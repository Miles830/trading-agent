# Opus Trader — Portfolio Memory

## Last Updated
2026-05-06 (Wednesday) — Pre-Market routine (late run at 22:59 UTC / 6:59 PM ET; market closed). Alpaca API blocked in sandbox runner; prices estimated from web research.

## Current Account Snapshot
- **Broker:** Alpaca Paper Trading (account PA3TXVEJ19LW)
- **Total Equity (estimated):** ~$100,255 (Alpaca API blocked; estimated from last-known cash + today's close prices)
- **Cash:** $85,550.02 (85.3%) — unchanged (no fills today)
- **Long Market Value (estimated):** ~$14,705
- **Open Positions:** 5 (TSM, GLD, NVDA, JPM, XLE)
- **Pending Orders:** 1 bracket BUY (AVGO @ $418.59 GTC — stale, AVGO now ~$440+; consider canceling)
- **API Status:** BLOCKED — "Host not in allowlist" on all Alpaca endpoints. Orders cannot be placed automatically; operator intervention required.
- **Daytrade Count:** 0

## Bucket State
| Bucket | Target | Current $ (est.) | Current % | Positions |
|---|---|---|---|---|
| Long-term | 55% ($55K) | ~$8,835 | 8.81% | 3 (TSM, NVDA, JPM) |
| Active Trading | 30% ($30K) | ~$5,870 | 5.85% | 2 (GLD, XLE) |
| Crypto | 5% ($5K) | $0 | 0% | 0 |
| Cash Reserve | 10% ($10K floor) | $85,550.02 | 85.3% | — |

## Open Positions
| Symbol | Bucket | Qty | Entry | Stop | Target | Cost basis | Est. Current | Est. P/L | Sector |
|---|---|---|---|---|---|---|---|---|---|
| TSM | long-term | 7 | 401.47 | 353.76 (-12%) | 498.48 (+24%) | $2,810.29 | $2,908.64 ($415.52) | +$98.35 | Semiconductors |
| GLD | active | 7 | 418.86 | 397.92 (-5%) | — | $2,932.02 | $3,013.01 ($430.43) | +$80.99 | Precious metals |
| NVDA | long-term | 15 | 198.83 | 175.60 (-12%) | 247.44 (+24%) | $2,982.45 | $3,096.90 ($206.46) | +$114.45 | Semiconductors |
| JPM | long-term | 9 | 308.30 | 272.14 (-12%) | 383.47 (+24%) | $2,774.72 | $2,829.42 ($314.38) | +$54.72 | Financials |
| XLE | active | 50 | 59.01 | 56.15 (-5%) | 65.01 (+10%) | $2,950.50 | $2,857.00 ($57.14) | -$93.50 | Energy |

**Stop coverage (estimated):** All 5 positions believed covered per last-known state. Cannot verify via Alpaca API. XLE is ⚠ CLOSE — $57.14 close vs $56.15 stop = only $0.99 / 1.7% cushion. Iran deal confirmation tomorrow could trigger.

**GLD note:** Two standalone GTC stops in place (1-share + 6-share = 7 shares total, all at $397.92). GLD closed +3.07% today ($430.43) — well above stop.

## Sector Exposure (estimated)
| Sector | Est. $ | Est. % of equity |
|---|---|---|
| Semiconductors (TSM + NVDA) | $6,005.54 | 5.99% |
| Financials (JPM) | $2,829.42 | 2.82% |
| Precious metals (GLD) | $3,013.01 | 3.00% |
| Energy (XLE) | $2,857.00 | 2.85% |
| Cash | $85,550.02 | 85.3% |
All well under 25% sector cap. LT bucket tech sub-allocation: (TSM+NVDA)/(TSM+NVDA+JPM) = $6,005/$8,835 = 67.9% — above 60% ceiling but LT bucket ($8.8K) is below $20K threshold so ceiling is informational per CLAUDE.md.

## Performance vs S&P 500
- **Portfolio daily P/L (est.):** +$259 / +0.26%
- **SPX today:** +0.9% (new record high, Nasdaq +2%)
- **Today's gap vs SPX:** -0.64 pp (XLE -3.89% dragged; rest of portfolio outperformed or tracked)
- **Cumulative return:** +0.25% ($100,255 / $100,000 initial)
- **Consecutive weeks underperforming SPX:** 0 (tracking just started)

## Macro Context (as of 2026-05-06 close)
- **Fed:** April 29 FOMC held at 3.75%; market pricing 50bps of cuts in 2026.
- **Geopolitics:** US "nearing agreement" with Iran on nuclear deal including moratorium. Not yet confirmed. Energy selling off (XLE -3.9%) but gold still bid (+3%) — market pricing in "almost but not quite" certainty.
- **Equities:** SPY/Nasdaq at record highs. AI semis leading (AMD +18.6%, NVDA +4%, TSM +3.5%). Financials solid (JPM +2%). Energy lagging (XLE -3.9%). 
- **Disney (DIS):** Q2 FY2026 beat — revenue $25.17B vs $24.78B, adj EPS $1.57 vs $1.49. Streaming income +88% to $582M. Stock +7%. New CEO Josh D'Amaro. Not on current watchlist.
- **Crypto:** BTC $82,320 (highest since January, +5.4% 5-day). ETH $2,412 (+5.61% 5-day). Risk-on regime = crypto bid.
- **Tonight's binary events (AMC):** ARM, SNAP, APP, IONQ, FTNT. ARM earnings most impactful for semis tomorrow.

## Active Themes
1. **AI broadening** — TSM + NVDA in (long-term). AMD +18.6% validates AI capex cycle. PLTR Q1 +85% YoY revenue growth.
2. **Steeper curve / financials tailwind** — JPM in (long-term), performing well.
3. **Geopolitical hedge** — GLD (active) holding up (+3% today despite risk-on). XLE (active) at risk from Iran deal confirmation.
4. **Crypto recovery** — BTC at highest since January. Crypto bucket 0% deployed, needs filling.
5. **Post-earnings follow-throughs** — AMD (18.6% today), PLTR (beat but sold off -7% on May 5, now potential re-entry at $134).

## Pending Actions — OPERATOR MUST EXECUTE BEFORE 9:25 AM ET MAY 7

Three approved orders attempted via API but FAILED (API blocked). Manual placement required:

1. **AMD** (score 7.33, earnings-reaction-follow, active): Buy 11 shares, limit $423.50, stop $400.32, target $463.53. GTC bracket. Note: ARM reports tonight; if ARM beats, AMD may open higher — adjust limit accordingly.

2. **PLTR** (score 7.0, ai-momentum-pullback, long-term): Buy 37 shares, limit $135.00, stop $118.20, target $166.56. GTC bracket. Q1 beat massive (+85% revenue YoY), post-earnings sell-off creates entry opportunity.

3. **BTC/USD** (score 7.17, breakout-volume, crypto): Buy 0.06 BTC, limit $82,732, GTC. After fill: place separate GTC stop at $67,502. (Crypto does not use bracket order_class on Alpaca; stop must be separate.)

4. **AVGO bracket** (existing, $418.59 GTC): AVGO now trading ~$440+. Consider canceling the $418.59 bracket and re-queueing at $440 + 0.5% = $442 to get filled on any weakness tomorrow.

5. **INTC** (user suggestion #1): REJECTED — see trades.md. Close GitHub issue #1 with rejection comment.

## Pending Deferrals (≥7 watchlist names not yet entered)
- **AMD** (7.33) — API blocked, operator must place before 9:25 AM May 7
- **PLTR** (7.0) — API blocked, operator must place before 9:25 AM May 7
- **BTC/USD** (7.17) — API blocked, operator must place before 9:25 AM May 7

## Lessons Learned (running log)
- **Week of 2026-04-27 (init):** No trades placed. First-run setup; benchmarking begins next week. Established research baseline so future weekly reviews can compare against. Note: do **not** chase late-stage breakouts in extended names without a clear pullback or post-earnings reset — this market is at record highs and risk/reward shrinks at the top of ranges.
- **2026-05-01 — bias correction (operator-mandated):** Week 1 sat in 100% cash through Mon–Fri despite the account being funded 2026-04-27 and a fully scored watchlist (5 names ≥ 7) existing by Friday morning. The "disciplined dry-run" framing was a rationalization for inaction. Operator correction: the mission is aggressive growth; capital in cash earns nothing toward beating SPX. Going forward, score ≥ 7 = enter at the next routine, period. The Monday plan from the most recent weekly review is the floor of action, not the ceiling. The only acceptable reasons to skip a ≥ 7 entry are: (1) hard guardrail breach, (2) binary event within 48h, (3) 3% daily-loss circuit breaker tripped. See CLAUDE.md "Deployment Bias" section. Any future routine that ends with cash above the 10% floor and scored ≥ 7 candidates on the watchlist must justify it against those three exemptions in logs/trades.md, or it is a logged guardrail violation.
- **2026-05-04 — remote-routine failure mode discovered:** Both Pre-Market (12:00 UTC) and Market Open (13:45 UTC) cron triggers fired today (`next_run_at` advanced to 2026-05-05) but produced ZERO commits, ZERO log entries, and ZERO Alpaca orders. Account stayed at 100% cash through both windows — same Week-1 failure mode despite the deployment-bias instructions in the trigger prompts. The manual session at 10:55 AM ET broke the streak. Root cause not yet diagnosed — need to inspect run history at claude.ai/code/routines. Hypothesis: the agent is generating a thoughtful response but skipping the actual `curl POST /v2/orders` and `git push` steps. The MANDATORY OUTPUT CONTRACT in the trigger prompt is necessary but apparently not sufficient. Possible mitigations once diagnosed: tighten allowed_tools, add a self-check at end of run that verifies `git log --since='5 minutes ago' | grep <routine_name>`, or have the agent output the curl response JSON to a watch file the next routine cross-checks.
- **2026-05-05 — silent failure REPEATS post-fix; heartbeat infra was NOT sufficient:** Heartbeat-START forcing-function commits (`47d3c71`, `ca3f79f`) deployed at 04:30 UTC, then BOTH morning routines silently failed AGAIN at 12:00 UTC and 13:45 UTC. No heartbeat START commit, no `logs/heartbeats/2026-05-05.log` file — confirming the post-fix signature: **the model is failing BEFORE its first user-message-driven tool call**. STEP 0 inside the prompt cannot save us if the model never executes a tool. Today the account survived only because the operator pre-queued NVDA/AVGO/JPM brackets the night before (commit `db9e55a`); NVDA + JPM filled at open without any routine intervention. Stop-coverage audit on the manual catch-up revealed GLD had 6 shares NAKED (yesterday's trim sell expired, but stop was reduced to 1 sh — so GLD became unprotected on 6 of 7 sh). Fixed via a second 6-sh stop at 397.92. **Lesson — durable, not just reactive:** until the routine infra is diagnosed and fixed, every Daily Review MUST end with at least one pre-queued bracket BUY (tif=gtc) on the highest-conviction watchlist name. This is now a hard requirement, not a fallback. Diagnostic next step: inspect run history at https://claude.ai/code/routines for both trigger IDs and look for a model-init failure trace; suspect the auto-attached Google Drive MCP connector or the very long trigger prompt blocking session start.
- **2026-05-06 — NEW FAILURE MODE: Alpaca API blocked in sandbox; routine ran 11h late:** Heartbeat START committed successfully (first time in days!) at 22:59 UTC but (1) routine ran at 22:59 UTC instead of 12:00 UTC (7 PM ET, market closed — MOO window missed), and (2) all Alpaca API calls return "Host not in allowlist" — outbound egress to paper-api.alpaca.markets is blocked in the sandbox runner. This is a THIRD distinct failure mode separate from the prior silent-failure incidents. Three approved orders (AMD 7.33, PLTR 7.0, BTC 7.17) documented as attempts in trades.md; NONE could be placed. **Operator MUST manually place all three before 9:25 AM ET May 7.** Research, scoring, and log entries are complete. The routine's observability improved (heartbeat works) but execution layer is still broken (API egress blocked). Next step: operator must unblock paper-api.alpaca.markets egress in the runner's network allowlist, in addition to fixing the timing issue (routine should fire at 12:00 UTC not 23:00 UTC).

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
