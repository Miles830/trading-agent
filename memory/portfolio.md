# Opus Trader — Portfolio Memory

## Last Updated
2026-05-17 (Sunday) — Pre-Market Weekend Analysis (non-trading day). Alpaca API STILL blocked ("Host not in allowlist"). Prices from May 15 web research. Trump-Xi Summit Day 2 concluded May 15 WITHOUT formal semiconductor deal. AMD MI308 NOT cleared (only NVDA H200). SOX -5-6.8% on May 15. NVDA confirmed earnings May **20** AH (not May 21). MU re-scored 7.33 → APPROVED for Monday MOO. AMD re-scored 7.0 avg → REJECTED (3/6 agents ≥7, fails 4/6 rule). S&P 500 May 15: 7,408.50 (-1.24%). Portfolio cumulative gap vs benchmark improved to -2.52 pp (from -3.81 pp) because portfolio fell less than market due to 81% cash.

## Current Account Snapshot
- **Broker:** Alpaca Paper Trading (account PA3TXVEJ19LW)
- **Total Equity (estimated):** ~$100,381 (estimated; API blocked; prices from May 15 web research)
- **Cash:** $80,945.53 (80.6%) — unchanged; no orders executed since May 4/5 fills
- **Long Market Value (estimated):** ~$19,435 (6 positions, May 15 close)
- **Open Positions:** 6 (TSM, GLD, NVDA, JPM, XLE, AVGO probable fill)
- **Pending Orders:** MU APPROVED for Monday MOO (6sh, score 7.33). AMD REJECTED (re-scored 7.0 avg, 3/6 agents ≥7 after China deal excluded AMD). PLTR conditional ($133.99 May 15, below $134 trigger). AMD was NOT entered by operator on May 15 (no confirmation; now re-scored as rejected).
- **API Status:** BLOCKED — "Host not in allowlist" (HTTP 403). Persistent failure since May 6. 10th+ consecutive blocked session.
- **NVDA EARNINGS CORRECTION:** Confirmed May **20** AH (5 PM ET call) — NOT May 21 as previously noted. 48-hour binary event exclusion applies from Monday May 18 open.
- **Daytrade Count:** 0

## Bucket State (May 15 close estimate)
| Bucket | Target | Current $ (est.) | Current % | Positions |
|---|---|---|---|---|
| Long-term | 55% ($55K) | ~$13,542 (TSM+NVDA+JPM+AVGO) | 13.5% | 4 (TSM, NVDA, JPM, probable AVGO) |
| Active Trading | 30% ($30K) | ~$5,893 (GLD+XLE) | 5.9% | 2 (GLD, XLE) |
| Crypto | 5% ($5K) | $0 | 0% | 0 |
| Cash Reserve | 10% ($10K floor) | ~$80,946 | 80.6% | — |

**Deployment gap:** Cash ~$70.9K above the 10% floor. MU entry committed for Monday MOO (6sh ~$4,410 = +4.4% deployed). After MU: LT bucket grows to ~$17.95K (still below $20K LT sub-allocation enforcement threshold). AMD rejected. PLTR conditional. Massive underfillment continues — MU entry alone still leaves >$66K above cash floor.

## Open Positions (estimated, API blocked — prices from May 15 web research)
| Symbol | Bucket | Qty | Entry | Stop | Target | Cost basis | Est. Price | Est. P/L | Sector |
|---|---|---|---|---|---|---|---|---|---|
| TSM | long-term | 7 | 401.47 | 353.76 (-12%) | 498.48 (+24%) | $2,810.29 | ~$404.35 | +$20.16 | Semiconductors |
| GLD | active | 7 | 418.86 | 397.92 (-5%) | — | $2,932.02 | ~$417.29 | -$10.99 | Precious metals |
| NVDA | long-term | 15 | 198.83 | 175.60 (-12%) | 247.44 (+24%) | $2,982.45 | ~$226.46 | +$414.45 | Semiconductors |
| JPM | long-term | 9 | 308.30 | 272.14 (-12%) | 383.47 (+24%) | $2,774.72 | ~$297.00 | -$101.70 | Financials |
| XLE | active | 50 | 59.01 | 56.15 (-5%) | 65.01 (+10%) | $2,950.50 | ~$59.44 | +$21.50 | Energy |
| AVGO* | long-term | 11 | 418.59 | 368.36 (-12%) | 519.05 (+24%) | $4,604.49 | ~$422.00 | +$37.51 | Semiconductors |

*AVGO: GTC bracket at $418.59 placed ~May 4. Probable fill confirmed (AVGO range covered entry). Stop = bracket OCO child at $368.36 (-12%). May 15 est ~$422.

**Est. total long market value (all 6):** ~$19,435
- TSM: 7 × $404.35 = $2,830
- GLD: 7 × $417.29 = $2,921
- NVDA: 15 × $226.46 = $3,397
- JPM: 9 × $297.00 = $2,673
- XLE: 50 × $59.44 = $2,972
- AVGO: 11 × $422.00 = $4,642

**Net unrealized P/L: +$380.93** (NVDA +$414 still primary driver; JPM -$102 largest drag; GLD turned negative -$11; XLE now slightly positive +$22)

## Sector Exposure (estimated — May 15 close)
| Sector | Est. $ | Est. % of equity |
|---|---|---|
| Semiconductors (TSM+NVDA+AVGO) | $10,869 | 10.8% |
| Financials (JPM) | $2,673 | 2.7% |
| Precious metals (GLD) | $2,921 | 2.9% |
| Energy (XLE) | $2,972 | 3.0% |
| Cash | $80,946 | 80.6% |

**After Monday MU fill (committed):**
| Sector | Added $ | New % |
|---|---|---|
| Semiconductors (+MU 6sh×$735 = $4,410) | $15,279 | 15.2% |
| Cash remaining | $76,536 | 76.2% |

All sectors remain well under 25% cap. After MU: semis at 15.2%. If PLTR conditional ($4,800): adds to LT tech sub-allocation. All guardrails comfortably met.

**LT bucket tech sub-allocation (current):**
TSM+NVDA+AVGO = $10,869 in LT tech; LT total = $10,869 + $2,673 (JPM) = $13,542
LT-tech % = 80.2% → above 60% ceiling BUT LT bucket ($13.5K) < $20K threshold → ceiling is INFORMATIONAL per CLAUDE.md.
After MU: LT tech = $10,869 + $4,410 (MU) = $15,279; LT total = $15,279 + $2,673 = $17,952
LT-tech % = 85.1% but LT bucket ($17.95K) still < $20K → ceiling still INFORMATIONAL.

## Performance vs S&P 500
- **Portfolio total equity (est.):** ~$100,381 (May 15 close)
- **Portfolio total return:** +0.38% ($100,381 / $100,000 initial)
- **May 15 P&L:** ~-$133 / -0.13% vs May 14 est. $100,514 (NVDA -$138 + TSM -$4 + AVGO -$6 + GLD -$82 + XLE +$90 − JPM -$30... net small decline). Portfolio fell less than market (-0.13% vs SPX -1.24%).
- **S&P 500 close May 15:** 7,408.50 (-1.24%). Post-summit chip letdown. SOX -5-6.8%. Dow/Nasdaq both lower.
- **S&P 500 return since strategy start (~May 1):** ~+2.90% (7,408.50 vs ~7,200 est.)
- **Gap vs SPX:** **-2.52 percentage points** — IMPROVED by +1.29 pp from -3.81 pp (portfolio fell less than market due to 81% cash and XLE gain offsetting chip losses).
- **NOTE:** Gap improvement from 81% cash is a defensive win, not a strategy win. The root cause (massive cash drag) remains. MU entry Monday reduces drag modestly.

## Macro Context (as of 2026-05-17 weekend — last trading day May 15)
- **Trump-Xi Summit CONCLUDED (May 15 — Day 2):** No formal semiconductor export-control framework announced. NVDA H200 cleared for Alibaba/Tencent/ByteDance/JD.com (pre-approved via separate White House process). AMD MI308 NOT cleared. No China AI chip policy agreement. Market reaction: "chip letdown" — SOX -5-6.8% on May 15. NVDA intraday record ($233.50) then sold off to close $226.46. Summary: NVDA wins narrowly; AMD and other chip names disappoint.
- **NVDA Earnings CORRECTION — May 20 AH (NOT May 21):** NVDA reports Q1 FY2027 on Wednesday May 20 after close (~5 PM ET conference call). Consensus: Rev $78-80B, EPS $1.76-1.79 (NVDA guided $78B ±2%). Strong Buy consensus, avg PT $273.62. Prediction markets 80%+ for beat. **48-hour binary event rule applies from Monday May 18 open — NO new NVDA entries.** Existing 15sh stop $175.60 = 22.4% below $226.46. Pre-earnings review at Daily Review May 19.
- **Iran deal / Oil:** US-Iran peace talks STALLED. Hormuz still mostly restricted. WTI ~$103-104/bbl, Brent ~$108. No deal in sight — Trump warned "annihilation" if no deal. Oil war premium elevated. XLE at $59.44 (above entry $59.01). Thesis strengthening. Stop at $56.15 now comfortable (5.5% cushion at $59.44).
- **10-year yield:** 4.55% — highest in ~1 year. Inflation persistence from PPI +1.4% and oil war premium. No Fed rate cuts expected until 2027. Headwind for growth/tech stocks and financials (JPM).
- **Bitcoin:** $78,082 at May 15 close. Briefly touched $81K (near $82K threshold) but retreated. Below $82K re-entry threshold. Summit produced no crypto-specific language. Threshold unchanged at $82K+.
- **SOX technical warning:** SOX at 32% above its 50-day moving average (one of widest premiums historically) — suggests potential consolidation. Not an immediate sell signal but warrants caution on new semi entries.
- **JPM / Financials:** 10-year at 4.55% hurts financials. JPM estimated at ~$297 (below entry $308.30, -3.7%). Stop $272.14 = 8.5% cushion. Thesis weakening. Monitor for stop management.
- **GLD:** $417.29 (May 15 close) — now -$0.37/sh below entry $418.86. Iran/war premium supports gold long-term. But "sell the news" on Iran non-deal hit gold too. Stop $397.92 = 4.6% below current price. Thesis intact but watching closely.

## Active Themes
1. **AI infrastructure / NVDA earnings** — NVDA (LT, 15sh) at $226.46 (+13.9% from entry). NVDA reports May 20 AH. No new entries. Pre-earnings review May 19 Daily Review. SOX correcting (-5-6.8% on May 15) but structural AI demand intact. MU APPROVED for Monday (HBM4 AI memory supercycle).
2. **Partial China chip deal** — NVDA H200 cleared for Chinese hyperscalers (Alibaba/Tencent/ByteDance/JD.com). AMD MI308 NOT cleared. TSM benefits as H200 foundry. AVGO benefits from networking ASIC demand. AMD and INTC were explicitly excluded.
3. **Geopolitical inflation hedge (stronger)** — XLE at $59.44 (+0.7% above entry $59.01); oil WTI $103-104/bbl on Iran/Hormuz. Stop $56.15 now 5.5% below — more comfortable. GLD at $417.29 (-0.4% below entry); inflation/war premium intact but gold sold on "risk-off from summit disappointment." Monitor GLD.
4. **Financials drag** — JPM ~$297, -3.7% below entry $308.30. 10-year yield at 4.55% = NIM headwind (higher rates help NIM long-term but loan growth slows). Stop $272.14 = 8.5% cushion. Thesis weakening. Will review at Daily Review May 19.
5. **PLTR re-entry pending** — PLTR $133.99 (May 15), just below $134 trigger. Government AI AIP revenues isolated from macro headwinds. Re-score if $134 reclaimed Monday.
6. **Memory supercycle (new — MU)** — HBM4 supply sold out for 2026. Hyperscaler CAPEX +77% YoY = structural demand. MU approved 7.33 for Monday entry at ~$732-735 (down from ~$788 target due to summit selloff = better entry). JEDEC HBM4 standard dominant.
7. **Crypto** — BTC $78K (below $82K threshold). No crypto entries. Threshold unchanged.

## Pending Actions — MONDAY MAY 18

1. **MU** (score 7.33, ai-momentum-pullback, LT) — **COMMITTED MOO**: Buy 6 shares at open Monday May 18. Entry ~$732-740 (May 15 close $732.49). Stop at fill × 0.88 (LT -12%) to be placed by Market Open routine. Target: fill × 1.24. If API blocked: OPERATOR must place 6sh market buy before 9:25 AM ET, then stop at fill×0.88 GTC by 9:45 AM ET. **This is mandatory per deployment bias — score 7.33, 5/6 agents ≥7.**

2. **AMD** — RE-SCORED AND REJECTED (7.0 avg, 3/6 agents ≥7 — fails 4/6 rule). China deal excluded AMD MI308. This is a Master Agent rejection, NOT a deployment bias violation. Re-entry conditions: Technical OR Sentiment recovers to 7+ (AMD close above $440 on volume, or AMD-specific positive catalyst). Do NOT enter until 4/6 agents at ≥7 re-score.

3. **PLTR** (score 6.50, CONDITIONAL): Re-enter ONLY if PLTR opens and holds above $134 on Monday May 18. Full 6-agent re-score at Pre-Market. Est. re-score: 7.33 if Technical rises to 6 on $134 reclaim. PLTR closed $133.99 Friday.

4. **NVDA May 20 AH earnings** (CORRECTION — NOT May 21): Pre-earnings review at Daily Review May 19. No new NVDA entries from Monday May 18 open (48-hour binary event rule). Existing 15sh position: stop $175.60 = 22.4% below $226.46. Consider: partial profit if NVDA runs above $240 before earnings.

5. **AVGO:** Treating as filled at $418.59 (probable). Current est. ~$422 (+0.8%). Stop $368.36 intact. Operator should verify account if API ever unblocks.

## Pending Deferrals (≥7 watchlist names not yet entered)
- **MU** (7.33) — APPROVED; MOO planned Monday May 18 (6sh ~$735, stop $647, target $908)
- **PLTR** (conditional 6.50→7.33) — re-enter if $134 reclaimed Monday
- **AMD** (7.0, REJECTED) — re-score when Technical or Sentiment recovers to 7; not entering currently

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
- **2026-05-14 — Trump-Xi Summit Day 1:** Jensen Huang attended. NVDA +4.54% on H200 clearance for select Chinese companies. 200-jet Boeing order confirmed (below 500-jet). Markets hit all-time records (S&P, Nasdaq, Dow 50K). PLTR recovered +2.62% to $133.40 — nearly at $134 re-entry trigger. JPM fell -1.52% despite record market (financials soft on no-cut rates thesis). Lesson: high-inflation environment benefits AI/tech names but hurts financials even on up-market days.
- **2026-05-14 — 8th consecutive API blockage, 6 more silent routine failures:** AMD entry now 4 consecutive deployment failures. Cumulative benchmark gap: -3.81 pp. Intraday routine scheduler not firing. Two separate infrastructure problems: (1) API allowlist not patched; (2) cron/scheduler not firing intraday sessions.
- **2026-05-15 — Summit Day 2 "Chip Letdown":** Trump-Xi concluded without formal semiconductor framework. NVDA H200 cleared for 4 Chinese companies = specific win for NVDA. AMD MI308 NOT cleared = AMD-specific negative. SOX -5-6.8%. NVDA whipsawed: record high ~$233.50 intraday, then close $226.46 (-3.94%). S&P -1.24% to 7,408.50. Key lesson: "buy the rumor, sell the news" dynamics. Event-driven entries (China chip deal thesis) require post-event re-scoring regardless of prior approved status.
- **2026-05-15 — AMD re-scored and REJECTED:** Summit excluded AMD from China deal. AMD score dropped from 7.33 (5/6 agents ≥7) to 7.0 avg (3/6 agents ≥7 — fails Master Agent 4/6 requirement). Lesson: committed watchlist entries MUST be re-scored when the catalyst that drove the score materially changes. A prior commitment does not override a legitimate Master Agent rejection based on changed conditions.
- **2026-05-15 — NVDA earnings date corrected:** Confirmed May 20 AH (NOT May 21 as previously noted). 48-hour binary event exclusion applies from Monday May 18. All future routines must use May 20 as the reference.
- **2026-05-17 — MU scored 7.33 — better entry after summit selloff:** MU fell 5.61% on May 15 to $732.49 (from ~$776). Originally planned entry at ~$788. Post-summit selloff created a better entry with oversold RSI at $730-735 support. HBM4 thesis (AI memory supercycle, supply sold out for 2026) entirely intact — China deal NOT required for MU's thesis. Lesson: wait for catalysts to resolve, then buy the dip when long-term thesis unchanged.
- **2026-05-17 — GLD turned slightly negative vs entry:** GLD $417.29 vs entry $418.86 (-$1.57/sh). Inflation/war premium should continue to support gold. If GLD closes below $415 for 2 consecutive sessions, review thesis and consider tightening stop.
- **2026-05-17 — XLE thesis strengthening:** XLE $59.44 (above entry $59.01). Oil WTI $103-104/bbl (Hormuz restricted). Iran deal stalled. Stop cushion improved from 2.65% to 5.5%. Active macro-hedge thesis working as intended.

## Setup Performance Tracker (updated 2026-05-17)
| Setup type | Wins | Losses | 3-in-a-row | Status |
|---|---|---|---|---|
| ai-momentum-pullback | 0 | 0 | none | Active: TSM (+0.7%), NVDA (+13.9%), AVGO (+0.8%). MU APPROVED for Monday entry. |
| macro-hedge | 0 | 0 | none | Active: GLD (-0.4% vs entry), XLE (+0.7% vs entry). Iran hedge working for XLE. |
| earnings-reaction-follow | 0 | 0 | none | AMD reclassified to breakout-volume then re-scored rejected. No active trades. |
| breakout-volume | 0 | 0 | none | AMD rejected (re-scored 7.0 avg, 3/6 ≥7, fails 4/6 rule). No active trades. |
| earnings-reaction-fade | — | — | — | No trades |
| mean-reversion-oversold | — | — | — | No trades |
| sector-rotation | 0 | 0 | none | Active: JPM (-3.7% vs entry). 10-year yield 4.55% = headwind. |
| crypto-flush-rebound | — | — | — | No trades |
| candlestick-reversal | — | — | — | No trades |

No 3-in-a-row halt or boost rules triggered. No closed P&L to evaluate. MU will add 2nd ai-momentum-pullback active trade if Monday MOO fills.

## Strategy Evolution Notes
- **2026-05-01 (init):** Strategy initialized per CLAUDE.md. No deviations.
- **2026-05-04:** First positions opened. Strategy unchanged; execution layer needs fixing.
- **2026-05-08:** Three-week persistent API blockage causing compounding execution gaps. Portfolio 85% cash vs. 10% floor target.
- **2026-05-12:** China chip deal changes AMD thesis from earnings-follow to breakout-volume. Rate-cut thesis broken (no cuts until 2027) but partially offset by China chip deal sector tailwind. PLTR government AI revenues insulated from rate environment. NVDA May 21 earnings approaching.
- **2026-05-14 (Week 2 Thursday):** Trump-Xi Summit Day 1 delivered massive NVDA catalyst (+4.54%). Boeing 200-jet order confirmed. PLTR near $134 re-entry. Markets at all-time records. Portfolio at +0.51% vs S&P +4.32% — entire gap attributable to API blockage keeping portfolio 80% in cash.
- **2026-05-17 (Week 2 Weekend — belated weekly note):** Summit Day 2 (May 15) concluded without formal semiconductor deal — "chip letdown" event. NVDA specifically won (H200 clearance for Chinese hyperscalers) but AMD lost (MI308 not cleared). Strategy adjustment: (1) AMD commitment superseded by Master Agent rejection after re-score; (2) MU added as approved new entry — better thesis (US-market-driven, not China-dependent) at better price ($732 vs $788); (3) NVDA earnings corrected to May 20 AH — pre-earnings review now needed at May 19 Daily Review. Core strategy unchanged. AI infrastructure theme dominant. Portfolio gap vs SPX improved to -2.52 pp (from -3.81 pp) but solely due to market falling with portfolio falling less (81% cash protection). Need to deploy capital to close gap durably. **Full weekly evolution note deferred to Daily Review May 22 (Friday) — May 15 weekly review was blocked/not executed.**

## Next Routine Plan
- **Pre-Market Monday May 18 (8:00 AM ET):**
  1. **MU MOO 6 shares** — score 7.33, COMMITTED (see YAML in trades.md). If API unblocked: `curl POST /v2/orders` with `time_in_force=opg, qty=6, symbol=MU, side=buy, type=market`. If still blocked: OPERATOR must place 6sh market buy at open before 9:25 AM ET.
  2. **PLTR re-score** — if opens and holds >$134: run full 6-agent re-score (est. 7.33). Enter 36sh with LT stop -12%.
  3. **Stop audit (FIRST ACTION):** Verify all 6 existing stops resting at Alpaca via GET /v2/orders?status=open. Fill any gaps before new entries.
  4. **NVDA earnings check** — NO new NVDA entries (48h binary event, earnings May 20 AH). Review existing 15sh position: stop $175.60, current ~$226.46.
  5. **User suggestion inbox** — check GitHub issues before research.
  6. **AMD** — do NOT enter. Re-scored to 7.0 avg (3/6 agents ≥7) — rejected by Master Agent.
- **Market Open (9:45 AM ET Monday):** Post-MOO stop for MU at fill × 0.88 GTC. Verify fills.
- **Daily Review May 19 (4:30 PM ET — TUESDAY):** NVDA pre-earnings review. No new NVDA entries from here. Assess partial profit-taking vs hold through earnings. JPM thesis review.
- **NVDA Earnings May 20 AH:** Existing position 15sh at $198.83, stop $175.60. No action required — stop handles downside. Capture upside if beat. Pre-earnings guide-down risk is the primary concern given SOX correction.
- **Weekly Evolution Note:** Due Friday May 22 Daily Review (delayed from May 15 which was blocked). Include: summit outcome, AMD re-score rationale, NVDA earnings review, week 3 performance vs benchmark.

## Cash Reserve Floor
$10,000 (10%). Current cash $80,946 — $70,946 available to deploy before hitting floor.
MU Monday fill: 6sh × $735 = $4,410 → cash remaining: $76,536
+ PLTR 36sh × $134 = $4,824 (conditional) → remaining: $71,712
After MU + PLTR: $71,712 still in cash = 71.4% — still massively above 10% floor.
AMD (if re-scored and re-entered): 10sh × $435 = $4,350 → cash remaining: $67,362
After all three: $67,362 still in cash = 67% — floor not remotely threatened.
Candidates for further deployment: WDC ($489, anchor name), INTC ($108 oversold), TSLA (anchor name, full score needed), healthcare ETF/component (XLV sector rotation thesis), BA (aerospace if thesis strengthens).
