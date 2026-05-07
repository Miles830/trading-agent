# Opus Trader — Strategy Guide

## Account Overview
- Account: Alpaca Paper Trading
- Starting Capital: $100,000
- API: https://paper-api.alpaca.markets
- Data API: https://data.alpaca.markets

---

## Deployment Bias — NON-NEGOTIABLE

**Score >= 7 = ENTER at this routine.** The most recent weekly review's watchlist is a COMMITMENT, not a suggestion. Default state is invested up to bucket targets with cash at the 10% floor. "Wait for a better setup" is NOT valid.

**The ONLY acceptable skip reasons:**
1. Order would breach a hard guardrail (5% pos / 25% sector / 1.5% trade risk / 10% cash floor / 12 max positions)
2. Setup is into a binary event within 48h (earnings, FDA, Fed decision) explicitly excluded by this guide
3. 3% daily-loss circuit breaker tripped

ANY OTHER REASON IS INVALID.

---

## Portfolio Buckets

| Bucket | Target Allocation | Description |
|--------|------------------|-------------|
| Core Growth | 40% | Large-cap AI, semiconductor, cloud (NVDA, MSFT, GOOGL, AMZN) |
| Momentum | 30% | High-momentum mid/large cap with score >= 7 |
| Defense | 15% | Energy, healthcare, consumer staples as macro hedge |
| Crypto/High-Beta | 5% | BTC, ETH, or crypto-adjacent equities |
| Cash | 10% (floor) | Minimum cash reserve — never breach |

---

## Guardrails — Hard Limits

- **Position size**: ≤ 5% of portfolio equity per position
- **Sector concentration**: ≤ 25% of portfolio in any single GICS sector
- **Trade risk**: ≤ 1.5% of portfolio per trade (= position size × stop-loss %)
- **Cash floor**: ≥ 10% cash at all times after any order executes
- **Max positions**: 12 open positions maximum
- **Daily loss circuit breaker**: Pause all new entries if daily P&L < -3%
- **Binary event embargo**: No new entries within 48h of earnings / FDA / Fed decision

---

## Stop-Loss Rules

Set at entry — no exceptions:
- Long-term positions (Core Growth): 12% stop below entry
- Active/Momentum trades: 5% stop below entry
- Crypto positions: 18% stop below entry

---

## Entry Scoring Rubric (0–10)

Score each candidate before placing any order. Score >= 7 is required to enter.

| Factor | Weight | Max Pts |
|--------|--------|---------|
| Technical momentum (RSI 50-70, above 20/50 MA) | High | 2 |
| Fundamental quality (earnings growth, margins) | High | 2 |
| Sector tailwind (macro / thematic alignment) | Medium | 2 |
| Analyst consensus (Buy/Strong Buy ≥ 70%) | Medium | 1 |
| Risk/Reward (R:R ≥ 2:1 to nearest support/resistance) | High | 2 |
| Catalyst clarity (clear driver, no binary event within 48h) | Medium | 1 |

**Total: 10 points. Enter only at >= 7.**

---

## Order Types

- **MOO (Market On Open)**: `time_in_force: opg` — use for score >= 7 setups
  - Max 3 MOO orders per day
  - Must be placed before 9:25 AM ET
- **Limit orders**: Preferred for precise entries during regular hours
- **Market orders**: Only during regular session, never pre/after-market

---

## Research Requirements (per routine)

Before any trade decision, gather:
1. **Last 48h news** on the symbol — earnings, guidance, management changes, litigation
2. **Macro context** — Fed, inflation data, geopolitical events
3. **Sector performance** — sector ETF price action vs SPY
4. **Earnings calendar** — confirm no binary event within 48h
5. **Analyst sentiment** — recent upgrades/downgrades, price target changes

---

## Trade Log Entry Template

```yaml
---
date: YYYY-MM-DD
routine: Pre-Market | Midday | End-of-Day | Weekly Review
action: buy | sell | skip | violation
symbol: TICKER
side: buy | sell
qty: 0
price_approx: 0.00
notional: 0.00
entry_score: 0
stop_loss_pct: 0%
stop_price: 0.00
sector: Technology
bucket: Core Growth | Momentum | Defense | Crypto
rationale: >
  Brief explanation of the trade decision.
exemption_applied: null | guardrail | binary_event | circuit_breaker
order_id: ""
order_response: {}
---
```

---

## Portfolio State Block Format

Every routine output must begin with:

```
=== PORTFOLIO STATE ===
Date/Time: YYYY-MM-DD HH:MM ET
Equity: $XXX,XXX.XX
Cash: $XX,XXX.XX (XX.X%)
Open Positions: X / 12
Daily P&L: $X,XXX.XX (X.XX%)
Circuit Breaker: ACTIVE | CLEAR

POSITIONS:
  TICKER: X shares @ avg $XX.XX | current ~$XX.XX | P&L: $XXX (X.X%) | stop: $XX.XX

SECTOR EXPOSURE:
  Technology: XX.X%
  Energy: XX.X%
  ...

BUCKET ALLOCATION:
  Core Growth: XX.X% (target 40%)
  Momentum: XX.X% (target 30%)
  Defense: XX.X% (target 15%)
  Crypto: X.X% (target 5%)
  Cash: XX.X% (floor 10%)
======================
```

---

## Lessons Learned

*(Updated via Weekly Review and post-mortems)*

- First run 2026-05-07: Alpaca API returned 403 "Host not in allowlist" from cloud runner IP — trade placement may require IP whitelisting on Alpaca dashboard.
