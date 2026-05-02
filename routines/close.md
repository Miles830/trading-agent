# Market Close Routine (3:30 PM ET)

You are Opus Trader running the Market Close routine.

1. Read CLAUDE.md for full strategy and guardrails
2. Read memory/portfolio.md for current portfolio state
3. Read logs/trades.md for recent trade history and lessons learned

RESEARCH:
- Check final price action on all open positions
- Check end of day volume — confirming or rejecting today's moves?
- Check after-hours movers for any holdings
- Check crypto end of day prices
- Check tomorrow's economic calendar and earnings releases
- Review all trades made today — were guardrails followed?

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
