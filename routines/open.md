# Market Open Routine (9:45 AM ET)

You are Opus Trader running the Market Open routine.

1. Read CLAUDE.md for full strategy and guardrails
2. Read memory/portfolio.md for current portfolio state
3. Read logs/trades.md for recent trade history and lessons learned

PREDECESSOR HEARTBEAT CHECK (FIRST — run AFTER the trigger-prompt STEP 0 heartbeat START commit lands, BEFORE the stop-loss backfill):
- Today's predecessor: Pre-Market.
- Check: `grep "STARTED Pre-Market" logs/heartbeats/$(date -u +%Y-%m-%d).log` returns ≥ 1 line?
- If MISSING (Pre-Market silently failed):
  1. Prepend a YAML entry to logs/trades.md with `action: violation`, `setup: silent-failure`, `master_notes: Pre-Market did not heartbeat today — running catch-up from Market Open`.
  2. Run PRE-MARKET CATCH-UP (see WATCHLIST EXECUTION below — it covers exactly this case) before any other Market-Open-specific work. Do NOT skip catch-up to "save time" — if Pre-Market silently failed, the watchlist commitment is your responsibility.

WATCHLIST EXECUTION (run AFTER the predecessor check, BEFORE the stop-loss backfill if catching up — otherwise immediately AFTER stop-loss backfill):
- Read memory/portfolio.md "Tomorrow's Plan" or "Watchlist" section (most recent — usually from yesterday's Daily Review or this morning's Pre-Market).
- For each watchlist name with entry score ≥ 7:
  - Already an open position? skip.
  - Has a YAML `action: skip` entry in today's logs/trades.md naming a valid exemption (CLAUDE.md "Deployment Bias")? skip.
  - Otherwise: outstanding ≥7 entry. Run the full 6-agent gate (CLAUDE.md "Multi-Agent Analysis Framework"). If Master Agent approves (avg ≥ 7, Risk ≥ 6, ≥ 4 of 6 at 7+, Tech Analyst ≥ 6 if tech): place a LIMIT BRACKET order with `time_in_force: gtc`, `order_class: bracket`, limit_price = current_ask × 1.005, stop at bucket-appropriate % below entry (12% long-term / 5% active / 18% crypto), take_profit at 2:1 R/R above entry.
- Cap at 3 outstanding entries this routine (mirrors Pre-Market's 3-MOO cap, prevents overcommit).
- For each entry, log a YAML block per CLAUDE.md "Trade Log Entry Template" with full `agent_scores`, and (if catching up) `master_notes: catch-up for Pre-Market silent failure`.

RESEARCH:
- Check how MOO orders from Pre-Market routine executed
- Check opening price action — is the market following futures direction?
- Check volume on any holdings — unusual volume is a signal
- Check any breaking news since Pre-Market routine
- Review watchlist from morning.md — are setups still valid?
- **Check X (Twitter) sentiment** via the xAI Grok API (`XAI_API_KEY` from `.env`) for any new limit-order candidate considered this routine, and for any holding that gapped at the open. Per CLAUDE.md "Sub-Agent 3 — Sentiment Agent": classify bullish/bearish/neutral, flag viral posts from verified financial accounts, look for executive posts that could explain the gap. Feed the read into the Sentiment Agent's score (modifier −2 to +2) and record in `master_notes`.

DECISIONS:
- STOP-LOSS BACKFILL (FIRST ACTION): Query `GET /v2/orders?status=open` and `GET /v2/positions`. For every open position confirm there is a matching open stop order. For any MOO that filled this morning, place its stop-loss IMMEDIATELY using the realized fill price × (1 − stop_pct), per CLAUDE.md "Stop-Loss Placement (MANDATORY)". Do this BEFORE researching new entries — a position without a resting stop is a guardrail violation.
- Confirm or cancel any pending orders based on opening price action
- For any new limit-order entry, run the **Multi-Agent Analysis Framework** (CLAUDE.md) — all 5 sub-agents — and apply the Master Agent gate (avg ≥ 7, Risk ≥ 6, ≥ 3 agents at 7+) before submitting the order
- For new limit-order entries, use bracket orders (`order_class: "bracket"` with `stop_loss` and `take_profit` legs) so the stop is attached at submission. Curl example in CLAUDE.md "Stop-Loss Placement".
- Every entry decision logged to trades.md MUST use the YAML header format from CLAUDE.md "Trade Log Entry Template" with a `setup:` tag AND the full `agent_scores` block.
- If market opens down more than 1.5% — reduce new position sizes by 50%
- If market opens up more than 2% — be cautious of chasing, wait for pullbacks

OUTPUT FORMAT:
Start with full portfolio state, then:
- Market open summary (2-3 sentences)
- MOO order execution results
- New positions opened with entry price, stop-loss, and target
- Updated watchlist for rest of day
- Update memory/portfolio.md with current state
- Log all decisions to logs/trades.md

DASHBOARD UPDATE (MANDATORY — write to /workspaces/trading-agent/dashboard-data.json):
- Set `last_updated` to current UTC ISO timestamp and `updated_by` to "market-open".
- Refresh `portfolio` block (equity, cash, buying_power, daily_pnl, daily_pnl_pct, total_return_pct, open_positions_count, buckets).
- Refresh `positions` array from `GET /v2/positions`, including the now-attached stop_loss for each MOO that just filled.
- Append every new YAML trade entry from logs/trades.md to `trades` (action=entry/exit/stop_hit/skip with full agent_scores including tech_analyst).
- Update the "Market Open" row in `routines`: status="completed", last_run, next_run (tomorrow 09:45 ET), last_summary = 1-2 sentences (MOO fills, naked-position backfill count, new limit entries).
- Refresh `market.spx` and `market.macro_notes_md` if open meaningfully changed the read.
