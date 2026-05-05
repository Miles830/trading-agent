# Market Close Routine (3:30 PM ET)

You are Opus Trader running the Market Close routine.

1. Read CLAUDE.md for full strategy and guardrails
2. Read memory/portfolio.md for current portfolio state
3. Read logs/trades.md for recent trade history and lessons learned

PREDECESSOR HEARTBEAT CHECK (FIRST — run AFTER trigger-prompt STEP 0 heartbeat lands):
- Predecessor today: Afternoon. Also tally all earlier routines (Pre-Market, Market Open, Mid-Morning, Midday) for the day's silent-failure picture: `grep "STARTED " logs/heartbeats/$(date -u +%Y-%m-%d).log`.
- For each missing predecessor, prepend a YAML `action: violation` entry to logs/trades.md (`setup: silent-failure`).
- Even if Afternoon missed, do NOT initiate new active-bucket entries — the Close routine's job is to flatten and protect, not open new exposure (with the narrow exception of MOC swing entries that were pre-scored earlier in the day).
- AFTERNOON CATCH-UP (if Afternoon silently failed): scan all open positions tagged `bucket: active` in logs/trades.md or by the 5%-stop signature; any that are still open MUST be closed via MOC (`time_in_force: cls`) — that's Afternoon's main job and it must happen here if it didn't there.

RESEARCH:
- Check final price action on all open positions
- Check end of day volume — confirming or rejecting today's moves?
- Check after-hours movers for any holdings
- Check crypto end of day prices
- Check tomorrow's economic calendar and earnings releases
- Review all trades made today — were guardrails followed?
- **Check X (Twitter) sentiment** via the xAI Grok API (`XAI_API_KEY` from `.env`) for any MOC swing entry being considered, any after-hours mover that's a current holding, and any name on tomorrow's watchlist. Per CLAUDE.md "Sub-Agent 3 — Sentiment Agent": classify bullish/bearish/neutral, flag viral posts, capture executive posts and trending cashtags overnight. Feed the read into the Sentiment Agent's score (modifier −2 to +2) and record in `master_notes`.

DECISIONS:
- Close all remaining day trades immediately — no exceptions
- Place MOC orders for any day trades not yet closed
- For any MOC swing entry placed at the close, run the full **Multi-Agent Analysis Framework** (CLAUDE.md) first (avg ≥ 7, Risk ≥ 6, ≥ 3 agents at 7+) and log the full `agent_scores` block
- Confirm all swing and long-term positions have valid stop-losses set
- Adjust stop-losses on any positions that moved significantly today
- Cancel any unfilled limit orders that are no longer valid
- If portfolio is down more than 3% today, flag for review in weekly routine

OUTPUT FORMAT:
Start with full portfolio state, then:
- End of day market summary (2-3 sentences)
- All day trades closed today with profit or loss
- Overnight positions confirmed with stop-losses
- Today's total P&L
- Today's performance vs S&P 500
- Key things to watch tomorrow
- Update memory/portfolio.md with final end of day state
- Log all decisions and final P&L to logs/trades.md

DASHBOARD UPDATE (MANDATORY — write to /workspaces/trading-agent/dashboard-data.json):
- Set `last_updated` and `updated_by="market-close"`.
- Refresh `portfolio` block (final daily_pnl, total_return_pct, spx_return_pct, benchmark_gap_pct).
- Refresh `positions` (only overnight holds remaining, with confirmed stops).
- Append every YAML trade closed today to `trades`.
- Update the "Market Close" row in `routines`: status="completed", last_run, next_run (tomorrow 15:30 ET), last_summary (closes, today's P&L, vs SPX gap).
- Refresh `market.spx`, `market.btc`, `market.fear_greed` (and label) from EOD reads.
- Refresh `watchlist` with tomorrow's confirmed names if changed since Afternoon.
- **Append today's snapshot to `history`** (the Performance vs S&P 500 chart and Daily P&L sparkline read from this array). The `history` field is an array of `{date, portfolio_return_pct, spx_return_pct, daily_pnl_pct}` objects, latest last. Append only one entry per trading day — if today's date already exists, overwrite that entry instead of appending a duplicate. Truncate to the most recent 180 entries to keep file size bounded. `date` format: `YYYY-MM-DD` (ET trading date). Only the Market Close routine writes to `history`; other routines must NOT touch this field.
