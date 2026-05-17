# Opus Trader — Portfolio Memory

## Last Updated
2026-05-17 (Sunday) — Pre-Market routine fired but NON-TRADING DAY (weekend). Alpaca API STILL blocked ("Host not in allowlist") — 9th+ consecutive blocked session. Friday May 15 all routines silent failed (10th consecutive failure day). Prices from web research. AMD entry still unconfirmed (5th consecutive deployment failure). S&P 500 fell -1.24% on May 15 to 7,408 (no Trump-Xi deal). NVDA -3.6% to $225.32. XLE rally on oil surge (+6.7% est). BTC $78,026 (below $82K threshold). **CRITICAL: NVDA earnings date CORRECTED to May 20 (Wednesday) AH — not May 21.**

## Current Account Snapshot
- **Broker:** Alpaca Paper Trading (account PA3TXVEJ19LW)
- **Total Equity (estimated):** ~$100,380 (estimated; API blocked; prices from May 15 web research; XLE +6.7% offset chip losses)
- **Cash:** $80,945.53 (80.6%) — unchanged; no orders have executed since May 4/5 fills
- **Long Market Value (estimated):** ~$19,434 (6 positions; chip selloff May 15 partially offset by XLE oil surge)
- **Open Positions:** 6 (TSM, GLD, NVDA, JPM, XLE, AVGO probable fill)
- **Pending Orders / Actions:** AMD entry blocked 5 consecutive sessions — MANDATORY Monday May 18 (10sh MOO ~$424, stop -5% = ~$403, target +10% = ~$466). MU full 6-agent score at Pre-Market May 18 (est. score ~7.33, entry ~$749, stop -12% $659, target +24% $929). PLTR below $134 trigger — re-score at Monday open (current score ~6.5; skip unless $134 reclaimed). **NVDA pre-earnings strategy MANDATORY at Pre-Market May 18 (earnings May 20 AH).**
- **API Status:** BLOCKED — "Host not in allowlist" (HTTP 403, Anthropic sandbox TLS proxy). Persistent failure since May 6. 9th+ consecutive blocked session.
- **Daytrade Count:** 0

## Bucket State
| Bucket | Target | Current $ (est.) | Current % | Positions |
|---|---|---|---|---|
| Long-term | 55% ($55K) | ~$13,657 (TSM+NVDA+JPM+AVGO) | 13.6% | 4 (TSM, NVDA, JPM, probable AVGO) |
| Active Trading | 30% ($30K) | ~$5,885 (GLD+XLE) | 5.9% | 2 (GLD, XLE) |
| Crypto | 5% ($5K) | $0 | 0% | 0 |
| Cash Reserve | 10% ($10K floor) | ~$80,946 | 80.5% | — |

**Deployment gap:** Cash ~$70.9K above the 10% floor. AMD entry unconfirmed for 4th consecutive session. Massive underfillment continues. MU and PLTR also pending first entries.

## Open Positions (estimated, API blocked — prices from May 15 web research)
| Symbol | Bucket | Qty | Entry | Stop | Target | Cost basis | Est. Price | Est. P/L | Sector |
|---|---|---|---|---|---|---|---|---|---|
| TSM | long-term | 7 | 401.47 | 353.76 (-12%) | 498.48 (+24%) | $2,810.29 | ~$404.35 | +$19.04 | Semiconductors |
| GLD | active | 7 | 418.86 | 397.92 (-5%) | — | $2,932.02 | ~$427.21 | +$58.45 | Precious metals |
| NVDA | long-term | 15 | 198.83 | 175.60 (-12%) | 247.44 (+24%) | $2,982.45 | ~$225.32 | +$397.35 | Semiconductors |
| JPM | long-term | 9 | 308.30 | 272.14 (-12%) | 383.47 (+24%) | $2,774.72 | ~$297.81 | -$94.41 | Financials |
| XLE | active | 50 | 59.01 | 56.15 (-5%) | 65.01 (+10%) | $2,950.50 | ~$61.50 | +$124.50 | Energy |
| AVGO* | long-term | 11 | 418.59 | 368.36 (-12%) | 519.05 (+24%) | $4,604.49 | ~$410.00 | -$94.49 | Semiconductors |

*AVGO: GTC bracket at $418.59 placed ~May 4. Treating as probable fill. Chip selloff May 15 took AVGO down est. -3% from $422.50 → ~$410. Stop at $368.36 (-12% from entry) still provides 10.3% cushion at current price.

**Est. total long market value (all 6):** ~$19,434
- TSM: 7 × $404.35 = $2,830
- GLD: 7 × $427.21 = $2,990
- NVDA: 15 × $225.32 = $3,380
- JPM: 9 × $297.81 = $2,680
- XLE: 50 × $61.50 = $3,075
- AVGO: 11 × $410.00 = $4,510

**Net unrealized P/L: +$410.44** (XLE oil surge +$124 new; NVDA still primary driver +$397; JPM and AVGO dragging)

## Sector Exposure (estimated — May 15 EOD)
| Sector | Est. $ | Est. % of equity |
|---|---|---|
| Semiconductors (TSM+NVDA+AVGO) | $10,720 | 10.7% |
| Financials (JPM) | $2,680 | 2.7% |
| Precious metals (GLD) | $2,990 | 3.0% |
| Energy (XLE) | $3,075 | 3.1% |
| Cash | $80,946 | 80.6% |

**After AMD + MU fills (Monday May 18 mandatory):**
| Sector | Added $ | New % |
|---|---|---|
| Semiconductors (+AMD 10sh×$424 + MU 6sh×$749 = $4,240+$4,494 = $8,734) | $19,454 | 19.4% |
| Cash remaining | $72,211 | 71.9% |

All sectors remain well under 25% cap. If PLTR also enters (conditional on $134), semis + financials + LT tech still within bounds.

**LT bucket tech sub-allocation (current):**
TSM+NVDA+AVGO = $10,981 in LT tech; LT total = $10,981 + $2,702 (JPM) = $13,683
LT-tech % = 80.3% → above 60% ceiling BUT LT bucket ($13.7K) < $20K threshold → ceiling is INFORMATIONAL per CLAUDE.md. If PLTR enters ($4,800): LT total = $18,483 → still below $20K, still informational.

## Performance vs S&P 500
- **Portfolio total equity (est.):** ~$100,380 (updated May 15 EOD)
- **Portfolio total return:** +0.38% ($100,380 / $100,000 initial)
- **May 15 P&L:** ~-$134 / -0.13% (XLE +$193 oil surge, TSM +$19; vs NVDA -$155, AVGO -$138, JPM -$22, GLD -$13)
- **S&P 500 close May 15:** ~7,408.50 (-1.24%). Post-Trump-Xi summit disappointment (no deals). Weekly: SPX +0.3%.
- **S&P 500 return since strategy start (~May 1):** ~+2.90% (7,408 vs ~7,200 est.)
- **Gap vs SPX:** **-2.52 percentage points** — IMPROVED by +1.29 pp from Friday's down day (large cash position cushioned the -1.24% broad selloff)
- **Silver lining:** The 80%+ cash position that caused underperformance in up markets PROTECTED portfolio on Friday's -1.24% selloff. The 4 remaining trading days this week are critical to deploy capital correctly.
- **Bitcoin (May 17):** $78,026 — Fear & Greed 31 (Fear). Below $82K threshold. No crypto entry.

## Macro Context (as of 2026-05-17 weekend)
- **Trump-Xi Summit CONCLUDED (May 15):** Day 2 produced no major deals. No definitive semiconductor export framework. No additional Boeing orders. H200 clearance for select Chinese companies (Day 1 announcement) stands. Market disappointed — chips fell -3% to -7% Friday.
- **NVDA Earnings: CORRECTED to May 20 (Wednesday) AH.** Consensus: EPS $1.76 (+117% YoY), rev $78.5B (+78% YoY). Goldman raised target to $275. Pre-earnings entry cutoff = Monday May 18 COB. NVDA at $225.32 (down -3.6% Friday but still +13.3% above our entry of $198.83).
- **Oil / Iran:** No Iran deal. WTI ~$102, Brent ~$107. XLE benefited significantly (+6.7% est. May 15). XLE stop at $56.15 now has wide cushion ($61.50 vs $56.15 = 8.7%). Iran deal remains unresolved — no near-term catalyst to resolve.
- **Bitcoin:** $78,026 (May 17 weekend). Fear & Greed: 31 (Fear). CLARITY Act advancing through Senate Banking Committee — positive regulatory signal. Threshold remains $82K+. Technical "bear trap" forming per some analysts but do NOT lower threshold on speculation.
- **Semiconductor setup for week ahead:** MU at $749 (vs ATH $818) = 8.4% off highs; better entry point than $788. AMD at ~$424 (vs ATH ~$477) = 11% off highs; cheaper entry. Chip pullback on no-deal summit = opportunity to enter at discount.
- **Walmart earnings (May 20):** Consumer spending check. Home Depot (May 20 also). NVDA earnings dominate this week.
- **Rate environment:** No change — no cuts in 2026. JPM under pressure. Hot PPI/CPI environment.
- **Weekly performance (May 11-15):** S&P +0.3%, Nasdaq +0.3%, Dow -0.05%. Despite Friday selloff, full week was positive. Bull trend intact.

## Active Themes
1. **AI broadening / semiconductor supercycle** — TSM (+0.4% above entry), NVDA (+13.3%), AVGO (-1.1% vs entry due to selloff). AMD blocked 5 sessions — MUST enter Monday. MU pulled back to $749 (8.4% off ATH) = better entry. Summit produced no chip deal easing; rally was partially AI-driven not just China-deal. NVDA earnings May 20 AH is THE catalyst this week.
2. **Steeper curve / financials drag** — JPM at $297.81, now -3.4% below entry $308.30. PPI hot = no rate cuts in 2026. JPM dragging LT bucket. Thesis weakening but stop ($272.14) provides 8.6% cushion. Review for exit if JPM breaks $295.
3. **Geopolitical inflation hedge** — GLD (active) at $427.21 (+2.0% from entry). XLE now +4.2% above entry ($61.50 vs $59.01 entry). Oil surge ($102 WTI) widened XLE stop cushion from 2.65% → 8.7%. Iran deal unresolved = continued oil elevation. XLE target $65.01 (+10%) only $3.51/sh away.
4. **Crypto recovery** — BTC $78,026, still below $82K threshold. Fear & Greed: 31 (Fear). CLARITY Act advancing. No entry. Monitor.
5. **Government AI (PLTR AIP)** — PLTR at $132.28 (below $134 re-entry trigger). Summit produced no AI-specific language. Thesis intact (AIP government contracts + commercial expansion) but technical setup still broken. Re-score at Monday open; likely still ~6.5 without $134 reclaim.
6. **NVDA pre-earnings catalyst** — This is the dominant theme for week of May 18-22. Consensus very high (EPS +117% YoY). Goldman target $275. Existing position +13.3% above entry. Strategy: hold through earnings; no new entries; consider protective put if NVDA exceeds $240 Monday (5% OTM put for earnings hedge).

## Pending Actions — OPERATOR MUST EXECUTE MONDAY MAY 18

1. **AMD** (score 7.33, breakout-volume, active): Buy 10 shares at open Monday May 18 (MOO ~$424, better price than $445 from last week). Post-fill: stop at fill_price × 0.95 (active -5%). Target fill × 1.10. 5th consecutive deployment failure. MANDATORY. No excuses.

2. **MU** (Micron, est. score ~7.33, ai-momentum-pullback, LT): Full 6-agent score at Pre-Market May 18. AI memory supercycle; JEDEC HBM4; pulled back to $749 from ATH $818 = 8.4% off highs = BETTER entry than $788. Size: 6sh (avoids >5% position). LT entry: stop -12% = $659, target +24% = $929. Run full framework Monday.

3. **PLTR** (score 6.50 — conditional): Re-enter ONLY if PLTR opens and holds above $134 at Monday open. Current $132.28 = likely still below trigger. Full 6-agent re-score at Pre-Market. If still below $134 → SKIP (score ~6.5 with Technical=3 does not meet 7.0 bar).

4. **NVDA May 20 earnings (CORRECTED from May 21):** Pre-earnings positioning decision MANDATORY at Pre-Market May 18. No new NVDA entries after Monday COB. Consider: (a) hold 15sh + stop at $175.60 (28.6% cushion), (b) partial profit-take 5sh if NVDA opens >$228, (c) protective put if NVDA >$240. Decision must be made Monday.

5. **AVGO:** Still unconfirmed via API. Treating as probable fill at $418.59 (now -2.0% below entry at $410). Chip selloff May 15 took AVGO to ~$410. Stop at $368.36 still provides 10.3% cushion. Monitor for potential stop management if AVGO weakens further.

## Pending Deferrals (≥7 watchlist names not yet entered)
- **AMD** (7.33) — 5th consecutive deployment failure; MANDATORY at market open Monday May 18; entry ~$424 (better than original $445)
- **MU** (est. 7.33) — pending full 6-agent score at Pre-Market May 18; pullback to $749 from $788 = better entry; 6sh
- **PLTR** (6.50 current, conditional 7.33) — re-enter ONLY if $134 reclaimed at Monday open; currently $132.28 = likely skip

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
- **2026-05-15 — Trump-Xi Summit Day 2 (anticlimactic):** No deals announced. Summit ended with no semiconductor export framework. Markets fell -1.24% (S&P). Chip sector -3% to -7%. NVDA -3.6% to $225.32. XLE bucked trend (+6.7% est.) on oil surge to $102 WTI. Lesson: geo-political catalysts can be "buy the rumor, sell the news" — chip rally was partly priced in before summit began.
- **2026-05-15 — Large cash position cushioned down day:** Portfolio fell only -0.13% vs S&P -1.24% (gap improved by +1.25 pp). The 80% cash that hurt us in up markets protected us on the down day. Net: still want to deploy, but cash IS a real hedge.
- **2026-05-15 — NVDA earnings date CORRECTED:** Previously recorded as May 21; actual date is May 20 (Wednesday). This shifts the 48h entry cutoff to Monday May 18 COB. Always verify earnings dates from primary sources (NASDAQ earnings calendar) not just memory.
- **2026-05-15 — 9th+10th consecutive API blockage + silent failure (May 15 all routines):** AMD entry now 5 consecutive deployment failures. AMD has declined from $477 ATH to $424 (-11%) while waiting — entering now saves cost vs. original plan at $445-466.
- **2026-05-17 — Bitcoin Fear & Greed at 31 (Fear):** CLARITY Act advancing through Senate Banking Committee but BTC still at $78K (below $82K threshold). Regulatory clarity is NOT the same as price strength. Do not lower entry threshold on regulatory news alone — wait for price confirmation.
- **NVDA earnings risk (updated):** NVDA reports Q2 on May 20 AH. Stop $175.60 provides 28.6% cushion vs $225.32. Goldman target $275. Consensus very high (+117% EPS YoY). Risk: any miss or weak guidance would gap the stock down. Hold through earnings per strategy but have exit plan ready for May 21 open if needed.

## Setup Performance Tracker (updated 2026-05-14)
| Setup type | Wins | Losses | 3-in-a-row | Status |
|---|---|---|---|---|
| ai-momentum-pullback | 0 | 0 | none | Active (TSM open -0.4%, PLTR pending re-entry) |
| macro-hedge | 0 | 0 | none | Active (GLD open +2.4%, XLE open -2.3%) |
| earnings-reaction-follow | 0 | 0 | none | AMD setup reclassified to breakout-volume |
| breakout-volume | 0 | 0 | none | AMD pending fill (4th consecutive attempt) |
| earnings-reaction-fade | — | — | — | No trades |
| mean-reversion-oversold | — | — | — | No trades |
| sector-rotation | 0 | 0 | none | Active (JPM open -2.6% vs entry) |
| crypto-flush-rebound | — | — | — | No trades |
| candlestick-reversal | — | — | — | No trades |

No 3-in-a-row halt or boost rules triggered. No closed P&L to evaluate.

## Strategy Evolution Notes
- **2026-05-01 (init):** Strategy initialized per CLAUDE.md. No deviations.
- **2026-05-04:** First positions opened. Strategy unchanged; execution layer needs fixing.
- **2026-05-08:** Three-week persistent API blockage causing compounding execution gaps. Portfolio 85% cash vs. 10% floor target.
- **2026-05-12:** China chip deal changes AMD thesis from earnings-follow to breakout-volume. Rate-cut thesis broken (no cuts until 2027) but partially offset by China chip deal sector tailwind. PLTR government AI revenues insulated from rate environment. NVDA May 21 earnings approaching.
- **2026-05-14 (Week 2 Thursday):** Trump-Xi Summit Day 1 delivered massive NVDA catalyst (+4.54%). Boeing 200-jet order confirmed. PLTR near $134 re-entry. Markets at all-time records. Portfolio at +0.51% vs S&P +4.32% — entire gap attributable to API blockage keeping portfolio 80% in cash. No strategy changes warranted; execution infrastructure is the only problem. If API fixed and AMD/PLTR/MU deployed, portfolio would be ~+4-5% aligned with benchmark. **Friday Weekly Evolution Note:** Full strategy evolution note to be written at Daily Review May 15 (Friday).

## Next Routine Plan — WEEK OF MAY 18-22

### Pre-Market May 18 (8:00 AM ET — MONDAY) — CRITICAL WEEK
1. **Stop audit FIRST** — verify all 6 existing GTC stops still resting at Alpaca (assuming API becomes accessible, or operator verifies manually)
2. **AMD MOO 10 shares** — score 7.33, MANDATORY (5th attempt). Entry ~$424. If API blocked: operator places manually before 9:25 AM ET. No exceptions.
3. **MU full 6-agent score** — pull back to $749 = better entry. Size: 6sh ($4,494 = 4.5%). LT: stop -12% = $659, target +24% = $929. Enter as bracket GTC if API accessible.
4. **PLTR re-score** — if $134+ at open: run full 6-agent, enter. If still below $134: log skip with exemption rationale (score <7).
5. **NVDA pre-earnings strategy decision** — hold vs. partial-exit vs. protective put. Decision before 9:25 AM ET.

### Market Open May 18 (9:45 AM ET)
- Post-MOO stop orders for AMD (fill × 0.95, GTC)
- Confirm MU fill + bracket child orders resting
- Verify NVDA stop at $175.60 still active

### Daily Reviews May 19-22
- May 19: Last day for new NVDA entries — MUST finalize pre-earnings strategy
- May 20: NVDA earnings AH — hold position; no new entries today; Walmart/Home Depot results
- May 21: Post-NVDA reaction management
- May 22 (Friday): Weekly strategy evolution note; week recap

### XLE Watch
XLE at $61.50 — target $65.01 (+5.7% away). If oil remains elevated, XLE target could be hit this week. Have MOC close order plan ready.

## Cash Reserve Floor
$10,000 (10%). Current cash $80,946 — $70,946 available to deploy before hitting floor.
AMD fills would consume: 10sh × $424 = $4,240 → remaining: $76,706
+ MU 6sh × $749 = $4,494 → remaining: $72,212
+ PLTR (if $134 reclaimed): 36sh × $134 = $4,824 → remaining: $67,388
After all three: $67,388 still in cash = 67% — still massively above 10% floor.
After AMD + MU only (higher probability): $72,212 = 72% cash. Still very underfilled.
NVDA pre-earnings hedge: Could use ~$1,000 in protective puts (2026-May-20 expiry). Monitor at Pre-Market May 18.
