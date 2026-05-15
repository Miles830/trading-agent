# Opus Trader — Portfolio Memory

## Last Updated
2026-05-15 (Friday) — Midday (12:30 PM ET / 16:35 UTC). Alpaca API STILL blocked ("Host not in allowlist"). 9th consecutive blocked session. Pre-Market, Market Open, Mid-Morning all SILENT FAILED. Trump-Xi Summit Day 2 DISAPPOINTED: no chip deal signed, H200 not shipping, rare-earth exports 50% below baseline. S&P 500 DOWN ~1% midday (7,511→7,436). Tech selloff (NVDA -3%, AMD -3.7%, MU -5%). Energy up (oil Brent $107.30, WTI $102.74). All three watchlist candidates (AMD, PLTR, MU) re-scored and REJECTED (scores 5.5, 5.83, 5.5 — summit conditions degraded Technical/Sentiment/Macro below 7.0 threshold). Gap vs SPX IMPROVED slightly to -2.91pp (portfolio only -0.15% vs market -1%).

## Current Account Snapshot
- **Broker:** Alpaca Paper Trading (account PA3TXVEJ19LW)
- **Total Equity (estimated):** ~$100,365 (estimated; API blocked; prices from May 15 midday web research)
- **Cash:** $80,945.53 (80.6%) — unchanged; no orders have executed since May 4/5 fills
- **Long Market Value (estimated):** ~$19,419 (6 positions)
- **Open Positions:** 6 (TSM, GLD, NVDA, JPM, XLE, AVGO probable fill)
- **Today's P&L (midday):** ~-$149 / -0.15% — Circuit breaker NOT tripped
- **Pending Orders / Actions:** AMD, PLTR, MU all RE-SCORED AND REJECTED today (scores 5.5, 5.83, 5.5) due to summit Day 2 disappointment. Re-entry next week when macro/sentiment stabilize. NVDA stop trail (→$207) and XLE stop trail (→$57.00) INTENDED but cannot execute (API blocked).
- **API Status:** BLOCKED — "Host not in allowlist" (HTTP 403, Anthropic sandbox TLS proxy). Persistent failure since May 6. 9th consecutive blocked session.
- **Daytrade Count:** 0

## Bucket State
| Bucket | Target | Current $ (est.) | Current % | Positions |
|---|---|---|---|---|
| Long-term | 55% ($55K) | ~$13,657 (TSM+NVDA+JPM+AVGO) | 13.6% | 4 (TSM, NVDA, JPM, probable AVGO) |
| Active Trading | 30% ($30K) | ~$5,885 (GLD+XLE) | 5.9% | 2 (GLD, XLE) |
| Crypto | 5% ($5K) | $0 | 0% | 0 |
| Cash Reserve | 10% ($10K floor) | ~$80,946 | 80.5% | — |

**Deployment gap:** Cash ~$70.9K above the 10% floor. AMD entry unconfirmed for 4th consecutive session. Massive underfillment continues. MU and PLTR also pending first entries.

## Open Positions (estimated, API blocked — prices from May 15 midday web research)
| Symbol | Bucket | Qty | Entry | Stop | Target | Cost basis | Est. Price | Est. P/L | Sector |
|---|---|---|---|---|---|---|---|---|---|
| TSM | long-term | 7 | 401.47 | 353.76 (-12%) | 498.48 (+24%) | $2,810.29 | ~$390 | -$79.29 | Semiconductors |
| GLD | active | 7 | 418.86 | 397.92 (-5%) | — | $2,932.02 | ~$416 | -$20.02 | Precious metals |
| NVDA | long-term | 15 | 198.83 | 175.60 (-12%) | 247.44 (+24%) | $2,982.45 | ~$228 | +$437.55 | Semiconductors |
| JPM | long-term | 9 | 308.30 | 272.14 (-12%) | 383.47 (+24%) | $2,774.72 | ~$299 | -$83.72 | Financials |
| XLE | active | 50 | 59.01 | 56.15 (-5%) | 65.01 (+10%) | $2,950.50 | ~$58.50 | -$25.50 | Energy |
| AVGO* | long-term | 11 | 418.59 | 368.36 (-12%) | 519.05 (+24%) | $4,604.49 | ~$431 | +$136.51 | Semiconductors |

*AVGO: GTC bracket at $418.59 placed ~May 4. Probable fill. Stop = bracket OCO child at $368.36 (-12%). AVGO holding up +2% despite tech selloff — AI networking demand less China-dependent.

**Est. total long market value (all 6):** ~$19,419 (midday May 15)
- TSM: 7 × $390 = $2,730
- GLD: 7 × $416 = $2,912
- NVDA: 15 × $228 = $3,420
- JPM: 9 × $299 = $2,691
- XLE: 50 × $58.50 = $2,925
- AVGO: 11 × $431 = $4,741

**Net unrealized P/L: +$365.53** (NVDA +$437 and AVGO +$137 as primary drivers; TSM, GLD, JPM, XLE all modestly negative)

**Intended stop trails (cannot execute, API blocked):**
- NVDA: trail stop UP from $175.60 → $207.00 (pre-earnings cushion management; MANDATORY at Daily Review May 19)
- XLE: trail stop UP from $56.15 → $57.00 (lock in oil-surge gains against sudden reversal)

## Sector Exposure (estimated — May 14 EOD)
| Sector | Est. $ | Est. % of equity |
|---|---|---|
| Semiconductors (TSM+NVDA+AVGO) | $10,981 | 10.9% |
| Financials (JPM) | $2,702 | 2.7% |
| Precious metals (GLD) | $3,003 | 3.0% |
| Energy (XLE) | $2,882 | 2.9% |
| Cash | $80,946 | 80.5% |

**After AMD fill (still pending for May 15):**
| Sector | Added $ | New % |
|---|---|---|
| Semiconductors (+AMD 10sh×$445 = $4,450) | $15,431 | 15.4% |
| Cash remaining | $76,496 | 76.1% |

All sectors remain well under 25% cap. After MU + PLTR fills (if entered), semis could approach 20%+ but still below 25% cap.

**LT bucket tech sub-allocation (current):**
TSM+NVDA+AVGO = $10,981 in LT tech; LT total = $10,981 + $2,702 (JPM) = $13,683
LT-tech % = 80.3% → above 60% ceiling BUT LT bucket ($13.7K) < $20K threshold → ceiling is INFORMATIONAL per CLAUDE.md. If PLTR enters ($4,800): LT total = $18,483 → still below $20K, still informational.

## Performance vs S&P 500
- **Portfolio total equity (est.):** ~$100,365
- **Portfolio total return:** +0.37% ($100,365 / $100,000 initial)
- **Today's P&L (midday, vs May 14 est $100,514):** ~-$149 / -0.15%
- **S&P 500 midday May 15:** ~7,436 (-1.0%) — Summit Day 2 disappointment; tech selloff
- **S&P 500 return since strategy start (~May 1):** ~+3.28% (7,436 vs ~7,200 est.)
- **Gap vs SPX:** **-2.91 percentage points** — IMPROVED +0.90 pp today (portfolio -0.15% vs SPX -1.0%)
- Note: Gap improvement is the "silver lining" of 80% cash — on down days the portfolio underperforms less. Net effect still deeply negative over 10-day period.

## Macro Context (as of 2026-05-15 midday)
- **Trump-Xi Summit Day 2 CONCLUDED (DISAPPOINTMENT):** Summit ended with "warm rhetoric but no concrete wins." Not a single H200 chip has shipped to any approved Chinese buyer. Rare-earth exports still 50% below pre-restriction levels. No signed AI governance framework. No semiconductor export control changes. Trump called it a success; markets disagree (-1% S&P). Next summit meeting planned for fall 2026.
- **Market reaction:** S&P -1% midday. Tech sector -3-6% (NVDA -3%, AMD -3.7%, MU -5%, INTC -6%). Energy OUTPERFORMING: Brent $107.30 (+1.5%), WTI $102.74 (+1.6%) — oil surge driven by US-China trade talks about oil purchases (China agreed to buy more US LNG/energy).
- **PPI context:** April PPI +1.4% (reported May 13). No rate cuts in 2026. AI/tech narrative partially unwinding as China deal expectations reset.
- **NVDA Earnings:** May 21 (6 days). Do NOT enter new NVDA positions after May 19. Stop $175.60 provides 29.7% cushion vs $228. Pre-earnings review at Daily Review May 19 MANDATORY. Consider trailing stop to $207 (blocked by API) to protect +14.6% gain.
- **Iran deal:** Still unconfirmed. Oil surging to $102-107/bbl. XLE cushion improving (now 4.0% vs prior 2.65%). XLE thesis strengthening.
- **Bitcoin:** ~$79,600 range (May 14). Summit produced no crypto language. Threshold unchanged at $82K+. No entry.
- **Boeing:** Day 2 added no new orders or maintenance contracts. BA thesis remains weak at ~$245. Score ~6.2 — below 7.0 threshold.
- **Healthcare:** XLV outperformed again on May 14. Keep on watchlist for next week's scan.
- **Oil/Energy breakout:** WTI $102.74 (+1.5%), Brent $107.30 (+1.5%). China agreed to purchase more US energy. This is a strong macro tailwind for XLE (active holding) and potentially for entry in individual energy names next week.

## Active Themes
1. **AI broadening / China chip deal — THESIS PARTIALLY DAMAGED** — TSM + NVDA + AVGO in LT bucket. AMD, PLTR, MU all re-scored and REJECTED today (avg scores 5.5-5.83) due to summit disappointment. Summit Day 2 produced zero concrete wins for semis. Re-entry window: next week when summit noise clears and tech stabilizes. The AI demand thesis (data center, HPC) remains intact independently of China exports.
2. **Oil/Energy breakout — THESIS STRENGTHENING** — XLE (active) now with 4.0% stop cushion as oil surges to Brent $107. China agreed to buy more US energy. Iran deal still unconfirmed. Consider individual energy name entry next week (e.g., XOM, CVX) if oil momentum continues.
3. **Steeper curve / financials drag** — JPM (LT) at $299, now -3.1% below entry $308.30. PPI hot = no rate cuts. Thesis playing out. Stop $272.14 provides 9.3% cushion. Hold; no new financials until rate-cut environment improves.
4. **Geopolitical inflation hedge** — GLD (active) slightly below entry at $416 vs $418.86. Thesis intact: PPI +1.4%, oil $102/bbl, Iran unresolved = persistent inflation bid for gold. Stop $397.92 provides 4.3% cushion.
5. **Crypto recovery** — BTC ~$79,600. Summit produced no crypto language. Threshold unchanged at $82K. No entry.
6. **Government AI (PLTR AIP)** — PLTR at $134.06 midday, barely at threshold with volatile range ($131.57-$134.99). Re-score 5.83 (rejected). Re-entry condition: 2 consecutive closes above $134 with volume. Next assessment: Pre-Market Monday May 18.
7. **NVDA pre-earnings** — NVDA +14.6% above entry; earnings May 21 (6 days). Pre-earnings review MANDATORY at Daily Review May 19. Stop trail to $207 intended (blocked). Consider collar or partial profit-taking if NVDA above $230+ on May 19.

## Pending Actions — OPERATOR MUST EXECUTE / WATCHLIST FOR MAY 18 (Monday)

Summit noise has cleared. These are the re-entry targets for next week:

1. **AMD** (re-score at Pre-Market May 18): Summit disappointment re-scored AMD to 5.5 today. Once tech sentiment normalizes next week, re-score fresh. Key level: AMD must stabilize above $430-$440 support zone. If re-scores ≥7: enter 10sh with active stop -5%.

2. **PLTR** (re-entry condition): Must close above $134 for 2 consecutive sessions (Friday close + Monday open behavior). Re-score at Pre-Market May 18 with fresh Technical data.

3. **MU** (re-score at Pre-Market May 18): Summit produced no memory chip deal but AI memory supercycle thesis is intact. Re-score when tech stabilizes. Expected re-score: depends on price action over weekend/early next week.

4. **NVDA stop trail** (CRITICAL — OPERATOR OR DAILY REVIEW MAY 19): Trail stop from $175.60 to $207.00. CANNOT EXECUTE (API blocked). If not executed at Daily Review May 19, trail at Daily Review May 19 as pre-earnings position management.

5. **XLE stop trail** (intended): Trail from $56.15 to $57.00 given oil surge (WTI $102.74). CANNOT EXECUTE (API blocked). Operator should place at next available API access window.

6. **NVDA May 21 earnings:** Pre-earnings FULL review at Daily Review May 19 (mandatory). No new NVDA entries after May 19. Consider partial profit-taking or collar if NVDA above $230 on May 19.

7. **Individual energy plays next week:** Oil at $102-107/bbl with China energy purchase agreement. Scan XOM, CVX, EOG for individual stock entries in active bucket if they score ≥7 at Pre-Market May 18.

8. **AVGO:** Treating as confirmed fill at $418.59. Performing well (+2% today, holding above entry). Continue hold.

## Pending Deferrals (watchlist names pending re-score at Pre-Market May 18)
- **AMD** (re-score target ≥7) — re-scored 5.5 on May 15 (summit disappointment); re-enter when tech stabilizes
- **MU** (re-score target ≥7) — re-scored 5.5 on May 15; AI memory thesis intact but China risk not resolved
- **PLTR** (conditional, re-score target ≥7) — re-scored 5.83 on May 15; need 2 closes above $134 before re-entry

## Lessons Learned (running log)
- **2026-05-15 — Summit Day 2 re-score discipline:** All three ≥7 watchlist names (AMD 7.33, PLTR 7.33, MU 7.33) were legitimately re-scored below threshold (5.5, 5.83, 5.5) when summit Day 2 produced zero concrete chip deals. This is NOT a deployment-bias violation — re-scoring on materially changed conditions is required due diligence. The "deployment bias" rule means don't make up reasons to stay in cash; it doesn't mean ignore new information. Correct call: rejected all three based on updated Technical/Sentiment/Macro scores.
- **2026-05-15 — Tech sector China dependence vs independent demand:** AVGO held +2% while NVDA fell -3%, TSM fell -2.6%, AMD fell -3.7%. AVGO's AI networking/infrastructure revenue is less exposed to China chip export restrictions. This is a useful differentiation for future portfolio construction.
- **2026-05-15 — Energy oil surge on China energy deal:** China agreed to buy more US LNG/energy (even if chip deal failed). Oil surged to Brent $107, WTI $102. XLE thesis strengthened. Monitor individual energy names for next week entry.
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
- **NVDA earnings risk:** NVDA reports Q2 on May 21 (7 days). Pre-earnings review MUST happen at Daily Review May 19. Stop $175.60 provides 34.2% cushion vs $235.63. Consider partial profit-taking or collar if NVDA above $240 on May 19.

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

## Next Routine Plan
- **Daily Review May 15 (4:30 PM ET — FRIDAY):** 
  1. Weekly strategy evolution note (mandatory per CLAUDE.md)
  2. NVDA pre-earnings prep begins (6 days to May 21) — initiate pre-earnings review
  3. Final settlement prices for all 6 positions
  4. Watchlist prep for week of May 18 — AMD, PLTR, MU re-score conditions
  5. Individual energy name scan (XOM, CVX, EOG) given oil surge
  6. Update benchmark tracking (gap vs SPX)

- **Pre-Market May 18 (8:00 AM ET — MONDAY):**
  1. Re-score AMD, PLTR, MU with fresh technical data (weekend news + Monday open conditions)
  2. Scan energy names for potential entries (XOM, CVX, EOG)
  3. NVDA pre-earnings assessment — 3 days to May 21; stop trail to $207
  4. Stop audit — verify all GTC stops resting

- **Daily Review May 19 (CRITICAL — NVDA Earnings eve):**
  1. FULL NVDA pre-earnings review — collar analysis, partial profit-taking decision
  2. No new NVDA entries after this review
  3. Trail NVDA stop UP to $207+ (or execute collar depending on premium)

## Cash Reserve Floor
$10,000 (10%). Current cash $80,946 — $70,946 available to deploy before hitting floor.
AMD fills would consume: 10sh × $445 = $4,450 → remaining: $76,496
+ PLTR 36sh × $134 = $4,824 → remaining: $71,672
+ MU 6sh × $788 = $4,728 → remaining: $66,944
After all three: $66,944 still in cash = 66% — still massively above 10% floor.
NVDA pre-earnings hedge consideration: Could use up to 1% of portfolio = ~$1,000 in protective puts.
