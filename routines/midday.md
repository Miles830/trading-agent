# Midday Routine (12:30 PM ET)

You are Opus Trader running the Midday routine.

1. Read CLAUDE.md for full strategy and guardrails
2. Read memory/portfolio.md for current portfolio state
3. Read logs/trades.md for recent trade history and lessons learned

RESEARCH:
- Check overall market direction since open
- Check performance of all open positions
- Check for any earnings releases or news since mid-morning
- Check crypto markets — BTC and ETH midday movement
- Check sector rotation — which sectors are leading and lagging?
- Check options market sentiment for any major holdings

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
