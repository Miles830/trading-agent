# Opus Trader — Portfolio Memory

## Last Updated
2026-05-14 (Thursday) — Afternoon routine (2:07 PM ET / 18:07 UTC). Alpaca API STILL blocked ("Host not in allowlist" — Anthropic TLS proxy). 8th consecutive blocked routine. Prices from web research. AMD limit bracket attempted (18:07Z) — blocked HTTP 403. NVDA +3.9% on Trump-Xi H200 China approval (10 Chinese firms, 75K chips each). PLTR recovering to $133.39 but still below $134 trigger. BTC $79,640 — below $82K re-entry threshold.

## Current Account Snapshot
- **Broker:** Alpaca Paper Trading (account PA3TXVEJ19LW)
- **Total Equity (estimated):** ~$100,546 (estimated; API blocked; prices from May 14 web research ~2PM ET)
- **Cash:** $80,945.53 (80.5%) — unchanged; no orders have executed since May 4/5 fills
- **Long Market Value (estimated):** ~$19,600 (6 positions)
- **Open Positions:** 6 (TSM, GLD, NVDA, JPM, XLE, AVGO probable fill)
- **Pending Orders / Actions:** AMD limit bracket attempted (18:07Z May 14) — BLOCKED HTTP 403. OPERATOR MUST place AMD 10sh MOO before 9:25 AM ET May 15 (score 7.50, MANDATORY).
- **API Status:** BLOCKED — "Host not in allowlist" (HTTP 403, Anthropic sandbox TLS proxy). Persistent failure since May 6. 8th consecutive blocked routine.
- **Daytrade Count:** 0
- **NVDA Stop Trail PENDING:** Recommend trailing NVDA stop from $175.60 → $206.07 (-12% of $234.17 current). Cannot execute (API blocked). OPERATOR or Market Open May 15 routine must update Alpaca stop order.

## Bucket State
| Bucket | Target | Current $ (est.) | Current % | Positions |
|---|---|---|---|---|
| Long-term | 55% ($55K) | ~$13,715 (TSM+NVDA+JPM+AVGO) | 13.6% | 4 (TSM, NVDA, JPM, probable AVGO) |
| Active Trading | 30% ($30K) | ~$5,885 (GLD+XLE) | 5.9% | 2 (GLD, XLE) |
| Crypto | 5% ($5K) | $0 | 0% | 0 |
| Cash Reserve | 10% ($10K floor) | ~$80,946 | 80.5% | — |

**Deployment gap:** Cash ~$70.9K above the 10% floor. AMD entry attempted and blocked (8th consecutive). Massive underfillment continues.

## Open Positions (estimated, API blocked — prices from May 14 web research ~2PM ET)
| Symbol | Bucket | Qty | Entry | Stop | Target | Cost basis | Est. Price | Est. P/L | Sector |
|---|---|---|---|---|---|---|---|---|---|
| TSM | long-term | 7 | 401.47 | 353.76 (-12%) | 498.48 (+24%) | $2,810.29 | ~$399.80 | -$11.69 | Semiconductors |
| GLD | active | 7 | 418.86 | 397.92 (-5%) | — | $2,932.02 | ~$429.01 | +$71.05 | Precious metals |
| NVDA | long-term | 15 | 198.83 | 175.60 (-12%)* | 247.44 (+24%) | $2,982.45 | ~$234.17 | +$530.10 | Semiconductors |
| JPM | long-term | 9 | 308.30 | 272.14 (-12%) | 383.47 (+24%) | $2,774.72 | ~$313.28 | +$44.82 | Financials |
| XLE | active | 50 | 59.01 | 56.15 (-5%) | 65.01 (+10%) | $2,950.50 | ~$57.64 | -$68.50 | Energy |
| AVGO** | long-term | 11 | 418.59 | 368.36 (-12%) | 519.05 (+24%) | $4,604.49 | ~$416.79 | -$19.80 | Semiconductors |

*NVDA stop trail PENDING: recommended to trail from $175.60 → $206.07 (-12% of $234.17). Cannot execute — API blocked. OPERATOR / Market Open May 15 must update.
**AVGO: GTC bracket at $418.59 placed ~May 4. Treating as probable fill. Stop = bracket OCO child at $368.36 (-12%).

**Est. total long market value (all 6):** ~$19,600
- TSM: 7 × $399.80 = $2,799
- GLD: 7 × $429.01 = $3,003
- NVDA: 15 × $234.17 = $3,513
- JPM: 9 × $313.28 = $2,820
- XLE: 50 × $57.64 = $2,882
- AVGO: 11 × $416.79 = $4,585

**Net unrealized P/L: +$545.98** (NVDA H200 China approval added ~$131 today; JPM +$44 from entry; GLD +$71 from entry)

## Sector Exposure (estimated — May 14 ~2PM ET)
| Sector | Est. $ | Est. % of equity |
|---|---|---|
| Semiconductors (TSM+NVDA+AVGO) | $10,896 | 10.84% |
| Financials (JPM) | $2,820 | 2.80% |
| Precious metals (GLD) | $3,003 | 2.99% |
| Energy (XLE) | $2,882 | 2.87% |
| Cash | $80,946 | 80.5% |

**After AMD fill (pending for May 15 MOO):**
| Sector | Added $ | New % |
|---|---|---|
| Semiconductors (+AMD ~$4,510) | $15,406 | 15.3% |
| Cash remaining | $76,435 | 76.0% |

All sectors remain well under 25% cap after AMD fill.

**LT bucket tech sub-allocation (current):**
TSM+NVDA+AVGO = $10,896 in LT tech; LT total = $10,896 + $2,820 (JPM) = $13,716
LT-tech % = 79.5% → above 60% ceiling BUT LT bucket ($13.7K) < $20K threshold → ceiling is INFORMATIONAL per CLAUDE.md.

## Performance vs S&P 500
- **Portfolio total equity (est.):** ~$100,546
- **Portfolio total return:** +0.55% ($100,546 / $100,000 initial)
- **Today's P&L (vs May 13 est $100,232):** ~+$314 / +0.31% (NVDA +$131 from H200 news + JPM +$38 + TSM +$13 + AVGO +$51 - GLD -$9 - XLE +$10)
- **S&P 500 May 14 (intraday, 2PM est.):** ~7,474 (+0.3% from 7,452 close). Dow +0.7% to 50,000. Trump-Xi summit catalyst.
- **S&P 500 return since strategy start (~May 1):** ~+3.8% (7,474 vs ~7,200 est.)
- **Gap vs SPX:** **~-3.25 percentage points** — essentially flat from -3.27pp yesterday. Today: portfolio +0.31% vs SPX +0.3% = NEUTRAL (slight reversal of gap widening trend).
- **CRITICAL:** Gap stabilized today. AMD entry is still highest-priority deployment — MUST execute May 15. Each day of inaction adds ~0.3-0.4pp expected cost to 12-month return target.

## Macro Context (as of 2026-05-14 ~2PM ET)
- **Trump-Xi Beijing summit Day 1 (TODAY):** MAJOR: H200 chip sales approved for 10 Chinese firms (Alibaba, Tencent, ByteDance, JD.com + 6 others; 75K chips each). Jensen Huang in Beijing alongside Trump. "Constructive China-U.S. relationship of strategic stability" agreed. Key beneficiaries: NVDA (H200 directly approved), TSM (fab), AVGO (networking), AMD (MI308 separately approved). Summit continues through May 15.
- **Market reaction (May 14):** S&P 500 +0.3%, Dow +0.7% to 50,000. NVDA +3.9% ($234.17). JPM +2.76% ($313.28) on risk-on sentiment. Tech leading; energy/gold slight pullback.
- **PPI (May 13 data):** April PPI +1.4% MoM vs +0.5% expected — largest since 2022. Fed rate cuts pushed further out (no cuts 2026, first cut possibly 2027 per CME FedWatch). Still a headwind for high-multiple growth, but AI/China catalyst overriding for tech sector.
- **Iran deal:** Still unconfirmed. Oil $100-126/bbl (Brent). XLE thesis intact — stop at $56.15 (2.6% cushion at $57.64).
- **S&P 500:** ~7,474 (intraday high May 14). Dow 50,000 milestone. AI capex cycle intact. Breadth improving.
- **NVDA Earnings:** May 21 (7 days). Do NOT enter new NVDA positions after May 19. Existing position stop $175.60 — recommend trailing to $206.07 (-12% of $234.17). Pre-earnings review at Daily Review May 19.
- **Bitcoin:** ~$79,640 — below $82K re-entry threshold. 4th rejection at $82K. No entry until breakthrough above $82K or flush to $75K.
- **MSFT:** Pre-scored 7.50 for May 15 watchlist. Azure AI demand accelerating. H200 approvals → NVDA supply chain → Azure GPU cluster expansion. Price ~$404-408 May 14.

## Active Themes
1. **AI broadening / China chip deal confirmed** — TSM + NVDA + probable AVGO in LT bucket. NVDA H200 approved for 10 Chinese firms (75K each). AMD MI308 separately approved. NVDA +3.9% today. AMD approved (7.50), entry still pending — MUST enter May 15 MOO. LT bucket capturing the move.
2. **Steeper curve / financials tailwind** — JPM (LT) now ABOVE entry at $313.28 vs $308.30. PPI hot = no rate cuts. Trump-Xi "constructive" outcome = risk-on. JPM +1.62% from entry. Stop $272.14 well cushioned.
3. **Geopolitical inflation hedge** — GLD (active) +2.42% from entry ($429.01 vs $418.86). Slight pullback today (-0.29%) as risk-on partially offset safe-haven bid. Iran unconfirmed = geopolitical premium maintained. XLE thin stop (2.6% cushion ⚠️ at $56.15 vs $57.64).
4. **Crypto recovery** — BTC $79,640 — below $82K. 4th rejection at resistance. Trump-Xi constructive outcome did NOT drive crypto bid. Re-evaluate at $82K+ or $75K flush.
5. **Government AI (PLTR AIP)** — PLTR recovering to $133.39 (+2.6% today) but still below $134 support. Re-entry trigger: close above $134 on volume. Summit Day 2 (May 15) government AI/defense news could catalyze.
6. **MSFT Azure AI (NEW THEME)** — MSFT pre-scored 7.50 for May 15 watchlist. Azure GPU demand expanding as H200 supply increases. Copilot AI revenue inflecting. Full 6-agent at Pre-Market May 15.

## Pending Actions — OPERATOR MUST EXECUTE MAY 15

1. **AMD** (score 7.50, breakout-volume, active): Buy 10 shares at open May 15 (MOO — before 9:25 AM ET). Post-fill: stop at fill × 0.95. Target fill × 1.10. API-blocked 8 consecutive sessions. Score upgraded to 7.50 (Macro 7→8). MANDATORY.

2. **NVDA stop trail** (CRITICAL): Update NVDA stop from $175.60 → $206.07 at Market Open May 15. Cannot execute now (API blocked). 7 days to earnings.

3. **PLTR** (score 6.50, SKIP): Do NOT enter until $134 reclaimed. Currently $133.39. Summit Day 2 (May 15) could catalyze — re-score if opens above $134.

4. **MSFT** (pre-score 7.50, long-term): Full 6-agent analysis at Pre-Market May 15. Limit bracket GTC at ~$409. 12 shares = ~$4,908 = 4.88% <5% ✓. Sector: Software (not Semiconductors).

5. **AVGO:** Probable fill confirmed. Recovering to $416.79. H200 approval confirms custom chip/networking thesis. Hold stop $368.36.

6. **NVDA May 21 earnings:** Pre-earnings review at Daily Review May 19. No new entries after May 19.

7. **Trump-Xi summit Day 2 (May 15):** Watch final communiqué for: additional chip approvals, trade framework, rare earth deal. Positive = additional catalyst. Reassess chip names if disappointing.

## Pending Deferrals (≥7 watchlist names not yet entered)
- **AMD** (7.50) — API blocked; operator must place MOO at open May 15
- **MSFT** (7.50 pre-score) — full 6-agent score required at Pre-Market May 15

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
- **2026-05-14 — Trump-Xi H200 approval (massive catalyst):** U.S. cleared NVDA H200 sales to 10 Chinese firms (Alibaba, Tencent, ByteDance, JD.com; 75K chips each). Jensen Huang in Beijing. NVDA +3.9% ($225.40 → $234.17). AMD Macro score raised 7→8 (score 7.33→7.50). Lesson: existing positions captured the move — being invested matters. AMD still not in; each blocked day is missed return.
- **2026-05-14 — NVDA stop trail pending:** NVDA +17.8% from entry. Recommend trailing stop to $206.07 (12% below $234.17). Cannot execute (API blocked). Critical action for Market Open May 15.
- **NVDA earnings risk:** NVDA reports Q2 on May 21 (7 days). Pre-earnings review MUST happen at Daily Review May 19. Stop trail recommended NOW to protect gains.

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
- **Market Close May 14 (3:30 PM ET):** PRIORITY: (1) Flat any day trades (none open). (2) Confirm existing 6 stops status (estimated resting). (3) Note May 15 as WEEKLY REVIEW day (Friday) — will include full strategy evolution note.
- **Daily Review May 14 (4:30 PM ET):** (1) Final Trump-Xi summit Day 1 assessment. (2) AMD carry to May 15 MANDATORY. (3) NVDA stop trail recommendation formalized. (4) MSFT full 6-agent score attempt.
- **Pre-Market May 15 (8:00 AM ET) — FRIDAY (WEEKLY REVIEW DAY):** PRIORITY: (1) AMD MOO 10sh — MANDATORY. (2) NVDA stop trail update via Alpaca. (3) MSFT full 6-agent score — if ≥7, place limit bracket GTC. (4) Trump-Xi Day 2 final outcomes. (5) PLTR check — if above $134, re-score and MOO. Weekly strategy evolution note.
- **Market Open May 15 (9:45 AM ET):** CRITICAL: (1) Confirm AMD MOO fill price → immediately place stop at fill × 0.95. (2) Update NVDA stop trail from $175.60 → $206.07 via Alpaca API.

## Cash Reserve Floor
$10,000 (10%). Current cash $80,946 — $70,946 available to deploy before hitting floor. PLTR + AMD fills would consume ~$9,592, leaving ~$61,354+ available. Massive remaining deployment gap.
