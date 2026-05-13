# Opus Trader — Portfolio Memory

## Last Updated
2026-05-13 (Wednesday) — Afternoon routine (2:03 PM ET / 18:03 UTC). Alpaca API blocked in sandbox runner ("Host not in allowlist" — Anthropic TLS proxy). MOC orders for MU (6sh) and AMD (re-attempt) both blocked. Prices from web research. All 4 predecessor routines (Pre-Market, Market Open, Mid-Morning, Midday) silent-failed today — violations logged.

## Current Account Snapshot
- **Broker:** Alpaca Paper Trading (account PA3TXVEJ19LW)
- **Total Equity (estimated):** ~$100,494 (est.; API blocked; see position table below)
- **Cash:** $80,945.53 (80.5%) — unchanged; no orders have executed since May 4/5 fills
- **Long Market Value (estimated):** ~$19,548
- **Open Positions:** 6 confirmed (TSM, GLD, NVDA, JPM, XLE, AVGO)
- **Pending Orders / Actions:** MU MOC 6sh APPROVED but API blocked; must place MOO May 14 Pre-Market. AMD MOO 10sh pending re-score at Pre-Market May 14.
- **API Status:** BLOCKED — "Host not in allowlist" (HTTP 403, Anthropic sandbox TLS proxy). Persistent failure since May 6. All routine order attempts blocked.
- **Daytrade Count:** 0

## Bucket State
| Bucket | Target | Current $ (est.) | Current % | Positions |
|---|---|---|---|---|
| Long-term | 55% ($55K) | ~$13,663 | 13.6% | 4 (TSM, NVDA, JPM, AVGO) |
| Active Trading | 30% ($30K) | ~$5,884 | 5.9% | 2 (GLD, XLE) |
| Crypto | 5% ($5K) | $0 | 0% | 0 |
| Cash Reserve | 10% ($10K floor) | ~$80,946 | 80.5% | — |

**Deployment gap:** Cash ~$70.9K above the 10% floor. MU (7.0 approved), AMD (7.5 approved but active-skip today), PLTR (rejected at 6.67) are the pending actions.

## Open Positions (estimated May 13 prices from web research)
| Symbol | Bucket | Qty | Entry | Stop | Target | Cost basis | Est. Price | Est. P/L | Sector |
|---|---|---|---|---|---|---|---|---|---|
| TSM | long-term | 7 | 401.47 | 353.76 (-12%) | 498.48 (+24%) | $2,810.29 | ~$397.28 | **-$29.33** | Semiconductors |
| GLD | active | 7 | 418.86 | 397.92 (-5%) | — | $2,932.02 | ~$430.27 | +$79.87 | Precious metals |
| NVDA | long-term | 15 | 198.83 | 175.60 (-12%) | 247.44 (+24%) | $2,982.45 | ~$227.28 | **+$426.75** | Semiconductors |
| JPM | long-term | 9 | 308.30 | 272.14 (-12%) | 383.47 (+24%) | $2,774.72 | ~$304.88 | **-$30.80** | Financials |
| XLE | active | 50 | 59.01 | 56.15 (-5%) | 65.01 (+10%) | $2,950.50 | ~$57.45 | **-$78.00** | Energy |
| AVGO | long-term | 11 | 418.59* | 368.36 (-12%) | 519.05 (+24%) | $4,604.49 | ~$430.27 | +$125.51 | Semiconductors |

*AVGO: GTC bracket confirmed fill (May 8 range $406-$426 passed through $418.59; May 12 low $408.41 confirms). Stop = bracket OCO child at $368.36, assumed resting at Alpaca.

**Est. total long market value:** ~$19,548
- TSM: 7 × $397.28 = $2,781
- GLD: 7 × $430.27 = $3,012
- NVDA: 15 × $227.28 = $3,409
- JPM: 9 × $304.88 = $2,744
- XLE: 50 × $57.45 = $2,873
- AVGO: 11 × $430.27 = $4,730

**Net open P/L:** +$426.75 + $125.51 + $79.87 - $29.33 - $30.80 - $78.00 = **+$494.00 unrealized**

## Stop-Loss Status (CRITICAL)
All stops are GTC bracket OCO children placed May 4/5. API blocked — cannot verify resting state. Cannot trail.

**INTENDED STOP TRAILS (execute via API when connectivity restores — URGENT):**
- NVDA: trail from $175.60 → **$199.99** ($227.28 × 0.88) to lock near-breakeven protection
- GLD: trail from $397.92 → **$408.76** ($430.27 × 0.95) to tighten 5% active-bucket trail

**🔴 XLE DANGER:** Stop $56.15. Day low today: $56.96 = only $0.81 ($1.4%) above stop. If XLE opens below $56.96 tomorrow and falls to $56.15, position auto-exits. Pre-Market May 14 MUST assess XLE at open — consider closing early if setup continues to deteriorate.

## Sector Exposure (estimated May 13)
| Sector | Est. $ | Est. % of equity |
|---|---|---|
| Semiconductors (TSM + NVDA + AVGO) | $10,920 | 10.9% |
| Financials (JPM) | $2,744 | 2.7% |
| Precious metals (GLD) | $3,012 | 3.0% |
| Energy (XLE) | $2,873 | 2.9% |
| Cash | $80,946 | 80.5% |

**After MU fill (pending Pre-Market May 14):**
Semiconductors: $10,920 + $4,783 (MU) = $15,703 = 15.6% ✓ (<25%)

**After AMD fill (pending Pre-Market May 14 — active bucket):**
Semiconductors LT: $15,703 | Active semis (AMD): $4,495 separately
Combined semis: $20,198 = 20.1% ✓ (<25%)

## Performance vs S&P 500
- **Portfolio total equity (est.):** ~$100,494
- **Portfolio total return:** +0.49% ($100,494 / $100,000 initial)
- **S&P 500 May 13 (est.):** ~7,414 (slightly mixed on PPI; S&P ~flat, Nasdaq +0.12%)
- **S&P 500 return since strategy start (~May 1, ~7,200):** est. ~+2.97%
- **Gap vs SPX:** Lagging by ~**2.48 percentage points** — driven entirely by 80.5% cash exposure from API-blocked deployments
- **CRITICAL:** Every day of 80% cash at record S&P represents compounding missed returns. MU/AMD deployment is the priority path to close this gap.

## Macro Context (as of 2026-05-13 afternoon)
- **PPI (released TODAY 8:30 AM ET):** April +1.4% MoM (exp +0.5%), +6.0% YoY (exp +4.8%) — hottest since 2022. Oil/energy-driven. Top banks now pricing NO Fed rate cuts in 2026 and first cut deferred to 2027. Rate-hike probability elevated. PPI headwind for high-multiple growth stocks (PLTR hurt; AMD resilient due to China deal).
- **Market reaction (2 PM ET):** S&P 500 -0.15%, Nasdaq +0.12%, Dow -0.48%. Tech/semis outperforming: NVDA +2%, MU strong. PLTR -4.31% (multiple compression + NHS concern). TSM -1.5% (semiconductor export uncertainty ahead of Trump-Xi).
- **Trump-Xi Beijing summit (May 14-15 TOMORROW):** Key agenda: AI chip export controls (NVDA China quota), rare-earth/critical minerals, Iran, Taiwan. Outcome uncertain. "Chips may be off the table" per Euronews — any agreement would face resistance from Rubio/NSA. Semiconductor stocks could swing sharply on headline risk. TSM and NVDA most exposed. AMD China deal already announced separately.
- **Iran deal:** Still unconfirmed. XLE stop dangerously thin. Oil $100+/bbl still.
- **NVDA Earnings:** May 21 (8 days). No new NVDA entry after May 19. Existing position up +14.3% — approaching 15% partial-profit threshold ($228.65).

## Active Themes
1. **AI broadening / HBM memory cycle** — TSM + NVDA + AVGO (LT bucket). MU approved (MOO pending May 14). AMD approved (active, MOO pending May 14 re-score).
2. **Steeper curve / financials** — JPM slightly below entry (-1.1%); thesis intact but PPI headwinds.
3. **Geopolitical inflation hedge** — GLD up +2.7%. Hot PPI + oil inflation = strong gold bull case. XLE at risk (stop proximity).
4. **China chip deal tailwind** — AMD/AVGO/NVDA China deal announced; Trump-Xi outcome is next catalyst.
5. **Crypto recovery** — BTC/ETH: not assessed this session. Still $0 in crypto bucket.

## Pending Actions — OPERATOR MUST EXECUTE / Pre-Market May 14 MUST ACT

1. **MU** (score 7.0, ai-momentum-pullback, long-term): Buy 6 shares MOO. APPROVED by master agent. API blocked today. Pre-Market MUST place MOO for MU before 9:25 AM ET. Market Open MUST place stop at fill_price × 0.88 (LT -12%).

2. **AMD** (score 7.5 at $449, breakout-volume, active): Re-score at Pre-Market open price. If ≥7 → place MOO. China deal catalyst + Trump-Xi summit outcome as additional catalyst. Stop at fill_price × 0.95 (active -5%).

3. **NVDA partial profit alert:** If NVDA opens above $228.65 tomorrow (or today at close), Pre-Market/Market-Open MUST consider selling 5 of 15 shares (33% trim) to book partial gain while maintaining LT thesis. Earnings May 21 — partial exit also hedges binary event risk.

4. **XLE critical watch:** Stop $56.15. Day low today $56.96. If Trump-Xi produces negative Iran outcome, XLE could break stop. Pre-Market MUST check XLE pre-open for any Iran headline.

5. **Stop trails (when API restores):**
   - NVDA: $175.60 → $199.99
   - GLD: $397.92 → $408.76

6. **PLTR:** REJECTED today (6.67 avg; support broken at $134; trading $129.99). Watch for reclaim of $134 before re-entry. Not on active watchlist.

## Pending Deferrals (≥7 watchlist names not yet entered)
- **MU** (7.0) — API blocked; Pre-Market May 14 MUST place MOO 6 shares
- **AMD** (7.5 at $449) — Active-bucket proximity-to-close skip today; Pre-Market May 14 re-score and MOO if ≥7

## Lessons Learned (running log)
- **Week of 2026-04-27 (init):** No trades placed. First-run setup; benchmarking begins next week.
- **2026-05-01 — bias correction (operator-mandated):** Capital in cash earns nothing. Score ≥ 7 = enter at next routine. Only 3 valid skip exemptions per CLAUDE.md Deployment Bias.
- **2026-05-04 — remote-routine failure mode discovered:** Cron triggers produced zero commits/orders. Manual session broke the streak.
- **2026-05-05 — silent failure REPEATS:** Heartbeat infra not sufficient. Operator pre-queued brackets saved the day (NVDA, JPM filled). GLD naked stop discovered and fixed.
- **2026-05-06 — API blocked (new failure mode):** Routine ran late AND Alpaca API blocked. AMD, PLTR, BTC documented as attempts; none executed.
- **2026-05-08 — API blocked AGAIN (3rd consecutive):** AMD and PLTR MOO blocked at 12:19Z. HTTP 403 from Anthropic TLS proxy. Persistent infrastructure problem.
- **2026-05-08 to 2026-05-12 (weekend gap):** S&P 500 hit record 7,412.84 on May 11 while portfolio remained 80% cash. Gap cost: ~2.5 percentage points vs. benchmark.
- **2026-05-12 — CPI note:** April CPI hot (+3.7% YoY) released. Not a CLAUDE.md-exempt binary event. MOO would have reflected CPI in open price.
- **2026-05-13 — PPI hot (+6% YoY):** Hottest since 2022. Reinforces no-rate-cuts narrative. TSM and JPM slipped below entry. XLE dangerously close to stop. PLTR broke $134 support — rejected at 6.67. New candidate: MU (7.0, anchor list, HBM AI memory). MU MOC blocked by API.
- **2026-05-13 — 4 predecessor violations:** All 4 preceding routines silent-failed (no heartbeats). Violation entries logged. Pattern of cron/runner failure is the core infrastructure problem.
- **2026-05-13 — PLTR support break:** $134 support (2-week consolidation base) broken on 4.31% down-day. NHS data privacy investigation adds new fundamental risk. Re-entry requires reclaim of $134.
- **NVDA earnings risk:** NVDA reports Q2 2026 on May 21. At +14.3% unrealized, approaching 15% partial-profit threshold ($228.65). Consider trim when price crosses $228.65.

## Setup Performance Tracker
| Setup type | Wins | Losses | Status |
|---|---|---|---|
| ai-momentum-pullback | 0 | 0 | active (TSM open -1.0%, PLTR rejected, MU pending) |
| macro-hedge | 0 | 0 | active (GLD +2.7%, XLE -2.6% — stop danger) |
| breakout-volume | 0 | 0 | AMD pending MOO May 14 |
| earnings-reaction-follow | 0 | 0 | AMD setup reclassified to breakout-volume |
| earnings-reaction-fade | — | — | — |
| mean-reversion-oversold | — | — | — |
| sector-rotation | 0 | 0 | active (JPM -1.1%) |
| crypto-flush-rebound | — | — | — |
| candlestick-reversal | — | — | — |

## Strategy Evolution Notes
- **2026-05-01 (init):** Strategy initialized per CLAUDE.md. No deviations.
- **2026-05-04:** First positions opened. Strategy unchanged; execution layer needs fixing.
- **2026-05-08:** Three-week persistent API blockage causing compounding execution gaps. Portfolio 85% cash vs. 10% floor target.
- **2026-05-12:** China chip deal changes AMD thesis from earnings-follow to breakout-volume. Rate-cut thesis broken (no cuts until 2027) but partially offset by China chip deal.
- **2026-05-13:** PPI +6% YoY (hottest since 2022) adds inflation persistence thesis. Identified MU (Micron) as new high-conviction anchor-list entry — HBM3E AI memory secular demand. PLTR rejected (support break). TSM/JPM temporarily below entry on PPI headwind. Trump-Xi summit tomorrow is binary for semiconductor stocks.

## Next Routine Plan — Pre-Market May 14 (8:00 AM ET)

**COMMITMENTS (must execute, not suggestions):**
1. **MU (7.0) — MOO 6 shares.** MANDATORY per Deployment Bias (score ≥7 at prior routine = must place MOO). Stop placed by Market Open routine at fill_price × 0.88.
2. **AMD (7.5) — Re-score at pre-market price.** If score still ≥7 → place MOO. China chip deal + Trump-Xi summit outcome as catalyst. Active bucket.
3. **NVDA partial profit check** — If NVDA pre-market > $228.65, consider MOO sell of 5 shares (33% trim). Locks in ~$14.3% gain on trimmed shares. Remaining 10 shares continue LT position.
4. **XLE pre-market assessment** — Check Iran/Trump-Xi news before open. If material negative (Iran deal confirmed = oil selloff), consider preemptive close. Stop $56.15 is thin.
5. **Trump-Xi outcome read** — Summit starts May 14. Any semiconductor-related headlines (NVDA China quota, chip export easing/tightening) directly affect TSM, NVDA, AMD, AVGO. Vet all positions against overnight news before placing MOOs.
6. **PLTR watch** — No entry unless $134 support reclaimed. Down 4.31% today at $129.99.
7. **Stop-loss audit** — Verify all 6 positions have resting GTC stops at Alpaca (if API restores). Place trailing stops for NVDA ($199.99) and GLD ($408.76) if API available.

## Cash Reserve Floor
$10,000 (10%). Current cash $80,946 — $70,946 available to deploy before hitting floor. MU ($4,783) + AMD ($4,495) fills would consume ~$9,278, leaving ~$61,668 available. Still massive deployment gap vs. bucket targets.
