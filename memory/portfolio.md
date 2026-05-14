# Opus Trader — Portfolio Memory

## Last Updated
2026-05-14 (Thursday) — Pre-Market routine (8:15 AM ET / 12:15 UTC). Alpaca API STILL blocked ("Host not in allowlist" — Anthropic TLS proxy). 9th consecutive blocked routine. Prices from web research. AMD MOO attempted and blocked (9th time). NEW: CSCO MOO attempted (earnings-reaction-follow, score 7.83) and blocked. OPERATOR MUST PLACE BOTH before 9:25 AM ET. Trump-Xi summit Day 1: NVDA H200 approved for Chinese firms — massive chip sector catalyst.

## Current Account Snapshot
- **Broker:** Alpaca Paper Trading (account PA3TXVEJ19LW)
- **Total Equity (estimated):** ~$100,442 (estimated; API blocked; prices from May 14 pre-market web research)
- **Cash:** $80,945.53 (80.5%) — unchanged; no orders have executed since May 4/5 fills
- **Long Market Value (estimated):** ~$19,496 (6 positions; NVDA up on H200 news)
- **Open Positions:** 6 confirmed (TSM, GLD, NVDA, JPM, XLE, AVGO probable fill)
- **Pending Orders / Actions:** AMD MOO attempted and BLOCKED (9th time, HTTP 403). CSCO MOO attempted and BLOCKED (1st time). OPERATOR MUST place BOTH before 9:25 AM ET: (1) AMD 10sh MOO, stop at fill×0.95, target fill×1.10; (2) CSCO 30sh MOO, stop at fill×0.95, target fill×1.10.
- **API Status:** BLOCKED — "Host not in allowlist" (HTTP 403, Anthropic sandbox TLS proxy). Persistent failure since May 6. 9th consecutive blocked routine.
- **Daytrade Count:** 0

## Bucket State (May 14 pre-market — API blocked, prices estimated)
| Bucket | Target | Current $ (est.) | Current % | Positions |
|---|---|---|---|---|
| Long-term | 55% ($55K) | ~$13,597 (TSM+NVDA+JPM+AVGO est.) | 13.5% | 4 (TSM, NVDA, JPM, probable AVGO) |
| Active Trading | 30% ($30K) | ~$5,898 (GLD+XLE est.) | 5.9% | 2 (GLD, XLE) |
| Crypto | 5% ($5K) | $0 | 0% | 0 |
| Cash Reserve | 10% ($10K floor) | ~$80,946 | 80.5% | — |

**Deployment gap:** Cash ~$70.9K above the 10% floor. AMD + CSCO entries attempted and blocked (API). OPERATOR MUST EXECUTE BOTH. After fills: Active bucket adds ~$7,410 → Active total ~$13,308 (13.3% vs 30% target — still severely underfilled).

## Open Positions (estimated, API blocked — prices from May 14 pre-market web research)
| Symbol | Bucket | Qty | Entry | Stop | Target | Cost basis | Est. Price | Est. P/L | Sector |
|---|---|---|---|---|---|---|---|---|---|
| TSM | long-term | 7 | 401.47 | 353.76 (-12%) | 498.48 (+24%) | $2,810.29 | ~$399.80 | -$11.67 | Semiconductors |
| GLD | active | 7 | 418.86 | 397.92 (-5%) | — | $2,932.02 | ~$432.00 | +$92.98 | Precious metals |
| NVDA | long-term | 15 | 198.83 | 175.60 (-12%) | 247.44 (+24%) | $2,982.45 | ~$231.00 | +$482.55 | Semiconductors |
| JPM | long-term | 9 | 308.30 | 272.14 (-12%) | 383.47 (+24%) | $2,774.72 | ~$304.00 | -$26.70 | Financials |
| XLE | active | 50 | 59.01 | 56.15 (-5%) | 65.01 (+10%) | $2,950.50 | ~$57.47 | -$77.00 | Energy |
| AVGO* | long-term | 11 | 418.59 | 368.36 (-12%) | 519.05 (+24%) | $4,604.49 | ~$418.00 | -$6.49 | Semiconductors |

*AVGO: GTC bracket at $418.59 placed ~May 4. Treating as probable fill (AVGO range May 8 covered $418.59). Stop = bracket OCO child at $368.36 (-12%).

**Est. total long market value (all 6):** ~$19,496
- TSM: 7 × $399.80 = $2,799
- GLD: 7 × $432.00 = $3,024
- NVDA: 15 × $231.00 = $3,465
- JPM: 9 × $304.00 = $2,736
- XLE: 50 × $57.47 = $2,874
- AVGO: 11 × $418.00 = $4,598

**Net unrealized P/L: +$453.67** (NVDA +$482 and GLD +$93 now the primary contributors; H200 approval lifted NVDA further)

## Sector Exposure (estimated — May 14 pre-market)
| Sector | Est. $ | Est. % of equity |
|---|---|---|
| Semiconductors (TSM+NVDA+AVGO) | $10,862 | 10.8% |
| Financials (JPM) | $2,736 | 2.7% |
| Precious metals (GLD) | $3,024 | 3.0% |
| Energy (XLE) | $2,874 | 2.9% |
| Cash | $80,946 | 80.5% |

**After AMD + CSCO fills (pending — OPERATOR must execute manually):**
| Sector | Added $ | New % (of ~$100,442 equity) |
|---|---|---|
| Semiconductors (+AMD ~$4,380) | $15,242 | 15.2% |
| Tech/Networking (+CSCO ~$3,030) | $3,030 | 3.0% |
| All tech combined | $18,272 | 18.2% |
| Cash remaining | $73,536 | 73.2% |

All sectors remain well under 25% cap after both fills. Total positions = 8 (<12 max ✓).

**LT bucket tech sub-allocation (current):**
TSM+NVDA+AVGO = $10,862 in LT tech; LT total = $10,862 + $2,736 (JPM) = $13,598
LT-tech % = 79.9% → above 60% ceiling BUT LT bucket ($13.6K) < $20K threshold → ceiling is INFORMATIONAL per CLAUDE.md. AMD and CSCO go into ACTIVE bucket (not LT), so LT tech composition unchanged.

## Performance vs S&P 500
- **Portfolio total equity (est.):** ~$100,442 (May 14 pre-market)
- **Portfolio total return:** +0.44% ($100,442 / $100,000 initial)
- **Today's P&L (vs May 13 est $100,232):** ~+$210 / +0.21% (NVDA +$84 on H200 approval; GLD +$13; TSM +$18; AVGO +$97; JPM -$8; XLE +$6)
- **S&P 500 close May 13:** ~7,452 (+0.69%). Futures May 14: +0.3% → ~7,474 projected open.
- **S&P 500 return since strategy start (~May 1):** ~+3.72% projected (7,474 vs ~7,200 est.)
- **Gap vs SPX:** **~-3.28 percentage points** — essentially flat vs yesterday; NVDA/AVGO/GLD gains offset by cash drag.
- **CRITICAL:** Gap widening almost daily. Every blocked session costs ~0.03-0.10pp vs benchmark. AMD + CSCO fills today would add ~$7.4K deployed = first meaningful step toward closing gap. Operator must execute both by 9:25 AM ET.

## Macro Context (as of 2026-05-14 pre-market)
- **Trump-Xi Summit Day 1 (May 14):** U.S. approved Nvidia H200 chip sales to ~10 Chinese companies (Alibaba, ByteDance, Tencent, JD.com, Lenovo, Foxconn — up to 75,000 chips each). This is the first direct hardware approval in over 2 years. Major positive catalyst for NVDA, TSM, AMD, AVGO. Actual deliveries pending Chinese guidance. Summit Day 2 (May 15) may yield additional concessions.
- **Cisco Q3 FY2026 earnings (May 13 AH):** MASSIVE beat. Revenue $15.84B (+12% YoY, beat $280M), EPS $1.06 (beat), AI orders $9B target (cumulative $5.3B), product orders +35%, FY guidance raised $1.3B. Stock up 15-18% to ~$101-102. Confirms AI capex super-cycle is intact. Cisco is the picks-and-shovels play for AI networking.
- **PPI Report (May 13):** April PPI +1.4% MoM vs +0.5% expected — annual ~6%. Oil/gas-driven (Hormuz closure). Fed rate cuts pushed to 2027. HEADWIND for growth multiples but tech sector is absorbing it.
- **Market reaction (May 14):** S&P futures +0.3%, Nasdaq +0.2%. Risk-on. Dow futures targeting 50,000 level. Chip sector rallying on H200 approval. NVDA up ~3% to $229-233.
- **China chip deal context:** NVDA + AMD + AVGO all benefit from expanded China access. TSM benefits as primary fab for NVDA H200/H20. AMD MI308 also cleared for China ($500-800M 2026 revenue upside).
- **Iran deal:** Still unconfirmed. Oil $100-126/bbl (Brent). XLE thesis intact — stop $56.15, price $57.47 (2.3% cushion ⚠️ — monitor closely).
- **S&P 500:** ~7,452 close May 13. Futures project 7,474+ open. AI capex cycle intact. Narrow breadth — tech carrying index.
- **NVDA Earnings:** May 21 (7 days). Do NOT enter new NVDA positions after May 19. Existing stop $175.60 provides 33.9% cushion vs $231 est. Pre-earnings review at Daily Review May 19. H200 news = very positive setup for earnings beat.
- **Bitcoin:** ~$79,549 — BELOW $82K threshold. Crypto down 1.5% today despite risk-on equities. China summit not yet showing direct crypto catalyst. Skip until $82K or flush below $75K.

## Active Themes
1. **AI broadening / China chip deal (UPGRADED)** — H200 China approval announced Day 1 of Trump-Xi summit. NVDA direct beneficiary (up 3%+ pre-market). TSM as fab benefits. AMD MI308 also cleared. Existing LT positions TSM+NVDA+AVGO all rallying. AMD entry (10sh MOO) attempted and blocked — MUST execute manually before 9:25 AM ET.
2. **AI infrastructure / picks-and-shovels (CSCO NEW)** — Cisco Q3 massively beat. AI orders at $5.3B cumulative toward $9B. Enterprise networking is the backbone of AI clusters. CSCO up 15-18% — earnings-reaction-follow entry (30sh MOO) attempted and blocked — MUST execute manually.
3. **Steeper curve / financials tailwind** — JPM (LT) at ~$304 — slightly below entry $308.30. No rate cuts until 2027 = JPM NIM benefit. Hold with stop $272.14.
4. **Geopolitical inflation hedge** — GLD (active) +3% from entry (~$432 vs $418.86 entry). PPI shock + delayed rate cuts sustains gold bid. Iran deal unconfirmed — XLE stop $56.15 active (2.3% cushion ⚠️ — monitor).
5. **Crypto recovery** — BTC ~$79,549. BELOW $82K threshold. Skip continues. Trump-Xi summit not directly boosting crypto yet. Crypto bill (Digital Asset Market Clarity Act) providing background support.
6. **Government AI (PLTR AIP)** — PLTR at $130.25, still below $134 support. Score 6.50 — skip continues. Will re-score at Daily Review if Trump-Xi summit produces government AI governance news.

## Pending Actions — OPERATOR MUST EXECUTE MAY 14

**PRIORITY 1 — PLACE BEFORE 9:25 AM ET (MOO orders):**

1. **AMD** (score 7.50, breakout-volume, active): Buy 10 shares AMD MOO (`time_in_force: "opg"`). Post-fill at Market Open: place stop at fill_price × 0.95. Target = fill_price × 1.10. This has been blocked 9+ consecutive sessions. MANDATORY. Estimated open ~$437-439.

2. **CSCO** (score 7.83, earnings-reaction-follow, active): Buy 30 shares CSCO MOO (`time_in_force: "opg"`). Post-fill at Market Open: place stop at fill_price × 0.95. Target = fill_price × 1.10. Cisco Q3 massive beat — earnings-reaction-follow setup. Estimated open ~$100-102.

**PRIORITY 2 — Market Open routine (9:45 AM ET):**
- Verify AMD fill. Place stop: AMD_fill × 0.95 (GTC stop order, side=sell, type=stop).
- Verify CSCO fill. Place stop: CSCO_fill × 0.95 (GTC stop order, side=sell, type=stop).
- Verify all 6 existing stops resting at Alpaca: TSM=$353.76, GLD=$397.92, NVDA=$175.60, JPM=$272.14, XLE=$56.15, AVGO=$368.36.

**PRIORITY 3 — Standing:**
- PLTR (score 6.50, SKIP): Do NOT enter until price reclaims $134 support. Currently $130.25.
- NVDA May 21 earnings: Pre-earnings review at Daily Review May 19. No new NVDA entries after May 19.
- AVGO: Still unconfirmed via API. Treating as probable fill at $418.59. Current ~$418. Stop at $368.36 safe (17.5% cushion).
- Trump-Xi summit Day 2 (May 15): Watch for additional chip/tariff concessions. Any positive news = additional catalyst for NVDA, AMD, TSM, AVGO holdings.

## Pending Deferrals (≥7 watchlist names not yet entered — API blocked)
- **AMD** (7.50) — API blocked (9th time); operator must place at market open May 14 before 9:25 AM ET
- **CSCO** (7.83) — API blocked (1st time); operator must place at market open May 14 before 9:25 AM ET

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
- **2026-05-13 — AMD pullback (thesis intact):** AMD declined from $477 peak to ~$438. Re-score: 7.50 (Technical improved from 5 to 7 as RSI fully normalized). Remains a MUST-ENTER. 9th consecutive API blockage.
- **2026-05-14 — CSCO earnings catalyst identified:** Cisco Q3 FY2026 beat was massive (rev +12%, AI orders raised). Earnings-reaction-follow setup identified at open. Score 7.83. Both AMD and CSCO attempted (API blocked). Shows process is working — agent can identify new opportunities — but infrastructure prevents execution.
- **2026-05-14 — H200 China approval (Trump-Xi summit):** U.S. approved NVDA H200 for 10 Chinese firms on Day 1. This is a direct catalyst for existing NVDA, TSM, AVGO positions. Lesson: geopolitical catalysts can move existing positions significantly — portfolio gains without needing new orders.
- **NVDA earnings risk:** NVDA reports Q2 on May 21 (7 days). Pre-earnings review MUST happen at Daily Review May 19. Stop $175.60 provides 33.9% cushion vs ~$231 est.

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
- **Pre-Market May 14 DONE (12:15 UTC / 8:15 AM ET):** AMD MOO (score 7.50, 10sh) and CSCO MOO (score 7.83, 30sh) attempted; both blocked by API (HTTP 403). OPERATOR must execute both manually before 9:25 AM ET. PLTR skip (below $134), BTC skip (below $82K).
- **Market Open May 14 (9:45 AM ET):** (1) Verify AMD fill → place stop at fill × 0.95 immediately. (2) Verify CSCO fill → place stop at fill × 0.95 immediately. (3) Audit all 6 existing stops (TSM, GLD, NVDA, JPM, XLE, AVGO). (4) Monitor XLE — stop at $56.15 with 2.3% cushion at $57.47. (5) Assess Trump-Xi summit Day 2 developments.
- **Midday May 14 (12:30 PM ET):** (1) Scan for intraday setups in chip sector (NVDA pre-earnings run-up, TSM reaction). (2) Check BTC — if approaching $82K, rescore. (3) Evaluate MU (Micron) — anchor list name not yet entered; benefits from AI memory demand and China deal.
- **Daily Review May 14 (4:30 PM ET):** (1) Tally AMD + CSCO fills + stops placed. (2) Tally Trump-Xi Day 2 outcomes vs positions. (3) Produce scored watchlist for May 15. (4) NVDA pre-earnings assessment (6 days to May 21). (5) Update Setup Performance Tracker.

## Cash Reserve Floor
$10,000 (10%). Current cash $80,946 — $70,946 available to deploy before hitting floor. PLTR + AMD fills would consume ~$9,592, leaving ~$61,354+ available. Massive remaining deployment gap.
