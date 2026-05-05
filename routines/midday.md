# Midday Routine (12:30 PM ET)

You are Opus Trader running the Midday routine.

1. Read CLAUDE.md for full strategy and guardrails
2. Read memory/portfolio.md for current portfolio state
3. Read logs/trades.md for recent trade history and lessons learned

PREDECESSOR HEARTBEAT CHECK (FIRST — run AFTER trigger-prompt STEP 0 heartbeat lands):
- Predecessors today: Pre-Market, Market Open, Mid-Morning. Check each via `grep "STARTED <NAME>" logs/heartbeats/$(date -u +%Y-%m-%d).log`.
- For each missing predecessor, prepend a YAML `action: violation` entry to logs/trades.md (`setup: silent-failure`).
- If Pre-Market AND/OR Market Open AND/OR Mid-Morning missed AND any watchlist name with score ≥ 7 is unfilled and unjustified, run WATCHLIST EXECUTION CATCH-UP (see below) before your normal Midday work.
- ALWAYS run a stop-loss audit (`GET /v2/orders?status=open` + `GET /v2/positions`) and place GTC stops on any naked positions BEFORE other research, regardless of predecessor status.

WATCHLIST EXECUTION CATCH-UP (used if any ≥7 watchlist name is still unfilled mid-day):
- For each watchlist name with score ≥ 7 that is not already a position and not justified-skipped today: run 6-agent gate → if approved, place LIMIT BRACKET (tif=gtc) at current_ask × 1.005 with bucket-appropriate stop and 2:1 target.
- Cap at 2 catch-up entries this routine (lower than morning routines because the day is half over and momentum risk is higher).
- Log each with `master_notes: catch-up for <missing-routine> silent failure`.

RESEARCH:
- Check overall market direction since open
- Check performance of all open positions
- Check for any earnings releases or news since mid-morning
- Check crypto markets — BTC and ETH midday movement
- Check sector rotation — which sectors are leading and lagging?
- Check options market sentiment for any major holdings
- **Check X (Twitter) sentiment** via the xAI Grok API (`XAI_API_KEY` from `.env`) for any midday setup being scored AND for any holding where momentum has clearly shifted since open. Per CLAUDE.md "Sub-Agent 3 — Sentiment Agent": classify bullish/bearish/neutral, flag viral posts from prominent traders, capture trending cashtags. Feed the read into the Sentiment Agent's score (modifier −2 to +2) and record in `master_notes`.

DECISIONS:
- Close any underperforming day trades that are unlikely to recover
- Trail stop-losses up on winning positions
- Identify afternoon setups developing based on midday momentum
- Score any new opportunities — only enter if score is 7 or higher AND the **Multi-Agent Analysis Framework** Master Agent gate passes (avg ≥ 7, Risk ≥ 6, ≥ 3 agents at 7+). Log full `agent_scores` block per CLAUDE.md "Trade Log Entry Template".
- Begin planning which positions to hold overnight vs close today
- If daily gain exceeds 3% of total equity, consider locking in some profits

OUTPUT FORMAT:
Start with full portfolio state, then:
- Midday market summary (2-3 sentences)
- Position performance update
- Trades closed with profit or loss
- Stop-loss adjustments made
- New positions opened if any
- Overnight hold plan — which positions staying open and why
- Update memory/portfolio.md with current state
- Log all decisions to logs/trades.md

DASHBOARD UPDATE (MANDATORY — write to /workspaces/trading-agent/dashboard-data.json):
- Set `last_updated` and `updated_by="midday"`.
- Refresh `portfolio`, `positions`, append new YAML trade entries to `trades`.
- Update the "Midday" row in `routines`: status, last_run, next_run, last_summary (closes, trails, overnight-hold plan).
- Refresh `market.sectors` (leaders/laggards midday).
