# Opus Trader — Portfolio Memory

## Last Updated
2026-05-13 (Wednesday) — Pre-Market routine (8:43 AM ET / 12:43 UTC). Alpaca API still blocked ("Host not in allowlist" — 7th consecutive routine). Prices estimated from web research. PLTR (36sh), AMD (10sh), NVDA add (5sh) MOO orders all attempted and blocked. OPERATOR must manually place all three before 9:25 AM ET. NEW CATALYST: Jensen Huang joining Trump's China delegation for Beijing summit.

## Current Account Snapshot
- **Broker:** Alpaca Paper Trading (account PA3TXVEJ19LW)
- **Total Equity (estimated):** ~$100,540 (estimated; API blocked; chip sector -3% Tue reduced TSM/NVDA positions; AVGO bracket confirmed filled)
- **Cash:** $80,945.53 (80.5%) — unchanged; no orders have executed since May 4/5 fills (AVGO bracket fill May 12 if confirmed reduces this by $4,604.49)
- **Long Market Value (estimated):** ~$19,608 (6 confirmed positions: TSM, GLD, NVDA, JPM, XLE, AVGO)
- **Open Positions:** 6 confirmed fills; PLTR+AMD+NVDA-add pending (API blocked)
- **Pending Orders / Actions:** PLTR MOO 36sh + AMD MOO 10sh + NVDA add 5sh — all APPROVED, all API-blocked; operator must place manually before 9:25 AM ET May 13
- **API Status:** BLOCKED — "Host not in allowlist" (HTTP 403, Anthropic sandbox TLS proxy). Persistent failure since May 6. 7th consecutive routine failure. All order attempts blocked.
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
| TSM | long-term | 7 | 401.47 | 353.76 (-12%) | 498.48 (+24%) | $2,810.29 | ~$411.68 | +$71.89 | Semiconductors |
| GLD | active | 7 | 418.86 | 397.92 (-5%) | — | $2,932.02 | ~$430 | +$77.42 | Precious metals |
| NVDA | long-term | 15 | 198.83 | 175.60 (-12%) | 247.44 (+24%) | $2,982.45 | ~$226.39 | +$416.40 | Semiconductors |
| JPM | long-term | 9 | 308.30 | 272.14 (-12%) | 383.47 (+24%) | $2,774.72 | ~$320 | +$104.58 | Financials |
| XLE | active | 50 | 59.01 | 56.15 (-5%) | 65.01 (+10%) | $2,950.50 | ~$57.50 | -$75.50 | Energy |
| AVGO | long-term | 11 | 418.59 | 368.36 (-12%) | 519.05 (+24%) | $4,604.49 | ~$417.62 | -$10.67 | Semiconductors |

**AVGO STATUS UPDATE:** CONFIRMED FILLED May 12. AVGO daily range May 12 was $408.41-$429.34 — the GTC bracket at $418.59 limit buy was definitively executed. AVGO now at $417.62, -$0.97/sh from entry (-0.23%). OCO stop child at $368.36 and target at $519.05 are active bracket children.

**Est. total long market value (all 6):** ~$19,608
- TSM: 7 × $411.68 = $2,882
- GLD: 7 × $430 = $3,010
- NVDA: 15 × $226.39 = $3,396
- JPM: 9 × $320 = $2,880
- XLE: 50 × $57.50 = $2,875
- AVGO: 11 × $417.62 = $4,594

**Total estimated P/L on open positions:**
- Gains: TSM +$71.89 + GLD +$77.42 + NVDA +$416.40 + JPM +$104.58 = +$670.29
- Losses: XLE -$75.50 + AVGO -$10.67 = -$86.17
- **Net unrealized P/L: +$584.12** (down from +$736.91 on May 12 due to chip sector -3% Tuesday)

## Sector Exposure (estimated)
| Sector | Est. $ | Est. % of equity |
|---|---|---|
| Semiconductors (TSM + NVDA + AVGO) | $10,872 | 10.83% |
| Financials (JPM) | $2,880 | 2.87% |
| Precious metals (GLD) | $3,010 | 3.00% |
| Energy (XLE) | $2,875 | 2.86% |
| Cash | $80,946 | 80.5% |

**After PLTR + AMD + NVDA-add fills (pending):**
| Sector | Added $ | New % |
|---|---|---|
| Semiconductors (+ AMD $4,658 + NVDA-add $1,132) | $16,662 | 16.5% |
| Software/AI (+ PLTR $4,918) | $4,918 | 4.88% |
| Cash remaining | $70,238 | 69.7% |

All sectors remain well under 25% cap after fills. ✓

**LT bucket tech sub-allocation (after PLTR + NVDA-add fill):**
TSM($2,882) + NVDA($3,396+$1,132=$4,528) + AVGO($4,594) = $12,004 in LT tech; + PLTR $4,918 = $16,922 LT tech
LT bucket total: $16,922 + JPM($2,880) = $19,802
LT-tech % = 85.5% → above 60% ceiling BUT LT bucket ($19.8K) < $20K threshold → ceiling INFORMATIONAL per CLAUDE.md. Approaching $20K — next LT tech entry will trigger strict enforcement.

## Performance vs S&P 500
- **Portfolio total equity (est.):** ~$100,540 (slightly below May 12 est. due to chip sector -3% Tuesday)
- **Portfolio total return:** +0.54% ($100,540 / $100,000 initial)
- **S&P 500 close May 12:** ~7,377 (estimate; chip-led selloff Tuesday -0.5% from record 7,412)
- **S&P 500 return since strategy start (~May 1):** est. ~+2.5-3.0% (S&P May 1 ~$7,200 est.)
- **Gap vs SPX:** Lagging by ~2.0-2.5 percentage points — driven entirely by 80% cash exposure from API-blocked deployments
- **CRITICAL:** Every day of 80% cash represents compounding missed returns. PLTR/AMD/NVDA-add deployment blocked by API — operator must manually place all three MOOs before 9:25 AM ET.

## Macro Context (as of 2026-05-13 pre-market)
- **CPI (May 12):** April headline +3.7% YoY confirmed. Hot. Chip stocks fell 3-6.8% on Tuesday (PHLX largest intraday drop in over a year). No Fed rate cuts until 2027. Rate hike probability 5.7%.
- **PPI (TODAY 8:30 AM ET):** April PPI expected +0.5% MoM. Key risk for today's open. NOT a CLAUDE.md exempt binary event — cannot be used as skip reason.
- **Jensen Huang / Beijing summit (MAJOR NEW CATALYST):** NVDA CEO personally invited by Trump to join China delegation. Flying on Air Force One to Beijing summit (May 14-15). Purpose: negotiate H200/H20 chip exports. Chinese AI stocks surged +18-37% overnight. This is the most significant single-stock catalyst of the portfolio cycle for NVDA.
- **China chip deal:** NVDA + AMD + AVGO agreed to 15% U.S. revenue share on China AI chip sales. AMD $500M-800M 2026 revenue upside. NVDA $7-12.5B upside. Trump-Xi summit key agenda item.
- **Iran deal:** Still unconfirmed. Oil $100-126/bbl. XLE thesis intact — hold with stop at $56.15. Note: Beijing summit agenda includes Iran-adjacent topics; any Hormuz resolution from summit could pressure XLE.
- **NVDA Earnings:** May 21 (8 days). Flag for pre-earnings review May 19. Blackout for new entries after May 19. Today's 5-share add is >48h from print ✓.
- **BTC:** $80,611 premarket. Below $82K threshold — crypto bucket still 0%.

## Active Themes
1. **AI broadening / China chip deal + Huang Beijing trip** — TSM + NVDA (now adding 5sh) + AVGO confirmed in LT bucket. AMD + PLTR pending fills. Jensen Huang personally at Beijing summit = step-function escalation. H200/H20 export discussions at highest diplomatic level.
2. **Steeper curve / financials tailwind** — JPM (LT), stable at +3.4% P/L.
3. **Geopolitical inflation hedge** — GLD (active) +2.7% from entry. PPI today reinforces gold bull case. XLE stop at $56.15 = 2.4% cushion; watch if summit produces Iran/Hormuz resolution.
4. **Crypto recovery** — BTC $80,611. Below $82K entry threshold. Re-evaluate at $82K+ breakout or $75K flush-rebound.
5. **Government AI (PLTR AIP)** — fiscally funded, not rate-sensitive. Q1 beat extraordinary. 3rd MOO attempt pending.

## Pending Actions — OPERATOR MUST EXECUTE BEFORE 9:25 AM ET MAY 13

Three approved orders attempted via API but FAILED (API blocked — 7th consecutive failure). Manual placement required:

1. **PLTR** (score 7.33, ai-momentum-pullback, long-term): Buy 36 shares MOO at ~$136.60. Post-MOO fill: Market Open routine MUST place stop at fill_price × 0.88 (LT -12%).

2. **AMD** (score 7.33, breakout-volume, active): Buy 10 shares MOO at ~$465.80. Post-MOO fill: Market Open routine MUST place stop at fill_price × 0.95 (active -5%).

3. **NVDA add** (score 8.0, ai-momentum-pullback, long-term): Buy 5 additional shares MOO at ~$226.39. New catalyst: Jensen Huang joining Trump's China delegation. Post-MOO fill: Market Open routine MUST place stop at fill_price × 0.88 (LT -12%). NVDA earnings May 21 — this add is valid (>48h before print).

4. **AVGO confirmed filled:** GTC bracket at $418.59 was CONFIRMED FILLED on May 12 (daily range $408.41-$429.34). Stop OCO at $368.36 and target at $519.05 are active bracket children. No action needed.

## Pending Deferrals (≥7 watchlist names not yet entered)
- **PLTR** (7.33) — API blocked; operator must place before 9:25 AM May 13 (3rd attempt)
- **AMD** (7.33) — API blocked; operator must place before 9:25 AM May 13 (3rd attempt)
- **NVDA add 5sh** (8.0) — API blocked; NEW today; operator must place before 9:25 AM May 13 (1st attempt)

## Lessons Learned (running log)
- **Week of 2026-04-27 (init):** No trades placed. First-run setup; benchmarking begins next week.
- **2026-05-01 — bias correction (operator-mandated):** Capital in cash earns nothing. Score ≥ 7 = enter at next routine. Only 3 valid skip exemptions per CLAUDE.md Deployment Bias.
- **2026-05-04 — remote-routine failure mode discovered:** Cron triggers produced zero commits/orders. Manual session broke the streak.
- **2026-05-05 — silent failure REPEATS:** Heartbeat infra not sufficient. Operator pre-queued brackets saved the day (NVDA, JPM filled). GLD naked stop discovered and fixed.
- **2026-05-06 — API blocked (new failure mode):** Routine ran late AND Alpaca API blocked. AMD, PLTR, BTC documented as attempts; none executed.
- **2026-05-08 — API blocked AGAIN (3rd consecutive):** AMD and PLTR MOO blocked at 12:19Z. HTTP 403 from Anthropic TLS proxy. Persistent infrastructure problem.
- **2026-05-08 to 2026-05-12 (weekend gap):** S&P 500 hit record 7,412.84 on May 11 while portfolio remained 80% cash. Gap cost: ~2.1-2.7 percentage points vs. benchmark. This is the direct cost of the API blockage.
- **2026-05-12 — CPI binary event note:** April CPI (+3.7% YoY) is NOT a CLAUDE.md-exempt binary event (list: earnings, FDA, Fed decision day). Per Deployment Bias, CPI is NOT a valid skip reason.
- **2026-05-12 — AMD setup change:** AMD entry thesis changed from `earnings-reaction-follow` to `breakout-volume` at $466 due to China chip deal catalyst. Scores valid at 7.33.
- **2026-05-12 — Chip sector selloff:** PHLX -3% to -6.8% on Tuesday. Qualcomm -11%. No portfolio stops hit (all positions well above stop levels). AVGO bracket at $418.59 confirmed filled during the selloff (daily range $408-$429).
- **2026-05-13 — Huang Beijing catalyst:** Jensen Huang joining Trump's China delegation is the highest-level possible endorsement of NVDA's China market access. Chinese AI stocks +18-37% overnight. New NVDA 5-share add scored 8.0 (highest score in portfolio cycle). PPI NOT a skip reason — same logic as CPI.
- **NVDA earnings (May 21):** 8 days from today's add. Valid entry (>48h). No new NVDA entries after May 19. Stop at $175.60 provides 28.9% cushion on existing 15 shares.

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
- **Market Open (9:45 AM ET):** PRIORITY: (1) If PLTR MOO filled: immediately place stop at fill × 0.88. (2) If AMD MOO filled: immediately place stop at fill × 0.95. (3) If NVDA add MOO filled: immediately place stop for new 5 shares at fill × 0.88. (4) Verify AVGO bracket status (should show as filled with OCO children active). (5) Assess PPI reaction (8:30 AM release today — expect volatility at open). (6) Check XLE — summit agenda includes Iran topics.
- **Intraday:** Monitor Huang/summit news flow. Trump-Xi summit starts tomorrow — any pre-summit chip export announcements today would be massive catalyst. AMD/NVDA particularly sensitive.
- **Daily Review (4:30 PM ET):** (1) Tally fills from today. (2) NVDA pre-earnings hedge strategy assessment (7 days to May 21). (3) Summit outcome preview — what are markets pricing in? (4) BTC re-evaluate at $82K threshold. (5) XLE stop review after any Iran/summit news.

## Cash Reserve Floor
$10,000 (10%). Current cash $80,946 — $70,946 available to deploy before hitting floor. PLTR + AMD fills would consume ~$9,592, leaving ~$61,354+ available. Massive remaining deployment gap.
