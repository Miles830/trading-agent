# Pre-Market Routine Playbook (8:00 AM ET)

## Step 1 — System Checks
1. Run `date -u` and convert to US Eastern time
2. Confirm market is open: GET /v2/calendar for today
3. Check market clock: GET /v2/clock
4. Read CLAUDE.md, memory/portfolio.md, logs/trades.md (last 7 days)

## Step 2 — Portfolio Snapshot
1. GET /v2/account — capture equity, cash, buying_power, daily P&L
2. GET /v2/positions — list all open positions with current value
3. Check daily P&L: if < -3%, circuit breaker ACTIVE → no new entries today
4. Compute: position count, sector exposures, bucket allocations, cash %
5. Output the PORTFOLIO STATE block

## Step 3 — Overnight News & Macro Context
1. WebSearch: "stock market [date] pre-market futures" — capture index levels
2. WebSearch: "FOMC Fed [month year]" — any Fed decision in next 48h?
3. WebSearch: "earnings calendar [week]" — who reports today/tomorrow?
4. WebSearch: news for each existing position symbol — any material developments?

## Step 4 — Watchlist Review & Scoring
1. Pull the most recent Weekly Review's watchlist from memory/portfolio.md
2. For each candidate:
   a. Check earnings in next 48h → if yes, SKIP (binary event exemption)
   b. WebSearch last 48h news on the symbol
   c. Score 0–10 using the rubric in CLAUDE.md
   d. If score >= 7 AND no guardrail breach → ADD to MOO order list
3. If no watchlist exists: identify 3–5 momentum candidates via WebSearch and score them

## Step 5 — Guardrail Pre-Check (for each candidate ≥ 7)
For each proposed order compute:
- Notional = min(5% of equity, amount needed to reach bucket target)
- Qty = floor(Notional / approx price)
- New cash after order = current cash − notional → must be ≥ 10% equity
- Position as % equity = notional / equity → must be ≤ 5%
- Sector total after order → must be ≤ 25%
- Position count after order → must be ≤ 12
- Trade risk = qty × (entry price × stop_loss_pct) → must be ≤ 1.5% of equity
If ANY guardrail breached → reduce qty or skip

## Step 6 — Place MOO Orders (max 3, before 9:25 AM ET)
For each approved order:
```bash
curl -X POST "${APCA_API_BASE_URL}/v2/orders" \
  -H "APCA-API-KEY-ID: ${APCA_API_KEY_ID}" \
  -H "APCA-API-SECRET-KEY: ${APCA_API_SECRET_KEY}" \
  -H "Content-Type: application/json" \
  -d '{"symbol":"TICKER","qty":N,"side":"buy","type":"market","time_in_force":"opg"}'
```
Capture JSON response → log to logs/trades.md

## Step 7 — Review Existing Positions
1. For each open position, check overnight news
2. If stop-loss triggered or fundamental thesis broken → place SELL order
3. Log any exits to logs/trades.md

## Step 8 — Persist Results
1. Update memory/portfolio.md with new snapshot
2. Append all decisions to logs/trades.md (orders placed + skips + reasoning)
3. Commit and push:
```bash
git add memory/portfolio.md logs/trades.md
git commit -m "Pre-Market routine $(date -u +%Y-%m-%d-%H%MZ)"
git push origin main
```

## Step 9 — Heartbeat COMPLETE
Run the HEARTBEAT COMPLETE command exactly as specified in the routine prompt.
