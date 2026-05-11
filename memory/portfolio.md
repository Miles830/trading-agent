# Opus Trader — Portfolio Memory

## Last Updated
2026-05-11 — Daily Review (4:30 PM ET / 20:34 UTC). Alpaca API still blocked ("Host not in allowlist" — Anthropic TLS proxy). All prices estimated from web research. All 6 daytime routines silently failed again. AMD setup (score 7.33, approved May 6) expired — stock ran from $413 → $463 while we sat in cash. XLE near-miss: intraday low $56.24 vs stop $56.15. S&P 500 at all-time high 7,412.84. Portfolio outperformed SPY today (+0.29% vs +0.19%) on NVDA strength.

## Current Account Snapshot
- **Broker:** Alpaca Paper Trading (account PA3TXVEJ19LW)
- **Total Equity (estimated):** ~$100,425
- **Cash:** $80,946 (80.6%)
- **Long Market Value (estimated):** ~$19,479
- **Open Positions:** 6 confirmed (TSM, GLD, NVDA, JPM, XLE, AVGO)
- **Pending Orders / Pre-queue for May 12:** SPY bracket ($735 limit), BA bracket ($238 limit), PLTR bracket ($135 limit) — OPERATOR MUST PLACE TONIGHT
- **API Status:** BLOCKED — "Host not in allowlist" (HTTP 403, Anthropic sandbox TLS proxy). 4th+ consecutive week. All orders must be placed manually.
- **Daytrade Count:** 0

## Bucket State
| Bucket | Target | Current $ (est.) | Current % | Positions |
|---|---|---|---|---|
| Long-term | 55% ($55K) | ~$13,604 | 13.5% | 4 (TSM, NVDA, JPM, AVGO) |
| Active Trading | 30% ($30K) | ~$5,875 | 5.9% | 2 (GLD, XLE) |
| Crypto | 5% ($5K) | $0 | 0% | 0 |
| Cash Reserve | 10% ($10K floor) | ~$80,946 | 80.6% | — |

**Deployment gap:** ~$70K above the 10% floor. Infrastructure failures (silent routines + API block) are the root cause of massive underfillment.

**LT-TECH SUB-CAP WARNING:** LT tech (TSM+NVDA+AVGO) = $10,898 / $13,604 = 80.1% of LT bucket. Once LT bucket ≥ $20K, 60% ceiling becomes HARD. Must add SPY and BA (non-tech) BEFORE adding any more LT tech positions.

## Open Positions (estimated, API blocked — prices from web research May 11 close)
| Symbol | Bucket | Qty | Entry | Stop | Target | Cost basis | Est. Price | Est. P/L | Sector |
|---|---|---|---|---|---|---|---|---|---|
| TSM | long-term | 7 | 401.47 | 353.76 (-12%) | 498.48 (+24%) | $2,810.29 | $405.48 | +$28.07 | Semiconductors |
| GLD | active | 7 | 418.86 | 397.92 (-5%) | — | $2,932.02 | $433.77 | +$104.37 | Precious metals |
| NVDA | long-term | 15 | 198.83 | 175.60 (-12%) | 247.44 (+24%) | $2,982.45 | $221.98 | **+$347.25** | Semiconductors |
| JPM | long-term | 9 | 308.30 | 272.14 (-12%) | 383.47 (+24%) | $2,774.72 | $300.70 | -$68.40 | Financials |
| XLE | active | 50 | 59.01 | 56.15 (-5%) | 65.01 (+10%) | $2,950.50 | $56.78 | -$111.50 | Energy |
| AVGO | long-term | 11 | 418.59 | 368.36 (-12%) | 519.05 (+24%) | $4,604.49 | $430.00 | +$125.51 | Semiconductors |

**🚨 XLE CRITICAL:** Today's intraday low was $56.24 — only $0.09 above the GTC stop at $56.15. US-Iran ceasefire appears to have been reached; thesis (geopolitical-hedge) is reversing. Position is -$111.50 / -3.78% from entry. If Market-Open routine fires tomorrow, evaluate closing XLE at open before stop is hit at a potentially gapped-down price.

**Est. total long market value:** ~$19,479

## Sector Exposure (estimated)
| Sector | Est. $ | Est. % of equity |
|---|---|---|
| Semiconductors (TSM+NVDA+AVGO) | $10,898 | 10.8% |
| Financials (JPM) | $2,706 | 2.7% |
| Precious metals (GLD) | $3,036 | 3.0% |
| Energy (XLE) | $2,839 | 2.8% |
| Cash | $80,946 | 80.6% |

All sectors under 25% global cap. LT-tech sub-cap: 80.1% of LT bucket — exceeds 60% ceiling informally. HARD enforcement begins when LT bucket ≥ $20K (currently $13,604 < $20K → ceiling informational but approaching threshold).

## Performance vs S&P 500
- **Portfolio daily P/L (est.):** +$273 / +0.27%
- **SPY May 11:** $738.40 (+0.19% / S&P 500 index: 7,412.84 — new all-time high)
- **Daily alpha:** +0.08 ppts (NVDA +$254.70 drove outperformance)
- **Cumulative return (est.):** +0.43% ($100,425 / $100,000 initial)
- **SPX since strategy start (~Apr 27):** ~+1.5–2.5% (6 consecutive weekly gains; S&P 500 at all-time highs)
- **Gap vs SPX:** Portfolio lagging ~-1.1 to -2.0 ppts — entirely due to 80% cash position from infrastructure failures. No strategy failures.

## Macro Context (as of 2026-05-11 close)
- **Fed:** April 29 FOMC held at 3.75%. Kevin Warsh confirmation vote expected this week (Fri May 15 is Powell's last day). Warsh = slightly hawkish lean.
- **CPI:** April CPI releases Tuesday May 12 at 8:30 AM ET. Consensus: headline 3.7% YoY, core 2.7% YoY. This is the biggest single catalyst for the week.
- **Iran:** Fragile US-Iran ceasefire appears reached — oil prices fell, XLE sold off to near-stop levels. Strait of Hormuz tensions easing. BAD for XLE, good for inflation.
- **US-China / Trump-Xi summit:** Trump-Xi summit ongoing. Iran focus is delaying tariff/rare-earth discussions. No major new tariff news today.
- **Equities:** S&P 500 at all-time high 7,412.84. Six consecutive weekly gains. AI capex cycle: MU +151% YTD, WDC $480, NVDA $222, AMD $463. NVDA +8.3% today — AI infrastructure demand confirmed.
- **Memory supercycle:** Micron (MU) and Western Digital (WDC) both in AI memory supercycle narrative. MU "eyes $1T market cap club." HBM3E demand structural.
- **PLTR:** $135.22 today (down from $137.80 prev close; still near the $135 approved entry zone). AIP adoption thesis intact.
- **BTC:** $81,224. Opened at $82,164 ("strongest opening in months"). Pulled back intraday. Near $82,320 resistance; needs to clear that for breakout-volume setup.
- **Earnings this week:** CSCO (Wed May 13 AMC, ±8.7% expected move), AMAT (Thu May 14 AMC). Both are AI capex proxies. 48h exclusion applies.

## Active Themes
1. **AI broadening** — NVDA (+11.6% from entry), AVGO (+2.7%), TSM (+1.0%). AMD confirmed at $463, MU at $710 (151% YTD). Memory supercycle thesis validated.
2. **Steeper curve / financials tailwind** — JPM struggling (-2.5% from entry) but thesis intact; may add to LT bucket as non-tech ballast.
3. **Geopolitical hedge REVERSING** — GLD thesis intact (gold near ATH), but XLE thesis is breaking down (Iran ceasefire → oil supply returning). XLE at critical stop level.
4. **Crypto recovery** — BTC at $81K+ support. Near $82,320 breakout level. Crypto bucket 0%; re-enter if BTC confirms breakout above $82,500.
5. **LT deployment push** — Must fill LT bucket from ~14% to ~55% target. Entry order: SPY → BA (non-tech) → PLTR → TSLA → MU/WDC (tech, after sub-cap managed).

## Pending Actions — OPERATOR MUST EXECUTE TONIGHT (before May 12 open)

Pre-queue THREE GTC bracket orders in Alpaca. CPI at 8:30 AM ET Tuesday — use limits 0.5-1% below current, not MOO, so CPI reaction can be absorbed.

1. **SPY** (non-tech LT ballast, FIRST — clears tech sub-cap path): Buy 6 shares GTC bracket, limit $735.00, stop $646.80 (-12%), target $911.40 (+24%)
2. **BA** (non-tech LT anchor, SECOND): Buy 20 shares GTC bracket, limit $238.00, stop $209.44 (-12%), target $295.12 (+24%)
3. **PLTR** (LT tech, THIRD — after SPY+BA provide sub-cap relief): Buy 36 shares GTC bracket, limit $135.00, stop $118.80 (-12%), target $167.40 (+24%)

⚠️ XLE contingency: If XLE opens tomorrow below $56.50 on Iran ceasefire continuation, Market-Open routine should consider a limit-sell at bid (close before stop-hit) to avoid gap-down execution. The thesis is broken.

## Lessons Learned (running log)
- **Week of 2026-04-27 (init):** No trades placed. First-run setup; benchmarking begins next week. Established research baseline. Do not chase late-stage breakouts.
- **2026-05-01 — bias correction (operator-mandated):** Capital in cash earns nothing. Score ≥ 7 = enter at next routine. Only 3 valid skip reasons per CLAUDE.md Deployment Bias.
- **2026-05-04 — remote-routine failure mode discovered:** Cron triggers produced zero commits/orders. Manual session broke the streak.
- **2026-05-05 — silent failure REPEATS:** Heartbeat infra not sufficient. Operator pre-queued brackets saved the day (NVDA, JPM filled). GLD naked stop discovered and fixed.
- **2026-05-06 — API blocked (new failure mode):** Routine ran late AND Alpaca API blocked. Three orders (AMD, PLTR, BTC) documented as attempts; none executed.
- **2026-05-08 — API blocked AGAIN (3rd consecutive):** AMD and PLTR MOO blocked. Operator told to place manually before 9:25 AM ET. No evidence of manual placement.
- **2026-05-11 — All 6 daytime routines silently failed.** AMD setup (score 7.33) expired: stock ran $413 → $463 (+$50/share, $554 missed on 11sh). XLE near-miss: intraday low $56.24 vs stop $56.15. NVDA drove portfolio outperformance today (+8.3% session). **Root lesson: pre-queued GTC brackets are the ONLY reliable defense against silent failures. Must pre-queue every night.**
- **XLE thesis reversal note:** Geopolitical hedge (Iran Hormuz uncertainty) was XLE's entry thesis. Fragile US-Iran ceasefire now appears reached. Thesis is reversing. Consider manual close tomorrow if API becomes available.

## Setup Performance Tracker
| Setup type | Wins | Losses | Status |
|---|---|---|---|
| ai-momentum-pullback | 0 | 0 | active (TSM +28, NVDA +347, AVGO +126 unrealized) |
| macro-hedge | 0 | 0 | active (GLD +104 unrealized; XLE -112 near stop) |
| sector-rotation | 0 | 0 | active (JPM -68 unrealized) |
| earnings-reaction-follow | 0 | 0 | AMD setup expired — never filled (API block). AMD ran $413→$463. |
| breakout-volume | 0 | 0 | BTC watching; needs to clear $82,320 |
| mean-reversion-oversold | — | — | — |
| candlestick-reversal | — | — | — |
| crypto-flush-rebound | — | — | — |

No 3-in-a-row rules triggered (no closed trades). All positions open.

## Agent Calibration Tracker
No closed trades → no realized results. Calibration pending first exits.

## Strategy Evolution Notes
- **2026-05-01 (init):** Strategy initialized per CLAUDE.md. No deviations.
- **2026-05-04:** First positions opened. Strategy unchanged; execution layer needs fixing.
- **2026-05-08:** Three-week persistent API blockage causing compounding execution gaps. Pipeline: AMD 7.33, PLTR 7.33 still valid.
- **2026-05-11:** AMD setup expired ($413 → $463 while we sat in cash). PLTR still actionable at $135. New watchlist built. Memory/AI supercycle names (MU, WDC) added to the LT deployment pipeline. LT-tech sub-cap constraint requires adding non-tech (SPY, BA) first. Prioritizing pre-queue GTC brackets over MOO going forward to defend against silent failures.

## Next Routine Plan
- **Pre-Market (8:00 AM ET May 12):** PRIORITY: (1) Stop-coverage audit; (2) Check if SPY/BA/PLTR GTC brackets triggered pre-open on CPI reaction. (3) Evaluate XLE: if opening below $56.50, consider limit-sell near bid to close before thesis-break becomes larger loss. (4) Confirm AMD is off the active watchlist (setup expired). (5) After CPI print: if cool (below 3.7% headline or below 2.7% core), add TSLA limit buy. If hot (above consensus), hold cash and wait.
- **Market Open (9:45 AM ET):** Confirm any pre-queued bracket fills. If PLTR filled: note cost basis. If XLE stop triggered at open (possible gap-down), record as stop_hit.
- **Daily Review (4:30 PM ET):** Run full review; update setup performance once first exits occur.

## Cash Reserve Floor
$10,000 (10%). Current cash $80,946 — $70,946 available to deploy before hitting floor. SPY+BA+PLTR+TSLA fills would consume ~$18.6K, leaving ~$52K available.
