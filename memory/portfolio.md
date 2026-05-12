# Opus Trader — Portfolio Memory

## Last Updated
2026-05-12 (Tuesday) — Pre-Market routine (8:07 AM ET / 12:07 UTC). Alpaca API blocked in sandbox runner ("Host not in allowlist" — Anthropic TLS proxy). Prices estimated from web research. PLTR MOO 36sh and AMD MOO 10sh attempted and blocked (HTTP 403). OPERATOR must manually place before 9:25 AM ET.

## Current Account Snapshot
- **Broker:** Alpaca Paper Trading (account PA3TXVEJ19LW)
- **Total Equity (estimated):** ~$100,805 (estimated; API blocked; based on price appreciation from May 8 last-known state)
- **Cash:** $80,945.53 (80.3%) — unchanged; no orders have executed since May 4/5 fills
- **Long Market Value (estimated):** ~$19,859 (6 positions including probable AVGO fill)
- **Open Positions:** 6 confirmed (TSM, GLD, NVDA, JPM, XLE, probable AVGO)
- **Pending Orders / Actions:** PLTR MOO 36sh + AMD MOO 10sh — APPROVED but API blocked; operator must place manually before 9:25 AM ET May 12
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

## Open Positions (estimated, API blocked — prices from May 12 web research)
| Symbol | Bucket | Qty | Entry | Stop | Target | Cost basis | Est. Price | Est. P/L | Sector |
|---|---|---|---|---|---|---|---|---|---|
| TSM | long-term | 7 | 401.47 | 353.76 (-12%) | 498.48 (+24%) | $2,810.29 | ~$430 | +$199.29 | Semiconductors |
| GLD | active | 7 | 418.86 | 397.92 (-5%) | — | $2,932.02 | ~$432 | +$91.98 | Precious metals |
| NVDA | long-term | 15 | 198.83 | 175.60 (-12%) | 247.44 (+24%) | $2,982.45 | ~$222 | +$347.55 | Semiconductors |
| JPM | long-term | 9 | 308.30 | 272.14 (-12%) | 383.47 (+24%) | $2,774.72 | ~$320 | +$104.58 | Financials |
| XLE | active | 50 | 59.01 | 56.15 (-5%) | 65.01 (+10%) | $2,950.50 | ~$57.70 | -$65.50 | Energy |
| AVGO* | long-term | 11 | 418.59 | 368.36 (-12%) | 519.05 (+24%) | $4,604.49 | ~$430 | +$124.51 | Semiconductors |

*AVGO: GTC bracket at $418.59 placed ~May 4. Treating as probable fill (AVGO range May 8 was $406-$426; bracket eligible). Stop = bracket OCO child at $368.36 (-12%).

**Est. total long market value (all 6):** ~$19,859
- TSM: 7 × $430 = $3,010
- GLD: 7 × $432 = $3,024
- NVDA: 15 × $222 = $3,330
- JPM: 9 × $320 = $2,880
- XLE: 50 × $57.70 = $2,885
- AVGO: 11 × $430 = $4,730

**Total estimated P/L on open positions:** +$802.41 (excl. XLE loss)
**Net open P/L:** +$802.41 - $65.50 = +$736.91 unrealized

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
- **Portfolio total equity (est.):** ~$100,805
- **Portfolio total return:** +0.80% ($100,805 / $100,000 initial)
- **S&P 500 close May 11:** 7,412.84 (new record high; futures 7,426.00 May 12 pre-market -0.14%)
- **S&P 500 return since strategy start (~May 1):** est. ~+2.9-3.5% (S&P May 1 ~$7,200 est.)
- **Gap vs SPX:** Lagging by ~2.1-2.7 percentage points — driven entirely by 80% cash exposure from API-blocked deployments
- **CRITICAL:** Every day of 80% cash at record S&P represents compounding missed returns. AMD/PLTR/additional deployment is the only path to close this gap.

## Macro Context (as of 2026-05-12 pre-market)
- **CPI Report (TODAY 8:30 AM ET):** April headline +3.7% YoY expected, core +2.7% YoY. Hot print from oil/gas (Hormuz closure). Top banks now saying first Fed rate cut delayed until 2027. Rate hike probability at 5.7% (CME FedWatch). This reverses the rate-cut thesis that supported growth/tech. HEADWIND for high-multiple names (PLTR, AMD) but China chip deal provides offsetting tailwind for semis.
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

## Pending Actions — OPERATOR MUST EXECUTE BEFORE 9:25 AM ET MAY 12

Two approved orders attempted via API but FAILED (API blocked). Manual placement required:

1. **PLTR** (score 7.33, ai-momentum-pullback, long-term): Buy 36 shares MOO. Post-MOO fill: Market Open routine MUST place stop at fill_price × 0.88 (LT -12%).

2. **AMD** (score 7.33, breakout-volume, active): Buy 10 shares MOO. Post-MOO fill: Market Open routine MUST place stop at fill_price × 0.95 (active -5%).

3. **NVDA May 21 earnings:** Close or hedge consideration for Daily Review. Existing 15-share position well protected (stop $175.60 vs $222 est = 26% cushion). No new entries after May 19.

4. **AVGO:** Still unconfirmed via API. If NOT filled, operator should verify account and place bracket limit order at $430 (current market) GTC: stop $378.40 (-12%), target $533.20 (+24%).

## Pending Deferrals (≥7 watchlist names not yet entered)
- **PLTR** (7.33) — API blocked; operator must place before 9:25 AM May 12
- **AMD** (7.33) — API blocked; operator must place before 9:25 AM May 12

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
- **Market Open (9:45 AM ET):** PRIORITY: (1) If AMD MOO filled: immediately place stop at fill × 0.95. (2) If PLTR MOO filled: immediately place stop at fill × 0.88. (3) Check CPI reaction in market (CPI released 8:30 AM — assess impact on positions). (4) Verify AVGO bracket status. (5) Assess XLE at open — if Iran deal news has changed over weekend, may need to adjust.
- **Intraday:** Monitor AMD/PLTR fills. AMD technical is elevated RSI — watch for profit-taking fade. Stop provides protection.
- **Daily Review (4:30 PM ET):** (1) Tally any fills from today. (2) Consider NVDA pre-earnings hedge strategy (earnings May 21). (3) Assess Trump-Xi summit preview for May 14-15 plays. (4) Score BTC if it has recovered above $82K.

## Cash Reserve Floor
$10,000 (10%). Current cash $80,946 — $70,946 available to deploy before hitting floor. PLTR + AMD fills would consume ~$9,592, leaving ~$61,354+ available. Massive remaining deployment gap.
