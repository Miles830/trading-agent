# Opus Trader — Portfolio Memory

## Last Updated
2026-05-04 (Monday) — Manual Pre-Market/Open equivalent (operator-driven; see logs/trades.md)

## Current Account Snapshot
- **Broker:** Alpaca Paper Trading (account PA3TXVEJ19LW)
- **Total Equity:** $99,997.15
- **Cash:** $91,307.19 (91.3%)
- **Buying Power:** $191,304.34
- **Long Market Value:** $8,689.96 (8.7%)
- **Short Market Value:** $0
- **Open Positions:** 3
- **Daytrade Count:** 0
- **Account Created:** 2026-04-27

## Bucket State
| Bucket | Target | Current $ | Current % | Positions |
|---|---|---|---|---|
| Long-term | 55% ($55K) | $5,740.96 | 5.7% | 2 (TSM, GLD) |
| Active Trading | 30% ($30K) | $2,949.00 | 2.95% | 1 (XLE) |
| Crypto | 5% ($5K) | $0 | 0% | 0 |
| Cash Reserve | 10% ($10K floor) | $91,307.19 | 91.3% | — |

## Open Positions
| Symbol | Bucket | Qty | Entry | Stop | Target | Cost basis | Current | Unrealized P/L | Sector |
|---|---|---|---|---|---|---|---|---|---|
| TSM | long-term | 7 | 401.47 | 353.76 (-12%) | 498.48 (+24%) | $2,810.29 | $2,809.78 | -$0.51 | Semiconductors |
| GLD | long-term | 7 | 418.86 | 368.98 (-12%) | 519.93 (+24%) | $2,932.02 | $2,931.11 | -$0.91 | Precious metals |
| XLE | active | 50 | 59.01 | 56.15 (-5%) | 65.01 (+10%) | $2,950.50 | $2,949.00 | -$1.50 | Energy |

All 3 positions have bracket OCO live at Alpaca (order class: bracket, take_profit limit + stop_loss stop). No naked positions.

## Sector Exposure
| Sector | $ | % of equity |
|---|---|---|
| Semiconductors | $2,809.78 | 2.81% |
| Precious metals | $2,931.11 | 2.93% |
| Energy | $2,949.00 | 2.95% |
| Cash | $91,307.19 | 91.3% |
All well under 25% sector cap.

## Performance vs S&P 500
- **Cumulative gap:** -0.003% (intraday mark-to-market on fresh fills; tracking begins meaningfully tomorrow)
- **Consecutive weeks underperforming SPX:** 0

## Macro Context (as of 2026-05-04 open)
- **Fed:** April 29 FOMC held at 3.75% with 4 dissenters; market pricing 50bps of cuts in 2026.
- **Geopolitics:** Strait of Hormuz extended closure ongoing; energy supply premium remains. US–Iran talks stalled.
- **Equities:** SPY +0.08% on the day (essentially flat). AI-capex names slightly red (NVDA -0.38%, AVGO -1.01%), TSM +0.93% bucking. Financials -1.29% (JPM). Energy +0.34% (XLE).
- **Crypto:** Not yet positioned. BTC/ETH watch — entry on flush-and-rebound pattern only.
- **Today's earnings risk:** PLTR AMC. Tuesday: AMD AMC. Wed: DIS BMO, ARM AMC. Avoid pre-positioning into binary events per CLAUDE.md.

## Active Themes
1. **AI broadening** — TSM in (long-term). NVDA/AVGO deferred ≥7 entries (see Pending Deferrals).
2. **Steeper curve / financials tailwind** — JPM deferred ≥7 entry.
3. **Geopolitical hedge** — GLD long-term and XLE active both LIVE.
4. **Crypto washout** — BTC/ETH watch only; await ETF outflow turn.
5. **Earnings cluster this week** — PLTR (5/4 AMC), AMD (5/5 AMC), DIS+ARM (5/6) — no pre-position.

## Pending Deferrals (≥7 watchlist names not yet entered) — RESOLVE AT NEXT ROUTINE
- **NVDA** (score 7, long-term, ai-momentum-pullback)
- **AVGO** (score 7, long-term, ai-momentum-pullback)
- **JPM** (score 7, long-term, sector-rotation)

These are NOT a strict CLAUDE.md exemption (no guardrail breach, no 48h binary, no circuit breaker). They were deferred only because the manual session was scoped to a 3-name Pre-Market equivalent. Default at next routine: enter all three unless conditions deteriorate.

## Lessons Learned (running log)
- **Week of 2026-04-27 (init):** No trades placed. First-run setup; benchmarking begins next week. Established research baseline so future weekly reviews can compare against. Note: do **not** chase late-stage breakouts in extended names without a clear pullback or post-earnings reset — this market is at record highs and risk/reward shrinks at the top of ranges.
- **2026-05-01 — bias correction (operator-mandated):** Week 1 sat in 100% cash through Mon–Fri despite the account being funded 2026-04-27 and a fully scored watchlist (5 names ≥ 7) existing by Friday morning. The "disciplined dry-run" framing was a rationalization for inaction. Operator correction: the mission is aggressive growth; capital in cash earns nothing toward beating SPX. Going forward, score ≥ 7 = enter at the next routine, period. The Monday plan from the most recent weekly review is the floor of action, not the ceiling. The only acceptable reasons to skip a ≥ 7 entry are: (1) hard guardrail breach, (2) binary event within 48h, (3) 3% daily-loss circuit breaker tripped. See CLAUDE.md "Deployment Bias" section. Any future routine that ends with cash above the 10% floor and scored ≥ 7 candidates on the watchlist must justify it against those three exemptions in logs/trades.md, or it is a logged guardrail violation.
- **2026-05-04 — remote-routine failure mode discovered:** Both Pre-Market (12:00 UTC) and Market Open (13:45 UTC) cron triggers fired today (`next_run_at` advanced to 2026-05-05) but produced ZERO commits, ZERO log entries, and ZERO Alpaca orders. Account stayed at 100% cash through both windows — same Week-1 failure mode despite the deployment-bias instructions in the trigger prompts. The manual session at 10:55 AM ET broke the streak. Root cause not yet diagnosed — need to inspect run history at claude.ai/code/routines. Hypothesis: the agent is generating a thoughtful response but skipping the actual `curl POST /v2/orders` and `git push` steps. The MANDATORY OUTPUT CONTRACT in the trigger prompt is necessary but apparently not sufficient. Possible mitigations once diagnosed: tighten allowed_tools, add a self-check at end of run that verifies `git log --since='5 minutes ago' | grep <routine_name>`, or have the agent output the curl response JSON to a watch file the next routine cross-checks.

## Setup Performance Tracker
| Setup type | Wins | Losses | Status |
|---|---|---|---|
| ai-momentum-pullback | 0 | 0 | active (TSM open) |
| macro-hedge | 0 | 0 | active (GLD, XLE open) |
| earnings-reaction-fade | — | — | — |
| earnings-reaction-follow | — | — | — |
| breakout-volume | — | — | — |
| mean-reversion-oversold | — | — | — |
| sector-rotation | — | — | — |
| crypto-flush-rebound | — | — | — |
| candlestick-reversal | — | — | — |

## Strategy Evolution Notes
- **2026-05-01 (init):** Strategy initialized per CLAUDE.md. No deviations. Next 4-week review checkpoint: 2026-05-29.
- **2026-05-04:** First positions opened. Operator manually executed Pre-Market equivalent after both scheduled remote routines failed silently. Strategy unchanged; execution layer needs fixing.

## Next Routine Plan
- **Mid-Morning (11:00 ET, in ~1h):** Verify all 3 stops still resting at Alpaca (they are, via bracket OCO). Reconsider NVDA / AVGO / JPM ≥7 deferrals — default action is enter all three at ~3% each unless tape deteriorates. Re-check sector exposure caps after additions (semis would go to ~9%, well under 25%).
- **Midday (12:30 ET):** Read tape; trim any laggard and add to leader within open names if signal supports.
- **Close (15:30 ET):** EOD reconcile; append today's snapshot to dashboard `history`. Tomorrow's Pre-Market should resume normal cron operation IF remote-routine root cause is identified and fixed today.

## Cash Reserve Floor
$10,000 (10%). Current cash $91,307.19 — $81,307 available to deploy before hitting floor. Plenty of room for the 3 deferrals plus normal weekly additions.
