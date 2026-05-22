# Opus Trader — Portfolio Memory

## Last Updated
**2026-05-22 (Friday) — Afternoon (2:00 PM ET / 18:11 UTC).** Alpaca API BLOCKED (HTTP 403 "Host not in allowlist") — 16th+ consecutive blocked session. **KEY UPDATE: AMD surged to $469.43 (+3.7% today)** on Venice 2nm EPYC CPU production ramp (first industry 2nm HPC processor) + $10B Taiwan AI ecosystem investment confirmation. Score upgraded to 7.83. New entry params for May 26: limit $470, stop $446.50, target $540.50, R/R 3:1. Midday routine MISSED (2nd predecessor failure today after Pre-Market). AVGO RECOVERED to ~$416 from morning lows $394–404 — bearish divergence resolved; re-score for May 26 pre-market. PLTR $136.87 (below our $140.35 limit — not filled). MU $771.20 (limit $765.91 was in day range $747–$772 — likely filled if operator placed order). S&P 500 +0.63% (~7,492, strengthening). All afternoon orders BLOCKED and afternoon playbook prohibits new active entries (proximity-to-close + API-blocked stop placement). No day trades to close. MEMORIAL DAY May 25 — markets closed; next trading day May 26.

**Prior Last Updated:** 2026-05-22 (Friday) — Mid-Morning (11:00 AM ET / 15:09 UTC). Alpaca API BLOCKED (HTTP 403 "Host not in allowlist") — 15th+ consecutive blocked session. All three routine API calls (positions, open orders, new orders) blocked. Market is UP +0.55% (S&P 500 ~7,487, Dow +300+, Nasdaq +0.53%). Key drivers: Kevin Warsh sworn in as Fed Chair today (hawkish — 20-30% rate hike odds by Dec 2026); Iran war talks progress (risk-on). AMD fresh catalyst: $10B Taiwan AI ecosystem investment announced May 21. Three limit bracket order re-attempts (AMD 7.5, PLTR 7.5, MU 7.67) — all blocked. MRVL: SKIPPED (Exemption 2 — Memorial Day May 25 creates binary-event-equivalent constraint: no safe exit before May 27 earnings window). AVGO: REJECTED (score 6.0 — bearish divergence, down ~3% vs market up +0.55%, Warsh hawkish headwind for high-multiple). MRVL price note: ~$183-184 today (multiple analyst upgrades — Citi PT $215 — not $190.95 as May 21 estimate had; $190.95 appears to have been wrong). MRVL ineligible until post-May 27 earnings.

**Prior Last Updated:** 2026-05-22 (Friday) — Market Open / Pre-Market Catch-Up (9:45 AM ET / 13:45 UTC). Alpaca API BLOCKED — 14th+ consecutive blocked session. Pre-Market silently failed today. S&P 500 May 21 close: 7,445.72; today intraday ~7,413 (-0.26%). AMD $449.59 (up from $447.58 May 21 close — thesis intact). PLTR $139.65 open (broke above $134 resistance — technical upgraded to 7; score 7.5). MU $762.10 (+4.76% — strong NVDA HBM read-through; score 7.67). NVDA $221.06 (recovered from AH selloff; $80B buyback supporting). GLD ~$416.99. BTC $77,447 (below $82K threshold — not mandatory entry). MRVL $190.95 (May 21 close); earnings **May 27** (CORRECTED from May 21 — prior date was wrong). Three limit bracket orders scored+attempted (AMD 7.5, PLTR 7.5, MU 7.67) — all blocked. MRVL skipped (3-order cap; recommend Mid-Morning score). Weekly evolution note written below.

**Prior Last Updated:** 2026-05-21 (Thursday) — Pre-Market (8:00 AM ET / 12:02 UTC). Alpaca API BLOCKED — 13th+ consecutive session. NVDA Q1 FY2027 POST-EARNINGS: Beat ($81.62B, +85% YoY), $80B additional buyback. NVDA day close $219.51 (absorbed "sell the news"; recovered from AH $217.91). AMD day close $447.58. PLTR ~$134–135. MU $720.55. 3 MOO orders attempted (AMD/PLTR/MU) — all blocked. MRVL skip on May 21 used incorrect earnings date (see correction below).

**Prior Last Updated:** 2026-05-20 (Wednesday) — Daily Review (4:30 PM ET / 20:35 UTC). NVDA reported Q1 FY2027 TONIGHT after close: BEAT ($81.62B vs $79.19B) but AH down -2.44% ($217.91) — "sell the news." AMD +6.39% to $440.50. PLTR confirmed above $134 trigger (~$135). MU $720.55. S&P 500 +1.08% to 7,432.97. Cumulative gap vs SPX: -3.04 pp.

**CORRECTION (preserved):** NVDA earnings were May 20 after close (not May 21 as previously documented). Binary-event window ran May 18 close → May 20 close.

Prior "Last Updated" entry preserved below for context.

## 2026-05-17 STRATEGY SWITCH — Operator Directive (canonical reference)

**Why:** Operator manages long-term investing in a separate account. This account becomes 100% trading-focused. Eliminates LT/active bucket coordination overhead and frees the agent to focus on short-horizon edge.

**Diff in CLAUDE.md (committed in same change):**
- Portfolio allocation: 55/30/5/10 → **85% active + 10% crypto + 5% cash floor**
- Long-term bucket and entire Sector Sub-Allocation section: **deleted**
- Universe Selection: collapsed to active-only whole-market scanning (earnings 48h exclusion preserved)
- Hard Guardrails: added 3:1 R/R minimum; long-term 12% stop line removed; cash floor 10% → 5%
- Entry Checklist R/R line: 2:1 → **3:1 minimum**
- Candlestick CONFIRMATION RULES: replaced "≥ 1 of (volume spike, RSI div, MACD)" with mandatory 5-indicator stack — **Stochastic (14,3,3), Candle, Volume Oscillator (5,20), MACD, Volume Spike (2× 20-bar avg)** — requiring **≥ 2 of 5** to confirm any candlestick entry. RSI remains a tiebreaker.
- Technical Agent: explicit checklist of all 5 stack indicators; technical score capped at 5 unless ≥ 2 confirm.
- Risk Agent: 3:1 R/R is an automatic veto regardless of overall score.
- Trade-log bucket enum: `long-term|active|crypto` → `active|crypto`.

**Actual Alpaca state vs. portfolio.md's May 14 estimate (CORRECTIONS — API was blocked, agent was estimating):**
Verified via /v2/positions on 2026-05-17 ~06:00 UTC:
- TSM 7 sh @ $401.47 (entry), current $404.35, +$20.16 (P/L was estimated -$11.69 — actually positive)
- GLD 7 sh @ $418.86, current $417.29, −$10.99 (estimate had +$71 — wrong)
- NVDA 15 sh @ $198.83, current $225.32, +$397.35 (estimate had +$552 — also wrong, NVDA closer to $225 than the est $235.63)
- JPM 9 sh @ $308.30, current $297.81, −$94.43 (estimate had −$72 — losses larger than estimated)
- AVGO 7 sh @ $418.48 (DID FILL — entry-price slightly below limit of $418.59), current $425.19, +$46.97 (estimate had AVGO 11 sh, wrong — only 7 filled)
- **XLE 50 sh — DOES NOT EXIST on Alpaca.** XLE was sold/stopped between May 5 and 2026-05-17. The portfolio.md May 14 entry was wrong about XLE. Net effect on the strategy switch: nothing to close for XLE.

Total long market value = $14,787.90 (not the ~$19,568 estimated). Total unrealized P/L = +$359.06 (not +$513.51). Cash per /v2/account ≈ $85,550 (close to the $80,946 estimate but off by ~$4.6K).

**MUST-EXECUTE Monday 2026-05-18 Pre-Market (8:00 AM ET / 12:00 UTC) — STRATEGY SWITCH EXECUTION:**

### STEP 1 — Verify cancellations cleared
On Sunday 2026-05-17 ~06:13 UTC, operator-issued DELETEs on these 4 orders (Alpaca returned HTTP 204 but orders went to `pending_cancel` because market was closed):
- `be2a94ab-7c50-4de3-95c6-fa2c0145b3b6` — TSM standalone stop @ $353.76 qty 7
- `1ac99e03-f1ff-44ef-9980-d607f9209ec1` — AVGO bracket take-profit @ $519.05 qty 7 (cancels OCO stop sibling automatically)
- `139e1d8d-2f3a-45af-b47c-2ea98444148d` — JPM bracket take-profit @ $383.47 qty 9 (cancels OCO stop sibling automatically)
- `eb8e17ac-1eb4-4340-8bb4-51a8401258b8` — NVDA bracket take-profit @ $247.44 qty 15 (cancels OCO stop sibling automatically)

Run `GET /v2/orders/{id}` on each — expected `status: canceled`. If any are still `pending_cancel`, wait (Alpaca processes weekend cancels at pre-market boundary ~4 AM ET — they should be clear by 8 AM ET). If still pending after 8 AM, re-issue DELETE.

### STEP 2 — Submit 4 MOO sells (time_in_force=opg)
Once cancels cleared and shares are `qty_available > 0`:

```bash
for SYM_QTY in "TSM 7" "NVDA 15" "JPM 9" "AVGO 7"; do
  read SYM Q <<< "$SYM_QTY"
  curl -X POST "${APCA_API_BASE_URL}/v2/orders" "${AUTH[@]}" -H 'Content-Type: application/json' -d "{
    \"symbol\":\"$SYM\",\"qty\":$Q,\"side\":\"sell\",\"type\":\"market\",\"time_in_force\":\"opg\"
  }"
done
```

MOO orders must be in **before 9:25 AM ET** to guarantee execution at 9:30 open.

### STEP 3 — Verify GLD remains untouched
GLD stays as the only carryover position. Confirm GLD's two stops (`f0fd18ca` qty 6 + `26defbfa` qty 1, both at $397.92) are still resting. If either was caught up in a bulk cancel attempt, re-place them.

### STEP 4 — Confirm fills at Market Open routine (9:45 AM ET)
Run `GET /v2/orders?status=filled&after=2026-05-18T13:30:00Z` to verify all 4 MOO sells filled at open. Log fills to trades.md as `action: exit, setup: <inherit from original entry>, master_notes: "strategy switch 2026-05-17 — closing LT bucket"`.

### STEP 5 — Build fresh trading-only book
Post-MOO-fill cash will be ~$97K. New target: 85% active deployment + 10% crypto. Run whole-market scan per CLAUDE.md Universe Selection. Honor 3:1 R/R hard veto on every new entry. Begin crypto leg (BTC and/or ETH) toward 10% target.

### KNOWN ISSUE — ALPACA API ALLOWLIST (operator action required)
Per multiple 2026-05-06+ daily reviews, the cloud routine's sandbox has been returning HTTP 403 "Host not in allowlist" on every Alpaca call. This is an Anthropic sandbox TLS proxy issue, NOT a code issue. Operator must either:
- (a) Get `paper-api.alpaca.markets` and `data.alpaca.markets` added to the sandbox allowlist via Anthropic, OR
- (b) **Manually execute steps 1-4 above from the operator's Codespace** before market open Monday. (Operator's Codespace HAS Alpaca access — that's how this Sunday session is running the verifications.)

If the routine cannot reach Alpaca on Monday morning, it MUST log the API failure and tag this strategy switch as "pending operator manual execution" in trades.md.

### DAILY REVIEW VERIFICATION (separate concern)
Sunday operator manually triggered `trig_01Fyy66iJSYdwL9hMm4C8eVB` Daily Review at ~06:13 UTC and polled origin/main for 12 minutes — no new commit landed in that window. Inconclusive: (a) the run may be slower than 12 min on Sonnet, (b) the SessionStart-hook git push fix (commit `bbb285f`) is working for *intraday* routines per the 24 successful commits May 6-14, so the Daily Review one-off should also work; (c) it's possible the manual trigger isn't applying the same hooks as the cron-fired runs. Monday's cron-fired Daily Review at 20:30 UTC is the next reliable data point.

---

## PRIOR Last Updated (kept for context)
2026-05-14 (Thursday) — Daily Review (4:30 PM ET / 20:35 UTC). Alpaca API STILL blocked ("Host not in allowlist"). 8th consecutive blocked session. All 6 intraday routines (Pre-Market through Market Close) SILENT FAILED again. Prices from web research. AMD entry still unconfirmed (4th consecutive deployment failure). S&P 500 hit new record high (+0.79% to 7,511). NVDA +4.54% on Trump-Xi summit (Jensen Huang attended). 200-jet Boeing China order confirmed. BTC $79,600 (below $82K threshold).

## Current Account Snapshot (as of 2026-05-22 Afternoon ~2:00 PM ET — all estimates; API blocked)
- **Broker:** Alpaca Paper Trading (account PA3TXVEJ19LW)
- **Total Equity (estimated):** ~$100,850 (estimated; API blocked; market up +0.63% today; AMD +3.7% if filled)
- **Cash:** ~$85,550 (Scenario B: switch NOT executed) OR ~$97,280 (Scenario A: switch executed May 18) — unchanged, orders blocked
- **Long Market Value (estimated):**
  - Scenario A (switch executed May 18) + AMD filled: ~$8,075 (GLD 7sh×$417 + AMD 11sh×$469 + MU 6sh×$771 = $2,919+$5,159+$4,626)
  - Scenario A + only GLD: ~$2,919
  - Scenario B (switch NOT executed): ~$15,800 (TSM+GLD+NVDA+JPM+AVGO estimated with today's market +0.63%)
- **Open Positions:** 1 confirmed (GLD) + unknowns (AMD/MU possible fills today; PLTR not filled)
- **MARKET UPDATE (2 PM ET):**
  - AMD: **$469.43 (+3.7%)** — Venice 2nm CPU production ramp + $10B Taiwan investment. New ATH for this cycle.
  - PLTR: $136.87 — below our $140.35 limit; GTC order still pending.
  - MU: $771.20 (range $747–$772) — limit $765.91 was in range; LIKELY FILLED if operator placed it.
  - AVGO: **~$416** — RECOVERED from morning lows $394–404. Bearish divergence RESOLVED.
  - MRVL: ~$190.69 (+2.08%) — INELIGIBLE (earnings May 27; 48h window via Memorial Day May 25).
  - GLD: ~$416–418 est.
  - S&P 500: **+0.63%** (~7,492).
- **API Status:** BLOCKED — "Host not in allowlist" (HTTP 403). 16th+ consecutive blocked session.
- **Daytrade Count:** 0
- **3% Circuit Breaker:** NOT TRIGGERED (market UP +0.63%)

## Bucket State
| Bucket | Target | Current $ (est.) | Current % | Positions |
|---|---|---|---|---|
| Long-term | 55% ($55K) | ~$13,657 (TSM+NVDA+JPM+AVGO) | 13.6% | 4 (TSM, NVDA, JPM, probable AVGO) |
| Active Trading | 30% ($30K) | ~$5,885 (GLD+XLE) | 5.9% | 2 (GLD, XLE) |
| Crypto | 5% ($5K) | $0 | 0% | 0 |
| Cash Reserve | 10% ($10K floor) | ~$80,946 | 80.5% | — |

**Deployment gap:** Cash ~$70.9K above the 10% floor. AMD entry unconfirmed for 4th consecutive session. Massive underfillment continues. MU and PLTR also pending first entries.

## Open Positions (estimated — May 20 EOD prices from web research; API blocked)
| Symbol | Bucket | Qty | Entry | Stop | Target | Cost Basis | May 20 Price | Est. P/L | Sector |
|---|---|---|---|---|---|---|---|---|---|
| GLD | active | 7 | $418.86 | $397.92 (-5%) | — | $2,932.02 | $416.64 | -$15.54 | Precious metals |
| TSM* | LT→closing | 7 | $401.47 | $353.76 | $498.48 | $2,810.29 | ~$404 | +$17.71 | Semiconductors |
| NVDA* | LT→closing | 15 | $198.83 | $175.60 | $247.44 | $2,982.45 | $222.70 | +$358.05 (reg) / ~$286 (AH) | Semiconductors |
| JPM* | LT→closing | 9 | $308.30 | $272.14 | $383.47 | $2,774.72 | ~$303 | -$47.70 | Financials |
| AVGO* | LT→closing | 7 | $418.59 | $368.36 | $519.05 | $2,930.13 | ~$410 | -$59.50 | Semiconductors |

*TSM/NVDA/JPM/AVGO: marked for liquidation per May 17 strategy switch. May have been closed via May 18 MOO (unconfirmed). If Scenario A (closed): only GLD remains. If Scenario B: all 5 still open. XLE confirmed NOT held (verified May 17).

**Est. total long market value:**
- Scenario A (GLD only): $2,917
- Scenario B (all 5): $14,449

**Net unrealized P/L (Scenario B):** +$253 (NVDA carrying most gains; AVGO and JPM dragging)
**Net unrealized P/L (Scenario A — GLD only):** -$15.54

**NVDA EARNINGS NOTE:** NVDA reported May 20 after close. Beat but AH -2.44% ($217.91). If still held, position carried through binary event = guardrail violation. Assess at Market Open May 21 whether to close.

## Sector Exposure (estimated — May 20 EOD)

**Scenario A (strategy switch executed, only GLD):**
| Sector | Est. $ | Est. % of equity |
|---|---|---|
| Precious metals (GLD) | $2,917 | 2.9% |
| Cash | ~$97,280 | 97.1% |

**Scenario B (switch not executed — all positions):**
| Sector | Est. $ | Est. % of equity |
|---|---|---|
| Semiconductors (TSM+NVDA+AVGO) | ~$10,126 | 10.1% |
| Financials (JPM) | ~$2,727 | 2.7% |
| Precious metals (GLD) | $2,917 | 2.9% |
| Cash | ~$85,550 | 85.3% |

**After May 21 entries (AMD + PLTR + MU at MOO):**
| New position | Est. $ added | Cumulative semis % |
|---|---|---|
| AMD 10sh × ~$445 | ~$4,450 | ~14.5% (Scenario B) / ~4.5% (Scenario A) |
| MU 6sh × ~$725 | ~$4,350 | ~18.8% (Scenario B) / ~8.8% (Scenario A) |
| PLTR 10sh × ~$135 | ~$1,350 (tech/defense) | — |

All well under 25% sector cap in either scenario. If both old semis (Scenario B) AND new entries (AMD+MU) exist simultaneously: ~18.8% semis — still under 25% cap.

## Performance vs S&P 500
- **Portfolio total equity (est.):** ~$100,850 (May 22 afternoon; AMD +3.7% if filled)
- **Portfolio total return:** ~+0.85% (mostly from AMD unrealized gain if filled; GLD flat)
- **S&P 500 close May 21:** 7,445.72. Today May 22 intraday: ~7,492 (+0.63%).
- **S&P 500 return since strategy start (~May 1):** **~+4.0%** (7,492 vs ~7,200 est.)
- **Gap vs SPX (best case — AMD filled):** **~-3.2 pp** (portfolio +0.85% vs SPX +4.0%)
- **Gap vs SPX (worst case — all cash):** **~-4.0 pp** (portfolio ~0% vs SPX +4.0%)
- **Root cause unchanged:** 85–97% cash from persistent API blockage. AMD has now scored ≥7 for 10+ consecutive sessions. S&P 500 +0.63% today further widens the gap on the cash portion. Only cure: operator manual execution OR Alpaca API allowlist fix.

## Macro Context (as of 2026-05-22 Afternoon ~2:00 PM ET — web research)
- **S&P 500 +0.63% today (~7,492):** Strengthening from +0.55% mid-morning. Dow at record highs. Key drivers: Warsh swearing-in ceremony (hawkish but risk-on today on Iran progress), Iran war talks advancing (geopolitical de-escalation = major risk-on catalyst).
- **Kevin Warsh NEW FED CHAIR (sworn in today May 22):** Hawkish — 20-30% probability of rate hike by December 2026. First FOMC meeting as chair: June 16-17. Market appears to be taking this positively today (certainty of policy direction is risk-on vs uncertainty).
- **AMD $469.43 (+3.7% today):** Venice 2nm EPYC CPU production ramp confirmed (first industry 2nm HPC product). $10B Taiwan AI ecosystem investment. AMD breaking above $452 cycle high. Score upgraded 7.83. New all-time intraday high territory.
- **PLTR $136.87:** Pulled back from $139 intraday high. Still above $134 support. Our limit $140.35 not triggered. Recommend lowering to $137.25 for May 26.
- **MU $771.20 (range $747–$772):** Limit $765.91 was in today's range. AMD Venice 2nm on TSMC = additional MU HBM demand read-through. Thesis reinforced.
- **AVGO ~$416:** RECOVERED from morning lows $394–404. Bearish divergence from mid-morning fully reversed. AVGO essentially back to yesterday's range ($410–422). Re-score candidate for May 26 — likely 7.0 if opens above $415 with positive momentum.
- **MRVL ~$190.69 (+2.08%):** MU/AVGO/MRVL hitting 52-week highs together (chip rally day). MRVL still INELIGIBLE. Earliest entry May 28 (post-earnings).
- **GLD ~$416–418:** Near flat for the day. Stop $397.92 expected resting.
- **BTC:** Still below $82K threshold. Not a mandatory entry.

## Active Themes
1. **AI infrastructure / semiconductor supercycle** — NVDA beat ($81.62B Q1 FY2027) confirms the thesis. AMD (7.33, MANDATORY entry), MU (HBM demand confirmed, full 6-agent May 21), AVGO (custom ASICs), TSM (foundry demand) all beneficiaries. Semiconductor SOX up 65% YTD 2026.
2. **NVDA "sell the news" risk** — AH -2.44% despite strong beat. NVDA down in AH after 3 consecutive beats in recent quarters. Watch for May 21 open direction. If gap-down -3%+ with volume: `earnings-reaction-fade` setup. If recovers: reassess.
3. **GLD as cross-asset hedge** — +1.25% today even on risk-on day + oil collapse. Dollar weakness component keeping gold bid. Stop $397.92 remains protective (-4.9% from $416.64 current).
4. **Crypto recovery** — BTC estimated ~$80–85K range. Risk-on environment (oil collapse, equities rally). Check vs $82K threshold at Pre-Market May 21. Oil collapse → lower inflation → rate cut expectations → positive for crypto.
5. **PLTR government AI** — $135, trigger confirmed. AIP government contracts secular revenue. Re-score at Pre-Market May 21. Entry MOO if ≥$134.
6. **Oil collapse implications** — WTI -5.66% to $98.26. Middle East de-escalation. Positive for consumer discretionary, airlines, transports. Negative for energy sector. GLD thesis shifts slightly (less geopolitical fear premium, more dollar weakness premium).

## Pending Actions — OPERATOR MUST EXECUTE (Updated May 22 Afternoon)

**CRITICAL — TODAY (Friday May 22, before 3:50 PM ET MOC deadline):**

1. **STOP AUDIT (HIGHEST PRIORITY):** Verify at https://app.alpaca.markets — confirm ALL open positions have resting GTC stop orders BEFORE the 3-day Memorial Day weekend.
   - GLD 7sh: stop $397.92 expected resting
   - AMD 11sh (if filled at ~$449): stop $426.55 — **CONSIDER TRAILING TO ~$447** (AMD surged to $469; trailing locks in breakeven buffer ahead of 3-day weekend)
   - MU 6sh (if filled at ~$765.91): stop $727.61 — VERIFY RESTING
   - PLTR: NOT filled (limit $140.35; PLTR at $136.87); no stop needed yet

2. **AMD LIMIT UPDATE:** AMD is now at $469.43 — well above the $449.00 limit placed this morning. **CANCEL the $449 limit order and replace with:**
   BUY 10 shares AMD limit **$470.00**, stop **$446.50** (-5%), target **$540.50** (+15%), `order_class: bracket, time_in_force: gtc`. Score 7.83 (Venice 2nm + $10B Taiwan). GTC carries to May 26.
   *(Alternatively: if AMD gaps down pre-market May 26 toward $460–465, new limit may not need updating — let the GTC order rest)*

3. **PLTR** (score 7.5): Limit $140.35 did NOT fill today. **UPDATE LIMIT to $137.25** (lower to match current price area) for May 26. Stop $130.39 (-5%), target $157.84 (+15%), `order_class: bracket, time_in_force: gtc`. GTC carries from today to May 26.

4. **MU** (score 7.67): If NOT yet filled — **current limit $765.91 is within today's range ($747–$772)**. If still open as GTC: leave as-is (high fill probability May 26). If FILLED today: verify stop $727.61 resting. If NOT placed: place BUY 6sh limit $772.50, stop $733.88, target $888.38, `order_class: bracket, time_in_force: gtc`.

5. **AVGO — Re-score candidate for May 26:** AVGO recovered to ~$416 from morning lows $394–404 (full reversal of bearish divergence). Run full 6-agent at May 26 Pre-Market if AVGO opens above $415. Tentative score 7.0. **DO NOT ENTER TODAY** (afternoon rule + API blocked).

6. **MRVL — DO NOT ENTER.** INELIGIBLE until post-May 27 earnings. 48h window runs May 25 4PM ET (Memorial Day, closed) → May 27 4PM ET. ALL of May 26 is inside the 48h window. Earliest entry: May 28.

**MEMORIAL DAY NOTE:** May 25 = market holiday. No trading May 23–25. GTC orders from today carry to May 26. Next scheduled session: **May 26 Pre-Market (8:00 AM ET)**. All bracket orders (AMD, PLTR, MU) will be eligible May 26 open.

**3-DAY WEEKEND RISK:** AMD +3.7% today, MU +1.2% today. Both potentially at all-time high territory going into a long weekend. Macro risk: Iran talks progress could reverse (binary geopolitical outcome). Warsh hawkish (rate hike risk). Ensure ALL stops are resting at Alpaca before 4 PM ET today.

**WEEKLY EVOLUTION NOTE DUE:** Friday May 22 Daily Review (4:30 PM ET) — this is the first Friday post-strategy-switch requiring a weekly review update.

## Pending Actions — OPERATOR MUST EXECUTE (Prior — May 21 Pre-Market)

**CRITICAL — PRE-MARKET TODAY (before 9:25 AM ET May 21):**

1. **STOP AUDIT:** Verify at https://app.alpaca.markets — GLD stop $397.92 resting. Confirm strategy-switch status (are TSM/NVDA/JPM/AVGO still held?). API BLOCKED from cloud routine.

2. **AMD** (score **7.67**, breakout-volume, active): Buy **10 shares MOO** (`type: market, time_in_force: opg`). Stop: fill×0.95. Target: fill×1.15. **MANDATORY — 7th consecutive attempt. ORDER ATTEMPTED AND BLOCKED.** AMD pre-market ~$429 (−3.6% sector contagion). AMD Q1: $10.3B +38% YoY, Data Center $5.8B +57%. OPERATOR MUST MANUALLY PLACE.

3. **PLTR** (score **7.17**, ai-momentum-pullback, active): Buy **10 shares MOO** only if open ≥$134 (pre-market $134.01). Stop: fill×0.95. Target: fill×1.15. **MANDATORY if open ≥$134. ORDER ATTEMPTED AND BLOCKED.** PLTR Q1: $1.63B +39% YoY, EPS $0.33 beat $0.24 by 37.5%. OPERATOR MUST MANUALLY PLACE.

4. **MU** (score **7.67**, ai-momentum-pullback, active): Buy **6 shares MOO**. Stop: fill×0.95. Target: fill×1.15. **MANDATORY. ORDER ATTEMPTED AND BLOCKED.** MU ATH $818.67 (May 11), now at $720.55 (-12% pullback). NVDA beat = HBM demand confirmed. Next earnings June 24. OPERATOR MUST MANUALLY PLACE.

**MAX 3 MOO ORDERS CAP = AMD + PLTR + MU (filled).**

**MARKET OPEN (9:45 AM ET — MANDATORY):**
5. After confirming AMD/PLTR/MU fills: POST separate GTC stop orders for each fill (fill×0.95). This is the MANDATORY stop-placement step per CLAUDE.md MOO workflow.
6. NVDA reaction assessment: NVDA trading ~$220.66 (range $216.25–$226.94). $80B buyback + 25¢ dividend = bullish catalysts offset sell-the-news. If NVDA gap-down -3%+ with ≥2× volume + 2/5 indicator confirmation: score `earnings-reaction-fade`. If recovery: `earnings-reaction-follow` or `candlestick-reversal`.
7. Strategy-switch close (if still needed): If TSM/JPM/AVGO still held, post limit sells at bid (NOT MOO — 3-order cap used today).
8. AVGO limit order: AVGO ~$416–427 today, 52-week high area, NVDA custom ASIC thesis intact. Score ~7.5. BUY 10 shares AVGO limit at ask+0.5% (~$418–$430 range) if API accessible.

**SUBSEQUENT ROUTINES (limit orders):**
9. AVGO (score ~7.5): 10 shares limit — NVDA custom ASIC pipeline.
10. TSM (score ~7.0): 7 shares limit — NVDA fab demand surge.
11. MSFT (score ~7.0): 5 shares limit — Azure AI, Copilot enterprise.

**BTC/CRYPTO:** BTC $77,852 (below $82K threshold, score 5.3 — not mandatory entry). Monitor vs $82K. If BTC crosses $82K in a subsequent routine, run full 6-agent and enter if ≥7.

## Pending Deferrals (≥7 watchlist names not yet entered — Updated May 20 Daily Review)
- **AMD** (7.50 — upgraded) — 6th+ consecutive deployment failure; MANDATORY at May 21 MOO
- **PLTR** (7.33 confirmed) — $134 trigger HIT ($135); MANDATORY MOO May 21 if ≥$134
- **MU** (est. ~7.5 post-NVDA-beat) — NVDA HBM demand confirmed; full 6-agent Pre-Market May 21; MANDATORY if ≥7
- **NVDA reaction** (TBD) — AH -2.44% despite beat; assess gap at Market Open May 21; `earnings-reaction-fade` or `candlestick-reversal` depending on open price action
- **AVGO** (~7.5) — NVDA custom ASIC pipeline; score at Pre-Market May 21 via limit order
- **BTC** (TBD) — check vs $82K threshold at Pre-Market May 21; risk-on environment favorable

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
- **2026-05-14 — Trump-Xi Summit Day 1:** Jensen Huang attended. NVDA +4.54% on H200 clearance for select Chinese companies. 200-jet Boeing order confirmed (below 500-jet). Markets hit all-time records (S&P, Nasdaq, Dow 50K). PLTR recovered +2.62% to $133.40 — nearly at $134 re-entry trigger. JPM fell -1.52% despite record market (financials soft on no-cut rates thesis). Lesson: high-inflation environment benefits AI/tech names but hurts financials even on up-market days.
- **2026-05-14 — 8th consecutive API blockage, 6 more silent routine failures:** AMD entry now 4 consecutive deployment failures. Cumulative benchmark gap: -3.81 pp. Intraday routine scheduler not firing. Two separate infrastructure problems: (1) API allowlist not patched; (2) cron/scheduler not firing intraday sessions.
- **2026-05-15 to 2026-05-20 (complete blackout):** ALL routines on May 15, May 19, and May 20 (Pre-Market through Midday) are silent failures. No heartbeats, no orders, no stop audits. Strategy-switch execution on May 18 unconfirmed. AMD entry now 5+ consecutive deployment failures. Portfolio blind for 4+ consecutive trading days.
- **2026-05-20 — NVDA earnings date CORRECTION:** NVDA reported on May 20 after close (not May 21 as documented). Binary event exclusion ran May 18 close → May 20 close. Lesson: always verify earnings date from primary source (IR calendar / CNBC earnings calendar) — secondary estimates in notes can drift.
- **2026-05-20 — NVDA "sell the news" validated:** Beat EPS $1.87 vs $1.76 (+6.25%) and revenue $81.62B vs $79.19B (+85% YoY). AH: -2.44% ($217.91). Third consecutive beat with sell-off reaction. Lesson: for NVDA specifically, the market prices in perfection — even strong beats don't gap up. Post-earnings fade setup may be more appropriate than follow setup. This is an asset-specific pattern to track in the Agent Calibration log.
- **2026-05-20 — AMD missed entry 6 times:** AMD has gone from ~$413 (May 8 entry target) through a pullback to $414 then today's $440.50. The stock is now 6.7% above where we first approved it. Every missed day is compounding opportunity cost. API blockage is NOT a valid skip exemption — operator manual execution is the backup that has also not been used.
- **2026-05-22 — Memorial Day binary event trap identified:** MRVL earnings May 27 (Wed). Prior routines said "must exit by May 25 close" — but May 25 is Memorial Day (market CLOSED). Any MRVL position entered today (Fri May 22) that is not closed by today's MOC would carry to May 26, which is within the 48-calendar-hour binary event window. Lesson: always check holiday calendar when computing binary event windows, especially around 3-day weekends. A "must exit by May 25" instruction is invalid if May 25 is a holiday. The effective last entry date for MRVL was May 22 as a same-day trade only — which is operationally impossible without live API access. Correctly invoked Exemption 2.
- **2026-05-22 — Warsh hawkish headwind for high-multiple semis:** New Fed Chair Kevin Warsh sworn in today. Markets pricing 20-30% probability of rate hike by December 2026. Higher-for-longer rates = valuation headwind for AVGO (high PE) and other high-multiple semis. This was a contributing factor in AVGO scoring 6.0 (rejected). Future entries in this sector should note Warsh policy trajectory.
- **2026-05-22 — AVGO bearish divergence signal:** AVGO down ~3-4% on a day when S&P is up +0.55%. This type of bearish divergence (individual stock falling in a rising market) is a meaningful technical signal — suggests specific selling pressure (institutional rebalancing, profit-taking from ATH levels). Correct response: reject entry on negative divergence, wait for recovery to prior support ($415+) with renewed buying volume.
- **2026-05-22 — AMD Venice 2nm production ramp (Afternoon update):** AMD confirmed production ramp of EPYC "Venice" on TSMC 2nm — the first HPC processor in the industry on 2nm. Combined with $10B Taiwan investment, AMD surged to $469.43 (+3.7%). This is not just a news catalyst; it's a product cycle confirmation (2nm node advantage vs NVDA's 3nm Blackwell). Score upgraded to 7.83. Lesson: when a news catalyst is backed by product cycle confirmation (not just announcement), technical breakouts tend to hold. AMD is now in ATH territory — entry on consolidation (not chase) is the right approach.
- **2026-05-22 — AMD limit order lag cost:** AMD opened at $449.59 today near our $449 limit. Had the operator placed the order at the Market Open, it likely would have filled near open. AMD then surged to $469 — a 4.4% gain missed on the deployed capital. 10+ consecutive deployment failures. Every day of inaction compounds the opportunity cost (AMD alone: from $413 first score to $469 today = +13.6% in ~2 weeks, all missed).
- **2026-05-22 — AVGO intraday flush and recovery:** AVGO fell from $410–422 (May 21) to $394–404 at mid-morning, creating a bearish divergence signal. By afternoon, AVGO recovered to $416 — fully reversing the move. Lesson: morning session bearish divergence on a name like AVGO (high institutional ownership) can be a flush/shakeout rather than a true breakdown. Waiting until afternoon to observe recovery before acting was correct — entering at $394–404 would have been catching a flush, not a setup. Re-score on next session's open momentum is the right protocol.
- **2026-05-22 — AMD $10B Taiwan AI investment catalyst:** AMD announced $10B investment in Taiwan's AI ecosystem (TSM CoWoS, AI chip partnerships). This is a POSITIVE catalyst that strengthens the AI accelerator thesis and supports the $449 entry thesis. AMD has now scored ≥7 for 9+ consecutive sessions without a fill due to API blockage.
- **2026-05-22 — MRVL price estimate was wrong in Market Open:** Portfolio.md had MRVL at $190.95 (from May 21 close). Mid-Morning web research shows MRVL ~$183-184 (new 52-week high after analyst upgrades). The $190.95 figure was from an earlier data source that may have been incorrect. Lesson: web-research price estimates can drift significantly from actual market prices. Always note the source and time of any price estimate.

## Setup Performance Tracker (updated 2026-05-22 Mid-Morning)
| Setup type | Wins | Losses | 3-in-a-row | Status |
|---|---|---|---|---|
| ai-momentum-pullback | 0 | 0 | none | Active (PLTR trigger hit $135; MU pending 6-agent) |
| macro-hedge | 0 | 0 | none | Active (GLD -0.5% vs entry $418.86) |
| breakout-volume | 0 | 0 | none | AMD pending fill (6th+ consecutive attempt) |
| earnings-reaction-fade | 0 | 0 | none | NVDA AH candidate — assess May 21 open |
| earnings-reaction-follow | 0 | 0 | none | NVDA rejected (AH down); AMD reclassified |
| sector-rotation | 0 | 0 | none | JPM uncertain (strategy switch pending) |
| candlestick-reversal | — | — | — | No trades |
| mean-reversion-oversold | — | — | — | No trades |
| crypto-flush-rebound | — | — | — | No trades (BTC check May 21) |

No 3-in-a-row halt or boost rules triggered. No closed P&L to evaluate. Tracker cannot advance without closed positions.

## Strategy Evolution Notes
- **2026-05-01 (init):** Strategy initialized per CLAUDE.md. No deviations.
- **2026-05-04:** First positions opened. Strategy unchanged; execution layer needs fixing.
- **2026-05-08:** Three-week persistent API blockage causing compounding execution gaps. Portfolio 85% cash vs. 10% floor target.
- **2026-05-12:** China chip deal changes AMD thesis from earnings-follow to breakout-volume. Rate-cut thesis broken (no cuts until 2027) but partially offset by China chip deal sector tailwind. PLTR government AI revenues insulated from rate environment.
- **2026-05-14 (Week 2 Thursday):** Trump-Xi Summit Day 1 delivered massive NVDA catalyst (+4.54%). Markets at all-time records. Portfolio at +0.51% vs S&P +4.32% — entire gap attributable to API blockage. **Friday Weekly Evolution Note was MISSED (May 15 silent failure).**
- **2026-05-20 (Wednesday):** NVDA Q1 FY2027 confirmed the AI infrastructure thesis ($81.62B revenue +85% YoY, agentic AI arriving). But NVDA itself shows "sell the news" (-2.44% AH). Lesson for strategy: AI demand is real and secular, but specific large-cap AI stocks (NVDA) may have stretched valuations that don't reward even strong beats. Implication: favor AMD, MU, AVGO (read-through plays) over NVDA itself for new entries.

### WEEKLY EVOLUTION NOTE — Week of May 18-22, 2026 (First Full Week Post-Strategy-Switch)

**What changed this week:**
1. **Strategy switch executed (May 17/18):** Retired long-term bucket. Account is now 100% active trading (85% active + 10% crypto + 5% cash). Prior LT positions (TSM/NVDA/JPM/AVGO) flagged for MOO liquidation May 18 — status unconfirmed due to API blockage.
2. **AI infrastructure thesis massively validated:** NVDA Q1 FY2027 $81.62B (+85% YoY), $80B buyback, agentic AI declared by Jensen Huang. Every AI read-through name (AMD, MU, AVGO, MRVL, PLTR) repriced higher.
3. **"Sell the news" at scale confirmed for NVDA:** Despite record Q1 beat, NVDA AH -2.44%. Recovered to $221 by May 22. Lesson: for a stock priced for perfection, even strong beats don't gap up. Prefer AMD/MU/AVGO/MRVL as cleaner AI vehicles.
4. **AMD $447→$449 (May 18-22):** Thesis intact. MI450 exceeding projections. 8th+ consecutive entry block — pure execution failure. Score: 7.5. Every day without entry is compounding the opportunity cost.
5. **PLTR $134→$140 (May 18-22):** Broke decisively above $134 resistance. Gov AI AIP revenue accelerating. Score upgraded from 7.17 to 7.5 on improved technical.
6. **MU $720→$762 (May 18-22, +5.8%):** HBM3e demand confirmed by NVDA. Best R/R of the three. Score: 7.67.
7. **MRVL date correction:** Earnings incorrectly logged as May 21 — actually May 27. Entry window still open through May 25 close. Recommend Mid-Morning score today.
8. **Oil and rates:** WTI -5.66% May 20 (Middle East de-escalation). Lower inflation path = potential rate-cut runway. Positive for broad equities. GLD bid on dollar weakness theme (not geopolitical fear).

**What the strategy says but the execution layer hasn't delivered:**
- Deployment bias is MANDATORY. Score ≥7 = enter. AMD has scored ≥7 for 8+ consecutive sessions. Portfolio is ~85-97% cash. This is the LARGEST systemic failure: the strategy is correct but the execution infrastructure (Alpaca API blockage) prevents orders.
- **Operator must manually execute** until the API allowlist issue is resolved. There is no algorithmic solution until `paper-api.alpaca.markets` is added to the cloud runner's egress allowlist.

**What to watch next week (May 25-29):**
- **MRVL earnings May 27 (Q1 FY2027):** AI ASIC networking — custom silicon for AWS/Google/MSFT. Consensus $2.4B revenue. PT Citi $215. Score at Mid-Morning May 22 for last pre-earnings entry; exit by May 25 close if entered.
- **AMD breakout continuation:** Key levels: $450 breakout = momentum extends. Stop $429. Target $520.
- **MU continued HBM rally:** ATH $818.67 in sight. Target $881.
- **PLTR $140+ support test:** If pulls back to $134, re-evaluate technical score.
- **BTC vs $82K:** Still below. Monitor risk-on conditions.

**Core guardrails: NO CHANGES.** Stop-losses, position size, sector caps, R/R minimum — all unchanged. Only the execution infrastructure needs fixing.

## Next Routine Plan

**Market Open May 22 (9:45 AM ET — COMPLETED):**
- Pre-Market silently failed → catch-up ran.
- 3 limit bracket orders scored and attempted (AMD 7.5, PLTR 7.5, MU 7.67) — all BLOCKED by API.
- MRVL skipped (3-order cap). MRVL date corrected (earnings May 27, not May 21).
- OPERATOR: manually place AMD/PLTR/MU limit brackets before market close today.

**Mid-Morning May 22 (11:00 AM ET — THIS ROUTINE — COMPLETED):**
- Pre-Market predecessor: MISSING (violation logged, duplicate noted).
- Stop audit: BLOCKED (HTTP 403, 15th+ consecutive).
- MRVL: SKIPPED (Exemption 2 — Memorial Day May 25 creates binary-event-equivalent constraint; MRVL ineligible until post-May 27 earnings).
- AVGO: REJECTED (score 6.0 — bearish divergence in up market, Warsh hawkish headwind for high-multiple semis).
- AMD/PLTR/MU: re-attempted limit brackets — all BLOCKED by API.
- AMD updated limit: $449.00 (down from $451.84 for better fill odds; today range $441-$451.20).
- MRVL price corrected: ~$183-184 (not $190.95 as previously estimated).
- KEY MACRO: Warsh sworn in as Fed Chair (hawkish — rate hike odds 20-30% by Dec), Iran talks progress (risk-on), S&P +0.55%.
- OPERATOR: Please execute AMD/PLTR/MU manually at https://app.alpaca.markets today. AMD: 11sh limit $449, stop $426.55, target $516.35. PLTR: 10sh limit $140.35, stop $133.33, target $161.40. MU: 6sh limit check current price, stop at fill×0.95, target at fill×1.15.

**Midday May 22 (12:30 PM ET — NEXT ROUTINE):**
1. **Stop audit:** Re-attempt GET /v2/orders?status=open (API likely still blocked — log result).
2. **Confirm AMD/PLTR/MU order status** if operator has placed them.
3. **AVGO recovery check:** If AVGO has recovered to $415+, re-score — entry may be valid if technical improves.
4. **Circuit breaker check:** If S&P down 3% from open, halt all new entries.
5. **Memorial Day reminder:** US markets CLOSED May 25. Next trading day after today = May 26. All GTC orders placed today will be eligible May 26.
6. **MRVL remains INELIGIBLE** through May 27 earnings. Post-earnings entry possible May 28+ if reaction is bullish.

**Afternoon May 22 (2:00 PM ET — THIS ROUTINE — COMPLETED):**
- Midday MISSING (2nd predecessor violation today).
- Stop audit: BLOCKED (HTTP 403, 16th+ consecutive).
- AMD surged to $469.43 (+3.7%): Score upgraded 7.83. New params: $470 limit, stop $446.50, target $540.50.
- AVGO recovered to $416: Bearish divergence resolved; re-score May 26.
- PLTR $136.87: below limit $140.35; recommend lowering limit to $137.25 for May 26.
- MU $771.20: limit $765.91 was in day range — likely filled if operator acted.
- No new entries (afternoon proximity-to-close + API blocked).

**Market Close May 22 (3:30 PM ET — NEXT ROUTINE):**
- Stop verification: all open positions must have resting stops before 4 PM (3-day weekend).
- AMD stop: if filled at $449, TRAIL STOP from $426.55 to $447 before weekend.
- MU stop: if filled at $765.91, verify $727.61 resting.
- PLTR: limit $140.35 GTC → recommend operator change to $137.25 for better fill on May 26.
- MRVL: MUST NOT be held into close (ineligible). No MRVL position should exist.
- AMD limit: if still at $449 and unfilled, update to $470.00 for May 26.
- MOC orders: no day trades to close. Only action if any positions need adjustment.

**Daily Review May 22 (4:30 PM ET — WEEKLY EVOLUTION NOTE DUE):**
- First full week post-strategy-switch (May 18-22) with actual market data.
- Tally all order execution (AMD/PLTR/MU — operator-placed or still pending).
- Updated benchmark gap vs S&P 500 (prior gap: -3.04 pp vs SPX; today market up another +0.55% ≈ further widening gap).
- Write weekly evolution note (overdue since Friday).
- MRVL post-earnings (May 27) analysis — prep for May 28 entry decision.
- NOTE: No trading May 25 (Memorial Day). Weekend = May 23-24, holiday = May 25. Next session = May 26 Pre-Market.

## Cash Reserve Floor
**5% floor** = $5,000 (updated per May 17 strategy switch — was 10%, now 5% per CLAUDE.md).

**Current cash (estimated):**
- Scenario A (switch executed): ~$97,280 → available to deploy: $92,280 (floor = $5,000)
- Scenario B (switch not executed): ~$85,550 → available to deploy: $80,550

**After May 21 entries (AMD 10sh + PLTR 10sh + MU 6sh, estimated):**
- AMD 10sh × $445 = $4,450
- PLTR 10sh × $135 = $1,350
- MU 6sh × $725 = $4,350
- Total new positions: ~$10,150
- Remaining cash (Scenario A): ~$87,130 (87% — still massively above 5% floor)
- Remaining cash (Scenario B): ~$75,400 (75% — still massively above 5% floor)

Deployment gap remains enormous. After AMD+PLTR+MU: still need to deploy ~$65–80K more to reach 85% target. This means additional limit orders for AVGO, MRVL, MSFT, SMCI, and crypto (BTC/ETH) are all warranted on May 21.
