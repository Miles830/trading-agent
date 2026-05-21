# Opus Trader — Portfolio Memory

## Last Updated
**2026-05-21 (Thursday) — Daily Review (4:30 PM ET / 20:39 UTC).** Alpaca API BLOCKED (HTTP 403 "Host not in allowlist") — **14th consecutive blocked session**. S&P 500 −0.45% to ~7,399.52 (oil up on Iran uranium directive, yields rising, NVDA digest). AMD $447.58 (+1.61%), PLTR $138.28 (+2.40%), MU $754.91 (+3.13%) — all outperformed SPX on down day. NVDA "sell the news" day 2: $219.45 (−1.46%). GLD $413.66 (−0.71% — oil capturing geopolitical bid). MRVL binary event correction: reports May 27 after close (NOT today) — MRVL scoreable for May 22. BTC ~$77,500 (below $82K threshold). 3 MOO orders (AMD/PLTR/MU) blocked for 14th consecutive session. **Memorial Day May 26 — no trading.** Weekly evolution note due Friday May 22. Portfolio today: −0.021% vs SPX −0.45% → outperformed +0.43 pp (cash wins on down day). Cumulative gap vs SPX: **−2.61 pp** (improved from −3.04 pp). 5 of 7 intraday routines silently failed again.

**Prior Last Updated:** 2026-05-21 (Thursday) — Pre-Market (8:00 AM ET / 12:02 UTC). Alpaca API BLOCKED (HTTP 403 "Host not in allowlist") — 13th+ consecutive blocked session. NVDA Q1 FY2027 POST-EARNINGS: Beat ($81.62B, +85% YoY), $80B additional buyback, quarterly dividend raised 1¢ → 25¢. NVDA trading ~$220.66 today (high $226.94, low $216.25). AMD pre-market ~$429 (−3.6% sector contagion, no AMD-specific news; AMD day close $447.58). PLTR pre-market $134.01 (barely at $134 trigger). MU ~$720.55. BTC $77,852 (below $82K threshold, scored 5.3/10). S&P futures +0.09%. 3 MOO orders attempted (AMD 10sh, PLTR 10sh, MU 6sh) — all blocked by API. Orders documented in trades.md for operator execution. MRVL excluded (earnings binary event May 21).

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

## Current Account Snapshot
- **Broker:** Alpaca Paper Trading (account PA3TXVEJ19LW)
- **Total Equity (estimated):** ~$100,150 (estimated; API blocked; May 21 EOD prices from web research)
- **Cash:** ~$97,255 (Scenario A: switch executed May 18) OR ~$85,530 (Scenario B: switch NOT executed)
- **Long Market Value (estimated — May 21 EOD):**
  - Scenario A (switch executed May 18): ~$2,896 (GLD 7sh × $413.66)
  - Scenario B (switch NOT executed): ~$14,633 (TSM+GLD+NVDA+JPM+AVGO at May 21 prices)
- **Open Positions:** 1 confirmed (GLD) + 4 uncertain (TSM/NVDA/JPM/AVGO — Scenario B)
- **NVDA POST-EARNINGS:** "Sell the news" extended to day 2 — $219.45 (−1.46%). Combined 2-day post-earnings decline from ~$222.70 pre-event = −1.46% cumulative (not catastrophic but consistent pattern). NVDA binary event exposure if still held = guardrail violation already incurred.
- **API Status:** BLOCKED — "Host not in allowlist" (HTTP 403, Anthropic sandbox TLS proxy). Persistent failure since May 6. **14th consecutive blocked session.**
- **Daytrade Count:** 0
- **Memorial Day May 26:** No trading. Next trading day: Tuesday May 27 (also MRVL earnings day).

## Bucket State
| Bucket | Target | Current $ (est.) | Current % | Positions |
|---|---|---|---|---|
| Long-term | 55% ($55K) | ~$13,657 (TSM+NVDA+JPM+AVGO) | 13.6% | 4 (TSM, NVDA, JPM, probable AVGO) |
| Active Trading | 30% ($30K) | ~$5,885 (GLD+XLE) | 5.9% | 2 (GLD, XLE) |
| Crypto | 5% ($5K) | $0 | 0% | 0 |
| Cash Reserve | 10% ($10K floor) | ~$80,946 | 80.5% | — |

**Deployment gap:** Cash ~$70.9K above the 10% floor. AMD entry unconfirmed for 4th consecutive session. Massive underfillment continues. MU and PLTR also pending first entries.

## Open Positions (estimated — May 21 EOD prices from web research; API blocked)
| Symbol | Bucket | Qty | Entry | Stop | Target | Cost Basis | May 21 Price | Est. P/L | Sector |
|---|---|---|---|---|---|---|---|---|---|
| GLD | active | 7 | $418.86 | $397.92 (-5%) | — | $2,932.02 | $413.66 | -$36.40 | Precious metals |
| TSM* | LT→closing | 7 | $401.47 | $353.76 | $498.48 | $2,810.29 | $404.18 | +$18.97 | Semiconductors |
| NVDA* | LT→closing | 15 | $198.83 | $175.60 | $247.44 | $2,982.45 | $219.45 | +$309.30 | Semiconductors |
| JPM* | LT→closing | 9 | $308.30 | $272.14 | $383.47 | $2,774.72 | ~$303 | ~-$47 | Financials |
| AVGO* | LT→closing | 7 | $418.59 | $368.36 | $519.05 | $2,930.13 | $417.76 | -$5.81 | Semiconductors |

*TSM/NVDA/JPM/AVGO: marked for liquidation per May 17 strategy switch. May have been closed via May 18 MOO (unconfirmed). If Scenario A (closed): only GLD remains. If Scenario B: all 5 still open. XLE confirmed NOT held (verified May 17). NVDA "sell the news" continues day 2 ($219.45); if still held through earnings = binary event guardrail violation.

**Est. total long market value:**
- Scenario A (GLD only): $2,896 (GLD 7sh × $413.66)
- Scenario B (all 5): $14,633 (GLD+TSM+NVDA+JPM+AVGO at May 21 prices)

**Net unrealized P/L (Scenario B):** ~+$239 (NVDA still largest contributor; GLD dragging)
**Net unrealized P/L (Scenario A — GLD only):** -$36.40

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
- **Portfolio total equity (est.):** ~$100,150 (May 21 EOD)
- **Portfolio total return:** ~+0.15%
- **Today's P&L (May 21):** −$20.86 (GLD 7sh × −$2.98/sh); all MOO orders blocked
- **Today's portfolio return:** ~−0.021%
- **S&P 500 close May 21:** ~7,399.52 (−0.45%). Oil rising on Iran uranium directive. Yields up. NVDA "sell the news" day 2.
- **S&P 500 return since strategy start (~May 1):** **~+2.77%** (7,399.52 vs ~7,200 est.)
- **Gap vs SPX:** **−2.61 percentage points** — improved from −3.04 pp as SPX fell −0.45%. Portfolio outperformed by +0.43 pp today (cash wins on down day). But the underlying underperformance from missed entries remains.
- **Root cause unchanged:** 97% cash from persistent API blockage. 14 consecutive sessions with no new entries. Every market up-day widens the gap; every down-day narrows it slightly. Net trajectory: falling behind.
- **Rolling 20-day check:** Cannot compute accurately (API blocked, no /v2/portfolio/history). Consecutive-underperformance trigger not assessable.

## Macro Context (as of 2026-05-21 market close)
- **NVDA "SELL THE NEWS" — DAY 2 (May 21):** NVDA $219.45 (−1.46%) on day after beat report. 2-day post-earnings decline from ~$222.70 = −1.46%. Pattern matches Feb quarter (beat → down next day). AI demand validated ($81.62B Q1 FY2027, +85% YoY) but NVDA stock overextended. Not entering NVDA in any scenario until stable base forms.
- **Oil RISING — Iran directive:** Iran Supreme Leader issued directive to keep enriched uranium within the country. Oil reversed sharply from May 20's -5.66% collapse. Geopolitical premium reinflated. This explains May 21's broad market sell-off (inflation + yield concern) and GLD's mild decline (oil capturing geopolitical bid; gold slightly displaced).
- **Semiconductor sub-sector outperforming:** AMD $447.58 (+1.61%), MU $754.91 (+3.13%), PLTR $138.28 (+2.40%) — ALL showed relative strength vs SPX −0.45%. The AI infrastructure theme is acting defensively within tech. Institutions appear to be buying semiconductor dips while selling broader tech.
- **S&P 500 context:** ~7,399.52 — down from 7,432.97 (May 20) and well below 7,511 record (May 14). Rally fading on oil + yields. Broad market risk-off but semiconductor sub-sector diverging.
- **Rates/Yields:** Rising on inflation concern (oil price recovery + prior PPI data). This is negative for broad equities but may eventually support GLD (inflation hedge).
- **Bitcoin:** ~$77,500 (still below $82K threshold). Risk-off environment. No crypto deployment warranted. Check again at Pre-Market May 22.
- **PLTR:** $138.28 — decisively above $134 re-entry trigger. Government AI revenue secular. AIP agentic AI narrative confirmed by NVDA CEO Jensen Huang. Strong buy case.
- **MRVL DATE CORRECTION:** Reports Q1 FY2027 on May 27 after close (NOT May 21). Binary event window = May 25 close → May 27 close. MRVL is SAFE to enter on May 22 (Friday). Stock ~$181 (per search). Surge expected post-May 27 if earnings beat (AI networking silicon, 27% revenue growth expected).
- **Memorial Day May 26:** US markets closed. Next trading day after May 22 = May 27 (MRVL earnings day). Plan accordingly.
- **Strategy switch (May 18 MOO):** UNCONFIRMED (API still blocked). Scenario A (switch executed) still working assumption. Verify at operator app.alpaca.markets.

## Active Themes
1. **AI infrastructure / semiconductor supercycle** — NVDA $81.62B Q1 FY2027 confirmed. AMD (+1.61% on down market day), MU (+3.13%), PLTR (+2.40%) ALL showing relative strength vs SPX −0.45%. Semiconductor SOX approximately YTD +65%. The sub-sector is acting defensively — institutions buying dips.
2. **NVDA "sell the news" — 2 days confirmed.** NVDA $219.45, down −1.46% day 2 after beat. No entry into NVDA until stable base forms. `earnings-reaction-fade` setup possible but requires 2/5 indicator stack confirmation — do not chase.
3. **GLD thesis recalibration.** Oil is now RISING on Iran geopolitics (reversed the May 20 collapse). Gold lost −0.71% today as oil captured the geopolitical bid. GLD may continue to underperform if oil keeps rising. Stop $397.92 (-3.8% from current $413.66) still protective. Reassess at next routine.
4. **Crypto subdued.** BTC ~$77,500, risk-off environment. Below $82K deployment threshold. No crypto deployment.
5. **PLTR breakout confirmed.** $138.28 — closed well above $134 trigger. Government AI contracts secular. AIP agentic narrative. This is now a high-conviction entry with stronger technical score (re-score to 7.50+).
6. **Oil rising — Iran geopolitical premium.** WTI rising after Iran uranium directive. Rising oil = inflation + yields + broad market pressure. Watch GLD/oil correlation.
7. **MRVL May 27 catalyst.** Q1 FY2027 AI networking silicon. 27% revenue growth expected. Can enter May 22 (Friday) before the binary event window (opens May 25 close). High conviction for post-earnings reaction if beat confirmed.

## Pending Actions — OPERATOR MUST EXECUTE (Updated May 21 Daily Review)

**CRITICAL — PRE-MARKET FRIDAY MAY 22 (before 9:25 AM ET):**

1. **STOP AUDIT FIRST:** Verify at https://app.alpaca.markets — GLD stop $397.92 resting. Confirm strategy-switch status (TSM/NVDA/JPM/AVGO open or closed?). API BLOCKED from cloud routine.

2. **AMD** (score **7.67**, breakout-volume, active): Buy **10 shares MOO** (`type: market, time_in_force: opg`). Stop: fill×0.95. Target: fill×1.15. **MANDATORY — 14th+ consecutive attempt. AMD $447.58 EOD May 21 — AI sector relative strength confirmed.** AMD Q1: $10.3B +38% YoY, Data Center $5.8B +57%. OPERATOR MUST MANUALLY PLACE.

3. **MU** (score **7.67**, ai-momentum-pullback, active): Buy **6 shares MOO**. Stop: fill×0.95. Target: fill×1.15. **MANDATORY.** MU $754.91 (+3.13% today). Next earnings June 24 (outside 48h window). NVDA beat = HBM demand confirmed. OPERATOR MUST MANUALLY PLACE.

4. **PLTR** (score **7.50**, ai-momentum-pullback, active): Buy **10 shares MOO**. Stop: fill×0.95. Target: fill×1.15. **MANDATORY.** PLTR $138.28 — strong breakout above $134 trigger. Re-score expected 7.50 at Pre-Market May 22. OPERATOR MUST MANUALLY PLACE.

**MAX 3 MOO ORDERS CAP = AMD + MU + PLTR (filled).**

**MARKET OPEN MAY 22 (9:45 AM ET — MANDATORY):**
5. After confirming AMD/MU/PLTR fills: POST separate GTC stop orders for each fill (fill×0.95). MANDATORY per CLAUDE.md MOO workflow.
6. Strategy-switch close (if still needed): If TSM/JPM/AVGO still held, post limit sells at bid.
7. GLD reassessment: If GLD continues declining toward $410 with oil-driven selling pressure, consider tightening stop or closing position to redeploy into semiconductors.

**LIMIT ORDERS (subsequent routines May 22):**
8. **AVGO** (~7.5): 10 shares limit ~$418. NVDA custom ASIC pipeline.
9. **MRVL** (full 6-agent score required): ~$181. Reports May 27. OUTSIDE 48h window until May 25 close. Score at Pre-Market May 22.
10. **TSM** (~7.17): 7 shares limit ~$405.

**MEMORIAL DAY May 26:** NO TRADING. Next trading day May 27 = MRVL earnings day. No new positions in MRVL allowed after May 25 close.

**POST-MRVL EARNINGS (May 27 after close → May 28):**
11. **MRVL earnings reaction setup:** If MRVL beats (27% revenue growth expected) → `earnings-reaction-follow` at May 28 Market Open. If misses → skip.

**BTC/CRYPTO:** $77,500 (below $82K threshold). No deployment. Monitor at each Pre-Market.

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
- **2026-05-21 — MRVL binary event date correction:** TipRanks initially indicated MRVL earnings May 21. Confirmed via MarketBeat and SEC filings: actual date is May 27 after close. Pre-Market correctly excluded MRVL on May 21. But this means MRVL is SAFE to score and enter on May 22 (Friday) before the 48h exclusion window (which opens May 25 close). Lesson: always verify earnings date from multiple sources — TipRanks estimated dates can be off by days.
- **2026-05-21 — AI semiconductor sub-sector defensive behavior:** AMD (+1.61%), MU (+3.13%), PLTR (+2.40%) ALL outperformed SPX (−0.45%) on a down day driven by oil/yield concerns. This is a classic institutional rotation signal: money moving INTO high-conviction secular themes (AI infrastructure) and OUT of rate-sensitive names. The approved entries (AMD, MU, PLTR) are validated by this behavior. 14th consecutive session of opportunity cost.
- **2026-05-21 — Oil geopolitical reversal (Iran directive):** Oil reversed from May 20's −5.66% collapse back up on Iran's Supreme Leader uranium directive. This validates the lesson: geopolitical oil events are binary and directionally unpredictable. GLD's −0.71% today reflects the geopolitical premium shifting from gold to oil. Watch GLD/oil correlation for thesis maintenance.
- **2026-05-21 — Portfolio outperforms on down days, underperforms on up days:** Today: portfolio −0.021% vs SPX −0.45% = +0.43 pp outperform. This is the second time in recent sessions where being 97% cash has been temporarily beneficial. But over 20 days, the market has more up days than down days. The cumulative gap of −2.61 pp proves this net. Cash is not an investment strategy; it is a drag on returns in a bull market.

## Setup Performance Tracker (updated 2026-05-21 Daily Review)
| Setup type | Wins | Losses | 3-in-a-row | Status |
|---|---|---|---|---|
| ai-momentum-pullback | 0 | 0 | none | Active — PLTR $138.28 (trigger confirmed), MU $754.91 (+3.13%), AVGO/TSM/MRVL pending |
| macro-hedge | 0 | 0 | none | Active — GLD $413.66 (−$36.40 unrealized vs entry $418.86) |
| breakout-volume | 0 | 0 | none | AMD $447.58 — 14th+ consecutive attempt pending fill |
| earnings-reaction-fade | 0 | 0 | none | NVDA "sell the news" day 2 (−1.46%) — validated but no position |
| earnings-reaction-follow | 0 | 0 | none | AMD reclassified; NVDA rejected |
| sector-rotation | 0 | 0 | none | JPM uncertain (strategy switch pending) |
| candlestick-reversal | — | — | — | No trades |
| mean-reversion-oversold | — | — | — | No trades |
| crypto-flush-rebound | — | — | — | BTC ~$77,500, below $82K — no deployment |

**No 3-in-a-row halt or boost rules triggered. No closed P&L to evaluate. Tracker cannot advance without closed positions.**

**Observation:** PLTR's behavior today (+2.40% to $138.28 on a down market day) is exactly the relative-strength signal the ai-momentum-pullback setup is designed to capture. Had the MOO order been placed, the unrealized gain would be approximately +$3.77/sh × 10sh = +$37.70. This is performance being left on the table every single session.

## Strategy Evolution Notes
- **2026-05-01 (init):** Strategy initialized per CLAUDE.md. No deviations.
- **2026-05-04:** First positions opened. Strategy unchanged; execution layer needs fixing.
- **2026-05-08:** Three-week persistent API blockage causing compounding execution gaps. Portfolio 85% cash vs. 10% floor target.
- **2026-05-12:** China chip deal changes AMD thesis from earnings-follow to breakout-volume. Rate-cut thesis broken (no cuts until 2027) but partially offset by China chip deal sector tailwind. PLTR government AI revenues insulated from rate environment.
- **2026-05-14 (Week 2 Thursday):** Trump-Xi Summit Day 1 delivered massive NVDA catalyst (+4.54%). Markets at all-time records. Portfolio at +0.51% vs S&P +4.32% — entire gap attributable to API blockage. **Friday Weekly Evolution Note was MISSED (May 15 silent failure).**
- **2026-05-20 (Wednesday):** NVDA Q1 FY2027 confirmed the AI infrastructure thesis ($81.62B revenue +85% YoY, agentic AI arriving). But NVDA itself shows "sell the news" (-2.44% AH). Lesson for strategy: AI demand is real and secular, but specific large-cap AI stocks (NVDA) may have stretched valuations that don't reward even strong beats. Implication: favor AMD, MU, AVGO (read-through plays) over NVDA itself for new entries. AMD at $440.50 is the preferred AI exposure vehicle. PLTR ($135, gov AI) is the software-layer AI play. Oil collapse (-5.66%) improves the macro picture for equities broadly.
- **2026-05-21 (Thursday) — daily review:** AMD +1.61% ($447.58), PLTR +2.40% ($138.28), MU +3.13% ($754.91) — ALL showing relative strength on a −0.45% SPX day. AI semiconductor sub-sector acting defensively. MRVL date correction: reports May 27 (not May 21). Memorial Day May 26 = no trading. Oil rising on Iran geopolitics (reversed May 20 de-escalation). BTC ~$77,500 (below threshold). Cumulative gap vs SPX: −2.61 pp (improved from −3.04 pp). 14th consecutive API blockage.
- **WEEKLY EVOLUTION NOTE DUE:** Friday May 22 Daily Review — first full week post-strategy-switch. Will cover: strategy switch execution status, API blockage (14 days), AMD/PLTR/MU deployment failure impact, NVDA "sell the news" asset-specific pattern, MRVL date correction, Memorial Day week plan, GLD thesis recalibration, PLTR breakout confirmation.

## Next Routine Plan

**Pre-Market May 22 (8:00 AM ET / 12:00 UTC — NEXT ROUTINE):**
- STOP AUDIT first (GET /v2/positions, GET /v2/orders?status=open). Likely blocked. OPERATOR: verify via app.alpaca.markets.
- 3 MOO orders: AMD 10sh (7.67), MU 6sh (7.67), PLTR 10sh (re-score ~7.50). All MANDATORY.
- Full 6-agent score on MRVL (~$181, reports May 27 — outside 48h window for May 22 entry). If ≥7: limit buy.
- Full 6-agent score on AVGO (~$418) and TSM (~$405). If ≥7: limit buy.
- GLD assessment: if price trending toward $410, reconsider thesis vs oil rising narrative.
- BTC check vs $82K threshold. Below = skip.
- Note: Friday May 22 = monthly options expiration (OpEx) — expect elevated volatility. Do not chase gaps at open; wait for first 15-minute candle to set range.

**Memorial Day Note:** May 26 = US market CLOSED. No routines. May 27 = first day back AND MRVL earnings day. MRVL binary event window opens May 25 close — no new MRVL positions after May 25 4 PM ET.
- MRVL excluded (binary event). BTC scored 5.3 (not mandatory entry).

**Market Open May 21 (9:45 AM ET — NEXT ROUTINE):**
1. **MANDATORY:** Confirm AMD/PLTR/MU MOO fills. POST standalone GTC stop orders immediately for each (stop = fill × 0.95).
2. **Stop audit:** Re-run GET /v2/orders?status=open; confirm GLD stop $397.92 still resting.
3. **Strategy-switch close (if still needed):** If TSM/JPM/AVGO still held, post limit sells at bid. NVDA: if still held, close per strategy-switch directive (earnings now past; lock in gain at ~+11%).
4. **NVDA reaction trade assessment:** NVDA ~$220.66 (range $216.25–$226.94). $80B buyback + 25¢ dividend = bullish. Assess 5-min chart for: (a) `earnings-reaction-fade` if gap-down -3%+ with 2/5 confirmation, (b) `candlestick-reversal` long if gap-down then recovery, (c) `earnings-reaction-follow` if gap-up.
5. **AVGO limit:** BUY 10 shares AVGO limit at ask+0.5% (~$418–430). Score ~7.5, all guardrails clear.
6. **MRVL post-earnings:** If MRVL reports good Q1 after open, score immediately. Do NOT enter before report is out.

**Daily Review May 21 (4:30 PM ET):**
- Tally AMD/PLTR/MU fills and stop placements (first actual entries since account inception if operator manually placed)
- NVDA reaction setup P&L
- AVGO limit order status
- **Weekly strategy evolution note DUE (should be Friday May 22 but advancing if useful)**

**Weekly evolution note due:** Friday May 22 Daily Review.

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
