# Opus Trader — Portfolio Memory

## Last Updated
2026-05-13 (Wednesday) — Market Close routine (3:36 PM ET / 19:36 UTC). Alpaca API STILL blocked in sandbox runner ("Host not in allowlist" — Anthropic TLS proxy). 7th consecutive blocked routine. Prices from web research. AMD MOC order attempted (3:42 PM ET) and blocked HTTP 403. PLTR re-scored to 6.50 (support broken) — skip until $134 reclaimed.

## Current Account Snapshot
- **Broker:** Alpaca Paper Trading (account PA3TXVEJ19LW)
- **Total Equity (estimated):** ~$100,232 (estimated; API blocked; prices from May 13 web research)
- **Cash:** $80,945.53 (80.7%) — unchanged; no orders have executed since May 4/5 fills
- **Long Market Value (estimated):** ~$19,286 (6 positions)
- **Open Positions:** 6 (TSM, GLD, NVDA, JPM, XLE, AVGO probable fill)
- **Pending Orders / Actions:** AMD MOC attempted and blocked — OPERATOR MUST place AMD 10sh manually before market open May 14 (limit ~$448-452, stop -5% = ~$425-427, target +10% = ~$493)
- **API Status:** BLOCKED — "Host not in allowlist" (HTTP 403, Anthropic sandbox TLS proxy). Persistent failure since May 6. 7th consecutive blocked routine.
- **Daytrade Count:** 0

## Bucket State
| Bucket | Target | Current $ (est.) | Current % | Positions |
|---|---|---|---|---|
| Long-term | 55% ($55K) | ~$13,619 (TSM+NVDA+JPM+AVGO) | 13.6% | 4 (TSM, NVDA, JPM, probable AVGO) |
| Active Trading | 30% ($30K) | ~$5,667 (GLD+XLE) | 5.7% | 2 (GLD, XLE) |
| Crypto | 5% ($5K) | $0 | 0% | 0 |
| Cash Reserve | 10% ($10K floor) | ~$80,946 | 80.7% | — |

**Deployment gap:** Cash ~$70.9K above the 10% floor. AMD entry attempted (blocked). Massive underfillment continues.

## Open Positions (estimated, API blocked — prices from May 13 web research)
| Symbol | Bucket | Qty | Entry | Stop | Target | Cost basis | Est. Price | Est. P/L | Sector |
|---|---|---|---|---|---|---|---|---|---|
| TSM | long-term | 7 | 401.47 | 353.76 (-12%) | 498.48 (+24%) | $2,810.29 | ~$397.28 | -$29.33 | Semiconductors |
| GLD | active | 7 | 418.86 | 397.92 (-5%) | — | $2,932.02 | ~$430.27 | +$79.87 | Precious metals |
| NVDA | long-term | 15 | 198.83 | 175.60 (-12%) | 247.44 (+24%) | $2,982.45 | ~$225.40 | +$398.55 | Semiconductors |
| JPM | long-term | 9 | 308.30 | 272.14 (-12%) | 383.47 (+24%) | $2,774.72 | ~$304.88 | -$30.78 | Financials |
| XLE | active | 50 | 59.01 | 56.15 (-5%) | 65.01 (+10%) | $2,950.50 | ~$57.36 | -$82.50 | Energy |
| AVGO* | long-term | 11 | 418.59 | 368.36 (-12%) | 519.05 (+24%) | $4,604.49 | ~$409.14 | -$103.95 | Semiconductors |

*AVGO: GTC bracket at $418.59 placed ~May 4. Treating as probable fill (AVGO range May 8 covered $418.59). Stop = bracket OCO child at $368.36 (-12%).

**Est. total long market value (all 6):** ~$19,286
- TSM: 7 × $397.28 = $2,781
- GLD: 7 × $430.27 = $3,012
- NVDA: 15 × $225.40 = $3,381
- JPM: 9 × $304.88 = $2,744
- XLE: 50 × $57.36 = $2,868
- AVGO: 11 × $409.14 = $4,501

**Net unrealized P/L: +$231.86** (NVDA +$399 partially offset by TSM, JPM, XLE, AVGO declines)

## Sector Exposure (estimated — May 13 EOD)
| Sector | Est. $ | Est. % of equity |
|---|---|---|
| Semiconductors (TSM+NVDA+AVGO) | $10,663 | 10.64% |
| Financials (JPM) | $2,744 | 2.74% |
| Precious metals (GLD) | $3,012 | 3.01% |
| Energy (XLE) | $2,868 | 2.86% |
| Cash | $80,946 | 80.7% |

**After AMD fill (pending for May 14):**
| Sector | Added $ | New % |
|---|---|---|
| Semiconductors (+AMD $4,483) | $15,146 | 15.1% |
| Cash remaining | $76,463 | 76.3% |

All sectors remain well under 25% cap after AMD fill.

**LT bucket tech sub-allocation (current):**
TSM+NVDA+AVGO = $10,663 in LT tech; LT total = $10,663 + $2,744 (JPM) = $13,407
LT-tech % = 79.5% → above 60% ceiling BUT LT bucket ($13.4K) < $20K threshold → ceiling is INFORMATIONAL per CLAUDE.md. PLTR skip removes that from LT bucket plans for now.

## Performance vs S&P 500
- **Portfolio total equity (est.):** ~$100,232
- **Portfolio total return:** +0.23% ($100,232 / $100,000 initial)
- **Today's P&L (vs May 12 est $100,805):** ~-$573 / -0.57% (TSM -$229 + AVGO -$229 + NVDA +$51 + GLD -$12 + JPM -$31 + XLE -$17; prior JPM estimate of $320 was too high — actual ~$300 range)
- **S&P 500 close May 13:** ~7,452 (+0.69% from 7,412.84). Tech-led despite hot PPI (+1.4% vs +0.5% expected).
- **S&P 500 return since strategy start (~May 1):** ~+3.50% (7,452 vs ~7,200 est.)
- **Gap vs SPX:** **-3.27 percentage points** — widened from -2.15pp yesterday. Driven by 80% cash exposure from API-blocked deployments.
- **CRITICAL:** Gap widening daily. AMD entry is the highest-priority deployment; operator must manually place by May 14 open if API remains blocked.

## Macro Context (as of 2026-05-13 market close)
- **PPI Report (TODAY):** April PPI +1.4% MoM vs +0.5% expected. Core PPI +1.0% vs +0.4% expected. Annual rate ~6% — biggest jump since 2022. Oil/gas-driven (Hormuz closure). Fed rate cuts pushed further. HEADWIND for high-multiple growth names.
- **Market reaction:** S&P 500 +0.69% to ~7,452 (tech-led; 2/3 of SPX components fell). Dow -0.48%. NVDA +2.1%. Tech holding up the index vs. rest of market soft.
- **China chip deal (week of May 8-12):** NVDA + AMD + AVGO agreed to 15% U.S. revenue share on China AI chip sales. AMD MI308 + NVDA H20 approved for China. AMD $500M-800M 2026 revenue upside. NVDA $7-12.5B. TSM also benefits as fabricator.
- **Trump-Xi Beijing summit (May 14-15):** Trump arrived in Beijing on May 13. Summit tomorrow-Friday. Agenda: trade, semiconductor export controls, Taiwan, Iran. Analysts expect "tactical stabilization" — semiconductor easing possible. Key catalyst for TSM, NVDA, AMD, AVGO.
- **Iran deal:** Still unconfirmed. Oil $100-126/bbl (Brent). XLE thesis intact — stop at $56.15 protecting position (2.2% cushion at $57.36).
- **S&P 500:** ~7,452 close May 13 (new approximate high). AI capex cycle intact. Narrow breadth — tech carrying index.
- **NVDA Earnings:** May 21 (8 days). Do NOT enter new NVDA positions after May 19. Existing position stop $175.60 provides 28.4% cushion vs $225.40. Pre-earnings review at Daily Review May 19.
- **Bitcoin:** ~$80,960 — holding near $81K. China summit could boost crypto sentiment. Re-entry threshold remains $82K+.

## Active Themes
1. **AI broadening / China chip deal** — TSM + NVDA + probable AVGO in LT bucket. AMD approved (7.33), MOC blocked — MUST enter May 14. TSM/NVDA/AVGO all China deal beneficiaries. Trump-Xi summit = additional catalyst.
2. **Steeper curve / financials tailwind** — JPM (LT) at $304.88 — slightly below entry $308.30. PPI hot = no rate cuts. JPM NIM benefit from higher rates partially offsets. Hold with stop $272.14.
3. **Geopolitical inflation hedge** — GLD (active) +2.7% from entry. PPI shock today bids gold. Iran deal NOT confirmed — XLE stop at $56.15 active (2.2% cushion ⚠️).
4. **Crypto recovery** — BTC ~$80,960. Still below $82K threshold. China summit outcomes may drive crypto sentiment. Re-evaluate at $82K+ or $75K flush.
5. **Government AI (PLTR AIP)** — PLTR broke $134 support (-4.31% today). Re-scored 6.50. Skip until reclaim. Watch for Trump-Xi AI governance news as re-entry catalyst.

## Pending Actions — OPERATOR MUST EXECUTE MAY 14

1. **AMD** (score 7.33, breakout-volume, active): Buy 10 shares at open May 14 (MOO or market limit ~$448). Post-fill: place stop at fill_price × 0.95 (active -5% = ~$425-427). Target fill × 1.10 = ~$493. This has been approved and blocked 3+ consecutive sessions. MANDATORY.

2. **PLTR** (score 6.50, SKIP): Do NOT enter until price reclaims $134 support. Watch for recovery post Trump-Xi summit outcomes or fresh catalyst.

3. **NVDA May 21 earnings:** Pre-earnings review at Daily Review May 19. No new NVDA entries after May 19. Existing stop $175.60 provides 28% cushion. Consider partial profit-taking or hedge if NVDA rallies further pre-earnings.

4. **AVGO:** Still unconfirmed via API. Treating as probable fill at $418.59. Current price $409.14 (-2.26% below entry but above stop $368.36). If NOT filled, operator should verify account.

5. **Trump-Xi summit outcomes (May 14-15):** Watch for chip export control news. Any positive outcome could be additional catalyst for NVDA, AMD, TSM, AVGO. No pre-positioning needed — existing holdings capture the move.

## Pending Deferrals (≥7 watchlist names not yet entered)
- **AMD** (7.33) — API blocked; operator must place at market open May 14

## Lessons Learned (running log)
- **Week of 2026-04-27 (init):** No trades placed. First-run setup; benchmarking begins next week.
- **2026-05-01 — bias correction (operator-mandated):** Capital in cash earns nothing. Score ≥ 7 = enter at next routine. Only 3 valid skip exemptions per CLAUDE.md Deployment Bias.
- **2026-05-04 — remote-routine failure mode discovered:** Cron triggers produced zero commits/orders. Manual session broke the streak.
- **2026-05-05 — silent failure REPEATS:** Heartbeat infra not sufficient. Operator pre-queued brackets saved the day (NVDA, JPM filled). GLD naked stop discovered and fixed.
- **2026-05-06 — API blocked (new failure mode):** Routine ran late AND Alpaca API blocked. AMD, PLTR, BTC documented as attempts; none executed.
- **2026-05-08 — API blocked AGAIN (3rd consecutive):** AMD and PLTR MOO blocked at 12:19Z. HTTP 403 from Anthropic TLS proxy. Persistent infrastructure problem.
- **2026-05-08 to 2026-05-12 (weekend gap):** S&P 500 hit record 7,412.84 on May 11 while portfolio remained 80% cash. Gap cost: ~2.1-2.7 percentage points vs. benchmark.
- **2026-05-12 — CPI binary event note:** April CPI is NOT a CLAUDE.md-exempt binary event. MOO orders must be placed regardless; CPI price reflection happens at open.
- **2026-05-12 — AMD setup change:** AMD entry thesis changed from `earnings-reaction-follow` (at $413) to `breakout-volume` (at $466) due to China chip deal catalyst. Scores valid at 7.33. Technical 5 due to elevated RSI.
- **2026-05-13 — PPI shock:** April PPI +1.4% vs +0.5% expected — largest since 2022. S&P rose +0.69% anyway (tech-led). Lesson: macro data shocks can be absorbed by strong sector narratives (AI/tech). PPI is NOT a CLAUDE.md-exempt binary event — same as CPI.
- **2026-05-13 — PLTR support break:** PLTR fell -4.31% to $129.99, breaking $134 support zone. Re-score: 6.50 (Technical dropped to 3). Correct response: re-score and skip — not force-entry into broken technical setup. Will re-enter when $134 reclaimed.
- **2026-05-13 — AMD pullback (thesis intact):** AMD declined from $477 peak to $448.29. Re-score: 7.33 (Technical improved from 5 to 6 as RSI normalized). Remains a MUST-ENTER. 7th consecutive API blockage.
- **NVDA earnings risk:** NVDA reports Q2 on May 21 (8 days). Pre-earnings review MUST happen at Daily Review May 19. Stop $175.60 provides 28% cushion vs $225.40.

## Setup Performance Tracker
| Setup type | Wins | Losses | Status |
|---|---|---|---|
| ai-momentum-pullback | 0 | 0 | active (TSM open, PLTR pending fill) |
| macro-hedge | 0 | 0 | active (GLD open +3.1%, XLE open -2.2%) |
| earnings-reaction-follow | 0 | 0 | AMD setup reclassified to breakout-volume at $466 |
| breakout-volume | 0 | 0 | AMD pending fill at $466 (China chip deal) |
| earnings-reaction-fade | — | — | — |
| mean-reversion-oversold | — | — | — |
| sector-rotation | 0 | 0 | active (JPM open +2.9%) |
| crypto-flush-rebound | — | — | — |
| candlestick-reversal | — | — | — |

## Strategy Evolution Notes
- **2026-05-01 (init):** Strategy initialized per CLAUDE.md. No deviations.
- **2026-05-04:** First positions opened. Strategy unchanged; execution layer needs fixing.
- **2026-05-08:** Three-week persistent API blockage causing compounding execution gaps. Portfolio 85% cash vs. 10% floor target.
- **2026-05-12:** China chip deal changes AMD thesis from earnings-follow to breakout-volume. Rate-cut thesis broken (no cuts until 2027) but partially offset by China chip deal sector tailwind. PLTR government AI revenues insulated from rate environment. NVDA May 21 earnings approaching.

## Next Routine Plan
- **Pre-Market May 14 (8:00 AM ET):** PRIORITY: (1) AMD MOO 10 shares — score 7.33, MUST execute. If API still blocked, operator places manually before 9:25 AM ET. (2) Monitor Trump-Xi summit Day 1 outcomes overnight — any chip export deal news = re-score TSM, NVDA, AMD upward. (3) Check PLTR overnight — if recovered above $134 on summit news, re-enter with fresh score. (4) Check AVGO bracket status if API unblocked.
- **Market Open (9:45 AM ET):** If AMD MOO filled: immediately place stop at fill × 0.95. Verify all 6 existing stop orders still resting at Alpaca. Assess XLE — stop at $56.15 is thin (2.2% from $57.36).
- **Daily Review May 14 (4:30 PM ET):** (1) Tally AMD fill + stop placement. (2) Trump-Xi summit Day 1 assessment. (3) Score new chip plays if summit catalyst emerges. (4) Score BTC if above $82K.

## Cash Reserve Floor
$10,000 (10%). Current cash $80,946 — $70,946 available to deploy before hitting floor. PLTR + AMD fills would consume ~$9,592, leaving ~$61,354+ available. Massive remaining deployment gap.
