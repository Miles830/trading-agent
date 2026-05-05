# Afternoon Routine (2:00 PM ET)

You are Opus Trader running the Afternoon routine.

1. Read CLAUDE.md for full strategy and guardrails
2. Read memory/portfolio.md for current portfolio state
3. Read logs/trades.md for recent trade history and lessons learned

PREDECESSOR HEARTBEAT CHECK (FIRST — run AFTER trigger-prompt STEP 0 heartbeat lands):
- Predecessors today: Pre-Market, Market Open, Mid-Morning, Midday. Check each via `grep "STARTED <NAME>" logs/heartbeats/$(date -u +%Y-%m-%d).log`.
- For each missing predecessor, prepend a YAML `action: violation` entry to logs/trades.md (`setup: silent-failure`).
- ALWAYS run a stop-loss audit and place GTC stops on any naked positions BEFORE other research.
- Long-term watchlist catch-up: if a watchlist name with `bucket: long-term` and score ≥ 7 is still unfilled at 2 PM, run the 6-agent gate; if approved, place a LIMIT BRACKET (tif=gtc) at current_ask × 1.005. Cap at 1 long-term catch-up entry this routine.
- Active-trading catch-up: do NOT initiate new active-bucket entries this routine — too close to close. Document any unfilled active watchlist names with a YAML `action: skip` entry citing "afternoon proximity-to-close" and let the next Pre-Market re-evaluate.

RESEARCH:
- Check overall market trend for the day
- Check performance of all open positions
- Check for any late breaking news or Fed announcements
- Check if any day trades need to be closed before market close
- Check crypto markets for afternoon movement
- Check after-hours earnings calendar for today and tomorrow
- **Check X (Twitter) sentiment** via the xAI Grok API (`XAI_API_KEY` from `.env`) for tomorrow's preliminary watchlist names AND any swing/long-term holding where chatter has picked up this afternoon. Per CLAUDE.md "Sub-Agent 3 — Sentiment Agent": classify bullish/bearish/neutral, flag viral posts and CEO/executive posts that could move the stock overnight. Pre-score the X read so the Pre-Market routine only re-scores deltas. Record in `master_notes`.

DECISIONS:
- Begin closing day trades that are not showing strong momentum
- Never carry a day trade past 3:30 PM ET
- Trail stop-losses up on all winning swing and long-term positions
- Place MOC orders for any day trades to be closed at end of day
- Identify any high conviction setups for tomorrow's Pre-Market watchlist — pre-score them through the **Multi-Agent Analysis Framework** (CLAUDE.md) so Pre-Market only re-scores deltas
- For any MOC swing entry placed here, run the full Multi-Agent Analysis Framework first (avg ≥ 7, Risk ≥ 6, ≥ 3 agents at 7+) and log the full `agent_scores` block
- If any swing trade is up more than 15% consider taking partial profits

OUTPUT FORMAT:
Start with full portfolio state, then:
- Afternoon market summary (2-3 sentences)
- Day trades being closed and method (limit, MOC, or market)
- Swing and long-term position updates
- Stop-loss adjustments made
- Tomorrow's preliminary watchlist (top 3-5 names)
- Update memory/portfolio.md with current state
- Log all decisions to logs/trades.md

DASHBOARD UPDATE (MANDATORY — write to /workspaces/trading-agent/dashboard-data.json):
- Set `last_updated` and `updated_by="afternoon"`.
- Refresh `portfolio`, `positions`, append new YAML trade entries to `trades`.
- Update the "Afternoon" row in `routines`: status, last_run, next_run, last_summary (day-trade closes, MOC orders queued, partial profits taken).
- Replace `watchlist` with tomorrow's preliminary 3–5 names and pre-scored Multi-Agent reads.
