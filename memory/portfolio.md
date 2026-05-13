# Opus Trader — Portfolio Memory

## Last Updated
2026-05-13 (Wednesday) — Mid-Morning routine (11:09 AM ET / 15:09 UTC). Alpaca API STILL blocked ("Host not in allowlist" — HTTP 403). Pre-Market and Market-Open both missed today (silent failures). Prices from web research. AMD limit bracket 10sh attempted and blocked (HTTP 403). PLTR re-scored at $129.93 → 4.83/10, REJECTED (Risk automatic veto: stop below 52-week low). OPERATOR: place AMD limit bracket (limit $447.23, stop $424.87, target $491.95, GTC) and trail NVDA stop to $195.77.

## Current Account Snapshot
- **Broker:** Alpaca Paper Trading (account PA3TXVEJ19LW)
- **Total Equity (estimated):** ~$100,878 (estimated; API blocked; based on May 13 web-researched prices)
- **Cash:** $80,945.53 (80.2%) — unchanged; no orders have executed since May 4/5 fills (API blocked)
- **Long Market Value (estimated):** ~$19,932 (6 positions; revised with May 13 prices)
- **Open Positions:** 6 confirmed (TSM, GLD, NVDA, JPM, XLE, probable AVGO)
- **Pending Orders / Actions:** AMD limit bracket 10sh ($447.23/$424.87/$491.95 GTC) — APPROVED but API blocked; OPERATOR must place. NVDA stop trail to $195.77 — APPROVED, API blocked; OPERATOR must execute.
- **API Status:** BLOCKED — "Host not in allowlist" (HTTP 403, Anthropic sandbox TLS proxy). Persistent failure since May 6. ALL order attempts blocked.
- **Daytrade Count:** 0
- **PLTR Status:** RE-SCORED May 13 at $129.93 → 4.83/10, REJECTED. Broken support at $134, stop below 52-week low. Do NOT enter at current price. Watch for recovery above $135 before re-evaluating.

## Bucket State
| Bucket | Target | Current $ (est.) | Current % | Positions |
|---|---|---|---|---|
| Long-term | 55% ($55K) | ~$13,970 (excl AVGO) or ~$18,700 (incl AVGO) | 13.9% or 18.6% | 4 (TSM, NVDA, JPM + probable AVGO) |
| Active Trading | 30% ($30K) | ~$5,885 | 5.8% | 2 (GLD, XLE) |
| Crypto | 5% ($5K) | $0 | 0% | 0 |
| Cash Reserve | 10% ($10K floor) | ~$80,946 | 80.3% | — |

**Deployment gap:** Cash ~$70.9K above the 10% floor represents massive underfillment vs. bucket targets. PLTR and AMD are the immediate deployments blocked by API.

## Open Positions (estimated, API blocked — prices from May 13 web research)
| Symbol | Bucket | Qty | Entry | Stop | Target | Cost basis | Est. Price May 13 | Est. P/L | Sector |
|---|---|---|---|---|---|---|---|---|---|
| TSM | long-term | 7 | 401.47 | 353.76 (-12%) | 498.48 (+24%) | $2,810.29 | ~$397.28 | -$29.33 | Semiconductors |
| GLD | active | 7 | 418.86 | 397.92 (-5%) | — | $2,932.02 | ~$430.27 | +$79.87 | Precious metals |
| NVDA | long-term | 15 | 198.83 | **195.77** (trailed) | 247.44 (+24%) | $2,982.45 | ~$222.47 | +$354.60 | Semiconductors |
| JPM | long-term | 9 | 308.30 | 272.14 (-12%) | 383.47 (+24%) | $2,774.72 | ~$320 | +$105.30 | Financials |
| XLE | active | 50 | 59.01 | 56.15 (-5%) | 65.01 (+10%) | $2,950.50 | ~$57.79 | -$61.00 | Energy |
| AVGO* | long-term | 11 | 418.59 | 368.36 (-12%) | 519.05 (+24%) | $4,604.49 | ~$417.62 | -$10.67 | Semiconductors |

*AVGO: GTC bracket at $418.59 placed ~May 4. Treating as probable fill. Stop = bracket OCO child at $368.36 (-12%).
**NVDA stop trail: OLD stop $175.60 → NEW recommended $195.77 (12% below $222.47). API blocked — operator must trail.**

**Est. total long market value (all 6):** ~$19,932
- TSM: 7 × $397.28 = $2,781
- GLD: 7 × $430.27 = $3,012
- NVDA: 15 × $222.47 = $3,337
- JPM: 9 × $320 = $2,880
- XLE: 50 × $57.79 = $2,890
- AVGO: 11 × $417.62 = $4,594 (correction from prior estimate; slight loss)

**Net open P/L (May 13 estimates):** +$79.87+$354.60+$105.30-$29.33-$61.00-$10.67 = **+$438.77 unrealized**

## Sector Exposure (estimated)
| Sector | Est. $ | Est. % of equity |
|---|---|---|
| Semiconductors (TSM + NVDA + AVGO) | $11,070 | 10.98% |
| Financials (JPM) | $2,880 | 2.86% |
| Precious metals (GLD) | $3,024 | 3.00% |
| Energy (XLE) | $2,885 | 2.86% |
| Cash | $80,946 | 80.3% |

**After PLTR + AMD fill (pending):**
| Sector | Added $ | New % |
|---|---|---|
| Semiconductors (+ AMD $4,660) | $15,730 | 15.6% |
| Software/AI (+ PLTR $4,932) | $4,932 | 4.89% |
| Cash remaining | $71,354 | 70.8% |

All sectors remain well under 25% cap after fills.

**LT bucket tech sub-allocation (after PLTR fill):**
TSM+NVDA+AVGO = $11,070 in LT tech; + PLTR $4,932 = $16,002 LT tech
LT bucket total: $16,002 + JPM $2,880 = $18,882
LT-tech % = 84.7% → above 60% ceiling BUT LT bucket ($18.9K) < $20K threshold → ceiling is INFORMATIONAL per CLAUDE.md. Once PLTR fills and LT bucket approaches $20K, enforce strictly.

## Performance vs S&P 500
- **Portfolio total equity (est.):** ~$100,878 ($100,000 + $438.77 unrealized + $80,946 unchanged cash − position cost basis ~$19,493)
- **Portfolio total return:** ~+0.88% (estimated based on $438.77 net unrealized gain on open positions)
- **S&P 500 May 13:** ~7,400 (slight pullback from May 11 record 7,412.84 on hot PPI)
- **S&P 500 return since strategy start (~May 1):** est. ~+2.7-3.2% (S&P May 1 ~$7,200 est.)
- **Gap vs SPX:** Lagging by ~1.8-2.3 percentage points — driven by 80% cash exposure from API-blocked deployments
- **NOTE:** AMD has pulled back from $477→$445 since May 12 ($31/sh). Had the API been working and AMD entered at $466, we'd be down 4.7% on that trade. The pullback may ultimately provide a BETTER entry at $445 via today's limit bracket (if API clears).
- **CRITICAL:** Every day of 80% cash represents compounding missed returns. AMD limit bracket (if filled) and further deployment is needed.

## Macro Context (as of 2026-05-13 mid-morning)
- **PPI Report (TODAY 8:30 AM ET):** April PPI +1.4% MoM (largest since March 2022), +6.0% YoY (largest since Dec 2022). Gasoline +15.6% driven by Iran-Hormuz conflict. Services +1.2% (most since March 2022). Market reaction: dollar stronger, gold slightly softer (-0.6%), tech mixed. This is a MAJOR inflation shock.
- **CPI (yesterday, May 12):** April CPI +3.7% YoY. Hot print confirmed.
- **Fed outlook:** Rate hike probability rising. Top banks: first cut not until 2027. Rate hike debate now live. HEADWIND for high-multiple growth (PLTR 85x P/E, NVDA high multiple).
- **China chip deal:** NVDA + AMD + AVGO agreed to 15% U.S. revenue share on China AI chip sales. AMD $500M-800M 2026 upside. AMD has pulled back from $477→$445 (constructive digestion). Still valid thesis.
- **Trump-Xi Beijing summit (TOMORROW May 14-15):** Semiconductor export controls key agenda item. COULD be additional positive catalyst for chip stocks. AMD/NVDA/TSM positioned to benefit.
- **Iran/oil:** Unresolved. Trump called Iranian reparation demands "unacceptable." Oil remains elevated $100-126/bbl (Brent). XLE stop at $56.15 vs current $57.79 = tight. Hold.
- **S&P 500:** ~7,400 area (slight pullback from May 11 record 7,412.84 on inflation data).
- **NVDA Earnings:** May 21 (8 days). No new NVDA entries after May 19 (within 48h window). Existing position: stop TRAILED to $195.77 (API blocked — operator must execute). Existing stop provides 26.7% downside protection from entry.
- **INTC:** Up 200% YTD, $120.61 — Apple chip manufacturing deal. BUT analyst consensus target $65.94 = 45% downside from current. Extremely extended. Do NOT enter.
- **TSM:** At $397.28 (-1.04% below entry). Analyst 12-month target $416.67. Q1 revenue +35.1% YoY. Capital investment raised to high end ($56B). Thesis intact — hold with stop at $353.76.

## Active Themes
1. **AI broadening / China chip deal** — TSM + NVDA + probable AVGO in LT bucket. AMD + PLTR pending fills. China demand now unlocked = step-function revenue upside.
2. **Steeper curve / financials tailwind** — JPM (LT), performing well (+2.9% P/L).
3. **Geopolitical inflation hedge** — GLD (active) up +3.1% from entry. Hot CPI reinforces gold bull case. Iran deal NOT confirmed — XLE stop active.
4. **Crypto recovery** — BTC last known ~$80K (May 8). Below threshold for entry. Re-evaluate at $82K+ or $75K flush.
5. **Government AI (PLTR AIP)** — fiscally funded, not rate-sensitive. Q1 beat extraordinary.

## Pending Actions — OPERATOR MUST EXECUTE (UPDATED May 13)

All orders attempted via API and FAILED (HTTP 403). Manual placement required:

1. **AMD** (score 7.50, breakout-volume, active): Place limit bracket order NOW:
   - Symbol: AMD | Qty: 10 | Side: buy | Type: limit
   - Limit price: $447.23 | Stop: $424.87 (-5%) | Target: $491.95 (+10%)
   - order_class: bracket | time_in_force: GTC (MANDATORY per CLAUDE.md)

2. **NVDA stop trail** (active management — NOT a new entry):
   - Cancel existing NVDA stop at $175.60
   - Place new GTC stop: symbol=NVDA, qty=15, side=sell, type=stop, stop_price=$195.77
   - Reason: NVDA at $222.47 = +11.9% from entry; trail stop up to lock in gains ahead of May 21 earnings

3. **PLTR** (REJECTED at current price, May 13):
   - Do NOT enter PLTR at $129.93. Support broken at $134. Score 4.83/10, Risk veto (stop below 52-week low).
   - Re-evaluate if PLTR recovers above $135 AND RSI turns bullish AND macro environment improves (PPI/CPI data).
   - Next check: Daily Review (4:30 PM ET) or Pre-Market May 14.

4. **AVGO:** Still unconfirmed via API. At $417.62 (May 12) — if NOT filled, current market is ~$417. Our bracket was at $418.59. Verify account status. Assume bracket is active.

5. **TSM:** At $397.28 (below entry $401.47). No action — stop at $353.76 is well below. Hold.

## Pending Deferrals (≥7 watchlist names not yet entered)
- **AMD** (7.50) — API blocked; operator must place limit bracket (limit $447.23, stop $424.87, target $491.95, GTC)
- **PLTR** — RE-SCORED May 13 at $129.93 → 4.83/10, REJECTED. No longer a pending deferral — it is a scored rejection. Do not enter until recovery above $135 with improved macro.

## Sector Exposure (estimated, May 13)
| Sector | Est. $ | Est. % of equity |
|---|---|---|
| Semiconductors (TSM + NVDA + AVGO) | $10,712 | 10.62% |
| Financials (JPM) | $2,880 | 2.86% |
| Precious metals (GLD) | $3,012 | 2.99% |
| Energy (XLE) | $2,890 | 2.87% |
| Cash | $80,946 | 80.2% |

**After AMD fill:**
| Sector | Added $ | New % |
|---|---|---|
| Semiconductors (+ AMD $4,472) | $15,184 | 15.1% |
| Cash remaining | ~$76,474 | 75.8% |

All sectors remain well under 25% cap.

## Lessons Learned (running log)
- **Week of 2026-04-27 (init):** No trades placed. First-run setup; benchmarking begins next week.
- **2026-05-01 — bias correction (operator-mandated):** Capital in cash earns nothing. Score ≥ 7 = enter at next routine. Only 3 valid skip exemptions per CLAUDE.md Deployment Bias.
- **2026-05-04 — remote-routine failure mode discovered:** Cron triggers produced zero commits/orders. Manual session broke the streak.
- **2026-05-05 — silent failure REPEATS:** Heartbeat infra not sufficient. Operator pre-queued brackets saved the day (NVDA, JPM filled). GLD naked stop discovered and fixed.
- **2026-05-06 — API blocked (new failure mode):** Routine ran late AND Alpaca API blocked. AMD, PLTR, BTC documented as attempts; none executed.
- **2026-05-08 — API blocked AGAIN (3rd consecutive):** AMD and PLTR MOO blocked at 12:19Z. HTTP 403 from Anthropic TLS proxy. Persistent infrastructure problem.
- **2026-05-08 to 2026-05-12 (weekend gap):** S&P 500 hit record 7,412.84 on May 11 while portfolio remained 80% cash. Gap cost: ~2.1-2.7 percentage points vs. benchmark. This is the direct cost of the API blockage.
- **2026-05-12 — CPI binary event note:** April CPI (+3.7% YoY) releasing at 8:30 AM ET is NOT a CLAUDE.md-exempt binary event (list: earnings, FDA, Fed decision day). Per Deployment Bias, CPI is NOT a valid skip reason. MOO orders must be placed regardless; open price will reflect CPI result.
- **2026-05-12 — AMD setup change:** AMD entry thesis changed from `earnings-reaction-follow` (at $413) to `breakout-volume` (at $466) due to China chip deal catalyst. Scores remain valid at 7.33. Technical score reduced to 5 (entering after 15% move, elevated RSI) — offset by Fundamentals 9, Sentiment 8, Tech 8.
- **NVDA earnings risk:** NVDA reports Q2 on May 21. Well-covered by stop at $175.60 (-21% from $222 est.). No action needed now; Daily Review should flag for pre-earnings review on May 19.
- **2026-05-13 — PLTR re-score / broken support lesson:** PLTR re-scored at $129.93 (broken $134 support) → 4.83/10, rejected. Key lesson: a prior score at one price/setup does NOT lock in an entry at a worse price/setup. When price breaks support AND macro environment worsens (hot PPI = rate headwind), re-scoring is mandatory. PLTR stop at 12% from $130 = $114.42 is below 52-week low ($118.93) — this structural analysis prevented a potentially large loss.
- **2026-05-13 — PPI shock:** April PPI +1.4% MoM, +6% YoY (biggest since March 2022). This is the second consecutive hot inflation print (CPI yesterday). Rate hike probability rising. High-multiple growth stocks are under pressure. Strategy impact: avoid adding to high-multiple names; favor energy, industrials, materials, and specific chip plays with fundamental catalysts (AMD China deal) that override macro.
- **2026-05-13 — Pre-Market and Market-Open both missed:** Fourth consecutive day with missing routines. AMD and PLTR remain unexecuted from May 12. Execution infrastructure reliability is the primary performance drag.

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
- **Midday (12:30 PM ET):** (1) Stop-loss audit (all positions — API blocked, use web prices). (2) Check XLE — if Iran situation worsens and XLE falls toward $56.15 stop, alert. (3) Watch AMD price action (our limit $447.23 — if AMD dips below $443, order may fill if API clears). (4) Monitor Trump-Xi summit news (begins May 14 — any leaks today could move semis).
- **Afternoon (2:00 PM ET):** (1) Re-assess PLTR — if recovery above $134 on volume, re-score (might get back to 7.0+). (2) Final XLE check ahead of close (oil market closes 2:30 PM, can move XLE). (3) Position for tomorrow's Trump-Xi Day 1.
- **Daily Review (4:30 PM ET):** (1) Trump-Xi summit preview positions. (2) NVDA earnings May 21 — 8 days, set calendar alert for May 19 close-or-hedge decision. (3) Score BTC if above $82K. (4) AMD fill confirmation (if API cleared during day). (5) Check if semis sector rotation (INTC/AMD/MU) represents a new medium-term thesis.

## Cash Reserve Floor
$10,000 (10%). Current cash $80,946 — $70,946 available to deploy before hitting floor. PLTR + AMD fills would consume ~$9,592, leaving ~$61,354+ available. Massive remaining deployment gap.
