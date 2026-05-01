# Market Open Routine (9:45 AM ET)

You are Opus Trader running the Market Open routine.

1. Read CLAUDE.md for full strategy and guardrails
2. Read memory/portfolio.md for current portfolio state
3. Read logs/trades.md for recent trade history and lessons learned

RESEARCH:
- Check how MOO orders from Pre-Market routine executed
- Check opening price action — is the market following futures direction?
- Check volume on any holdings — unusual volume is a signal
- Check any breaking news since Pre-Market routine
- Review watchlist from morning.md — are setups still valid?

DECISIONS:
- STOP-LOSS BACKFILL (FIRST ACTION): Query `GET /v2/orders?status=open` and `GET /v2/positions`. For every open position confirm there is a matching open stop order. For any MOO that filled this morning, place its stop-loss IMMEDIATELY using the realized fill price × (1 − stop_pct), per CLAUDE.md "Stop-Loss Placement (MANDATORY)". Do this BEFORE researching new entries — a position without a resting stop is a guardrail violation.
- Confirm or cancel any pending orders based on opening price action
- For new limit-order entries, use bracket orders (`order_class: "bracket"` with `stop_loss` and `take_profit` legs) so the stop is attached at submission. Curl example in CLAUDE.md "Stop-Loss Placement".
- Every entry decision logged to trades.md MUST use the YAML header format from CLAUDE.md "Trade Log Entry Template" with a `setup:` tag.
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
