# Opus Trader — Portfolio Memory

## Last Updated
2026-05-01 (Friday) — Weekly Review (initialization run)

## Current Account Snapshot
- **Broker:** Alpaca Paper Trading (account PA3TXVEJ19LW)
- **Total Equity:** $100,000.00
- **Cash:** $100,000.00 (100%)
- **Buying Power:** $200,000 (2x margin available, will not use until justified)
- **Long Market Value:** $0
- **Short Market Value:** $0
- **Open Positions:** 0
- **Daytrade Count:** 0
- **Account Created:** 2026-04-27

## Bucket State
| Bucket | Target | Current $ | Current % | Positions |
|---|---|---|---|---|
| Long-term | 50% ($50K) | $0 | 0% | 0 |
| Active Trading | 30% ($30K) | $0 | 0% | 0 |
| Crypto | 10% ($10K) | $0 | 0% | 0 |
| Cash Reserve | 10% ($10K floor) | $100K | 100% | — |

## Open Positions
None.

## Sector Exposure
None.

## Performance vs S&P 500
- **Cumulative gap:** 0.00% (no positions yet — first run)
- **Consecutive weeks underperforming SPX:** 0

## Macro Context (as of 2026-05-01)
- **Fed:** Held funds rate at 3.75% on April 29 FOMC with **4 dissenters** (dovish skew). Goldman base case: 50bps of cuts across 2026. Inflation trending lower; wage growth softening.
- **Geopolitics:** US–Iran peace talks stalled; **Strait of Hormuz extended closure** is bid into energy and creating crypto/risk-asset weakness.
- **Equity backdrop:** S&P 500 near record highs (~7,160 area; 52-wk range ~5,578–7,178). AI capex remains the dominant theme and is **broadening** into financials, healthcare, utilities. 8 of 11 S&P sectors carry higher 2026 EPS growth than 2025. Value forecast for first double-digit EPS growth year.
- **Crypto:** BTC ~$76K, ETH ~$2,250 — both lower three days running into May 1. Spot BTC ETFs saw $137.77M outflows on April 29 (third straight outflow day). May historically the strongest month for ETH.

## Active Themes
1. **AI broadening** — own picks-and-shovels (NVDA, AVGO, TSM) over crowded software.
2. **Steeper curve / financials tailwind** — JPM as core long.
3. **Geopolitical hedge** — GLD as long-term hedge; XLE as Hormuz-driven tactical trade.
4. **Crypto washout** — possible mean-reversion setup in BTC/ETH after ETF outflow flush.
5. **Earnings cluster next week** — PLTR (5/4), AMD (5/5), DIS (5/6 BMO), ARM (5/6) — wait for post-print reactions, do not pre-position into binary events.

## Lessons Learned (running log)
- **Week of 2026-04-27 (init):** No trades placed. First-run setup; benchmarking begins next week. Established research baseline so future weekly reviews can compare against. Note: do **not** chase late-stage breakouts in extended names without a clear pullback or post-earnings reset — this market is at record highs and risk/reward shrinks at the top of ranges.
- **2026-05-01 — bias correction (operator-mandated):** Week 1 sat in 100% cash through Mon–Fri despite the account being funded 2026-04-27 and a fully scored watchlist (5 names ≥ 7) existing by Friday morning. The "disciplined dry-run" framing was a rationalization for inaction. Operator correction: the mission is aggressive growth; capital in cash earns nothing toward beating SPX. Going forward, score ≥ 7 = enter at the next routine, period. The Monday plan from the most recent weekly review is the floor of action, not the ceiling. The only acceptable reasons to skip a ≥ 7 entry are: (1) hard guardrail breach, (2) binary event within 48h, (3) 3% daily-loss circuit breaker tripped. See CLAUDE.md "Deployment Bias" section. Any future routine that ends with cash above the 10% floor and scored ≥ 7 candidates on the watchlist must justify it against those three exemptions in logs/trades.md, or it is a logged guardrail violation.

## Setup Performance Tracker
| Setup type | Wins | Losses | Status |
|---|---|---|---|
| (none yet) | — | — | — |

## Strategy Evolution Notes
- **2026-05-01 (init):** Strategy initialized per CLAUDE.md. No deviations. Next 4-week review checkpoint: 2026-05-29.

## Next Week Plan (Week of 2026-05-04) — FLOOR, NOT CEILING
This plan is the minimum capital deployment for the week. It is not contingent on additional analysis. If the Monday Pre-Market re-score still puts these names at ≥ 7, the orders go in. "Conditions have changed since Friday" is not a license to delay — it is a license to *re-rank*, then act.

- **Monday Pre-Market (MANDATORY):** Place 3 MOO orders from the top-scored names — TSM, NVDA, AVGO, JPM, GLD. Pick the 3 highest-scoring on the morning re-score, ~3% equity each (~$3K). This is the floor. If any name scored ≥ 7 has dropped overnight to score < 7, replace it with the next highest from the watchlist. Do NOT end Monday with > 91% cash.
- **Monday post-open:** If the open is constructive (not down >1.5%), place limit orders for the remaining 2 of the top 5 names. Target ≥ 5 long-term positions on the books by Monday close.
- **Tuesday:** XLE entry if Hormuz situation persists (2.5% equity). Avoid pre-positioning AMD into the 5/5 AMC print.
- **Wednesday:** Evaluate AMD post-earnings reaction; size accordingly. Avoid pre-positioning ARM (5/6 AMC) and DIS (5/6 BMO).
- **Thursday:** Evaluate ARM post-earnings; tactical BTC entry (2–3%) if spot ETF outflows have abated.
- **Friday:** Weekly review with real trade history.
- **Capital deployment target by Friday close:** ≥ 25% deployed (i.e., ≤ 75% cash). Underdeployment beyond this requires explicit justification logged to trades.md against the three exemption categories in CLAUDE.md "Deployment Bias".
- **Cash reserve:** Hold $10K floor (10%). Never deploy beyond 90% gross.
