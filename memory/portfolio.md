# Opus Trader — Portfolio Memory

## Last Updated
2026-05-14 (Thursday) — Midday routine (12:30 PM ET / 16:33 UTC). Alpaca API STILL blocked ("Host not in allowlist" — Anthropic TLS proxy). 8th consecutive blocked routine. Prices from web research. AMD bracket limit order attempted at 16:38 UTC (limit $451.25, stop $426.55, target $493.90, qty 10) — HTTP 403 again. MAJOR CATALYST: Trump-Xi Beijing summit Day 1 — H200 chips cleared for China (Alibaba, Tencent, ByteDance, JD.com). Semiconductor sector surging: NVDA +3.41%, AVGO +4.6%, TSM +3.9% from entry. All 6 positions above stop levels.

## Current Account Snapshot
- **Broker:** Alpaca Paper Trading (account PA3TXVEJ19LW)
- **Total Equity (estimated):** ~$100,830 (estimated; API blocked; prices from May 14 web research ~12:30 PM ET)
- **Cash:** $80,945.53 (80.3%) — unchanged; no orders have executed since May 4/5 fills
- **Long Market Value (estimated):** ~$19,884 (6 positions, surging on H200/China deal catalyst)
- **Open Positions:** 6 (TSM, GLD, NVDA, JPM, XLE, AVGO probable fill)
- **Pending Orders / Actions:** AMD limit bracket attempted again (blocked). OPERATOR MUST place AMD 10sh manually — limit $451.25, stop $426.55 (-5%), target $493.90 (+10%). Score upgraded to 7.67 on Trump-Xi H200 catalyst. NINTH CONSECUTIVE BLOCKED SESSION — NO AMD FILL.
- **API Status:** BLOCKED — "Host not in allowlist" (HTTP 403, Anthropic sandbox TLS proxy). Persistent failure since May 6. 8th consecutive blocked routine.
- **Daytrade Count:** 0

## Bucket State
| Bucket | Target | Current $ (est.) | Current % | Positions |
|---|---|---|---|---|
| Long-term | 55% ($55K) | ~$14,072 (TSM+NVDA+JPM+AVGO) | 14.0% | 4 (TSM, NVDA, JPM, probable AVGO) |
| Active Trading | 30% ($30K) | ~$5,892 (GLD+XLE) | 5.8% | 2 (GLD, XLE) |
| Crypto | 5% ($5K) | $0 | 0% | 0 |
| Cash Reserve | 10% ($10K floor) | ~$80,946 | 80.3% | — |

**Deployment gap:** Cash ~$70.9K above the 10% floor. AMD entry attempted again (blocked). Massive underfillment continues. Today's H200 catalyst makes AMD entry even more critical.

## Open Positions (estimated, API blocked — prices from May 14 web research ~12:30 PM ET)
| Symbol | Bucket | Qty | Entry | Stop | Target | Cost basis | Est. Price | Est. P/L | Sector |
|---|---|---|---|---|---|---|---|---|---|
| TSM | long-term | 7 | 401.47 | 353.76 (-12%) | 498.48 (+24%) | $2,810.29 | ~$416.00 | +$101.71 | Semiconductors |
| GLD | active | 7 | 418.86 | 397.92 (-5%) | — | $2,932.02 | ~$430.00 | +$77.98 | Precious metals |
| NVDA | long-term | 15 | 198.83 | 175.60 (-12%) | 247.44 (+24%) | $2,982.45 | ~$233.60 | +$521.55 | Semiconductors |
| JPM | long-term | 9 | 308.30 | 272.14 (-12%) | 383.47 (+24%) | $2,774.72 | ~$309.00 | +$6.30 | Financials |
| XLE | active | 50 | 59.01 | 56.15 (-5%) | 65.01 (+10%) | $2,950.50 | ~$57.64 | -$68.50 | Energy |
| AVGO* | long-term | 11 | 418.59 | 368.36 (-12%) | 519.05 (+24%) | $4,604.49 | ~$435.88 | +$190.19 | Semiconductors |

*AVGO: GTC bracket at $418.59 placed ~May 4. Treating as probable fill. Stop = bracket OCO child at $368.36 (-12%).

**Est. total long market value (all 6):** ~$19,884
- TSM: 7 × $416.00 = $2,912
- GLD: 7 × $430.00 = $3,010
- NVDA: 15 × $233.60 = $3,504
- JPM: 9 × $309.00 = $2,781
- XLE: 50 × $57.64 = $2,882
- AVGO: 11 × $435.88 = $4,795

**Net unrealized P/L: +$829.23** (NVDA +$522 + TSM +$102 + GLD +$78 + AVGO +$190 partially offset by XLE -$69)

## Sector Exposure (estimated — May 14 Midday)
| Sector | Est. $ | Est. % of equity |
|---|---|---|
| Semiconductors (TSM+NVDA+AVGO) | $11,211 | 11.13% |
| Financials (JPM) | $2,781 | 2.76% |
| Precious metals (GLD) | $3,010 | 2.99% |
| Energy (XLE) | $2,882 | 2.86% |
| Cash | $80,946 | 80.3% |

**After AMD fill (pending):**
| Sector | Added $ | New % |
|---|---|---|
| Semiconductors (+AMD ~$4,490) | $15,701 | 15.6% |
| Cash remaining | $76,456 | 75.8% |

All sectors remain well under 25% cap after AMD fill.

**LT bucket tech sub-allocation (current):**
TSM+NVDA+AVGO = $11,211 in LT tech; LT total = $11,211 + $2,781 (JPM) = $13,992
LT-tech % = 80.1% → above 60% ceiling BUT LT bucket ($14.0K) < $20K threshold → ceiling is INFORMATIONAL per CLAUDE.md.

## Performance vs S&P 500
- **Portfolio total equity (est.):** ~$100,830
- **Portfolio total return:** +0.83% ($100,830 / $100,000 initial)
- **Today's P&L (vs May 13 est $100,232):** ~+$598 / +0.60% (NVDA +$123 + TSM +$131 + AVGO +$294 + JPM +$37 + GLD -$2 + XLE +$14)
- **S&P 500 midday May 14:** ~7,499 (+0.75% from 7,452 May 13 close). Gaining on Trump-Xi summit H200 deal.
- **S&P 500 return since strategy start (~May 1):** ~+4.15% (7,499 vs ~7,200 est.)
- **Gap vs SPX:** **-3.32 percentage points** — widened marginally from -3.27pp. Portfolio keeping pace with market today (+0.60% today vs SPX +0.75%) but structural gap persists from massive cash position.
- **CRITICAL:** Gap at -3.32pp. AMD fill remains #1 priority. Operator MUST place manually. 8th consecutive blocked session.

## Macro Context (as of 2026-05-14 Midday)
- **Trump-Xi Beijing Summit Day 1 (TODAY — MAJOR CATALYST):** H200 GPU exports cleared for ~10 Chinese tech firms (Alibaba, Tencent, ByteDance, JD.com). Xi says China will "open wider" to US business. Trade truce (tariffs cut from 145% to 30%) reinforced. Taiwan remains contentious. MASSIVE positive for NVDA, AMD, TSM, AVGO.
- **Market reaction May 14:** S&P 500 ~+0.75% to 7,499. Nasdaq +0.88%. Risk-on tone. Semiconductor sector surging. NVDA +3.41%, AVGO +4.6%, TSM +3.9% from entry.
- **Gold:** Spot ~$4,705/oz (flat). GLD ~$430. Iran-US truce AND positive summit outcomes reduce safe-haven demand. Gold not selling off aggressively — still supported by inflation (PPI, CPI elevated).
- **Oil/Energy:** Brent $110.87 (May 13). Iran-US truce reducing geopolitical premium — oil was $126 peak, now $110. XLE at $57.64 (day low $56.96 — very close to stop $56.15). Energy thesis weakening. XLE risk elevated.
- **NVDA Earnings:** May 21 (7 days). Do NOT enter new NVDA positions after May 19. Existing stop $175.60 provides 32.5% cushion vs $233.60. Pre-earnings review at Daily Review May 19.
- **Bitcoin:** ~$80,960-83,000 range expected on summit catalyst. Re-entry threshold remains $82K+ on sustained basis.
- **Retail Sales (today):** Solid April retail sales data cited as additional market tailwind (per TheStreet). Consumption holding up despite elevated inflation.

## Active Themes
1. **AI broadening / China chip deal** — TSM + NVDA + AVGO all surging on H200 clearance. AMD MUST enter (score upgraded to 7.67 on summit catalyst). NVDA +$522 unrealized. TSM +$102. AVGO +$190.
2. **Steeper curve / financials tailwind** — JPM (LT) est. $309 — fractionally above entry $308.30. No rate cuts expected until 2027. JPM NIM benefit from elevated rates. Hold with stop $272.14.
3. **Inflation hedge (gold)** — GLD (active) +2.65% from entry (~$430 vs $418.86 entry). Trump-Xi positive outcomes reduce extreme safe-haven demand BUT elevated inflation (PPI/CPI) remains gold supportive. Hold.
4. **Energy hedge weakening** — XLE (active) at $57.64 (day low $56.96). Stop $56.15 only $1.49 away (2.6%). Iran-US truce confirmed = geopolitical premium coming out of oil. Oil declining from $126 to $110. XLE thesis weakening. Hold for now — let stop protect. If summit concludes with Iran peace deal ratification, XLE exit likely.
5. **Crypto recovery** — BTC $80,960-83,000 range. Summit positive crypto catalyst but $82K sustained needed for re-entry. Re-evaluate at Daily Review.
6. **Government AI (PLTR AIP)** — PLTR at $133.36, briefly touched $134.48 today but COULD NOT HOLD. Skip maintained (score 6.50). Need confirmed close above $134. Summit AI governance talk = potential catalyst but not sufficient yet.

## Pending Actions — OPERATOR MUST EXECUTE IMMEDIATELY (May 14)

1. **AMD** (score 7.67 UPGRADED, breakout-volume, active): Buy 10 shares NOW — limit $451.25, stop $426.55 (-5%), target $493.90 (+10%). AMD at ~$449. Trump-Xi H200 clearance = major additional catalyst. This has been blocked 8 consecutive sessions. CRITICAL MANDATORY — every hour of delay is opportunity cost as AMD moves with chip sector. OPERATOR MUST PLACE MANUALLY.

2. **PLTR** (score 6.50, SKIP): Still below $134 reclaim (at $133.36). Intraday high $134.48 insufficient — need confirmed CLOSE above $134. Continue skip.

3. **Stop trailing recommendation** (API blocked — cannot execute):
   - NVDA: Current $233.60, trail stop to $205.57 ($233.60 × 0.88) from $175.60
   - TSM: Current $416, trail stop to $366.08 ($416 × 0.88) from $353.76
   - AVGO: Current $435.88, trail stop to $383.57 ($435.88 × 0.88) from $368.36
   - OPERATOR: Please update these 3 stops manually in Alpaca

4. **NVDA May 21 earnings:** Pre-earnings review at Daily Review May 19. No new NVDA entries after May 19. Existing stop provides 32.5% cushion vs $233.60 (or 12% from trailed stop $205.57). Consider partial profit-taking at Daily Review May 19.

5. **XLE watch:** Stop $56.15 with price at $57.64 = 2.6% cushion. Iran-US truce = geopolitical oil premium fading. If XLE closes below $57, consider tightening manual stop to $57 flat to protect against breakdown.

6. **Crypto (BTC/ETH):** Monitor for Trump-Xi summit crypto sentiment signal. If BTC sustains above $82K on summit outcomes, score BTC for crypto bucket entry at next routine.

## Pending Deferrals (≥7 watchlist names not yet entered)
- **AMD** (7.67 upgraded) — API blocked; operator must place manually NOW

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
- **2026-05-14 — Trump-Xi H200 catalyst:** H200 GPUs cleared for China. NVDA +3.41%, AVGO +4.6%, TSM near +4%. AMD score UPGRADED to 7.67. Lesson: major geopolitical catalysts compound quickly — the cost of not entering AMD on May 6-14 is now visible in price action. Every blocked session is a measurable opportunity cost.
- **NVDA earnings risk:** NVDA reports Q2 on May 21 (7 days as of May 14). Pre-earnings review MUST happen at Daily Review May 19. Stop $175.60 provides 32.5% cushion vs $233.60. Trail stop recommendation: $205.57.

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
- **Afternoon May 14 (2:00 PM ET):** (1) AMD still not filled — attempt again or confirm operator placed manually. (2) Monitor XLE — if below $57, tighten stop recommendation. (3) Check BTC if sustained above $82K on summit outcomes. (4) Monitor PLTR for close above $134.
- **Market Close May 14 (3:30 PM ET):** (1) If AMD still unfilled, place MOC order for AMD 10sh to guarantee today's fill. (2) Trail NVDA/TSM/AVGO stops if API unblocks. (3) Assess XLE ahead of overnight — may close to reduce binary risk from summit Day 2.
- **Daily Review May 14 (4:30 PM ET):** (1) Tally positions with summit Day 1 outcomes. (2) Score BTC for crypto bucket (if $82K+ sustained). (3) PLTR — score again if closed above $134. (4) Strategy evolution note: AMD opportunity cost from 8 consecutive blocked sessions = quantified. (5) NVDA pre-earnings plan for May 19 review.

## Cash Reserve Floor
$10,000 (10%). Current cash $80,946 — $70,946 available to deploy before hitting floor. PLTR + AMD fills would consume ~$9,592, leaving ~$61,354+ available. Massive remaining deployment gap.
