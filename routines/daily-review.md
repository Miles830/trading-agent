# Daily Review Routine (4:30 PM ET, every weekday)

You are Opus Trader running the Daily Review.

1. Read CLAUDE.md for full strategy and guardrails
2. Read memory/portfolio.md for current portfolio state
3. Read logs/trades.md for today's entries plus the rolling 5-day window

PREDECESSOR HEARTBEAT CHECK (FIRST — run AFTER trigger-prompt STEP 0 heartbeat lands):
- Predecessor today: Market Close. Tally all 6 weekday routines (Pre-Market, Market-Open, Mid-Morning, Midday, Afternoon, Market-Close): `grep "STARTED " logs/heartbeats/$(date -u +%Y-%m-%d).log` and `grep "COMPLETED " logs/heartbeats/$(date -u +%Y-%m-%d).log`.
- Build a heartbeat table: per routine, did STARTED appear? did COMPLETED appear? Note any missing pair.
- For each missing routine, prepend a YAML `action: violation` entry to logs/trades.md (`setup: silent-failure`, `master_notes: <NAME> did not heartbeat today`).
- MARKET-CLOSE CATCH-UP (if Market Close silently failed):
  1. Pull `GET /v2/positions` — for any open day-trade-tagged or active-bucket position that should have been flattened, place a market sell (the regular session is closed; use after-hours limit at last bid for active bucket, or carry overnight if it's a long-term bucket position).
  2. Pull `GET /v2/orders?status=open` — confirm every remaining position has a resting GTC stop. Place any missing.
  3. Compute today's P&L vs the previous trading day's close from `/v2/account/portfolio/history`.

RESEARCH:
- Pull `/v2/orders?status=all&after=<today_00:00_ET>` — every fill, cancel, skip today.
- Pull `/v2/account/portfolio/history?period=1M&timeframe=1D` for the rolling 20-day equity curve.
- Compute SPY daily return from `/v2/stocks/SPY/bars` and benchmark gap (today + cumulative 20-day).
- Compute today's win rate, avg win, avg loss, profit factor; same metrics rolling 20-day.

SETUP-TAG TALLY (drives the 3-in-a-row halt/boost rules per CLAUDE.md):
- Grep all YAML `setup:` tags from today's trades.md entries plus the rolling 5-day window.
- Per tag: count entries vs exits, tally wins/losses by `result_pct`. Update memory/portfolio.md "Setup Performance Tracker" cumulatively.
- HALT any tag with 3 consecutive losses (append to memory/portfolio.md "HALTED setups", refuse to enter on that tag until next strategy evolution checkpoint).
- BOOST any tag with 3 consecutive wins (allow entry on base score 6 instead of 7; log the adjustment).

AGENT CALIBRATION:
- For each closed trade today, pair the entry's `agent_scores` with the realized `result_pct`. Update per-agent hit rate in memory/portfolio.md "Agent Calibration Tracker".
- Flag any agent whose ≥ 7 calls produced 3 consecutive losing trades — note in lessons learned.

NEXT-SESSION WATCHLIST (MANDATORY — this is the commitment for tomorrow's Pre-Market):
- Build a top-10 watchlist for tomorrow's Pre-Market routine with entry-checklist scores.
- Active-trading bucket: scan the entire U.S. equity market (>$5, >1M ADV) — movers, gaps, breakouts, intraday catalysts. Do NOT anchor to a small recurring list.
- Long-term bucket: anchor list (PLTR, NVDA, TSLA, INTC, MU, WDC, BA, SPY/VOO) plus discretionary scalable-startup and earnings-anticipation candidates (respect the 48h binary-event exclusion for earnings).
- For each watchlist name, log the entry-checklist score, the bucket assignment, and a one-line thesis.

ON FRIDAYS ONLY: append a weekly Strategy Evolution note to memory/portfolio.md summarizing what changed this week and why.

PERSIST RESULTS:
- Update memory/portfolio.md with today's daily summary, lessons learned, setup performance tracker, agent calibration, heartbeat tally, and tomorrow's watchlist.
- Append a full Daily Review entry to logs/trades.md.
- Commit & push (the trigger-prompt STEP 0 heartbeat already did `git pull --rebase` and the FINAL STEP heartbeat will force a `git commit --allow-empty && git push` — but you should also run a normal commit of your work product before the FINAL STEP).

OUTPUT FORMAT:
Start with the PORTFOLIO STATE block per CLAUDE.md, then:
- Heartbeat tally table (6 routines × {STARTED, COMPLETED}).
- Today's P&L vs SPX gap (today + 20-day cumulative).
- Win rate / profit factor (today + 20-day rolling).
- Best & worst trade of the day with reasoning.
- 3 things that worked, 3 to improve.
- Setup performance update (any halts or boosts triggered).
- Agent calibration update.
- Tomorrow's top-10 watchlist with scores.
- Key macro events / earnings tomorrow.

DASHBOARD UPDATE (MANDATORY — write to /workspaces/trading-agent/dashboard-data.json):
- Set `last_updated` and `updated_by="daily-review"`.
- Refresh `portfolio` (end-of-day) and `positions` (overnight holds with confirmed stops).
- Append today's YAML trade entries to `trades` (full agent_scores including tech_analyst).
- Update the "Daily Review" row in `routines`: status="completed", last_run, next_run (next weekday 16:30 ET), last_summary (1-2 sentences: today's P&L, vs SPX gap, top operational issue if any).
- Replace `watchlist` with tomorrow's top-10 scored names.
- Refresh `memory.recent_lessons_md` with today's 3-things-worked + 3-things-to-improve (markdown, latest first, keep under ~40 lines combined across recent days).
- Do NOT modify `history` or `trade_stats` (Market Close owns `history`, Weekly Review owns `trade_stats` and `agent_scorecard`).
