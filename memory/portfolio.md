# Opus Trader — Portfolio Memory

## Last Updated
2026-05-14 (Thursday) — Market Close routine (3:44 PM ET / 19:44 UTC). Alpaca API STILL blocked ("Host not in allowlist" — Anthropic TLS proxy). **8th consecutive blocked routine.** AMD MOC attempted 19:44Z and blocked (HTTP 403). NVDA +4.5% and AVGO +4.4% on Trump-Xi H200 chip deal confirmation. Net unrealized P/L improved to +$672.97. Gap vs SPX narrowed to -2.72 pp (from -3.27 pp).

## Current Account Snapshot
- **Broker:** Alpaca Paper Trading (account PA3TXVEJ19LW)
- **Total Equity (estimated):** ~$100,673 (estimated; API blocked; prices from May 14 web research)
- **Cash:** $80,945.53 (80.4%) — unchanged; no orders have executed since May 4/5 fills
- **Long Market Value (estimated):** ~$19,727 (6 positions)
- **Open Positions:** 6 (TSM, GLD, NVDA, JPM, XLE, AVGO confirmed fill implied)
- **Pending Orders / Actions:** AMD MOC attempted and blocked — OPERATOR MUST place AMD 10sh manually before market open May 15 (limit ~$446, stop -5% = ~$423.70, target +10% = ~$490.60)
- **API Status:** BLOCKED — "Host not in allowlist" (HTTP 403, Anthropic sandbox TLS proxy). Persistent failure since May 6. **8th consecutive blocked routine.**
- **Daytrade Count:** 0

## Bucket State
| Bucket | Target | Current $ (est.) | Current % | Positions |
|---|---|---|---|---|
| Long-term | 55% ($55K) | ~$13,846 (TSM+NVDA+JPM+AVGO) | 13.8% | 4 (TSM, NVDA, JPM, AVGO) |
| Active Trading | 30% ($30K) | ~$5,882 (GLD+XLE) | 5.8% | 2 (GLD, XLE) |
| Crypto | 5% ($5K) | $0 | 0% | 0 |
| Cash Reserve | 10% ($10K floor) | ~$80,946 | 80.4% | — |

**Deployment gap:** Cash ~$70.9K above the 10% floor. AMD entry attempted (blocked). Massive underfillment continues.

## Open Positions (estimated, API blocked — prices from May 14 web research)
| Symbol | Bucket | Qty | Entry | Stop | Target | Cost basis | Est. Price | Est. P/L | Sector |
|---|---|---|---|---|---|---|---|---|---|
| TSM | long-term | 7 | 401.47 | 353.76 (-12%) | 498.48 (+24%) | $2,810.29 | ~$399.80 | -$11.69 | Semiconductors |
| GLD | active | 7 | 418.86 | 397.92 (-5%) | — | $2,932.02 | ~$428.53 | +$67.69 | Precious metals |
| NVDA | long-term | 15 | 198.83 | 175.60 (-12%) | 247.44 (+24%) | $2,982.45 | ~$235.63 | +$552.00 | Semiconductors |
| JPM | long-term | 9 | 308.30 | 272.14 (-12%) | 383.47 (+24%) | $2,774.72 | ~$302.00 | -$56.70 | Financials |
| XLE | active | 50 | 59.01 | 56.15 (-5%) | 65.01 (+10%) | $2,950.50 | ~$57.64 | -$68.50 | Energy |
| AVGO | long-term | 11 | 418.59 | 368.36 (-12%) | 519.05 (+24%) | $4,604.49 | ~$435.88 | +$190.19 | Semiconductors |

**Est. total long market value (all 6):** ~$19,727
- TSM: 7 × $399.80 = $2,799
- GLD: 7 × $428.53 = $3,000
- NVDA: 15 × $235.63 = $3,534
- JPM: 9 × $302.00 = $2,718
- XLE: 50 × $57.64 = $2,882
- AVGO: 11 × $435.88 = $4,795

**Net unrealized P/L: +$672.97** (vs +$231.86 May 13 — AVGO +$294 and NVDA +$153 driving today's improvement)

## Sector Exposure (estimated — May 14 EOD)
| Sector | Est. $ | Est. % of equity |
|---|---|---|
| Semiconductors (TSM+NVDA+AVGO) | $11,128 | 11.05% |
| Financials (JPM) | $2,718 | 2.70% |
| Precious metals (GLD) | $3,000 | 2.98% |
| Energy (XLE) | $2,882 | 2.86% |
| Cash | $80,946 | 80.4% |

**After AMD fill (pending for May 15):**
| Sector | Added $ | New % |
|---|---|---|
| Semiconductors (+AMD ~$4,460) | $15,588 | 15.5% |
| Cash remaining | $76,486 | 75.9% |

All sectors remain well under 25% cap after AMD fill.

**LT bucket tech sub-allocation (current):**
TSM+NVDA+AVGO = $11,128 in LT tech; LT total = $11,128 + $2,718 (JPM) = $13,846
LT-tech % = 80.4% → above 60% ceiling BUT LT bucket ($13.8K) < $20K threshold → ceiling is INFORMATIONAL per CLAUDE.md.

## Performance vs S&P 500
- **Portfolio total equity (est.):** ~$100,673
- **Portfolio total return:** +0.67% ($100,673 / $100,000 initial)
- **Today's P&L (vs May 13 est $100,232):** ~+$441 / +0.44% (AVGO +$294 + NVDA +$153 + TSM +$18 + XLE +$14, partially offset by JPM -$26 + GLD -$12)
- **S&P 500 close May 14:** ~7,444 (+0.5%). Nasdaq +1.2%, Dow -0.14%. Tech-led on Trump-Xi H200 chip deal confirmation.
- **S&P 500 return since strategy start (~May 1):** ~+3.39% (7,444 vs ~7,200 est.)
- **Gap vs SPX: -2.72 percentage points** (improved from -3.27 pp — best improvement in a single day since strategy start)
- **Today's relative vs benchmark:** -0.06 pp (essentially flat — best single-day relative performance since start)

## Macro Context (as of 2026-05-14 market close)
- **Trump-Xi Beijing Summit (TODAY — Day 1):** CONFIRMED: Washington cleared H200 Nvidia chip sales to Alibaba, Tencent, ByteDance, JD.com. AMD MI308 also supported. "Constructive China-U.S. relationship of strategic stability" framework agreed (3-year horizon). This is the semiconductor easing that chip names needed. NVDA +4.5%, AVGO +4.4%, Nasdaq +1.2%.
- **US-Iran Ceasefire:** FAILED — Trump rejected Iran's counterproposal to peace deal. "Cease-fire on life support." Oil ~$107-111/bbl Brent (elevated). Iran war continues. XLE thesis remains intact. GLD slightly lower today (risk-on from China deal offset safe-haven demand).
- **S&P 500 May 14:** ~7,444 (+0.5%). Tech-led. AI capex cycle reaffirmed. Narrow breadth with tech carrying index.
- **NVDA Earnings:** May 21 (7 days). Do NOT enter new NVDA positions after May 19. Existing position +18.5% from entry ($198.83→$235.63). Stop $175.60 provides 25.5% downside cushion. H200 China approval is incremental positive for upcoming print.
- **Bitcoin:** ~$79,549 — BELOW $82K threshold. BTC broke below $80K as China summit didn't boost crypto enough. US-Iran fears creating some selling pressure. No crypto action. Re-entry at $82K+ or $75K flush.
- **Fed/Rates:** No rate cuts in 2026; first cut deferred to 2027. PPI still elevated. Higher-for-longer = JPM NIM positive, headwind for high-multiple names (manageable with strong AI cycle).

## Active Themes
1. **AI broadening / China chip deal CONFIRMED** — TSM + NVDA + AVGO all benefiting. H200 + MI308 approved for China. AMD (score 7.67) MUST enter May 15. Summit Day 2 (May 15) — additional chip/trade news possible.
2. **Steeper curve / financials tailwind** — JPM (LT) at ~$302 — $6 below entry $308.30. PPI hot = no rate cuts = NIM support. Hold with stop $272.14.
3. **Geopolitical inflation hedge** — GLD (active) at $428.53 (+2.3% from entry). Iran ceasefire failed = continued geopolitical bid. XLE at $57.64 (oil elevated on failed Iran deal). Stop $56.15 at 2.6% cushion ⚠️.
4. **Crypto recovery** — BTC ~$79,549. Below $82K threshold. China summit didn't boost crypto this time. Re-evaluate at $82K+ or $75K flush.
5. **Government AI (PLTR AIP)** — PLTR $133.45 — touched $134.48 intraday (within $0.48 of support) but closed below. Re-score 6.50. Watch for close above $134 as re-entry trigger. Trump-Xi AI governance discussion = potential May 15 catalyst.

## Pending Actions — OPERATOR MUST EXECUTE MAY 15

1. **AMD** (score 7.67, breakout-volume, active): Buy 10 shares at open May 15 (MOO or market limit ~$446). Post-fill: place stop at fill_price × 0.95 (active -5% = ~$423.70). Target fill × 1.10 = ~$490.60. This has been approved and blocked **8 consecutive sessions**. MANDATORY. Trump-Xi H200 confirmation is additional catalyst.

2. **PLTR** (score 6.50, SKIP): Do NOT enter until daily CLOSE above $134 with volume >20M. Watch Summit Day 2 outcomes for AI governance news as potential catalyst.

3. **NVDA May 21 earnings:** Pre-earnings review MANDATORY at Daily Review May 19. No new NVDA entries after May 19. H200 China deal provides incremental earnings upside. Stop $175.60 provides 25.5% cushion.

4. **Trump-Xi Day 2 (May 15):** Watch for additional chip export control news, trade deal details, rare earth concessions. Any further semiconductor easing = re-score AMD/NVDA/AVGO upward.

5. **BTC:** Still below $82K threshold. If BTC surges to $82K+ on China summit Day 2 news, re-score crypto-flush-rebound.

## Pending Deferrals (≥7 watchlist names not yet entered)
- **AMD** (7.67) — API blocked; operator must place at market open May 15

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
- **2026-05-13 — AMD pullback (thesis intact):** AMD declined from $477 peak to $448.29. Re-score: 7.33 (Technical improved from 5 to 6 as RSI normalized).
- **2026-05-14 — Trump-Xi H200 CONFIRMED:** Washington cleared H200 chip sales to Chinese tech firms (Alibaba, Tencent, ByteDance, JD.com). NVDA +4.5% and AVGO +4.4%. AMD re-scored 7.67 (sentiment 8, macro 8 on confirmation). Gap vs SPX narrowed -0.55 pp in one day. Lesson: catalyst confirmation drives the largest single-day portfolio gains — existing positions in NVDA/AVGO captured the move correctly. The API blockage prevented capturing AMD in full.
- **2026-05-14 — 8th consecutive API block:** All predecessor routines silent failures. AMD MOC attempted 19:44Z and blocked. Deployment Bias violation documented. Cost: missed +AMD intraday move from ~$435 open to ~$453 high.
- **NVDA earnings risk:** NVDA reports Q2 on May 21 (7 days). Pre-earnings review MUST happen at Daily Review May 19. Stop $175.60 provides 25.5% cushion vs $235.63.

## Setup Performance Tracker
| Setup type | Wins | Losses | Status |
|---|---|---|---|
| ai-momentum-pullback | 0 | 0 | active (TSM open -0.4%, NVDA +18.5%, AVGO +4.1%, PLTR pending fill) |
| macro-hedge | 0 | 0 | active (GLD open +2.3%, XLE open -2.3%) |
| earnings-reaction-follow | 0 | 0 | AMD setup reclassified to breakout-volume at $466 |
| breakout-volume | 0 | 0 | AMD pending fill — 8th attempt; API blocked |
| earnings-reaction-fade | — | — | — |
| mean-reversion-oversold | — | — | — |
| sector-rotation | 0 | 0 | active (JPM open -2.0%) |
| crypto-flush-rebound | — | — | — |
| candlestick-reversal | — | — | — |

## Strategy Evolution Notes
- **2026-05-01 (init):** Strategy initialized per CLAUDE.md. No deviations.
- **2026-05-04:** First positions opened. Strategy unchanged; execution layer needs fixing.
- **2026-05-08:** Three-week persistent API blockage causing compounding execution gaps. Portfolio 85% cash vs. 10% floor target.
- **2026-05-12:** China chip deal changes AMD thesis from earnings-follow to breakout-volume. Rate-cut thesis broken (no cuts until 2027) but partially offset by China chip deal sector tailwind. PLTR government AI revenues insulated from rate environment. NVDA May 21 earnings approaching.
- **2026-05-14:** Trump-Xi H200 confirmation delivers +$441 single-day gain. Gap vs SPX narrowed from -3.27pp to -2.72pp. Best single-day relative performance since strategy start (-0.06pp vs benchmark). Existing NVDA/AVGO LT positions correctly positioned. AMD API blockage now 8 sessions — the cost of missed AMD entry is visible (~$100-150 opportunity cost from today's intraday range if MOC had filled at $446 vs open ~$435).

## Next Routine Plan
- **Pre-Market May 15 (8:00 AM ET):** PRIORITY: (1) AMD MOO 10 shares — score 7.67, MUST execute. OPERATOR: place manually before 9:25 AM ET if API still blocked. Limit ~$446 ±1%. (2) Monitor Trump-Xi summit Day 2 outcomes — chip deal implementation details, rare earth concessions, Taiwan stance. (3) Check PLTR overnight — if recovered above $134 on summit news, re-score and prepare MOO. (4) BTC — if rallied above $82K on summit optimism, re-score crypto-flush-rebound.
- **Market Open (9:45 AM ET):** If AMD MOO filled: immediately place stop at fill × 0.95. Verify all 6 existing stop orders still resting at Alpaca. XLE stop at $56.15 — 2.6% cushion; review oil prices.
- **Daily Review May 14 (4:30 PM ET — note: not yet run; this IS the close routine):** Tally May 14 moves. AMD fill + stop placement remains open.
- **Daily Review May 15 (4:30 PM ET):** (1) Full summit Day 2 assessment. (2) AMD fill confirmation + stop verification. (3) Tally NVDA earnings approach — 6 days to May 21. (4) Setup performance tracker update.

## Cash Reserve Floor
$10,000 (10%). Current cash $80,946 — $70,946 available to deploy before hitting floor. AMD fill ($4,460) leaves ~$66,486 available. Massive remaining deployment gap.
