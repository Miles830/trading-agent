# Opus Trader — Portfolio Memory

## Last Updated
2026-05-05 (Tuesday) — Manual catch-up after second silent-failure incident (operator-driven from main session; see logs/trades.md)

## Current Account Snapshot
- **Broker:** Alpaca Paper Trading (account PA3TXVEJ19LW)
- **Total Equity:** $99,995.99
- **Cash:** $85,550.02 (85.6%)
- **Buying Power:** $182,615.88
- **Long Market Value:** $14,445.97 (14.4%)
- **Short Market Value:** $0
- **Open Positions:** 5 (TSM, GLD, NVDA, JPM, XLE)
- **Pending Orders:** 1 bracket BUY (AVGO @ 418.59 GTC, current $422.02)
- **Daytrade Count:** 0
- **Account Created:** 2026-04-27

## Bucket State
| Bucket | Target | Current $ | Current % | Positions |
|---|---|---|---|---|
| Long-term | 55% ($55K) | $11,540.47 | 11.54% | 3 (TSM, NVDA, JPM) |
| Active Trading | 30% ($30K) | $5,905.50 | 5.91% | 2 (GLD, XLE) |
| Crypto | 5% ($5K) | $0 | 0% | 0 |
| Cash Reserve | 10% ($10K floor) | $85,550.02 | 85.6% | — |

## Open Positions
| Symbol | Bucket | Qty | Entry | Stop | Target | Cost basis | Current | Unrealized P/L | Sector |
|---|---|---|---|---|---|---|---|---|---|
| TSM | long-term | 7 | 401.47 | 353.76 (-12%) | 498.48 (+24%) | $2,810.29 | $2,783.83 | -$26.46 | Semiconductors |
| GLD | active | 7 | 418.86 | 397.92 (-5%) | — | $2,932.02 | $2,944.48 | +$12.46 | Precious metals |
| NVDA | long-term | 15 | 198.83 | 175.60 (-12%) | 247.44 (+24%) | $2,982.45 | $2,973.45 | -$9.00 | Semiconductors |
| JPM | long-term | 9 | 308.30 | 272.14 (-12%) | 383.47 (+24%) | $2,774.72 | $2,782.71 | +$7.99 | Financials |
| XLE | active | 50 | 59.01 | 56.15 (-5%) | 65.01 (+10%) | $2,950.50 | $2,961.50 | +$11.00 | Energy |

**Stop coverage:** All 5 positions covered. NVDA + JPM via bracket OCO children (status=held = active). TSM + XLE + GLD via standalone GTC stops. **GLD note:** the original 6-share trim from 2026-05-04 expired without filling, leaving 6 shares unprotected this morning until the manual catch-up placed a second 6-share stop @ 397.92 (order id `f0fd18ca`). The 1-share stop from yesterday remains in place. Combined 1+6 = 7 shares fully covered. The original trim intent is NOT executed; operator can decide later whether to complete it.

## Sector Exposure
| Sector | $ | % of equity |
|---|---|---|
| Semiconductors (TSM + NVDA) | $5,757.28 | 5.76% |
| Financials (JPM) | $2,782.71 | 2.78% |
| Precious metals (GLD) | $2,944.48 | 2.94% |
| Energy (XLE) | $2,961.50 | 2.96% |
| Cash | $85,550.02 | 85.6% |
All well under 25% sector cap. Tech share of LT bucket = $5,757.28 / $11,540.47 = 49.9% — within 30%–60% LT-bucket sub-allocation (LT bucket only $11.5k deployed, sub-cap is informational at this size per CLAUDE.md).

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
1. **AI broadening** — TSM + NVDA in (long-term). AVGO bracket queued at $418.59 (current $422.02, GTC, will sit).
2. **Steeper curve / financials tailwind** — JPM in (long-term).
3. **Geopolitical hedge** — GLD (active) and XLE (active) both LIVE with stops.
4. **Crypto washout** — BTC/ETH watch only; await ETF outflow turn.
5. **Earnings cluster this week** — AMD (5/5 AMC tonight), DIS+ARM (5/6) — no pre-position into binary events.

## Pending Deferrals (≥7 watchlist names not yet entered) — RESOLVE AT NEXT ROUTINE
- **AVGO** (score 7, long-term, ai-momentum-pullback) — bracket BUY at limit $418.59 GTC RESTING at Alpaca. Current price $422.02 above limit, will fill on a pullback. No new action needed.

NVDA and JPM bracket parents filled at today's open (per yesterday's pre-queue). All deferrals from the 2026-05-02 weekly watchlist are now either filled or queued.

## Lessons Learned (running log)
- **Week of 2026-04-27 (init):** No trades placed. First-run setup; benchmarking begins next week. Established research baseline so future weekly reviews can compare against. Note: do **not** chase late-stage breakouts in extended names without a clear pullback or post-earnings reset — this market is at record highs and risk/reward shrinks at the top of ranges.
- **2026-05-01 — bias correction (operator-mandated):** Week 1 sat in 100% cash through Mon–Fri despite the account being funded 2026-04-27 and a fully scored watchlist (5 names ≥ 7) existing by Friday morning. The "disciplined dry-run" framing was a rationalization for inaction. Operator correction: the mission is aggressive growth; capital in cash earns nothing toward beating SPX. Going forward, score ≥ 7 = enter at the next routine, period. The Monday plan from the most recent weekly review is the floor of action, not the ceiling. The only acceptable reasons to skip a ≥ 7 entry are: (1) hard guardrail breach, (2) binary event within 48h, (3) 3% daily-loss circuit breaker tripped. See CLAUDE.md "Deployment Bias" section. Any future routine that ends with cash above the 10% floor and scored ≥ 7 candidates on the watchlist must justify it against those three exemptions in logs/trades.md, or it is a logged guardrail violation.
- **2026-05-04 — remote-routine failure mode discovered:** Both Pre-Market (12:00 UTC) and Market Open (13:45 UTC) cron triggers fired today (`next_run_at` advanced to 2026-05-05) but produced ZERO commits, ZERO log entries, and ZERO Alpaca orders. Account stayed at 100% cash through both windows — same Week-1 failure mode despite the deployment-bias instructions in the trigger prompts. The manual session at 10:55 AM ET broke the streak. Root cause not yet diagnosed — need to inspect run history at claude.ai/code/routines. Hypothesis: the agent is generating a thoughtful response but skipping the actual `curl POST /v2/orders` and `git push` steps. The MANDATORY OUTPUT CONTRACT in the trigger prompt is necessary but apparently not sufficient. Possible mitigations once diagnosed: tighten allowed_tools, add a self-check at end of run that verifies `git log --since='5 minutes ago' | grep <routine_name>`, or have the agent output the curl response JSON to a watch file the next routine cross-checks.

- **2026-05-05 — silent failure REPEATS post-fix; heartbeat infra was NOT sufficient:** Heartbeat-START forcing-function commits (`47d3c71`, `ca3f79f`) deployed at 04:30 UTC, then BOTH morning routines silently failed AGAIN at 12:00 UTC and 13:45 UTC. No heartbeat START commit, no `logs/heartbeats/2026-05-05.log` file — confirming the post-fix signature: **the model is failing BEFORE its first user-message-driven tool call**. STEP 0 inside the prompt cannot save us if the model never executes a tool. Today the account survived only because the operator pre-queued NVDA/AVGO/JPM brackets the night before (commit `db9e55a`); NVDA + JPM filled at open without any routine intervention. Stop-coverage audit on the manual catch-up revealed GLD had 6 shares NAKED (yesterday's trim sell expired, but stop was reduced to 1 sh — so GLD became unprotected on 6 of 7 sh). Fixed via a second 6-sh stop at 397.92. **Lesson — durable, not just reactive:** until the routine infra is diagnosed and fixed, every Daily Review MUST end with at least one pre-queued bracket BUY (tif=gtc) on the highest-conviction watchlist name. This is now a hard requirement, not a fallback. Diagnostic next step: inspect run history at https://claude.ai/code/routines for both trigger IDs and look for a model-init failure trace; suspect the auto-attached Google Drive MCP connector or the very long trigger prompt blocking session start.

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
- **Mid-Morning (11:00 ET, ~30 min from this catch-up):** Stop audit should pass clean — all 5 positions covered (post-catch-up). If Mid-Morning fires, expect the predecessor-heartbeat-check logic to flag both Pre-Market and Market-Open as silently failed and run catch-up; the work is already done by the manual session, so it should no-op gracefully (only fresh ≥7 watchlist names would trigger entries; AVGO is the only deferral and is already queued).
- **Midday / Afternoon / Close:** Standard execution per playbook. Watch AMD AMC earnings reaction tomorrow — no pre-position tonight.
- **Daily Review (16:30 ET):** MUST diagnose silent-failure root cause via claude.ai/code/routines run history. MUST also pre-queue at least one bracket BUY for tomorrow's open per the new "durable pre-queue" rule (until routine infra is fixed, every Daily Review ends with at least one pre-queued GTC bracket on the highest-conviction watchlist name).

## Cash Reserve Floor
$10,000 (10%). Current cash $85,550.02 — $75,550 available to deploy before hitting floor. Plenty of room for fresh entries when watchlist refreshes.
