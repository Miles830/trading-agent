# Opus Trader — Portfolio Memory

## Last Updated
2026-05-13 (Wednesday) — Market Open routine (9:45 AM ET / 13:45 UTC). Pre-Market SILENTLY FAILED (no heartbeat). Catch-up run from Market Open. Alpaca API blocked (HTTP 403 / host_not_allowed — Anthropic sandbox TLS proxy). Prices estimated from web research. PLTR limit bracket GTC (36sh) and AMD limit bracket GTC (10sh) attempted and blocked. OPERATOR must place both manually.

## Current Account Snapshot
- **Broker:** Alpaca Paper Trading (account PA3TXVEJ19LW)
- **Total Equity (estimated):** ~$100,177 (estimated; API blocked; chip sector -3% + PPI shock dragged positions lower May 13)
- **Cash:** $80,945.53 (80.8%) — unchanged; no orders have executed since May 4/5 fills
- **Long Market Value (estimated):** ~$19,231 (6 positions including probable AVGO fill)
- **Open Positions:** 6 confirmed (TSM, GLD, NVDA, JPM, XLE, probable AVGO)
- **Pending Orders / Actions:** PLTR limit bracket GTC 36sh (limit $135.51, stop $118.66, target $167.20) + AMD limit bracket GTC 10sh (limit $450.53, stop $425.88, target $493.11) — APPROVED (7.17 each) but API blocked; operator must place manually
- **API Status:** BLOCKED — "Host not in allowlist" (HTTP 403, Anthropic sandbox TLS proxy). Persistent failure since May 6. All routine order attempts blocked.
- **Daytrade Count:** 0

## Bucket State
| Bucket | Target | Current $ (est.) | Current % | Positions |
|---|---|---|---|---|
| Long-term | 55% ($55K) | ~$13,970 (excl AVGO) or ~$18,700 (incl AVGO) | 13.9% or 18.6% | 4 (TSM, NVDA, JPM + probable AVGO) |
| Active Trading | 30% ($30K) | ~$5,885 | 5.8% | 2 (GLD, XLE) |
| Crypto | 5% ($5K) | $0 | 0% | 0 |
| Cash Reserve | 10% ($10K floor) | ~$80,946 | 80.3% | — |

**Deployment gap:** Cash ~$70.9K above the 10% floor represents massive underfillment vs. bucket targets. PLTR and AMD are the immediate deployments blocked by API.

## Open Positions (estimated, API blocked — prices from May 13 web research)
| Symbol | Bucket | Qty | Entry | Stop | Target | Cost basis | Est. Price | Est. P/L | Sector |
|---|---|---|---|---|---|---|---|---|---|
| TSM | long-term | 7 | 401.47 | 353.76 (-12%) | 498.48 (+24%) | $2,810.29 | ~$397.28 | -$29.33 | Semiconductors |
| GLD | active | 7 | 418.86 | 397.92 (-5%) | — | $2,932.02 | ~$430.50 | +$81.48 | Precious metals |
| NVDA | long-term | 15 | 198.83 | 175.60 (-12%) | 247.44 (+24%) | $2,982.45 | ~$224.46 | +$384.45 | Semiconductors |
| JPM | long-term | 9 | 308.30 | 272.14 (-12%) | 383.47 (+24%) | $2,774.72 | ~$304.88 | -$30.78 | Financials |
| XLE | active | 50 | 59.01 | 56.15 (-5%) | 65.01 (+10%) | $2,950.50 | ~$57.43 | -$79.00 | Energy |
| AVGO* | long-term | 11 | 418.59 | 368.36 (-12%) | 519.05 (+24%) | $4,604.49 | ~$405.00 | -$149.49 | Semiconductors |

*AVGO: GTC bracket at $418.59 placed ~May 4. Treating as probable fill (AVGO range May 8 was $406-$426; bracket eligible). Stop = bracket OCO child at $368.36 (-12%). Chip sector -3% May 13 → estimated at $405.

**Est. total long market value (all 6):** ~$19,232
- TSM: 7 × $397.28 = $2,780.96
- GLD: 7 × $430.50 = $3,013.50
- NVDA: 15 × $224.46 = $3,366.90
- JPM: 9 × $304.88 = $2,743.92
- XLE: 50 × $57.43 = $2,871.50
- AVGO: 11 × $405.00 = $4,455.00

**Total estimated open P/L:** -$29.33 + $81.48 + $384.45 - $30.78 - $79.00 - $149.49 = **+$177.33 unrealized** (vs +$736.91 on May 12 — $559.58 decline from chip sector selloff + PPI shock)

## Sector Exposure (estimated, May 13 prices)
| Sector | Est. $ | Est. % of equity |
|---|---|---|
| Semiconductors (TSM + NVDA + AVGO) | $10,602 | 10.58% |
| Financials (JPM) | $2,744 | 2.74% |
| Precious metals (GLD) | $3,014 | 3.01% |
| Energy (XLE) | $2,872 | 2.87% |
| Cash | $80,946 | 80.8% |

**After PLTR + AMD fill (pending operator action):**
| Sector | Added $ | New % |
|---|---|---|
| Semiconductors (+ AMD $4,483) | $15,085 | 15.06% |
| Software/AI (+ PLTR $4,854) | $4,854 | 4.85% |
| Cash remaining | $71,609 | 71.5% |

All sectors remain well under 25% cap after fills.

**LT bucket tech sub-allocation (after PLTR fill):**
TSM+NVDA+AVGO = $10,602 in LT tech; + PLTR $4,854 = $15,456 LT tech
LT bucket total: $15,456 + JPM $2,744 = $18,200
LT-tech % = 84.9% → above 60% ceiling BUT LT bucket ($18.2K) < $20K threshold → ceiling is INFORMATIONAL per CLAUDE.md. Once PLTR fills and LT bucket crosses $20K, enforce strictly.

## Performance vs S&P 500
- **Portfolio total equity (est.):** ~$100,177
- **Portfolio total return:** +0.18% ($100,177 / $100,000 initial)
- **S&P 500 May 13:** ~7,375 (est.; Dow -0.49%, S&P -0.15% on hot PPI data)
- **S&P 500 return since strategy start (~May 1):** est. ~+2.4% (S&P May 1 ~$7,200 est.; May 13 ~$7,375)
- **Gap vs SPX:** Lagging by ~2.2 percentage points — driven by 80% cash exposure from API-blocked deployments. S&P down today but less than chip stocks — portfolio losing small amount on positions vs large cash drag.
- **Today's P/L estimate:** ~-$628 from May 12 estimate (chip sector selloff -3%; TSM -7.6%, AVGO -3%, JPM -5%)
- **CRITICAL:** Every day of 80% cash represents compounding missed returns. AMD/PLTR fills are the only path to close the benchmark gap.

## Macro Context (as of 2026-05-13 market open)
- **PPI Report (TODAY 8:30 AM ET):** April wholesale prices +1.4% MoM (vs +0.5% expected), +6.0% YoY (vs +4.8% expected) — MASSIVE upside surprise. Second consecutive hot inflation print (CPI +3.8% YoY on May 12). Rate hike probability rising; first Fed cut now deferred well into 2027+. SIGNIFICANT headwind for high-multiple growth stocks.
- **Chip stocks under pressure:** SOX index -3.0% today. Qualcomm -11.5%, Intel -7.0%. Hot inflation = rising discount rates = growth stock valuations compressed. Our semiconductor positions (TSM, NVDA, AVGO) all down on the day.
- **China chip deal (intact):** AMD MI308 + NVDA H20 approved for China market. AMD $500M-800M 2026 revenue upside. NVDA $7-12.5B upside. Core thesis unchanged — chip stocks selling on macro, not on deal fundamentals.
- **Trump-Xi Beijing summit (TOMORROW May 14-15):** Trump departed for Beijing today. Summit covers AI guardrails, chip export controls, Taiwan, Iran. Semiconductor export controls are KEY agenda item. Outcome could reverse chip-sector selloff rapidly. AMD and TSM have largest direct exposure to positive outcome.
- **Iran / XLE:** Trump called the Iran ceasefire "unbelievably weak" and "on massive life support." Increased tension risk keeps oil elevated ($100-126/bbl). XLE stop at $56.15 is critical.
- **S&P 500:** ~$7,375 est. (Dow -0.49%, S&P -0.15%, Nasdaq +0.12%). Nasdaq holding better = growth tech resilient despite chip sector drag.
- **NVDA Earnings:** May 21 (8 days). Risk flag. No new NVDA entries after May 19 (within 48h). Existing stop $175.60 well protected (+27.8% cushion).

## Active Themes
1. **AI broadening / China chip deal** — TSM + NVDA + probable AVGO in LT bucket. AMD + PLTR pending fills. China demand now unlocked = step-function revenue upside.
2. **Steeper curve / financials tailwind** — JPM (LT), performing well (+2.9% P/L).
3. **Geopolitical inflation hedge** — GLD (active) up +3.1% from entry. Hot CPI reinforces gold bull case. Iran deal NOT confirmed — XLE stop active.
4. **Crypto recovery** — BTC last known ~$80K (May 8). Below threshold for entry. Re-evaluate at $82K+ or $75K flush.
5. **Government AI (PLTR AIP)** — fiscally funded, not rate-sensitive. Q1 beat extraordinary.

## Pending Actions — OPERATOR MUST EXECUTE (PRIORITY)

Two approved orders attempted via API but FAILED (HTTP 403 blocked). Manual placement required via Alpaca paper trading web UI or authenticated terminal:

1. **PLTR** (score 7.17, ai-momentum-pullback, long-term): Limit bracket GTC.
   - Buy 36 shares, limit_price $135.51, stop_price $118.66, take_profit $167.20
   - Order class: bracket, time_in_force: gtc
   - If price has moved, recalculate: limit = ask × 1.005, stop = fill × 0.88, target = fill + 2×(fill - stop)

2. **AMD** (score 7.17, breakout-volume, active): Limit bracket GTC.
   - Buy 10 shares, limit_price $450.53, stop_price $425.88, take_profit $493.11
   - Order class: bracket, time_in_force: gtc
   - If price has moved, recalculate: limit = ask × 1.005, stop = fill × 0.95, target = fill + 2×(fill - stop)

3. **NVDA May 21 earnings:** No new entries after May 19. Daily Review May 19 should consider trim/hedge. Existing stop $175.60 well protected.

4. **AVGO:** Still unconfirmed via API. If NOT filled, verify account and re-enter bracket at ~$405 (current market): stop $356.40 (-12%), target $502.20 (+24%).

## Pending Deferrals (≥7 watchlist names not yet entered)
- **PLTR** (7.17) — API blocked; operator must place limit bracket GTC as specified above
- **AMD** (7.17) — API blocked; operator must place limit bracket GTC as specified above

## Lessons Learned (running log)
- **Week of 2026-04-27 (init):** No trades placed. First-run setup; benchmarking begins next week.
- **2026-05-01 — bias correction (operator-mandated):** Capital in cash earns nothing. Score ≥ 7 = enter at next routine. Only 3 valid skip exemptions per CLAUDE.md Deployment Bias.
- **2026-05-04 — remote-routine failure mode discovered:** Cron triggers produced zero commits/orders. Manual session broke the streak.
- **2026-05-05 — silent failure REPEATS:** Heartbeat infra not sufficient. Operator pre-queued brackets saved the day (NVDA, JPM filled). GLD naked stop discovered and fixed.
- **2026-05-06 — API blocked (new failure mode):** Routine ran late AND Alpaca API blocked. AMD, PLTR, BTC documented as attempts; none executed.
- **2026-05-08 — API blocked AGAIN (3rd consecutive):** AMD and PLTR MOO blocked at 12:19Z. HTTP 403 from Anthropic TLS proxy. Persistent infrastructure problem.
- **2026-05-08 to 2026-05-12 (weekend gap):** S&P 500 hit record 7,412.84 on May 11 while portfolio remained 80% cash. Gap cost: ~2.1-2.7 percentage points vs. benchmark.
- **2026-05-12 — CPI binary event note:** April CPI (+3.8% YoY actual, vs +3.7% expected) NOT an exempt binary event. MOO orders still blocked by API.
- **2026-05-12 — AMD setup change:** AMD entry thesis changed from `earnings-reaction-follow` to `breakout-volume` due to China chip deal catalyst. Scores 7.33.
- **2026-05-13 — PPI shock + Pre-Market silent failure:** April PPI +1.4% MoM (+6.0% YoY) vs +0.5% expected — massive upside surprise. SOX -3.0%, Qualcomm -11.5%, Intel -7.0%. Pre-Market routine SILENTLY FAILED (no heartbeat). Catch-up run from Market Open. Both PLTR and AMD re-scored at 7.17 (avg slightly lower due to hot PPI / chip sector headwind, but macro offset by Trump-Xi summit tomorrow). PLTR and AMD approved; both blocked by API.
- **2026-05-13 — TSM below entry price:** TSM now at ~$397.28 vs entry $401.47 — first time in negative P/L territory. Stop at $353.76 has $43.52/sh cushion. No stop action needed, but chip sector selloff bears watching.
- **NVDA earnings risk:** NVDA reports Q2 on May 21 (8 days). No new entries after May 19. Daily Review May 19 should consider pre-earnings hedge/trim strategy.

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
- **Mid-Morning (11:00 AM ET):** (1) Check if Trump-Xi summit pre-positioning is driving chip stock recovery. (2) Assess XLE — Iran comments from Trump = watch for gap toward stop ($56.15). (3) Monitor TSM — below entry; if SOX continues -3%+ consider watching for stop approach. (4) Operator to place PLTR + AMD orders manually if API still blocked.
- **Afternoon / Market Close (2:00-3:30 PM ET):** (1) Assess whether Trump-Xi summit news (Beijing arrival, preliminary statements) is moving chip stocks. (2) If chips rallying: AMD/PLTR fills more urgent. (3) If chips continuing lower: TSM stop ($353.76) becomes key watch.
- **Daily Review (4:30 PM ET):** (1) Confirm any fills from today. (2) Macro review: Trump-Xi summit day 1 coverage. (3) Consider NVDA pre-earnings hedge strategy (8 days to May 21). (4) Score BTC if above $82K. (5) Generate committed watchlist for May 14 (summit day 1 plays).

## Cash Reserve Floor
$10,000 (10%). Current cash $80,946 — $70,946 available to deploy before hitting floor. PLTR + AMD fills would consume ~$9,592, leaving ~$61,354+ available. Massive remaining deployment gap.
