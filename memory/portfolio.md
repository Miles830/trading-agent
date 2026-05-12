# Opus Trader — Portfolio Memory

## Last Updated
2026-05-12 (Tuesday) — Mid-Morning routine (11:07 AM ET / 15:07 UTC). Alpaca API still blocked (HTTP 403). Market-Open routine silently failed. April CPI +3.8% YoY (hotter than expected) → S&P -0.7%, Nasdaq -1.2%. PLTR re-scored 7.17, limit bracket attempted — API blocked again. AMD re-scored 6.83 (below threshold due to failed ATH + CPI selloff). Prices from web research.

## Current Account Snapshot
- **Broker:** Alpaca Paper Trading (account PA3TXVEJ19LW)
- **Total Equity (estimated):** ~$100,377 (CPI selloff reduced position values; S&P -0.7%, Nasdaq -1.2%)
- **Cash:** $80,945.53 (80.6%) — unchanged; no orders have executed since May 4/5 fills
- **Long Market Value (estimated):** ~$19,431 (6 positions; CPI selloff hit TSM and JPM hardest)
- **Open Positions:** 6 confirmed (TSM, GLD, NVDA, JPM, XLE, AVGO)
- **Pending Orders / Actions:** PLTR GTC bracket limit 36sh at $136.04 — APPROVED (7.17), API blocked. OPERATOR must place at Alpaca when API restored.
- **API Status:** BLOCKED — "Host not in allowlist" (HTTP 403, Anthropic sandbox TLS proxy). Persistent failure since May 6. 6th consecutive routine blocked.
- **Daytrade Count:** 0

## Bucket State
| Bucket | Target | Current $ (est.) | Current % | Positions |
|---|---|---|---|---|
| Long-term | 55% ($55K) | ~$13,970 (excl AVGO) or ~$18,700 (incl AVGO) | 13.9% or 18.6% | 4 (TSM, NVDA, JPM + probable AVGO) |
| Active Trading | 30% ($30K) | ~$5,885 | 5.8% | 2 (GLD, XLE) |
| Crypto | 5% ($5K) | $0 | 0% | 0 |
| Cash Reserve | 10% ($10K floor) | ~$80,946 | 80.3% | — |

**Deployment gap:** Cash ~$70.9K above the 10% floor represents massive underfillment vs. bucket targets. PLTR and AMD are the immediate deployments blocked by API.

## Open Positions (estimated, API blocked — prices from May 12 mid-morning web research ~11:07 AM ET)
| Symbol | Bucket | Qty | Entry | Stop | Target | Cost basis | Est. Price | Est. P/L | Sector |
|---|---|---|---|---|---|---|---|---|---|
| TSM | long-term | 7 | 401.47 | 353.76 (-12%) | 498.48 (+24%) | $2,810.29 | ~$404.54 | +$21.49 (+0.8%) | Semiconductors |
| GLD | active | 7 | 418.86 | 397.92 (-5%) | — | $2,932.02 | ~$430.25 | +$79.73 (+2.7%) | Precious metals |
| NVDA | long-term | 15 | 198.83 | 175.60 (-12%) | 247.44 (+24%) | $2,982.45 | ~$220.00 | +$317.55 (+10.6%) | Semiconductors |
| JPM | long-term | 9 | 308.30 | 272.14 (-12%) | 383.47 (+24%) | $2,774.72 | ~$300.00 | -$74.70 (-2.7%) | Financials |
| XLE | active | 50 | 59.01 | 56.15 (-5%) | 65.01 (+10%) | $2,950.50 | ~$57.50 | -$75.50 (-2.6%) | Energy |
| AVGO | long-term | 11 | 418.59 | 368.36 (-12%) | 519.05 (+24%) | $4,604.49 | ~$428.43 | +$108.24 (+2.4%) | Semiconductors |

**Est. total long market value (all 6):** ~$19,431
- TSM: 7 × $404.54 = $2,831.78
- GLD: 7 × $430.25 = $3,011.75
- NVDA: 15 × $220.00 = $3,300.00
- JPM: 9 × $300.00 = $2,700.00
- XLE: 50 × $57.50 = $2,875.00
- AVGO: 11 × $428.43 = $4,712.73

**Net open P/L (unrealized):** +$376.81 (down from +$736.91 pre-market — CPI selloff compressed TSM and JPM)

**Note on JPM:** JPM fell to $300 (from $320 pre-market estimate) on hot CPI — rate hike fear hurts bank valuations near-term. Stop at $272.14 is 9.3% below $300. No stop risk; hold.
**Note on TSM:** TSM fell to $404.54 from $430 pre-market estimate. Still above entry $401.47. China chip deal remains a long-term positive. Hold.

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
- **Portfolio total equity (est.):** ~$100,377
- **Portfolio total return:** +0.38% ($100,377 / $100,000 initial)
- **S&P 500 May 12 mid-morning:** ~7,361 (down -0.7% from 7,412.84 close on hot CPI print)
- **S&P 500 return since strategy start (~May 1):** est. ~+2.2% (adjusted for today's -0.7%)
- **Gap vs SPX:** Lagging by ~1.84 pp (improved from -2.15 in pre-market — 80% cash cushioned today's CPI selloff)
- **Silver lining:** Being 80% cash during a -0.7% market day reduced our benchmark gap by ~0.3 pp. This is the only day the cash-heavy position has been an advantage.
- **CRITICAL:** Every day of 80% cash at record S&P represents compounding missed returns. AMD/PLTR/additional deployment is the only path to close this gap.

## Macro Context (as of 2026-05-12 mid-morning 11:07 AM ET)
- **CPI Report (RELEASED 8:30 AM ET — ACTUAL):** April headline +3.8% YoY (hotter than +3.7% expected). Core +2.8% YoY (hotter than +2.7%). Energy +3.8% MoM, gasoline +28.4% YoY. Market reaction: S&P -0.7%, Nasdaq -1.2%. Rate hike probability rose to ~30% by year-end. Fed cut deferred to 2027. This is a material headwind for high-multiple names but GOLD and ENERGY benefiting from energy-driven inflation.
- **China chip deal (announced ~week of May 8-12):** NVDA + AMD agreed to 15% U.S. revenue share on China AI chip sales (H20 + MI308 approved for China). AMD $500M-800M 2026 revenue upside. NVDA $7-12.5B upside. Explains AMD's $413→$477 rally since May 8. AVGO also named.
- **Trump-Xi Beijing summit (May 14-15):** Covers trade, AI chips, Taiwan, Iran. Semiconductor export controls are key agenda item. Potentially additional positive catalyst for chip stocks.
- **Iran deal:** Still unconfirmed. Senior Iranian official (Mohsen Rezaei) rebuffed U.S. proposal, demanding reparations. Oil still $100-126/bbl (Brent). XLE thesis intact — hold with stop at $56.15.
- **S&P 500:** Record 7,412.84 on May 11. AI capex cycle intact. Risk-on despite CPI caution.
- **NVDA Earnings:** May 21 (9 days). NVDA Q2 2026 earnings. Risk flag for existing NVDA position. Do NOT enter new NVDA positions after May 19 (within 48h). Existing position stop $175.60 provides protection.

## Active Themes
1. **AI broadening / China chip deal** — TSM + NVDA + probable AVGO in LT bucket. AMD + PLTR pending fills. China demand now unlocked = step-function revenue upside.
2. **Steeper curve / financials tailwind** — JPM (LT), performing well (+2.9% P/L).
3. **Geopolitical inflation hedge** — GLD (active) up +3.1% from entry. Hot CPI reinforces gold bull case. Iran deal NOT confirmed — XLE stop active.
4. **Crypto recovery** — BTC last known ~$80K (May 8). Below threshold for entry. Re-evaluate at $82K+ or $75K flush.
5. **Government AI (PLTR AIP)** — fiscally funded, not rate-sensitive. Q1 beat extraordinary.

## Pending Actions — OPERATOR MUST EXECUTE

Three action items for Operator (API blocked in sandbox runner):

1. **PLTR** (score 7.17 mid-morning re-score, ai-momentum-pullback, long-term): Place GTC bracket limit order: limit_price=$136.04, qty=36, stop_loss.stop_price=$119.71, take_profit.limit_price=$167.83. `time_in_force: gtc`, `order_class: bracket`.

2. **NVDA trailing stop:** Update existing GTC stop from $175.60 → $193.60 (trail to $220 × 0.88). Locks in +$18 per share additional gain protection. Earnings May 21 — consider closing or reducing before May 19.

3. **GLD trailing stop:** Update existing GTC stop from $397.92 → $408.74 (trail to $430.25 × 0.95). Hot CPI confirms gold bull thesis; lock in more of the gain.

**AMD: DO NOT ENTER today.** Re-scored 6.83 (below 7.0 threshold) due to CPI-triggered technical breakdown (-3.5% intraday, failed ATH at $458.80). Wait for consolidation at $445-450 or Trump-Xi summit catalyst (May 14-15) before re-scoring.

## Pending Deferrals (≥7 watchlist names not yet entered)
- **PLTR** (7.17 mid-morning re-score) — API blocked; operator must place GTC bracket limit at $136.04 (stop $119.71, target $167.83, qty 36)

## Lessons Learned (running log)
- **Week of 2026-04-27 (init):** No trades placed. First-run setup; benchmarking begins next week.
- **2026-05-01 — bias correction (operator-mandated):** Capital in cash earns nothing. Score ≥ 7 = enter at next routine. Only 3 valid skip exemptions per CLAUDE.md Deployment Bias.
- **2026-05-04 — remote-routine failure mode discovered:** Cron triggers produced zero commits/orders. Manual session broke the streak.
- **2026-05-05 — silent failure REPEATS:** Heartbeat infra not sufficient. Operator pre-queued brackets saved the day (NVDA, JPM filled). GLD naked stop discovered and fixed.
- **2026-05-06 — API blocked (new failure mode):** Routine ran late AND Alpaca API blocked. AMD, PLTR, BTC documented as attempts; none executed.
- **2026-05-08 — API blocked AGAIN (3rd consecutive):** AMD and PLTR MOO blocked at 12:19Z. HTTP 403 from Anthropic TLS proxy. Persistent infrastructure problem.
- **2026-05-08 to 2026-05-12 (weekend gap):** S&P 500 hit record 7,412.84 on May 11 while portfolio remained 80% cash. Gap cost: ~2.1-2.7 percentage points vs. benchmark. This is the direct cost of the API blockage.
- **2026-05-12 — Market Open silently failed:** No heartbeat from Market Open routine (9:45 AM ET). Mid-Morning ran catch-up. Pre-Market MOO orders were already API-blocked so no stop-placement gap.
- **2026-05-12 — CPI came in hotter (+3.8% vs +3.7% exp):** April CPI +3.8% YoY, Core +2.8%. Nasdaq -1.2%, S&P -0.7%. AMD failed its ATH attempt at $458.80 and reversed. Re-scored 6.83 (below threshold). Gold SURGED (CPI confirms inflation hedge). Energy sector (+XLE) also UP from energy-driven CPI.
- **2026-05-12 — AMD re-score lesson:** A pre-market score at one price does not bind at a materially different mid-session setup. AMD was approved at $466 pre-CPI; post-CPI the technical setup broke down (ATH failed, -3.5% intraday) reducing technical score to 4. Re-score correctly rejected entry. The China deal thesis remains intact; setup may re-qualify.
- **NVDA earnings risk:** NVDA reports Q2 on May 21. Well-covered by stop at $175.60 (-21% from $220 current). Trail stop to $193.60 recommended. No new entries after May 19.

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
- **Midday (12:30 PM ET):** (1) Check XLE intraday — energy-driven CPI may push XLE above $58 (watch for trailing stop opportunity). (2) Re-check TSM and JPM — both hit by rate hike fear, may stabilize. (3) Monitor GLD for stop-trail opportunity. (4) Check AMD — if it stabilizes above $450, may warrant a re-score before Daily Review. (5) Trump-Xi summit is May 14-15 — any pre-summit semiconductor news could re-catalyze AMD/NVDA.
- **Afternoon (2:00 PM ET):** Monitor open positions for reversal patterns. If S&P finds support, TSM/JPM may recover. AMD consolidation watch.
- **Market Close (3:30 PM ET):** Consider MOC orders for any strong close setups. AMD watch — if it reclaims $455+ on volume, re-score for tomorrow.
- **Daily Review (4:30 PM ET):** (1) Tally any fills from today (expect none due to API block). (2) Score AMD fresh at closing price for tomorrow's Pre-Market. (3) NVDA pre-earnings hedge strategy (earnings May 21 = 9 days). (4) Score BTC if recovered above $82K. (5) Pre-Trump-Xi summit plays (May 14-15) — NVDA, AMD, TSM, AVGO potential catalyst plays. (6) Final watchlist commitment for May 13.

## Cash Reserve Floor
$10,000 (10%). Current cash $80,946 — $70,946 available to deploy before hitting floor. PLTR + AMD fills would consume ~$9,592, leaving ~$61,354+ available. Massive remaining deployment gap.
