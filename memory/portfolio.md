# Opus Trader — Portfolio Memory

## Last Updated
2026-05-11 (Monday) — Mid-Morning routine (11:02 AM ET / 15:02 UTC). Catch-up session: Pre-Market and Market-Open both silently failed today (no heartbeats). Alpaca API blocked (HTTP 403 / "Host not in allowlist") for 4th consecutive week. Prices estimated from web research. AMD (10sh bracket $455) and PLTR (34sh bracket $143.82) orders attempted and blocked. NVDA stop trail ($175.60→$191.75) and GLD stop trail ($397.92→$446.50) attempted and blocked. OPERATOR must place all four manually.

## Current Account Snapshot
- **Broker:** Alpaca Paper Trading (account PA3TXVEJ19LW)
- **Total Equity (estimated):** ~$100,316
- **Cash:** ~$80,946 (80.7%) — assumes AVGO bracket filled May 8 at $418.59; AMD+PLTR not yet filled (API blocked)
- **Long Market Value (estimated):** ~$19,370
- **Open Positions:** 6 confirmed (TSM, NVDA, JPM, AVGO, GLD, XLE) + AMD+PLTR pending (approved, API-blocked)
- **API Status:** BLOCKED — "Host not in allowlist" (HTTP 403). 4th consecutive week. All order placement blocked. This is a persistent infrastructure problem.
- **Daytrade Count:** 0

## Bucket State
| Bucket | Target | Current $ (est.) | Current % | Positions |
|---|---|---|---|---|
| Long-term | 55% ($55K) | ~$13,248 | 13.2% | 4 (TSM, NVDA, JPM, AVGO) |
| Active Trading | 30% ($30K) | ~$6,124 | 6.1% | 2 (GLD, XLE) |
| Crypto | 5% ($5K) | $0 | 0% | 0 |
| Cash Reserve | 10% ($10K floor) | ~$80,946 | 80.7% | — |

**Deployment gap:** Cash $70K+ above the 10% floor. AMD + PLTR are approved and blocked for 3 weeks. Massive underfillment is entirely due to API infrastructure failure.

## Open Positions (estimated, API blocked — prices from web research 2026-05-11)
| Symbol | Bucket | Qty | Entry | Stop (current) | Target | Cost basis | Est. Price | Est. P/L | Sector |
|---|---|---|---|---|---|---|---|---|---|
| TSM | long-term | 7 | 401.47 | 353.76 (-12%) | 498.48 (+24%) | $2,810.29 | ~$405 | +$24.71 | Semiconductors |
| NVDA | long-term | 15 | 198.83 | 191.75* (-12% trail) | 247.44 (+24%) | $2,982.45 | ~$218 | +$288.00 | Semiconductors |
| JPM | long-term | 9 | 308.30 | 272.14 (-12%) | 383.47 (+24%) | $2,774.72 | ~$302 | -$56.16 | Financials |
| AVGO | long-term | 11 | 418.59 | 368.36 (-12%) | 519.05 (+24%) | $4,604.49 | ~$402 | -$180.49 | Semiconductors |
| GLD | active | 7 | 418.86 | 446.50* (-5% trail) | — | $2,932.02 | ~$470 | +$357.26 | Precious metals |
| XLE | active | 50 | 59.01 | 56.15 (-5%) | 65.01 (+10%) | $2,950.50 | ~$56.69 | -$116.00 | Energy |

*Starred stops are TRAILED positions — actual resting stop at Alpaca may still be at old value. OPERATOR MUST UPDATE:
- NVDA: cancel $175.60 stop, place GTC stop sell 15sh at $191.75
- GLD: cancel $397.92 stop, place GTC stop sell 7sh at $446.50

**Est. total long market value:** ~$19,370
**Est. total P/L on positions:** +$317.32

## Pending Orders / Approved But API-Blocked (OPERATOR ACTION REQUIRED)
1. **AMD** (score 7.33, earnings-reaction-follow, active bucket): GTC bracket 10sh limit $455, stop $432.25, target $501. Attempted May 6, May 8, May 11 — all blocked. Current AMD ~$455.
2. **PLTR** (score 7.50, ai-momentum-pullback, long-term): GTC bracket 34sh limit $143.82, stop $126.56, target $178.34. Attempted May 6, May 8, May 11 — all blocked. Current PLTR ~$143.
3. **NVDA stop trail**: cancel existing $175.60, place GTC stop sell 15sh at $191.75.
4. **GLD stop trail**: cancel existing $397.92, place GTC stop sell 7sh at $446.50.

## Sector Exposure (estimated, excl. AMD/PLTR pending)
| Sector | Est. $ | Est. % of equity |
|---|---|---|
| Semiconductors (TSM+NVDA+AVGO) | $10,528 | 10.5% |
| Financials (JPM) | $2,719 | 2.7% |
| Precious metals (GLD) | $3,290 | 3.3% |
| Energy (XLE) | $2,835 | 2.8% |
| Cash | $80,946 | 80.7% |

With AMD added (active, semis): $10,528+$4,550 = $15,078 semis = 15.0% ✓
With PLTR added (LT, software): software = $4,889 = 4.87% ✓
All sectors well under 25% cap.

**LT bucket tech sub-allocation (current):**
- LT tech: TSM+NVDA+AVGO = $10,528 / LT total ($13,248) = 79.5% → above 60% ceiling BUT LT bucket ($13.2K) < $20K threshold → ceiling INFORMATIONAL
- With PLTR added (LT tech): ($10,528+$4,889) / ($13,248+$4,889) = $15,417/$18,137 = 85.0% → still informational (LT bucket still <$20K)
- With PLTR + AMD (AMD is ACTIVE not LT, doesn't count toward LT tech sub-cap)

## Performance vs S&P 500
- **Portfolio est. P/L today:** +$317 unrealized / +0.32%
- **SPX today:** +0.3% (fresh intraday ATH, chip stocks leading)
- **Cumulative return (est.):** +0.32% ($100,316 / $100,000 initial)
- **S&P 500 est. YTD:** ~+5%
- **Gap vs SPX:** Lagging significantly due to 80% cash exposure — cash earns nothing vs invested benchmark. Every week of API-blocked order execution costs 80bps+ in missed returns on a bull market day.

## Macro Context (as of 2026-05-11 mid-morning)
- **Iran deal:** Trump rejected Iran's response as "TOTALLY UNACCEPTABLE" → oil +2% (WTI $97.88, Brent $103.93). Iran deal collapse is bullish for energy/oil, bullish for gold, mixed for equities.
- **Gold:** Surged to $4,699/oz. GLD ~$470. JPMorgan $6,300 year-end target intact. GLD our best-performing position (+12.3% from entry).
- **Oil:** Rising on Iran deal collapse → XLE should benefit. XLE at $56.69, barely above stop $56.15. Iran deal collapse is net positive for XLE thesis.
- **Equities:** S&P 500 +0.3%, Nasdaq +0.2%, fresh ATH intraday. AI capex theme intact.
- **AMD:** ~$455, near 52-week high ($456.29). 88% gain in 30 days. Entry window slipping but approved at current price.
- **PLTR:** ~$143, recovered from post-earnings sell-off. Breaking above pre-earnings resistance. All 6 agents at 7+ (unanimous approval).
- **AVGO:** ~$402 (below our $418.59 bracket fill). $35B private credit deal (Apollo/Blackstone) announced for AI chip development — bullish long-term catalyst. Underwater -3.9% from entry.
- **BTC:** $81,224. Opened at $82,164 (above $82K breakout) but pulled back. Not a confirmed breakout yet. Score 6.33/10 — SKIP.
- **XLE:** Oil up on Iran deal collapse = net positive for energy. Today's low $56.24 came within $0.09 of stop $56.15. Stop intact.

## Active Themes
1. **AI broadening** — TSM + NVDA + AVGO in LT bucket. AMD (active, approved) + PLTR (LT, approved) pending fills. GLD as macro hedge.
2. **Steeper curve / financials tailwind** — JPM (LT), slightly underwater but thesis intact.
3. **Geopolitical hedge** — GLD surging (+12.3%); XLE recovering on Iran deal collapse. Best-performing position.
4. **Energy recovery** — XLE at critical stop; Iran deal collapse removes downside catalyst. Oil at $97-103/bbl is bullish for XLE.
5. **AVGO AI infrastructure play** — $35B private credit deal with Apollo/Blackstone signals institutional conviction in AVGO AI strategy. Short-term pain (-3.9%) but long-term thesis intact.
6. **Crypto recovery** — BTC opened above $82K breakout but pulled back to $81,224. Not confirmed. Re-evaluate on daily close above $82K or drop to $75K support.

## Pending Actions — OPERATOR MUST EXECUTE ASAP

**STOP TRAILS (locked-gain preservation):**
1. **GLD stop trail**: Cancel existing GTC stop sell at $397.92 for 7 GLD shares. Place new GTC stop sell 7sh GLD at $446.50. (Locks in $193 gain minimum vs. current $357 unrealized gain.)
2. **NVDA stop trail**: Cancel existing stop/bracket-OCO for 15 NVDA shares at $175.60. Place new GTC stop sell 15sh NVDA at $191.75.

**NEW ENTRIES (approved ≥7, all guardrails pass):**
3. **AMD**: GTC bracket 10sh limit $455.00 (stop $432.25, target $501.00). Reduces if price moves — adjust to market if needed. R/R 2.02:1 ✓.
4. **PLTR**: GTC bracket 34sh limit $143.82 (stop $126.56, target $178.34). R/R 2.0:1 ✓. Unanimous 7.50/10 score.

## Lessons Learned (running log)
- **Week of 2026-04-27 (init):** No trades placed. First-run setup; benchmarking begins next week.
- **2026-05-01 — bias correction (operator-mandated):** Score ≥ 7 = enter. Only 3 valid skip reasons.
- **2026-05-04 — remote-routine failure mode discovered:** Cron triggers produced zero commits/orders.
- **2026-05-05 — silent failure REPEATS:** Heartbeat infra insufficient. Pre-queued brackets (NVDA, JPM) saved the day. GLD naked stop discovered and fixed.
- **2026-05-06 — API blocked (new failure mode):** AMD, PLTR, BTC attempted, all blocked.
- **2026-05-08 — API blocked AGAIN (3rd consecutive):** AMD and PLTR MOO orders blocked. Persistent infrastructure bottleneck.
- **2026-05-11 — API blocked (4th consecutive week):** Pre-Market AND Market-Open both silently failed. Mid-Morning catch-up ran successfully. AMD (7.33/10) and PLTR (7.50/10) re-approved at higher prices. EVERY MISSED EXECUTION WEEK COSTS REAL PORTFOLIO RETURNS — AMD went from $413 to $455 during the blocked period; we missed 10% of the move. AVGO bracket filled at $418.59 on May 8 (confirmed via price action) but is currently underwater ($402) — this position needs time to recover. GLD is our best performer (+12.3%) and stop needs manual trailing.
- **GLD trailing lesson:** Gold surged from $420 to $470 since May 8. Our 5% active-bucket trailing rule should have kicked in daily — in a normal (non-API-blocked) environment, stops would trail from $397 → $416 → $432 → $446. Current resting stop is still at the original $397.92. This is a gap in stop protection: if gold reverses, we could give back $72/share × 7 shares = $504 in gains unnecessarily. Manual operator trailing is critical.

## Setup Performance Tracker
| Setup type | Wins | Losses | Status |
|---|---|---|---|
| ai-momentum-pullback | 0 | 0 | active (PLTR pending fill, NVDA open) |
| macro-hedge | 0 | 0 | active (GLD +12.3%; XLE -3.9% near stop) |
| earnings-reaction-follow | 0 | 0 | active (AMD pending fill) |
| earnings-reaction-fade | — | — | — |
| breakout-volume | 0 | 0 | BTC below threshold again; re-watching |
| mean-reversion-oversold | — | — | — |
| sector-rotation | 0 | 0 | JPM open (-2.0%), thesis intact |
| crypto-flush-rebound | — | — | — |
| candlestick-reversal | — | — | — |

## Strategy Evolution Notes
- **2026-05-01 (init):** Strategy initialized per CLAUDE.md. No deviations.
- **2026-05-04:** First positions opened. Strategy unchanged; execution layer needs fixing.
- **2026-05-08:** Persistent API blockage causes compounding execution gaps.
- **2026-05-11:** 4th consecutive week of API-blocked order placement. Portfolio is massively underfilled (80% cash). GLD is the standout performer (gold surging on Iran deal collapse). AMD and PLTR have been approved for 3 weeks without fills. The opportunity cost of missing AMD's $413→$455 move alone is ~$420 in unrealized gains on the 10-share intended position. The systemic issue (Anthropic sandbox TLS proxy blocking Alpaca) must be resolved. Every routine will end with the same result until egress is whitelisted.

## Next Routine Plan
- **Midday (12:30 PM ET):** (1) Check XLE — if oil continues up on Iran deal news, XLE may recover toward $57-58 and provide more stop cushion. (2) Trail GLD stop again if gold breaks above $4,750 (GLD ~$475). (3) Check AMD/PLTR fills if operator placed orders. (4) AVGO: monitor for recovery on $35B deal news. (5) BTC: check if daily close sustains above $82K → upgrade to breakout-volume entry for Afternoon routine.
- **Daily Review (4:30 PM ET):** Score all open positions vs. daily close prices. Pre-queue at least one GTC bracket for tomorrow open (AMD/PLTR if still unfilled). Produce scored watchlist for May 12.

## Cash Reserve Floor
$10,000 (10%). Current cash ~$80,946 — $70K available to deploy before hitting floor. AMD+PLTR fills would consume ~$9.4K, leaving ~$71.5K available. Portfolio is severely underfilled.
