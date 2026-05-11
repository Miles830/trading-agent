# Opus Trader — Portfolio Memory

## Last Updated
2026-05-11 (Monday) — Market Open routine (9:45 AM ET / 13:46 UTC). Pre-Market silent failure today — no STARTED Pre-Market heartbeat. Catch-up run from Market Open. Alpaca API still blocked ("Host not in allowlist" HTTP 403, Anthropic sandbox TLS proxy). Prices estimated from web research. PLTR bracket (36sh, limit $138.48) and GLD add bracket (4sh, limit $432.00) attempted and blocked. OPERATOR must manually place both before close today.

## Current Account Snapshot
- **Broker:** Alpaca Paper Trading (account PA3TXVEJ19LW)
- **Total Equity (estimated):** ~$100,434 (estimated; API blocked)
- **Cash:** $80,945.53 (80.5%) — unchanged from May 8 (AMD/PLTR operator orders unconfirmed; treating as not placed)
- **Long Market Value (estimated):** ~$19,488 (6 positions: TSM, GLD, NVDA, JPM, XLE, AVGO)
- **Open Positions:** 6 confirmed (TSM, GLD, NVDA, JPM, XLE, AVGO) — AMD/PLTR unconfirmed (operator was to place manually May 8; no dashboard update since)
- **Pending Orders / Actions:** PLTR 36sh GTC bracket $138.48 + GLD 4sh add GTC bracket $432.00 — APPROVED but API blocked (5th consecutive session with blockage); operator must place manually NOW.
- **API Status:** BLOCKED — "Host not in allowlist" (HTTP 403, Anthropic sandbox TLS proxy). Now 4+ consecutive sessions blocked. All Alpaca calls fail. xAI API also blocked (sentiment scored qualitatively).
- **Daytrade Count:** 0

## Bucket State
| Bucket | Target | Current $ (est.) | Current % | Positions |
|---|---|---|---|---|
| Long-term | 55% ($55K) | ~$13,646 | 13.6% | 4 (TSM, NVDA, JPM, AVGO) |
| Active Trading | 30% ($30K) | ~$5,842 | 5.8% | 2 (GLD, XLE) |
| Crypto | 5% ($5K) | $0 | 0% | 0 |
| Cash Reserve | 10% ($10K floor) | ~$80,946 | 80.5% | — |

**Deployment gap:** Cash $70K+ above 10% floor. LT bucket at 13.6% vs 55% target. Urgently underfilled due to API blockage. PLTR and GLD add are immediate deployments. AMD at $460 re-scored to 6.5 (below threshold at current elevated price — entry window closed).

## Open Positions (estimated, API blocked — prices from web research May 11)
| Symbol | Bucket | Qty | Entry | Stop | Target | Cost basis | Est. Price | Est. P/L | Sector |
|---|---|---|---|---|---|---|---|---|---|
| TSM | long-term | 7 | 401.47 | 353.76 (-12%) | 498.48 (+24%) | $2,810.29 | ~$408 | +$45.71 | Semiconductors |
| GLD | active | 7 | 418.86 | 397.92 (-5%) | — | $2,932.02 | ~$431 | +$84.98 | Precious metals |
| NVDA | long-term | 15 | 198.83 | 175.60 (-12%) | 247.44 (+24%) | $2,982.45 | ~$215 | +$242.55 | Semiconductors |
| JPM | long-term | 9 | 308.30 | 272.14 (-12%) | 383.47 (+24%) | $2,774.72 | ~$315 | +$60.28 | Financials |
| XLE | active | 50 | 59.01 | 56.15 (-5%) | 65.01 (+10%) | $2,950.50 | ~$56.50 | -$125.50 | Energy |
| AVGO | long-term | 11 | 418.59 | 368.36 (-12%) | 519.05 (+24%) | $4,604.49 | ~$430 | +$125.51 | Semiconductors |

**Est. total long market value:** ~$19,488  
**Est. total unrealized P/L:** +$433.53  
**Est. total equity:** ~$100,434

**⚠️ XLE CRITICAL:** XLE today range $56.25–$56.61 vs stop $56.15. Only $0.10–$0.46 above stop. Brent crude +3.5% to $104.80 (Iran deal rejected by Trump) yet XLE is barely holding. XLE/oil divergence = institutional selling or demand-destruction fears overriding supply premium. GTC stop at $56.15 must be resting at Alpaca — if auto-executed, loss ≈ $143 from current price. Cannot verify stop via API.

**Stop coverage (estimated):**  
| Symbol | Stop @ | Est. Price | Cushion | Status |
|---|---|---|---|---|
| TSM | $353.76 | ~$408 | +15.3% | ✓ (bracket OCO) |
| GLD | $397.92 | ~$431 | +8.3% | ✓ (GTC stop) |
| NVDA | $175.60 | ~$215 | +22.4% | ✓ (bracket OCO) |
| JPM | $272.14 | ~$315 | +15.8% | ✓ (bracket OCO) |
| XLE | $56.15 | ~$56.50 | +0.6% | ⚠️ CRITICAL — nearly at stop |
| AVGO | $368.36 | ~$430 | +16.7% | ✓ (bracket OCO) |

Cannot verify via API — all stops BELIEVED in place from prior sessions.

## Sector Exposure (estimated)
| Sector | Est. $ | Est. % of equity |
|---|---|---|
| Semiconductors (TSM + NVDA + AVGO) | $10,811 | 10.8% |
| Financials (JPM) | $2,835 | 2.8% |
| Precious metals (GLD) | $3,017 | 3.0% |
| Energy (XLE) | $2,825 | 2.8% |
| Cash | $80,946 | 80.5% |

All sectors well under 25% cap.

**LT bucket tech sub-allocation:**
TSM + NVDA + AVGO in LT-tech = $2,856 + $3,225 + $4,730 = $10,811
LT bucket total (including JPM) = $13,646
LT-tech % = 79.2% → above 60% ceiling BUT LT bucket ($13.6K) < $20K threshold → ceiling is INFORMATIONAL per CLAUDE.md. When LT bucket exceeds $20K, enforce strictly.

Adding PLTR ($4,960 at $137.80): LT total = $18,606, LT-tech = $15,771, LT-tech% = 84.8% → still informational below $20K.

## Performance vs S&P 500
- **Portfolio est. unrealized P/L:** +$433.53 / +0.43%
- **SPX today (May 11):** ~7,407, +0.11% (muted open, Iran deal rejected, oil surge)
- **Portfolio vs SPX:** Portfolio +0.43% cumulative (from $100K start) vs SPX benchmark; outperforming by est. +0.3–0.4% but this is purely due to short tracking window; the 85% cash drag is compounding against benchmark
- **Benchmark gap:** Lagging significantly in deployment — cash earns nothing vs. invested benchmark

## Macro Context (as of 2026-05-11 market open)
- **Iran:** Trump formally REJECTED Iran's latest peace proposal over the weekend. War continues. Brent +3.5% to $104.80; WTI near $99–$100. IEA warns 14M bpd of global oil supply disrupted. Hormuz effectively closed since February. This is BULLISH for GLD (safe haven) and technically BULLISH for XLE (oil prices elevated) — but XLE is diverging bearishly, suggesting other forces.
- **Equities:** S&P +0.11%, Nasdaq -0.34%, Russell 2000 +0.76%. Muted, mixed market. Not triggering any guardrail (not down >1.5%, not up >2%).
- **Fed:** 3.75%, unchanged. Market pricing rate cuts. Soft macro data bullish for rate-sensitive positions.
- **Semiconductors:** AMD closed $455.19 (May 8), $461.20 (May 10). NVDA ~$215. TSM today $400–$417. AI capex theme continues.
- **Bitcoin:** Opened $82,164 (strongest since Jan 31) but fell to $80,971 by 7:16 AM ET. Failed to sustain above $82,320 resistance.
- **Gold:** $428–$434 today, accelerating higher on Iran escalation.

## Active Themes
1. **AI broadening** — TSM + NVDA + AVGO in LT bucket. AMD ran +11% from entry thesis price ($413→$460); not re-entering at extended price (re-score 6.5/10). PLTR is the AI platform next entry target.
2. **Iran escalation / safe-haven bid** — GLD surging (stop $397.92 well below). Adding 4 shares to bring position to 11sh (4.76% — under 5% cap). XLE at critical stop level despite high oil — bearish divergence.
3. **Steeper curve / financials tailwind** — JPM performing well, up +$60 from entry.
4. **Crypto recovery** — BTC opened $82,164 but failed to sustain above $82,320. NOT entering yet. Will re-enter on daily CLOSE above $82,320 (breakout-volume) or drop to $75K (crypto-flush-rebound).

## Pending Actions — OPERATOR MUST EXECUTE NOW (Market Hours)

Three orders approved but API-blocked. Manual placement required:

1. **PLTR** (score 7.17, ai-momentum-pullback, long-term): Buy 36 shares GTC bracket, limit $138.48, stop $121.26 (-12%), target $170.87 (+24%). Carried commitment from May 8 (7.33 original score). Still valid at $137.80 (barely moved).

2. **GLD add** (score 7.67, macro-hedge, active): Buy 4 shares GTC bracket, limit $432.00, stop $412.45 (-5% from limit), target $477.58 (+10.5%). New scan — Iran escalation thesis. Brings GLD to 11 total shares (4.73% of equity).

3. **XLE monitor:** Stop at $56.15 should auto-execute if price drops. Today's low $56.25 — barely holding. If Iran war escalates further, oil supply disruption may eventually lift XLE. But bearish divergence is a warning sign.

4. **BTC/USD**: SKIP for now. BTC opened $82,164 (near breakout) but failed to hold. Need daily CLOSE above $82,320 for breakout-volume confirmation.

## Pending Deferrals (≥7 watchlist names pending entry)
- **PLTR** (7.17) — API blocked; operator must place before market close today
- **GLD add** (7.67) — API blocked; operator must place before market close today

## Lessons Learned (running log)
- **Week of 2026-04-27 (init):** No trades placed. First-run setup.
- **2026-05-01 — bias correction:** Capital in cash earns nothing. Score ≥ 7 = enter at next routine.
- **2026-05-04 — remote-routine failure mode discovered:** Cron triggers produced zero commits/orders.
- **2026-05-05 — silent failure REPEATS:** Heartbeat infra not sufficient.
- **2026-05-06 — API blocked (new failure mode):** Routine ran late AND Alpaca API blocked.
- **2026-05-08 — API blocked AGAIN (3rd consecutive session):** AMD and PLTR MOO blocked.
- **2026-05-11 — Pre-Market silent failure + API blocked (4th consecutive):** Cron did not fire Pre-Market today. Market Open routine ran catch-up. AMD re-scored to 6.5/10 at $460 (entry window closed — price ran +11% from original thesis while API was blocked). PLTR still valid at $137.80. GLD add is new high-conviction opportunity (Iran escalation driving gold). BTC failed to hold $82K breakout — skip. XLE near stop ($56.15 vs $56.50 market) — diverging from oil; auto-stop should protect.
- **Pattern recognized:** Each API-blocked session loses the entry window on momentum names (AMD ran from $413 → $461 over 3 sessions). For GTC bracket names (PLTR, GLD add), the window stays open longer. Going forward, prioritize GTC brackets over MOO for API-unreliable sessions.

## Setup Performance Tracker
| Setup type | Wins | Losses | Status |
|---|---|---|---|
| ai-momentum-pullback | 0 | 0 | active (TSM open, PLTR pending) |
| macro-hedge | 0 | 0 | active (GLD open — profitable; XLE open — near stop) |
| earnings-reaction-follow | 0 | 0 | AMD entry window CLOSED (price ran away; re-scored below threshold at $460) |
| earnings-reaction-fade | — | — | — |
| breakout-volume | 0 | 0 | BTC failed $82K retest; watching for daily close above $82,320 |
| mean-reversion-oversold | — | — | — |
| sector-rotation | 0 | 0 | active (JPM open — profitable) |
| crypto-flush-rebound | — | — | — |
| candlestick-reversal | — | — | — |

## Strategy Evolution Notes
- **2026-05-01 (init):** Strategy initialized. No deviations.
- **2026-05-04:** First positions opened.
- **2026-05-08:** API blockage causing compounding execution gaps.
- **2026-05-11:** AMD entry window cost: API blocked 3× while AMD ran +11% from original thesis ($413 → $461). This is exactly the "asymmetric error cost" CLAUDE.md describes — sitting on cash through a +11% move on a ≥7-score name. The solution is for the OPERATOR to place orders manually when the API is blocked, or for the infrastructure team to whitelist paper-api.alpaca.markets in the sandbox egress policy. GTC brackets are more robust than MOO in this environment since they stay resting until filled or canceled.

## Next Routine Plan
- **Mid-Morning (11:00 AM ET):** (1) Check XLE — did stop trigger at $56.15? (2) If PLTR/GLD add were manually placed, confirm fills and adjust portfolio state. (3) Watch BTC for daily close above $82,320. (4) Check for new sector opportunities given Iran escalation (energy, defense, gold miners).
- **Daily Review (4:30 PM ET):** Re-score full watchlist. Pre-queue at least 2 GTC brackets for Tuesday open. Assess whether XLE stop-out changes active-bucket allocation.

## Cash Reserve Floor
$10,000 (10%). Current cash ~$80,946 — $70K+ available before hitting floor. PLTR ($4,960) + GLD add ($1,728) fills would consume ~$6,688, leaving ~$74K deployable. Massive deployment gap remains.
