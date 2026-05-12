# Opus Trader — Portfolio Memory

## Last Updated
2026-05-12 (Tuesday) — Midday routine (12:30 PM ET / 16:33 UTC). Alpaca API still blocked (HTTP 403 / host_not_allowed — 6th consecutive blocked session since May 6). Prices estimated from midday web research. Market Open + Mid-Morning routines both missed (silent failures logged as violations). PLTR + AMD GTC bracket limit orders attempted at Midday catch-up — HTTP 403 again. Midday prices: TSM $404.54, GLD $434.65, NVDA $221.50, JPM $299.60, XLE $57.60, AVGO $428.43.

## Current Account Snapshot
- **Broker:** Alpaca Paper Trading (account PA3TXVEJ19LW)
- **Total Equity (estimated):** ~$100,431 (estimated; API blocked; midday prices from web research)
- **Cash:** $80,945.53 (80.6%) — unchanged; no orders have executed since May 4/5 fills
- **Long Market Value (estimated):** ~$19,486 (6 positions — all below pre-market estimates due to hot CPI selloff)
- **Open Positions:** 6 confirmed (TSM, GLD, NVDA, JPM, XLE, probable AVGO)
- **Pending Orders / Actions:** PLTR GTC bracket limit $135.55 + AMD GTC bracket limit $467.13 — APPROVED but API blocked; operator must place manually. Market Open + Mid-Morning both missed (violations logged).
- **API Status:** BLOCKED — "Host not in allowlist" (HTTP 403). 6th consecutive blocked session since May 6. All routine order attempts blocked.
- **Daytrade Count:** 0
- **Daily P&L (est.):** -$373 (-0.37%) — hot CPI hit TSM (-$178), JPM (-$184) hardest; GLD +$19 (inflation bid)

## Bucket State
| Bucket | Target | Current $ (est.) | Current % | Positions |
|---|---|---|---|---|
| Long-term | 55% ($55K) | ~$13,970 (excl AVGO) or ~$18,700 (incl AVGO) | 13.9% or 18.6% | 4 (TSM, NVDA, JPM + probable AVGO) |
| Active Trading | 30% ($30K) | ~$5,885 | 5.8% | 2 (GLD, XLE) |
| Crypto | 5% ($5K) | $0 | 0% | 0 |
| Cash Reserve | 10% ($10K floor) | ~$80,946 | 80.3% | — |

**Deployment gap:** Cash ~$70.9K above the 10% floor represents massive underfillment vs. bucket targets. PLTR and AMD are the immediate deployments blocked by API.

## Open Positions (estimated, API blocked — prices from May 12 midday web research)
| Symbol | Bucket | Qty | Entry | Stop | Target | Cost basis | Midday Price | Midday P/L | Sector |
|---|---|---|---|---|---|---|---|---|---|
| TSM | long-term | 7 | 401.47 | 353.76 (-12%) | 498.48 (+24%) | $2,810.29 | ~$404.54 | +$21.49 | Semiconductors |
| GLD | active | 7 | 418.86 | 397.92 (-5%) | — | $2,932.02 | ~$434.65 | +$110.53 | Precious metals |
| NVDA | long-term | 15 | 198.83 | 175.60 (-12%) | 247.44 (+24%) | $2,982.45 | ~$221.50 | +$340.05 | Semiconductors |
| JPM | long-term | 9 | 308.30 | 272.14 (-12%) | 383.47 (+24%) | $2,774.72 | ~$299.60 | -$78.30 | Financials |
| XLE | active | 50 | 59.01 | 56.15 (-5%) | 65.01 (+10%) | $2,950.50 | ~$57.60 | -$70.50 | Energy |
| AVGO* | long-term | 11 | 418.59 | 368.36 (-12%) | 519.05 (+24%) | $4,604.49 | ~$428.43 | +$108.24 | Semiconductors |

*AVGO: GTC bracket at $418.59 placed ~May 4. Treating as probable fill (AVGO range May 8 was $406-$426; bracket eligible). Stop = bracket OCO child at $368.36 (-12%).

**Est. total long market value (all 6):** ~$19,486
- TSM: 7 × $404.54 = $2,831.78
- GLD: 7 × $434.65 = $3,042.55
- NVDA: 15 × $221.50 = $3,322.50
- JPM: 9 × $299.60 = $2,696.40
- XLE: 50 × $57.60 = $2,880.00
- AVGO: 11 × $428.43 = $4,712.73

**Total estimated unrealized P/L:** +$431.49
- Winners: GLD +$110.53, NVDA +$340.05, AVGO +$108.24, TSM +$21.49
- Losers: JPM -$78.30, XLE -$70.50

**Hot CPI impact today:** TSM down $25/sh, JPM down $20/sh — highest single-day drags. GLD up $2.65/sh (inflation bid).

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
- **Portfolio total equity (est.):** ~$100,431 (midday May 12)
- **Portfolio total return:** +0.43% ($100,431 / $100,000 initial)
- **S&P 500 midday May 12:** ~7,385 (-0.37% from record 7,412.84)
- **S&P 500 return since strategy start (~May 1):** est. ~+2.57% (S&P May 1 ~$7,200 est.)
- **Gap vs SPX:** Lagging by ~2.14 percentage points — driven entirely by ~81% cash exposure from API-blocked deployments
- **CRITICAL:** Every day of 81% cash costs compounding benchmark returns. Hot CPI slightly narrowed the gap today (growth stocks sold off), but the gap remains structural.

## Macro Context (as of 2026-05-12 midday)
- **CPI Result (8:30 AM ET today):** April +3.8% YoY / +0.6% MoM — HOTTER than expected (+3.7%/+0.2%). Core +2.8% YoY. Fed higher-for-longer fully confirmed; no rate cuts until 2027. Rate hike probability ~6%. S&P fell -0.37%, Nasdaq -0.65%.
- **China chip deal:** NVDA + AMD + AVGO revenue-share deal intact. AMD MI308 + NVDA H20 approved for China. AMD $500M-800M 2026 revenue upside; NVDA $7-12.5B. AMD at $464.81 midday (near pre-market levels despite CPI headwind — chip deal thesis holding).
- **Trump-Xi Beijing summit (May 14-15):** 2 days away. AI chip export controls, trade, Taiwan, Iran on agenda. Semiconductor sector may benefit from additional positive catalysts.
- **Iran deal:** Still unconfirmed. XLE at $57.60, stop $56.15 (2.5% cushion). Oil $100-126/bbl (Brent). Hold with stop.
- **S&P 500:** ~7,385 midday (-0.37% from record 7,412.84). Risk-off after hot CPI.
- **NVDA Earnings:** CORRECTED — May 20, 2026 (not May 21 as previously stated). 8 days away. 48h exclusion window opens May 18. Pre-earnings strategy decision needed by May 18 Daily Review.

## Active Themes
1. **AI broadening / China chip deal** — TSM + NVDA + probable AVGO in LT bucket. AMD + PLTR pending fills. China demand now unlocked = step-function revenue upside.
2. **Steeper curve / financials tailwind** — JPM (LT), performing well (+2.9% P/L).
3. **Geopolitical inflation hedge** — GLD (active) up +3.1% from entry. Hot CPI reinforces gold bull case. Iran deal NOT confirmed — XLE stop active.
4. **Crypto recovery** — BTC last known ~$80K (May 8). Below threshold for entry. Re-evaluate at $82K+ or $75K flush.
5. **Government AI (PLTR AIP)** — fiscally funded, not rate-sensitive. Q1 beat extraordinary.

## Pending Actions — OPERATOR MUST EXECUTE

MOO window closed (market open was 9:30 AM ET). New orders should be GTC bracket limit orders.

1. **PLTR** (score 7.33, ai-momentum-pullback, long-term): BUY 36 shares via GTC bracket limit at $135.55. Stop $119.28 (-12%), target $168.08 (+24%). API blocked — operator must place via Alpaca web UI.

2. **AMD** (score 7.33, breakout-volume, active): BUY 10 shares via GTC bracket limit at $467.13. Stop $443.77 (-5%), target $513.85 (2:1). API blocked — operator must place via Alpaca web UI.

3. **GLD stop trail (intended):** Raise stop $397.92 → $412.92 (GTC sell stop on 7 shares). API blocked — operator should update.

4. **NVDA stop trail (intended):** Raise stop $175.60 → $190.00 (conservative trail ahead of May 20 earnings). API blocked — operator should update.

5. **NVDA May 20 earnings (CORRECTED date):** Pre-earnings strategy decision needed at May 18 Daily Review. 48h exclusion window opens May 18. No new NVDA entries after May 18.

6. **AVGO:** Still unconfirmed via API. If NOT filled at $418.59 bracket, operator should place at current market ~$428. Stop $376.64 (-12%), target $530.72 (+24%).

## Pending Deferrals (≥7 watchlist names not yet entered)
- **PLTR** (7.33) — API blocked (6 attempts since May 6). Midday catch-up GTC bracket limit $135.55 attempted and failed. Operator must place GTC bracket via Alpaca web UI: buy 36sh limit $135.55, stop $119.28 (-12%), target $168.08 (+24%).
- **AMD** (7.33) — API blocked (6 attempts since May 6). Midday catch-up GTC bracket limit $467.13 attempted and failed. Operator must place GTC bracket via Alpaca web UI: buy 10sh limit $467.13, stop $443.77 (-5%), target $513.85 (2:1).

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
- **2026-05-12 Midday — Hot CPI actual:** April +3.8% YoY / +0.6% MoM (hotter than +3.7% est.). Core +2.8%. Market S&P -0.37%, Nasdaq -0.65%. JPM and TSM hardest hit (-$184, -$178 on portfolio). GLD +$19 (inflation bid). Daily loss -$373 / -0.37% — well under 3% circuit breaker.
- **2026-05-12 Midday — 2 violations:** Market Open + Mid-Morning both missed. Catch-up entries for PLTR and AMD attempted midday (2/2 API blocked HTTP 403 — 6th consecutive failure since May 6).
- **NVDA earnings risk:** NVDA reports Q2 on May 20 (CORRECTED — not May 21). Well-covered by stop at $175.60. Intended trail to $190 (API blocked). Pre-earnings review at May 18 Daily Review — decision to hold vs. close.

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
- **Afternoon (2:00 PM ET):** (1) Stop-loss audit. (2) Monitor XLE — only $1.45/sh cushion above stop. (3) Watch for Trump-Xi summit pre-positioning in semis. (4) Assess whether to close any position before Trump-Xi binary event. (5) Re-score BTC if above $82K.
- **Market Close (3:30 PM ET):** (1) Confirm all 6 positions held overnight. (2) Any MOC closes? (XLE if stop cushion deteriorates further). (3) Queue pre-summit semiconductor trade if evidence warrants.
- **Daily Review (4:30 PM ET):** (1) NVDA pre-earnings strategy (earnings May 20 — corrected). (2) Assess Trump-Xi summit plays (May 14-15). (3) Setup performance tally. (4) Score BTC. (5) Produce Wednesday watchlist commitment.
- **Weekly Review (Friday May 15):** Cover full week performance, Trump-Xi summit outcome, NVDA earnings countdown, strategy evolution note.

## Cash Reserve Floor
$10,000 (10%). Current cash $80,946 — $70,946 available to deploy before hitting floor. PLTR + AMD fills would consume ~$9,592, leaving ~$61,354+ available. Massive remaining deployment gap.
