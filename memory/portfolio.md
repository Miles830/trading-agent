# Opus Trader — Portfolio Memory

## Last Updated
2026-05-14 (Thursday) — Market Open routine (9:45 AM ET / 13:45 UTC). Alpaca API STILL blocked ("Host not in allowlist" — Anthropic TLS proxy). 9th consecutive blocked routine. Prices from web research. AMD bracket limit attempted and blocked (13:50Z). MU bracket limit attempted and blocked (13:50Z). Pre-Market also silently failed (no heartbeat). MASSIVE catalyst today: Trump-Xi summit Day 1, Jensen Huang in Beijing, H200 cleared for 10 Chinese firms. AMD score upgraded to 8.00; MU scored 8.17 as new anchor entry. Both blocked.

## Current Account Snapshot
- **Broker:** Alpaca Paper Trading (account PA3TXVEJ19LW)
- **Total Equity (estimated):** ~$100,374 (estimated; API blocked; prices from May 14 web research at 9:45 AM ET)
- **Cash:** $80,945.53 (80.6%) — unchanged; no orders have executed since May 4/5 fills
- **Long Market Value (estimated):** ~$19,429 (6 positions)
- **Open Positions:** 6 (TSM, GLD, NVDA, JPM, XLE, AVGO probable fill)
- **Pending Orders / Actions:** AMD bracket limit $447.23 attempted and blocked (13:50Z) — OPERATOR MUST place AMD 10sh immediately (limit $447.23, stop $424.87, target $491.95, GTC bracket). MU bracket limit $807.65 attempted and blocked — OPERATOR MUST place MU 5sh (limit $807.65, stop $710.73, target $1,001.49, GTC bracket LT).
- **API Status:** BLOCKED — "Host not in allowlist" (HTTP 403, Anthropic sandbox TLS proxy). Persistent failure since May 6. 9th consecutive blocked routine (Pre-Market + Market-Open both blocked May 14).
- **Daytrade Count:** 0

## Bucket State
| Bucket | Target | Current $ (est.) | Current % | Positions |
|---|---|---|---|---|
| Long-term | 55% ($55K) | ~$13,651 (TSM+NVDA+JPM+AVGO) | 13.6% | 4 (TSM, NVDA, JPM, probable AVGO) |
| Active Trading | 30% ($30K) | ~$5,778 (GLD+XLE) | 5.8% | 2 (GLD, XLE) |
| Crypto | 5% ($5K) | $0 | 0% | 0 |
| Cash Reserve | 10% ($10K floor) | ~$80,946 | 80.6% | — |

**Deployment gap:** Cash ~$70.9K above the 10% floor. AMD 10sh + MU 5sh both attempted and blocked. Massive underfillment continues. Gap widens daily vs S&P 500. OPERATOR ACTION REQUIRED IMMEDIATELY.

## Open Positions (estimated, API blocked — prices from May 14 web research 9:45 AM ET)
| Symbol | Bucket | Qty | Entry | Stop | Target | Cost basis | Est. Price | Est. P/L | Sector |
|---|---|---|---|---|---|---|---|---|---|
| TSM | long-term | 7 | 401.47 | 353.76 (-12%) | 498.48 (+24%) | $2,810.29 | ~$399.80 | -$11.69 | Semiconductors |
| GLD | active | 7 | 418.86 | 397.92 (-5%) | — | $2,932.02 | ~$431.38 | +$87.64 | Precious metals |
| NVDA | long-term | 15 | 198.83 | 175.60 (-12%) | 247.44 (+24%) | $2,982.45 | ~$227.80 | +$434.55 | Semiconductors |
| JPM | long-term | 9 | 308.30 | 272.14 (-12%) | 383.47 (+24%) | $2,774.72 | ~$302.00 | -$56.70 | Financials |
| XLE | active | 50 | 59.01 | 56.15 (-5%) | 65.01 (+10%) | $2,950.50 | ~$57.80 | -$60.50 | Energy |
| AVGO* | long-term | 11 | 418.59 | 368.36 (-12%) | 519.05 (+24%) | $4,604.49 | ~$416.79 | -$19.80 | Semiconductors |

*AVGO: GTC bracket at $418.59 placed ~May 4. Treating as probable fill (AVGO range May 8 covered $418.59). Stop = bracket OCO child at $368.36 (-12%).

**Est. total long market value (all 6):** ~$19,429
- TSM: 7 × $399.80 = $2,799
- GLD: 7 × $431.38 = $3,020
- NVDA: 15 × $227.80 = $3,417
- JPM: 9 × $302.00 = $2,718
- XLE: 50 × $57.80 = $2,890
- AVGO: 11 × $416.79 = $4,585

**Net unrealized P/L: +$373.50** (NVDA +$434.55 and GLD +$87.64 driving gains; JPM, XLE, TSM, AVGO partially offsetting)

## Sector Exposure (estimated — May 14 9:45 AM ET)
| Sector | Est. $ | Est. % of equity |
|---|---|---|
| Semiconductors (TSM+NVDA+AVGO) | $10,801 | 10.77% |
| Financials (JPM) | $2,718 | 2.71% |
| Precious metals (GLD) | $3,020 | 3.01% |
| Energy (XLE) | $2,890 | 2.88% |
| Cash | $80,946 | 80.6% |

**After AMD+MU fills (both attempted, blocked — pending operator action):**
| Sector | Added $ | New % |
|---|---|---|
| Semiconductors (+AMD $4,472 +MU $4,038) | $19,311 | 19.3% |
| Cash remaining after both | $72,435 | 72.2% |

All sectors remain well under 25% cap after AMD+MU fills. LT+Active combined semi exposure = 19.3%.

**LT bucket tech sub-allocation (current):**
TSM+NVDA+AVGO = $10,801 in LT tech; LT total = $10,801 + $2,718 (JPM) = $13,519
LT-tech % = 79.8% → above 60% ceiling BUT LT bucket ($13.5K) < $20K threshold → ceiling is INFORMATIONAL per CLAUDE.md.
After MU fill ($4,038 LT): LT total = $17,557; LT-tech = $14,839 = 84.5% — still informational until LT bucket ≥ $20K.

## Performance vs S&P 500
- **Portfolio total equity (est.):** ~$100,374
- **Portfolio total return:** +0.37% ($100,374 / $100,000 initial)
- **Today's P&L (vs May 13 est $100,232):** ~+$142 / +0.14% (NVDA +$36.15, GLD +$7.77, TSM +$17.64, AVGO +$123, XLE +$22, JPM -$25.02; net +$142)
- **S&P 500 estimated May 14:** ~7,467 (futures +0.20% from 7,452 close May 13; Nasdaq +0.69%)
- **S&P 500 return since strategy start (~May 1):** ~+3.71% (7,467 vs ~7,200 est.)
- **Gap vs SPX:** **-3.34 percentage points** — widened again from -3.27pp. Portfolio at +0.37% vs SPX +3.71%. Driven by 80% cash from API-blocked deployments.
- **CRITICAL:** AMD+MU both scored ≥8.0, both attempted and blocked again. OPERATOR MUST place manually. Every day of inaction costs ~0.5-1pp vs benchmark.

## Macro Context (as of 2026-05-14 Market Open 9:45 AM ET)
- **Trump-Xi Summit (Day 1 — TODAY):** US cleared H200 chip sales to 10 Chinese firms (Alibaba, Tencent, ByteDance, JD.com; up to 75K chips each). Jensen Huang in Beijing delegation. NVDA +1.1% to ~$227.80. Nasdaq futures +0.69%. Summit Day 2 (May 15) could bring additional chip, tariff, or rare earths announcements.
- **MU (Micron):** +4.83% to $803.63 today. H200 approval = direct HBM demand surge. Q2 2026 revenue $23.86B (3x YoY). HBM sold out 2026. Scored 8.17 — anchor name MUST ENTER.
- **PPI (April, released May 13):** +1.4% MoM vs +0.5% expected. Annual rate ~6%. Market ignoring for now on chip catalyst strength.
- **Iran deal:** Still unconfirmed. Oil ~$110/bbl. XLE cushion at 2.9% (stop $56.15 vs ~$57.80).
- **S&P 500:** ~7,467 estimated (futures +0.20%). Portfolio +0.37% vs SPX +3.71% since start. Gap -3.34 pp.
- **NVDA Earnings:** May 21 (7 days). No new NVDA entries after May 19. Existing stop $175.60 provides 29.7% cushion vs $227.80.
- **Bitcoin:** ~$81K. Summit Day 1 positive for risk assets. Re-evaluate at Daily Review.

## Active Themes
1. **AI broadening / China H200 chip deal** — TSM+NVDA+AVGO in LT bucket. AMD (score 8.00) + MU (score 8.17) both MUST ENTER — both attempted and blocked (9th consecutive failure). Trump-Xi summit Day 1 confirms H200 approval pathway.
2. **HBM memory supercycle (MU)** — NEW THEME: Micron HBM sold out through 2026; H200 China approval = fresh HBM demand surge. Anchor name. Scored 8.17 — mandatory entry pending operator action.
3. **Steeper curve / financials tailwind** — JPM (LT) at ~$302, below entry $308.30. Hold with stop $272.14. Hot PPI = no rate cuts = JPM NIM benefit.
4. **Geopolitical inflation hedge** — GLD (active) +3.0% from entry ($431.38 vs $418.86). Iran deal unconfirmed = gold bid stays. XLE stop $56.15 thin (2.9% cushion ⚠️).
5. **Government AI (PLTR AIP)** — PLTR ~$130.27, below $134 support (broken May 13). Re-scored 6.50. SKIP. Watch Trump-Xi Day 2 for government AI catalyst.
6. **Crypto recovery** — BTC ~$81K. Summit Day 1 positive for risk assets broadly. Re-entry if >$82K.

## Pending Actions — OPERATOR MUST EXECUTE IMMEDIATELY (May 14)

1. **AMD** (score 8.00, breakout-volume, active): Buy 10 shares NOW — limit $447.23 (or market), GTC bracket, stop $424.87 (-5%), target $491.95 (+10%). Scored 8.00 — 9th consecutive blocked entry. CRITICAL.

2. **MU** (score 8.17, ai-momentum-pullback, long-term): Buy 5 shares — limit $807.65, GTC bracket, stop $710.73 (-12% LT), target $1,001.49 (+24%). New anchor entry on H200 HBM catalyst. CRITICAL.

3. **PLTR** (score 6.50, SKIP): Do NOT enter until price reclaims $134 support. Monitor Trump-Xi summit Day 2 for government AI catalyst.

4. **NVDA May 21 earnings:** Pre-earnings review at Daily Review May 19. No new NVDA entries after May 19. Evaluate partial profit-taking or protective put if NVDA approaches $250.

5. **AVGO:** Still unconfirmed via API. Treating as probable fill at $418.59. Current price ~$416.79 (slightly below entry, above stop $368.36). China chip deal thesis intact.

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
- **2026-05-13 — PPI shock:** April PPI +1.4% vs +0.5% expected — largest since 2022. S&P rose +0.69% anyway (tech-led). Lesson: macro data shocks can be absorbed by strong sector narratives (AI/tech).
- **2026-05-13 — PLTR support break:** PLTR fell -4.31% to $129.99, breaking $134 support zone. Re-score: 6.50 (Technical=3). Skip until $134 reclaimed.
- **2026-05-14 — Trump-Xi summit H200 approval:** US cleared H200 chip sales to 10 Chinese firms at market open. NVDA +1.1%, MU +4.83%. AMD/MU both scored ≥8.0. Both orders attempted and blocked (9th consecutive API failure). MU becomes new anchor entry candidate — first time a non-pre-approved name has been scored ≥8 during a routine. Lesson: H200 Chinese approval directly propagates to Micron HBM demand — the HBM angle is NOT priced into initial chip deal analysis.
- **NVDA earnings risk:** NVDA reports Q2 on May 21 (7 days). Pre-earnings review MUST happen at Daily Review May 19. Stop $175.60 provides 29.7% cushion vs $227.80.

## Setup Performance Tracker
| Setup type | Wins | Losses | Status |
|---|---|---|---|
| ai-momentum-pullback | 0 | 0 | active (TSM open); MU new entry pending fill |
| macro-hedge | 0 | 0 | active (GLD open +3.0%, XLE open -2.1%) |
| earnings-reaction-follow | 0 | 0 | AMD setup reclassified to breakout-volume |
| breakout-volume | 0 | 0 | AMD pending fill (China chip deal); 9th consecutive API block |
| earnings-reaction-fade | — | — | — |
| mean-reversion-oversold | — | — | — |
| sector-rotation | 0 | 0 | active (JPM open, slightly below entry) |
| crypto-flush-rebound | — | — | — |
| candlestick-reversal | — | — | — |

## Strategy Evolution Notes
- **2026-05-01 (init):** Strategy initialized per CLAUDE.md. No deviations.
- **2026-05-04:** First positions opened. Strategy unchanged; execution layer needs fixing.
- **2026-05-08:** Three-week persistent API blockage causing compounding execution gaps. Portfolio 85% cash vs. 10% floor target.
- **2026-05-12:** China chip deal changes AMD thesis from earnings-follow to breakout-volume. Rate-cut thesis broken (no cuts until 2027) but partially offset by China chip deal sector tailwind.
- **2026-05-14:** H200 China approval expands candidate universe — MU added as LT anchor entry (HBM supercycle). Scoring two new entries this session demonstrates expanded market scanning per CLAUDE.md whole-market scanning mandate.

## Next Routine Plan
- **Mid-Morning May 14 (11:00 AM ET):** (1) Stop audit — confirm all 6 resting stops (estimated, API blocked). (2) AMD + MU re-attempt if API unblocked. (3) Monitor Trump-Xi summit Day 1 afternoon announcements. (4) Check PLTR for $134 recovery. (5) Assess XLE — stop at $56.15 is thin (2.9% cushion at ~$57.80).
- **Daily Review May 14 (4:30 PM ET):** (1) AMD + MU fill status (operator action). (2) Trump-Xi summit Day 1 full assessment. (3) Score BTC if $82K+ on risk-on mood. (4) NVDA pre-earnings review ahead of May 21. (5) PLTR re-evaluate if $134 reclaimed.
- **Pre-Market May 15 (8:00 AM ET):** Trump-Xi summit Day 2 — may produce additional chip, tariff, rare earths deals. AMD + MU as MOO if still not filled. PLTR re-evaluate for $134 reclaim.

## Cash Reserve Floor
$10,000 (10%). Current cash $80,946 — $70,946 available to deploy before hitting floor. AMD ($4,472) + MU ($4,038) fills would consume ~$8,510, leaving ~$62,436 available. After all pending fills (AMD+MU), 12 positions total capacity with 6 already filled — 6 more slots available. Massive remaining deployment gap. OPERATOR ACTION REQUIRED IMMEDIATELY.
