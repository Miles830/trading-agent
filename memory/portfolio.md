# Opus Trader — Portfolio Memory

## Last Updated
2026-05-08 (Friday) — Pre-Market routine (05:12 UTC / 1:12 AM ET). Alpaca API still blocked ("Host not in allowlist"). Prices estimated from web research. May 7 routine silently failed — zero log entries for that date. AVGO bracket likely filled May 7 (unconfirmed).

## Current Account Snapshot
- **Broker:** Alpaca Paper Trading (account PA3TXVEJ19LW)
- **Total Equity (estimated):** ~$100,717 (Alpaca API blocked; estimated from web-researched close prices)
- **Cash:** ~$82,620 (82.4%) — if AVGO filled May 7 at $418.59; otherwise $85,550 (85.3%)
- **Long Market Value (estimated):** ~$18,097 (if AVGO filled) / ~$15,167 (if AVGO not filled)
- **Open Positions:** 6 (TSM, GLD, NVDA, JPM, XLE, AVGO) — AVGO fill UNCONFIRMED
- **Pending Orders (attempted today, FAILED):** AMD MOO 11 sh + PLTR MOO 36 sh (API blocked — operator must place before 9:25 AM ET)
- **API Status:** BLOCKED — "Host not in allowlist" on all Alpaca endpoints (HTTP 403). Same persistent issue since May 6.
- **Daytrade Count:** 0

## Bucket State (estimated — AVGO fill assumed; operator must verify)
| Bucket | Target | Current $ (est.) | Current % | Positions |
|---|---|---|---|---|
| Long-term | 55% ($55K) | ~$14,836 | 14.7% | 4 (TSM, NVDA, JPM, AVGO) |
| Active Trading | 30% ($30K) | ~$6,229 | 6.2% | 2 (GLD, XLE) |
| Crypto | 5% ($5K) | $0 | 0% | 0 |
| Cash Reserve | 10% ($10K floor) | ~$82,620 | 82.4% | — |

**Note:** After AMD + PLTR MOO fills (pending operator action): LT bucket grows to ~$19,800 (NVDA+TSM+JPM+AVGO+PLTR), Active to ~$10,717 (GLD+XLE+AMD). Still far below bucket targets — cash at ~73% after both fills, aggressive deployment needed in coming sessions.

## Open Positions (estimated — API blocked)
| Symbol | Bucket | Qty | Entry | Stop | Target | Cost basis | Est. Current | Est. P/L | Sector |
|---|---|---|---|---|---|---|---|---|---|
| TSM | long-term | 7 | 401.47 | 353.76 (-12%) | 498.48 (+24%) | $2,810.29 | $2,918 ($416.86 est.) | +$108 | Semiconductors |
| GLD | active | 7 | 418.86 | 397.92 (-5%) | — | $2,932.02 | $3,129 ($447 est.) | +$197 | Precious metals |
| NVDA | long-term | 15 | 198.83 | 175.60 (-12%) | 247.44 (+24%) | $2,982.45 | $3,191 ($212.72) | +$209 | Semiconductors |
| JPM | long-term | 9 | 308.30 | 272.14 (-12%) | 383.47 (+24%) | $2,774.72 | $2,799 ($311 est.) | +$25 | Financials |
| XLE | active | 50 | 59.01 | 56.15 (-5%) | 65.01 (+10%) | $2,950.50 | $3,100 ($62 est.) | +$150 | Energy (oil surge on Iran ceasefire breakdown) |
| AVGO | long-term | 7 | 418.59 | 368.36 (-12%) | 519.05 (+24%) | $2,930.13 | $2,968 ($424 est.) | +$38 | ⚠ FILL UNCONFIRMED — bracket likely triggered May 7 |

**Stop coverage (estimated — cannot verify via API):**
- TSM: safe (+18% above stop) — bracket OCO
- GLD: safe (+12% above stop) — two standalone GTC stops (1+6 sh)
- NVDA: safe (+21% above stop) — bracket OCO
- JPM: safe (+14% above stop) — bracket OCO
- XLE: NOW SAFE — Iran ceasefire collapse pushed oil/XLE from $57.14 → ~$62, well above $56.15 stop
- AVGO: IF FILLED — bracket OCO should have activated stop at $368.36 automatically; UNVERIFIED

## Sector Exposure (estimated — May 8 pre-open)
| Sector | Est. $ | Est. % of equity |
|---|---|---|
| Semiconductors (TSM + NVDA + AVGO) | $9,077 | 9.0% |
| Financials (JPM) | $2,799 | 2.8% |
| Precious metals (GLD) | $3,129 | 3.1% |
| Energy (XLE) | $3,100 | 3.1% |
| Software/AI (PLTR — pending) | — | — |
| Cash | ~$82,620 | 82.4% |
All well under 25% sector cap. LT bucket tech sub-allocation (AVGO+NVDA+TSM) / (AVGO+NVDA+TSM+JPM) = $9,077 / $11,876 = 76.4% — above 60% ceiling BUT LT bucket ($11.9K) is below $20K threshold → ceiling informational per CLAUDE.md.

After AMD+PLTR fills: Semi sector + AMD ~$13,500 (13.4%); PLTR software $4,963 = 4.9%; total tech exposure ~18.4% — all under 25% cap.

## Performance vs S&P 500
- **May 7 portfolio P/L (est.):** +$462 / +0.46% (energy/gold surge on Iran war flare-up)
- **SPX May 7:** -0.38% (7,337.11) — market sold off on Iran ceasefire collapse
- **May 7 gap vs SPX:** +0.84 pp (portfolio OUTPERFORMED on May 7 — energy/gold long positions benefited from Iran war escalation)
- **Cumulative return:** +0.72% (~$100,717 / $100,000 initial; estimated)
- **SPX cumulative since May 1:** ~+1.5% (from ~7,200 to 7,337)
- **Gap vs SPX:** ~-0.78 pp (still underperforming since account inception)
- **Consecutive weeks underperforming SPX:** 1 (underperforming by ~0.78 pp cumulative; not yet at 20-day threshold)

## Macro Context (as of 2026-05-08 pre-market)
- **Fed:** April 29 FOMC held at 3.75%; market pricing 50bps of cuts in 2026. No FOMC events today.
- **Geopolitics (CRITICAL VOLATILE):** Iran ceasefire collapsed May 6 AMC — Iran struck UAE (Fujairah port). Oil surged 4-6%. Now US-Iran reportedly nearing Hormuz reopening deal (contradicting signals). Oil price is highly volatile — could swing 10%+ intraday on headlines. XLE/energy position must be closely monitored.
- **Equities:** S&P 500 at 7,337 (retreated from record 7,365). AI semi theme intact (NVDA +3% May 7, TSM flat). ARM sold off -10.1% (supply fears). AMD pulled back to $408 from earnings-day $421.
- **Crypto:** BTC $79,642 (down from $82,320 May 6). Risk-off in crypto. Breakout thesis weakened.
- **Gold:** Near $4,700+/oz — elevated on Iran war premium. GLD ~$447. Strong safe-haven bid.
- **Today's binary events (May 8):** None confirmed. ARM already reported. Market closed yesterday on Iran escalation.
- **Upcoming events this week:** No major FOMC or economic data confirmed for today.

## Active Themes
1. **AI broadening** — TSM + NVDA + AVGO in (long-term). AMD pulling back to $408 — better entry than post-earnings spike. PLTR recovery from $134 post-earnings low to $137.86 confirmed. AMD + PLTR MOOs pending operator placement.
2. **Steeper curve / financials tailwind** — JPM in (long-term), stable.
3. **Iran war geopolitical hedge** — GLD (active) surging on Iran war premium (~$447 est). XLE (active) recovered from $57 danger zone to $62+ on oil surge. GLD is now the strongest performer in the portfolio (% gain basis).
4. **Crypto recovery — PAUSED** — BTC breakout thesis failed; reversed to $79,642. Scoring 6.0 — not entering. Will reassess above $82,000.
5. **AMD post-earnings continuation** — ARM sympathy selloff created better entry. Approved 7.5/10, MOO pending.
6. **PLTR defense/AI platform** — Iran war = explicit bullish catalyst for Palantir defense contracts. Approved 7.0/10, MOO pending.

## Pending Actions — OPERATOR MUST EXECUTE BEFORE 9:25 AM ET MAY 8

Two approved orders attempted via API but FAILED (API still blocked). Manual placement required:

1. **AMD** (score 7.5, earnings-reaction-follow, active): Buy 11 shares MOO (market on open, time_in_force=opg). At Market Open routine (9:45 ET), place stop-sell GTC at fill_price × 0.95. Expected fill ~$405–415.

2. **PLTR** (score 7.0, ai-momentum-pullback, long-term): Buy 36 shares MOO (market on open, time_in_force=opg). At Market Open routine (9:45 ET), place stop-sell GTC at fill_price × 0.88. Expected fill ~$135–142.

3. **AVGO verification** (CRITICAL): AVGO bracket (7 sh, order_id: 7fe3b17a, limit $418.59 GTC) likely FILLED on May 7 when AVGO's intraday low was ~$414–418. Verify in Alpaca: (a) Was the fill confirmed? (b) Is the bracket stop $368.36 active? If NOT filled: consider canceling and placing new bracket at current levels (~$424+).

4. **BTC/USD** — RESCORED AND REJECTED today (score 6.0 < 7.0). No action needed. Will reassess when/if BTC re-establishes above $82,000.

## Pending Deferrals (≥7 watchlist names not yet entered)
- **AMD** (7.5) — API blocked, operator must place MOO (11 sh) before 9:25 AM ET May 8
- **PLTR** (7.0) — API blocked, operator must place MOO (36 sh) before 9:25 AM ET May 8

## Lessons Learned (running log)
- **Week of 2026-04-27 (init):** No trades placed. First-run setup; benchmarking begins next week. Established research baseline so future weekly reviews can compare against. Note: do **not** chase late-stage breakouts in extended names without a clear pullback or post-earnings reset — this market is at record highs and risk/reward shrinks at the top of ranges.
- **2026-05-01 — bias correction (operator-mandated):** Week 1 sat in 100% cash through Mon–Fri despite the account being funded 2026-04-27 and a fully scored watchlist (5 names ≥ 7) existing by Friday morning. The "disciplined dry-run" framing was a rationalization for inaction. Operator correction: the mission is aggressive growth; capital in cash earns nothing toward beating SPX. Going forward, score ≥ 7 = enter at the next routine, period. The Monday plan from the most recent weekly review is the floor of action, not the ceiling. The only acceptable reasons to skip a ≥ 7 entry are: (1) hard guardrail breach, (2) binary event within 48h, (3) 3% daily-loss circuit breaker tripped. See CLAUDE.md "Deployment Bias" section. Any future routine that ends with cash above the 10% floor and scored ≥ 7 candidates on the watchlist must justify it against those three exemptions in logs/trades.md, or it is a logged guardrail violation.
- **2026-05-04 — remote-routine failure mode discovered:** Both Pre-Market (12:00 UTC) and Market Open (13:45 UTC) cron triggers fired today (`next_run_at` advanced to 2026-05-05) but produced ZERO commits, ZERO log entries, and ZERO Alpaca orders. Account stayed at 100% cash through both windows — same Week-1 failure mode despite the deployment-bias instructions in the trigger prompts. The manual session at 10:55 AM ET broke the streak. Root cause not yet diagnosed — need to inspect run history at claude.ai/code/routines. Hypothesis: the agent is generating a thoughtful response but skipping the actual `curl POST /v2/orders` and `git push` steps. The MANDATORY OUTPUT CONTRACT in the trigger prompt is necessary but apparently not sufficient. Possible mitigations once diagnosed: tighten allowed_tools, add a self-check at end of run that verifies `git log --since='5 minutes ago' | grep <routine_name>`, or have the agent output the curl response JSON to a watch file the next routine cross-checks.
- **2026-05-05 — silent failure REPEATS post-fix; heartbeat infra was NOT sufficient:** Heartbeat-START forcing-function commits (`47d3c71`, `ca3f79f`) deployed at 04:30 UTC, then BOTH morning routines silently failed AGAIN at 12:00 UTC and 13:45 UTC. No heartbeat START commit, no `logs/heartbeats/2026-05-05.log` file — confirming the post-fix signature: **the model is failing BEFORE its first user-message-driven tool call**. STEP 0 inside the prompt cannot save us if the model never executes a tool. Today the account survived only because the operator pre-queued NVDA/AVGO/JPM brackets the night before (commit `db9e55a`); NVDA + JPM filled at open without any routine intervention. Stop-coverage audit on the manual catch-up revealed GLD had 6 shares NAKED (yesterday's trim sell expired, but stop was reduced to 1 sh — so GLD became unprotected on 6 of 7 sh). Fixed via a second 6-sh stop at 397.92. **Lesson — durable, not just reactive:** until the routine infra is diagnosed and fixed, every Daily Review MUST end with at least one pre-queued bracket BUY (tif=gtc) on the highest-conviction watchlist name. This is now a hard requirement, not a fallback. Diagnostic next step: inspect run history at https://claude.ai/code/routines for both trigger IDs and look for a model-init failure trace; suspect the auto-attached Google Drive MCP connector or the very long trigger prompt blocking session start.
- **2026-05-06 — NEW FAILURE MODE: Alpaca API blocked in sandbox; routine ran 11h late:** Heartbeat START committed successfully (first time in days!) at 22:59 UTC but (1) routine ran at 22:59 UTC instead of 12:00 UTC (7 PM ET, market closed — MOO window missed), and (2) all Alpaca API calls return "Host not in allowlist" — outbound egress to paper-api.alpaca.markets is blocked in the sandbox runner. This is a THIRD distinct failure mode separate from the prior silent-failure incidents. Three approved orders (AMD 7.33, PLTR 7.0, BTC 7.17) documented as attempts in trades.md; NONE could be placed. **Operator MUST manually place all three before 9:25 AM ET May 7.** Research, scoring, and log entries are complete. The routine's observability improved (heartbeat works) but execution layer is still broken (API egress blocked). Next step: operator must unblock paper-api.alpaca.markets egress in the runner's network allowlist, in addition to fixing the timing issue (routine should fire at 12:00 UTC not 23:00 UTC).
- **2026-05-07 — SILENT FAILURE AGAIN (4th consecutive trading day without automated routine):** No trades.md entries for May 7. No heartbeat log for May 7. The Alpaca API blockage means even when a routine fires, it cannot verify positions, audit stops, or place orders. AVGO bracket fill on May 7 was completely unmonitored. The portfolio is flying blind between manually-triggered sessions. **Critical need:** operator must unblock paper-api.alpaca.markets and fix routine timing before weekend.
- **2026-05-08 — API still blocked; ARM earnings created AMD pullback opportunity:** ARM's -10.1% post-earnings selloff (May 7) dragged AMD down 3.1% to $408. This actually improved AMD's technical setup (less overbought, closer to $400 support). Re-scored AMD at 7.5 (up from 7.33 on May 6) — better entry. Also: Iran war flare-up benefited portfolio on May 7 (GLD, XLE both surged). The portfolio IS positioned well for the current macro, but cannot confirm positions or place new orders without API access.

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
- **Market Open (9:45 ET):** FIRST ACTION is stop audit (all 6 positions). If AMD and/or PLTR MOOs filled (operator-placed), place follow-up GTC stop orders immediately: AMD stop at fill_price × 0.95; PLTR stop at fill_price × 0.88. Verify AVGO bracket stop is active.
- **Mid-Morning (11:00 ET):** Second stop audit pass. Review intraday movers — watch XLE for oil volatility (Iran/Hormuz headlines). Monitor AMD for follow-through above $415 or reversal at $400 support.
- **Midday/Afternoon/Close:** Standard execution per playbook. Watch oil headlines (Iran/Hormuz deal) — if deal confirmed, consider trimming XLE (profit take near $65 target or before stop at $56.15 triggers on any sharp reversal). GLD remains a core hold.
- **Daily Review (16:30 ET):** MUST: (1) confirm AVGO fill status; (2) update all position P/Ls; (3) pre-queue at least one GTC bracket BUY for Monday open (durable pre-queue rule from May 5 lesson). Look at NVDA — earnings expected soon; may need to close or protect position before binary event.
- **Weekend (May 9-10):** Operator should investigate and unblock paper-api.alpaca.markets egress. This is now the 4th consecutive trading day of API blockage. Without resolution, automated orders remain impossible and the portfolio is at risk of stops being missed.

## Cash Reserve Floor
$10,000 (10%). Current cash $85,550.02 — $75,550 available to deploy before hitting floor. Plenty of room for fresh entries when watchlist refreshes.
