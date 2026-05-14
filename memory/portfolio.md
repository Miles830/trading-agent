# Opus Trader — Portfolio Memory

## Last Updated
2026-05-14 (Thursday) — Mid-Morning routine (11:08 AM ET / 15:08 UTC). Alpaca API STILL blocked ("Host not in allowlist" — Anthropic TLS proxy). 8th consecutive blocked routine. Pre-Market and Market Open both silent failures. Prices from web research. AMD limit bracket order attempted ($452.25/stop $429.64/target $497.48, 10 shares) — blocked HTTP 403. AMD re-scored 7.67 (upgraded Sentiment and Macro on Trump-Xi H200 catalyst). PLTR still below $134 — skip maintained. BTC at $79,549 — below $82K threshold. Trump-Xi summit Day 1: H200 chips cleared for China (Alibaba, Tencent, ByteDance, JD.com), Jensen Huang joined delegation. NVDA +1.1% to $227.80; TSM +0.6% to $399.80; market S&P +0.75% at record 7,500.

## Current Account Snapshot
- **Broker:** Alpaca Paper Trading (account PA3TXVEJ19LW)
- **Total Equity (estimated):** ~$100,360 (estimated; API blocked; prices from May 14 web research ~11 AM ET)
- **Cash:** $80,945.53 (80.6%) — unchanged; no orders executed since May 4/5 fills; API blocked
- **Long Market Value (estimated):** ~$19,414 (6 positions)
- **Open Positions:** 6 (TSM, GLD, NVDA, JPM, XLE, AVGO probable fill)
- **Pending Orders / Actions:** AMD GTC bracket limit ($452.25/stop $429.64/target $497.48, 10 sh) — attempted and blocked HTTP 403. OPERATOR MUST place AMD manually. Also: GLD stop trail to $408.74 when API available.
- **API Status:** BLOCKED — "Host not in allowlist" (HTTP 403, Anthropic sandbox TLS proxy). Persistent failure since May 6. 8th consecutive blocked routine.
- **Daytrade Count:** 0

## Bucket State
| Bucket | Target | Current $ (est.) | Current % | Positions |
|---|---|---|---|---|
| Long-term | 55% ($55K) | ~$13,619 (TSM+NVDA+JPM+AVGO) | 13.6% | 4 (TSM, NVDA, JPM, probable AVGO) |
| Active Trading | 30% ($30K) | ~$5,667 (GLD+XLE) | 5.7% | 2 (GLD, XLE) |
| Crypto | 5% ($5K) | $0 | 0% | 0 |
| Cash Reserve | 10% ($10K floor) | ~$80,946 | 80.7% | — |

**Deployment gap:** Cash ~$70.9K above the 10% floor. AMD entry attempted (blocked). Massive underfillment continues.

## Open Positions (estimated, API blocked — prices from May 14 web research ~11 AM ET)
| Symbol | Bucket | Qty | Entry | Stop | Target | Cost basis | Est. Price | Est. P/L | Sector |
|---|---|---|---|---|---|---|---|---|---|
| TSM | long-term | 7 | 401.47 | 353.76 (-12%) | 498.48 (+24%) | $2,810.29 | ~$399.80 | -$11.69 | Semiconductors |
| GLD | active | 7 | 418.86 | 397.92 (-5%) | — | $2,932.02 | ~$430.25 | +$79.73 | Precious metals |
| NVDA | long-term | 15 | 198.83 | 175.60 (-12%) | 247.44 (+24%) | $2,982.45 | ~$227.80 | +$434.55 | Semiconductors |
| JPM | long-term | 9 | 308.30 | 272.14 (-12%) | 383.47 (+24%) | $2,774.72 | ~$301.02 | -$65.52 | Financials |
| XLE | active | 50 | 59.01 | 56.15 (-5%) | 65.01 (+10%) | $2,950.50 | ~$57.86 | -$57.50 | Energy |
| AVGO* | long-term | 11 | 418.59 | 368.36 (-12%) | 519.05 (+24%) | $4,604.49 | ~$416.79 | -$19.80 | Semiconductors |

*AVGO: GTC bracket at $418.59 placed ~May 4. Treating as probable fill (AVGO range May 8 covered $418.59). Stop = bracket OCO child at $368.36 (-12%).

**Est. total long market value (all 6):** ~$19,414
- TSM: 7 × $399.80 = $2,799
- GLD: 7 × $430.25 = $3,012
- NVDA: 15 × $227.80 = $3,417
- JPM: 9 × $301.02 = $2,709
- XLE: 50 × $57.86 = $2,893
- AVGO: 11 × $416.79 = $4,585

**Net unrealized P/L: +$359.77** (NVDA +$435 + GLD +$80 offset by JPM -$66, XLE -$58, TSM -$12, AVGO -$20)

## Sector Exposure (estimated — May 14, ~11 AM ET)
| Sector | Est. $ | Est. % of equity |
|---|---|---|
| Semiconductors (TSM+NVDA+AVGO) | $10,801 | 10.76% |
| Financials (JPM) | $2,709 | 2.70% |
| Precious metals (GLD) | $3,012 | 3.00% |
| Energy (XLE) | $2,893 | 2.88% |
| Cash | $80,946 | 80.6% |

**After AMD fill (pending — operator must execute manually):**
| Sector | Added $ | New % |
|---|---|---|
| Semiconductors (+AMD $4,500) | $15,301 | 15.2% |
| Cash remaining | $76,446 | 76.1% |

All sectors remain well under 25% cap after AMD fill.

**LT bucket tech sub-allocation (current):**
TSM+NVDA+AVGO = $10,663 in LT tech; LT total = $10,663 + $2,744 (JPM) = $13,407
LT-tech % = 79.5% → above 60% ceiling BUT LT bucket ($13.4K) < $20K threshold → ceiling is INFORMATIONAL per CLAUDE.md. PLTR skip removes that from LT bucket plans for now.

## Performance vs S&P 500
- **Portfolio total equity (est.):** ~$100,360
- **Portfolio total return:** +0.36% ($100,360 / $100,000 initial)
- **Today's P&L (vs May 13 est $100,232):** +$128 / +0.13% (NVDA +$36, TSM +$18, AVGO +$84, GLD -$0, JPM -$35, XLE +$25)
- **S&P 500 mid-morning May 14:** ~7,500.29 (+0.75% today). Trump-Xi summit Day 1 lifting all boats.
- **S&P 500 return since strategy start (~May 1):** ~+4.17% (7,500 vs ~7,200 est.)
- **Gap vs SPX:** **-3.81 percentage points** — widened slightly (80% cash not participating in +0.75% market rally).
- **CRITICAL:** Gap continues widening daily. AMD entry mandatory. Operator must execute manually: limit ~$452, stop $429.64, target $497.48, qty 10 sh, GTC bracket.

## Macro Context (as of 2026-05-14, ~11 AM ET)
- **Trump-Xi Beijing Summit DAY 1 (TODAY):** H200 chip sales to China reportedly cleared (Alibaba, Tencent, ByteDance, JD.com). NVDA CEO Jensen Huang personally invited by Trump — joined Air Force One. Xi told US CEOs China will "open wider." STRONGLY BULLISH for all chip names. Summit continues May 15.
- **Market reaction:** S&P 500 +0.75% to 7,500.29 (record). Nasdaq +0.89%. Dow +0.73%. Risk-on trade. NVDA +1.1% to $227.80. AMD range $433–$453. TSM +0.6% to $399.80. AVGO -0.93% to $416.79.
- **PPI Context (May 13):** April PPI +1.4% MoM vs +0.5% expected — largest since 2022. Annual rate ~6%. Oil/gas-driven (Hormuz closure). Fed rate cuts pushed to 2027. PPI headwind offset by strong chip demand narrative.
- **Iran deal:** Still unconfirmed. Oil $100-126/bbl. XLE at $57.86, stop $56.15 (3.0% cushion ⚠️). Monitor closely.
- **NVDA Earnings:** May 21 (7 days). Do NOT enter new NVDA positions after May 19. Existing stop $175.60 provides 29.7% cushion vs $227.80. Pre-earnings review at Daily Review May 19.
- **Bitcoin:** ~$79,549 — DECLINED from $80,960 yesterday. Below $82K re-entry threshold. No crypto action.
- **JPM:** At $301.02 — slightly below entry $308.30 (-2.4%). PPI/no-rate-cut environment pressures NIM expectations. Monitor; stop $272.14 provides 9.6% cushion.
- **AVGO Earnings:** Jun 3, 2026. No constraint yet (>48 hours away by a wide margin). Position near break-even at $416.79 vs entry $418.59.

## Active Themes
1. **AI broadening / China chip deal** — TSM + NVDA + AVGO in LT bucket. AMD MUST enter (score 7.67, API blocked). H200 cleared for China TODAY — direct revenue catalyst for NVDA ($7-12.5B) and signals further MI308/AMD easing. Trump-Xi summit ongoing through May 15.
2. **Steeper curve / financials headwind** — JPM (LT) at $301.02 (-2.4% from entry). No rate cuts expected until 2027 per CME FedWatch. PPI +1.4% further squeezing rate-cut bets. JPM NIM benefit at high rates partially offset by valuation pressure. Hold — stop $272.14 (9.6% cushion).
3. **Geopolitical inflation hedge** — GLD (active) +2.7% from entry at $430.25. PPI shock + Trump-Xi summit geopolitical uncertainty supports gold. GLD trailing stop intent: $408.74 (when API available). Iran deal still unconfirmed — XLE stop $56.15 thin (3.0% ⚠️ — closest to being hit).
4. **Crypto recovery** — BTC $79,549 — DECLINING, not recovering. Below $82K threshold. Risk-on summit sentiment not yet reflected in BTC price. Re-evaluate at $82K+.
5. **Government AI (PLTR AIP)** — PLTR at $131.90 — still below $134 support. Skip maintained (6.50 re-score). Watch for recovery above $134 as re-entry catalyst. Trump-Xi summit not yet triggering PLTR recovery (government AI not directly addressed).

## Pending Actions — OPERATOR MUST EXECUTE NOW (May 14)

1. **AMD** (score 7.67, breakout-volume, active): Buy 10 shares — GTC bracket limit at $452.25, stop_loss $429.64, take_profit $497.48. MANDATORY. Score upgraded from 7.33 to 7.67 on H200/summit catalyst. Blocked for 8th consecutive routine. Operator must place via brokerage platform manually.

2. **GLD trailing stop** (when API available): Move stop from $397.92 to $408.74 (-5% from current $430.25). Locks in gain protection.

3. **PLTR** (score 6.50, SKIP): Do NOT enter until price reclaims $134 support. Currently $131.90.

4. **NVDA May 21 earnings:** Pre-earnings review at Daily Review May 19. No new NVDA entries after May 19. Existing stop $175.60 provides 29.7% cushion at $227.80. Consider trailing stop to $200.46 (from -12% of $227.80) at May 19 review if price holds.

5. **AVGO:** Probable fill at $418.59 (now -0.43% vs entry; cushion to stop $368.36 = 11.6%). Earnings Jun 3 — no new entries needed near that date. Monitor.

6. **XLE:** $57.86, stop $56.15 (3.0% cushion ⚠️). Watch Iran deal news. If oil drops on deal progress, stop likely hit soon.

## Pending Deferrals (≥7 watchlist names not yet entered)
- **AMD** (7.67) — API blocked 8 consecutive routines; operator must place via brokerage platform manually (limit $452.25, stop $429.64, target $497.48, qty 10, GTC bracket)

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
- **2026-05-14 — Trump-Xi H200 catalyst:** Summit Day 1 produces H200 clearance for Chinese firms + Jensen Huang personally invited by Trump to delegation. AMD re-scored to 7.67 (Sentiment +8, Macro +8). Both predecessor routines (Pre-Market, Market Open) silent failures. 8th consecutive API blockage. Summit ongoing through May 15.
- **NVDA earnings risk:** NVDA reports Q2 on May 21 (7 days). Pre-earnings review MUST happen at Daily Review May 19. Stop $175.60 provides 29.7% cushion vs $227.80.

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
- **Midday May 14 (12:30 PM ET):** PRIORITY: (1) AMD — attempt bracket limit order again at market price (limit = ask × 1.005, stop -5%, target +10%). API likely still blocked. (2) Check PLTR — has it recovered above $134? If yes, re-score for entry. (3) Monitor XLE — if oil drops on Iran deal news, stop $56.15 may trigger. (4) Check summit Day 2 news. (5) GLD trailing stop to $408.74 when API allows.
- **Afternoon May 14 (2:00 PM ET):** Review all positions + any intraday candlestick signals. AMD position monitoring if filled.
- **Market Close May 14 (3:30 PM ET):** MOC for any day trades needing close. No current day trades open.
- **Daily Review May 14 (4:30 PM ET):** (1) AMD fill status. (2) Trump-Xi summit Day 1 full outcomes assessment. (3) PLTR re-evaluation (if above $134). (4) Score BTC if above $82K. (5) XLE stop status. (6) NVDA earnings approach plan (7 days out).

## Cash Reserve Floor
$10,000 (10%). Current cash $80,946 — $70,946 available to deploy before hitting floor. PLTR + AMD fills would consume ~$9,592, leaving ~$61,354+ available. Massive remaining deployment gap.
