# Opus Trader — Portfolio Memory

## Last Updated
**2026-05-19 (Monday) — Mid-Morning routine (11:00 AM ET / 15:04 UTC).** API STILL BLOCKED (HTTP 403). 18 consecutive silent routine failures spanning May 15-19. Strategy switch LT sells (TSM/NVDA/JPM/AVGO) UNCONFIRMED — no routine ran May 15-18, API blocked for programmatic execution. NVDA earnings TOMORROW May 20 after close — OPERATOR MUST CLOSE TODAY. Market risk-off: 30yr yield 5.18% (19-year high), S&P 500 -0.55% (third consecutive down day). BTC $77,119 (below $82K threshold). AMD re-scored 5.67 (rejected). PLTR re-scored 6.17 (rejected).

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
- **Total Equity (estimated):** ~$100,211 (API blocked; prices from May 19 web research)
- **Cash:** ~$85,550 (85.3%) — from May 17 verified API access; unchanged (no fills since May 4-5)
- **Long Market Value (estimated):** ~$14,661 (assuming LT sells DID NOT execute; 5 positions)
- **Open Positions:** 5 estimated (TSM 7, GLD 7, NVDA 15, JPM 9, AVGO 7) — XLE confirmed absent per May 17 API check
- **Pending Orders / Actions:**
  - 🚨 NVDA 15sh MUST CLOSE TODAY (earnings May 20 after close; strategy switch mandated; est. +$334 gain)
  - TSM 7sh sell (strategy switch; est. -$39 loss)
  - JPM 9sh sell (strategy switch; est. -$70 loss)
  - AVGO 7sh sell (strategy switch; est. +$9 gain)
  - GLD 7sh HOLD (active carryover, stop $397.92)
  - AMD: re-scored 5.67 (rejected — price fell to $397.83 from $445 breakout level)
  - PLTR: re-scored 6.17 (rejected — $134 reclaimed but market risk-off drags macro/sentiment)
- **API Status:** BLOCKED — "Host not in allowlist" (HTTP 403, Anthropic sandbox TLS proxy). Persistent failure since May 6. 13th consecutive routine-day API blockage.
- **Daytrade Count:** 0

## Bucket State (post-strategy-switch; LT sells UNCONFIRMED)
| Bucket | Target | Current $ (est.) | Current % | Positions |
|---|---|---|---|---|
| Active Trading | 85% ($85K) | ~$14,661 (all 5 positions) | 14.6% | 5 (TSM, GLD, NVDA, JPM, AVGO — LT sells pending) |
| Crypto | 10% ($10K) | $0 | 0% | 0 |
| Cash Reserve | 5% floor | ~$85,550 | 85.3% | — |

**After LT sells execute (TSM+NVDA+JPM+AVGO close, GLD holds):**
- Cash: ~$85,550 + ~$11,732 = ~$97,282 (97.1%)
- Active (GLD only): ~$2,929 (2.9%)
- Deployment gap: ~$82,282 above 5% floor — must deploy aggressively into active + crypto names

**Deployment gap:** 80%+ cash above 5% floor. 18 consecutive silent routine failures have prevented all deployment. Once API is restored and/or operator manually executes, need to build active + crypto book from scratch (GLD is the only active position).

## Open Positions (estimated, API blocked — prices from May 19 web research)
| Symbol | Bucket | Qty | Entry | Stop | Target | Cost basis | Est. Price | Est. P/L | Sector | Action |
|---|---|---|---|---|---|---|---|---|---|---|---|
| TSM | LT→close | 7 | 401.47 | 353.76 | — | $2,810.29 | ~$395.95 | -$38.64 | Semiconductors | ⚠️ CLOSE (strategy switch) |
| GLD | active | 7 | 418.86 | 397.92 (-5%) | — | $2,932.02 | ~$418.43 | -$3.01 | Precious metals | ✓ HOLD |
| NVDA | LT→close | 15 | 198.83 | 175.60 | — | $2,982.45 | ~$221.12 | +$334.35 | Semiconductors | 🚨 CLOSE TODAY (earnings May 20) |
| JPM | LT→close | 9 | 308.30 | 272.14 | — | $2,774.72 | ~$300.57 | -$69.57 | Financials | ⚠️ CLOSE (strategy switch) |
| AVGO | LT→close | 7 | 418.48 | 368.36 | — | $2,929.36 | ~$419.79 | +$9.31 | Semiconductors | ⚠️ CLOSE (strategy switch) |

**XLE: CONFIRMED NOT IN PORTFOLIO** (per May 17 Alpaca API verification)
**Est. total long market value:** ~$14,661
- TSM: 7 × $395.95 = $2,772
- GLD: 7 × $418.43 = $2,929
- NVDA: 15 × $221.12 = $3,317
- JPM: 9 × $300.57 = $2,705
- AVGO: 7 × $419.79 = $2,939

**Net unrealized P/L: +$232.44** (NVDA +$334 primary driver; JPM and TSM dragging)

## Sector Exposure (estimated — May 19 mid-morning, LT sells unconfirmed)
| Sector | Est. $ | Est. % of equity |
|---|---|---|
| Semiconductors (TSM+NVDA+AVGO — pending close) | $9,028 | 9.0% |
| Financials (JPM — pending close) | $2,705 | 2.7% |
| Precious metals (GLD — HOLD) | $2,929 | 2.9% |
| Cash | $85,550 | 85.3% |

**After all LT sells execute (GLD only active position):**
| Sector | $ | % of equity |
|---|---|---|
| Precious metals (GLD) | ~$2,929 | 2.9% |
| Cash | ~$97,282 | 97.1% |

All sectors under 25% cap. Post-liquidation, need to build active + crypto positions to target 85%/10% allocation.

## Performance vs S&P 500
- **Portfolio total equity (est.):** ~$100,211
- **Portfolio total return:** +0.211% ($100,211 / $100,000 initial)
- **Today's P&L (vs May 17 verified ~$100,338):** ~-$127 / -0.13% (TSM -$59 + NVDA -$63 + JPM +$25 + AVGO -$38 + GLD +$8)
- **S&P 500 (est. May 19 intraday):** ~$7,469 (down ~$42 from May 14's $7,511 record; three consecutive losing sessions)
- **S&P 500 return since strategy start (~May 1):** ~+3.7% estimated (7,469 vs ~$7,200 start)
- **Gap vs SPX:** ~**-3.5 pp** (estimated; exact S&P level unavailable)
- **Root cause unchanged:** 85%+ cash from persistent API blockage. Strategy switch LT sells still pending. Once deployed into active + crypto book, gap should narrow.
- **CRITICAL:** Gap approaching -4 pp in 10 trading days. If AMD, PLTR, MU entered tomorrow and markets hold, gap could narrow by ~1 pp. Operator action on May 15 is critical.

## Macro Context (as of 2026-05-19 mid-morning)
- **S&P 500 / Bonds:** Third consecutive losing day (-0.55% today). 30-year Treasury yield at 5.18% — highest in ~19 years. Rising yields headwind for growth/tech valuations. Dow -0.85%, Nasdaq -0.55%. Not a risk-on environment.
- **Iran / Oil:** Trump announced May 18 he called off a scheduled Iran attack; "serious negotiations" underway. But oil surged back above $108/bbl on resumed uncertainty about Middle East stability. Geopolitical risk premium maintained.
- **NVDA Earnings:** TOMORROW (May 20 after close — NOT May 21 as previously noted). 48-hour exclusion window is ACTIVE. Analysts expect EPS $1.78 (+120% YoY), revenue $79.2B (+79.5% YoY). 90% beat probability (Polymarket). However, strategy switch mandates CLOSING existing NVDA position TODAY. Hold-through-earnings risk is not appropriate for a mandated LT liquidation.
- **Bitcoin:** $77,119 — fell further below $80K. Iran uncertainty + 30yr yield spike drove $657M in crypto liquidations this week. Re-entry threshold $82K unchanged. BTC in weakness mode.
- **Chip stocks:** AMD at $397.83 (down 10.6% from planned entry level; breakout thesis void). TSM at $395.95 (below $401.47 entry). Broad chip weakness.
- **PLTR:** $135.14 — reclaimed $134 support. But re-scored 6.17 (rejected) due to macro risk-off environment (yields, consecutive down days).

## Active Themes (as of May 19, 2026)
1. **AI broadening / China chip deal** — China MI308/H200 deals intact. But chip stocks (AMD, TSM) in correction. NVDA earning tomorrow — strategy switch mandates LT sell TODAY. Post-liquidation, may re-enter active positions in AMD/PLTR/TSM if/when technical setups recover.
2. **Geopolitical inflation hedge** — GLD (active, 7sh) at $418.43 — essentially at breakeven. Iran uncertainty + 30yr yield at 5.18% provide floor support. Oil at $108/bbl. GLD carryover is still valid.
3. **Crypto recovery (PENDING)** — BTC $77,119 (below $82K threshold). Iran+yields driving crypto liquidations. Do NOT lower threshold. Watch for BTC reclaim of $82K.
4. **Government AI (PLTR AIP)** — PLTR at $135.14 (above $134 trigger). But re-score 6.17 (rejected). Macro needs to stabilize before entry is justified.
5. **Energy (RISING THEME)** — Oil at $108/bbl. Iran uncertainty. Energy names (DVN, MRO, EOG, XOM) rising. Worth scoring at next routine if market stabilizes. High yields support energy but hurt growth.
6. **Defense (EMERGING THEME)** — Iran threat even in "negotiation" drives defense spending. LMT, RTX, NOC candidates. Score at next routine.

## Pending Actions — OPERATOR MUST EXECUTE TODAY (May 19)

1. 🚨 **NVDA 15sh SELL (URGENT — TODAY before 3:50 PM ET):** Earnings TOMORROW May 20 after close. Strategy switch mandates LT liquidation. Current price ~$221.12 = unrealized +$334.35. Submit MOC order or market sell via Alpaca UI/dashboard. curl: `POST /v2/orders {"symbol":"NVDA","qty":15,"side":"sell","type":"market","time_in_force":"day"}`

2. **TSM 7sh sell:** Strategy switch LT liquidation. Current -$38.64 loss. Submit today. curl: `POST /v2/orders {"symbol":"TSM","qty":7,"side":"sell","type":"market","time_in_force":"day"}`

3. **JPM 9sh sell:** Strategy switch LT liquidation. Current -$69.57 loss. Submit today. curl: `POST /v2/orders {"symbol":"JPM","qty":9,"side":"sell","type":"market","time_in_force":"day"}`

4. **AVGO 7sh sell:** Strategy switch LT liquidation. Current +$9.31 gain. Submit today. curl: `POST /v2/orders {"symbol":"AVGO","qty":7,"side":"sell","type":"market","time_in_force":"day"}`

5. **GLD 7sh HOLD:** Keep with stop $397.92. Verify stop is still resting on Alpaca.

6. **Alpaca API allowlist fix:** OPERATOR: request that `paper-api.alpaca.markets` and `data.alpaca.markets` be added to the Anthropic sandbox egress allowlist. 13 consecutive routine-day API blockages have prevented all programmatic order execution.

## Pending Deferrals (watchlist status)
- **AMD** (re-scored 5.67 May 19) — REJECTED. Previous commitment at $445 is void. AMD at $397.83 (-10.6%). Re-entry signal: reclaim $415-420 on volume with 2-of-5 indicator stack confirmation.
- **PLTR** (re-scored 6.17 May 19) — REJECTED. $134 reclaimed ($135.14 today) but macro risk-off (yields 5.18%, three down days) drags score below 7. Re-entry signal: market stabilizes, yields pull back, Macro score improves to ≥5.
- **Energy names (NEW)** — DVN, MRO, EOG, XOM worth scoring at Afternoon routine if market allows. Oil at $108/bbl, Iran uncertainty ongoing.
- **Defense names (NEW)** — LMT, RTX, NOC candidates in rising Iran-risk environment.

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
- **2026-05-13 — PLTR support break:** PLTR fell -4.31% to $129.99, breaking $134 support zone. Re-score: 6.50 (Technical dropped to 3). Correct response: re-score and skip — not force-entry into broken technical setup.
- **2026-05-13 — AMD pullback (thesis intact at $448):** AMD declined from $477 peak to $448.29. Re-score: 7.33. Remains a MUST-ENTER but API blocked.
- **2026-05-14 — Trump-Xi Summit Day 1:** Jensen Huang attended. NVDA +4.54% on H200 clearance. Markets hit all-time records. JPM fell -1.52% despite broad market strength.
- **2026-05-15 to 2026-05-18 — 18 consecutive silent routine failures:** Entire 3-day trading window (May 15, 16, 18) produced zero heartbeats. Strategy switch LT sells missed. Scheduler still not firing intraday routines.
- **2026-05-19 — AMD re-score invalidates prior commitment:** AMD fell from $445 to $397.83 (-10.6%) while no routines ran. Re-scored 5.67 (rejected). Key lesson: watchlist commitments are valid at the price level used for scoring. A >10% price move triggers mandatory re-score that can invalidate the commitment. The breakout-volume setup is void when price returns below the breakout level.
- **2026-05-19 — NVDA earnings date correction:** Earnings are May 20 (not May 21). 48h window started May 18. This means NVDA should have been reviewed/closed at May 18 Pre-Market — which silently failed. OPERATOR MUST CLOSE NVDA TODAY.
- **2026-05-19 — PLTR $134 reclaim in risk-off market:** PLTR reclaimed $134 but re-scores 6.17 due to macro headwind (30yr yield 5.18%, three consecutive down days). Lesson: a technical trigger reclaim is necessary but not sufficient — macro environment must be conducive. PLTR at $134+ with stable/improving macro would be a ≥7 score.

## Setup Performance Tracker (updated 2026-05-14)
| Setup type | Wins | Losses | 3-in-a-row | Status |
|---|---|---|---|---|
| ai-momentum-pullback | 0 | 0 | none | Active (TSM open -0.4%, PLTR pending re-entry) |
| macro-hedge | 0 | 0 | none | Active (GLD open +2.4%, XLE open -2.3%) |
| earnings-reaction-follow | 0 | 0 | none | AMD setup reclassified to breakout-volume |
| breakout-volume | 0 | 0 | none | AMD pending fill (4th consecutive attempt) |
| earnings-reaction-fade | — | — | — | No trades |
| mean-reversion-oversold | — | — | — | No trades |
| sector-rotation | 0 | 0 | none | Active (JPM open -2.6% vs entry) |
| crypto-flush-rebound | — | — | — | No trades |
| candlestick-reversal | — | — | — | No trades |

No 3-in-a-row halt or boost rules triggered. No closed P&L to evaluate.

## Strategy Evolution Notes
- **2026-05-01 (init):** Strategy initialized per CLAUDE.md. No deviations.
- **2026-05-04:** First positions opened. Strategy unchanged; execution layer needs fixing.
- **2026-05-08:** Three-week persistent API blockage causing compounding execution gaps. Portfolio 85% cash vs. 10% floor target.
- **2026-05-12:** China chip deal changes AMD thesis from earnings-follow to breakout-volume. Rate-cut thesis broken (no cuts until 2027) but partially offset by China chip deal sector tailwind. PLTR government AI revenues insulated from rate environment. NVDA May 21 earnings approaching.
- **2026-05-14 (Week 2 Thursday):** Trump-Xi Summit Day 1 delivered massive NVDA catalyst (+4.54%). Boeing 200-jet order confirmed. PLTR near $134 re-entry. Markets at all-time records. Portfolio at +0.51% vs S&P +4.32% — entire gap attributable to API blockage keeping portfolio 80% in cash. No strategy changes warranted; execution infrastructure is the only problem. If API fixed and AMD/PLTR/MU deployed, portfolio would be ~+4-5% aligned with benchmark. **Friday Weekly Evolution Note:** Full strategy evolution note to be written at Daily Review May 15 (Friday).

## Next Routine Plan
- **Midday May 19 (12:30 PM ET — TODAY):**
  1. **Stop audit** — verify GLD stop $397.92 still resting (API blocked — log if confirmed via operator Alpaca dashboard check)
  2. **NVDA close confirmation** — operator should have submitted NVDA 15sh sell by now. If not, URGENT REMINDER.
  3. **Strategy switch sell status** — confirm TSM/JPM/AVGO sell orders submitted
  4. **Market scan** — check if energy/defense names developing ≥7 setups
  5. **AMD/PLTR re-score** — if market conditions improve (yields pull back, S&P stabilizes)
- **Afternoon May 19 (2:00 PM ET):**
  1. **Full 6-agent scores for energy/defense names** if thesis emerging (DVN, MRO, EOG, LMT, RTX)
  2. **Confirm all strategy switch sells filled**
- **Market Close May 19 (3:30 PM ET — CRITICAL):**
  1. **Confirm NVDA sell before 3:50 PM ET** (MOC order cutoff). This is the FINAL opportunity before earnings tomorrow.
- **Daily Review May 19 (4:30 PM ET):**
  1. Confirm all LT sells filled. Calculate realized P&L from strategy switch.
  2. Post-liquidation cash: ~$97K. Build watchlist for active + crypto deployment.
  3. Identify 5-7 active trading candidates for May 20 Pre-Market with 6-agent scores.
  4. Score: PLTR (if market stabilizes), AMD (if reclaims $415+), energy names, defense names.
  5. Write Weekly Strategy Evolution Note (overdue from Friday May 15).

## Cash Reserve Floor
$10,000 (10%). Current cash $80,946 — $70,946 available to deploy before hitting floor.
AMD fills would consume: 10sh × $445 = $4,450 → remaining: $76,496
+ PLTR 36sh × $134 = $4,824 → remaining: $71,672
+ MU 6sh × $788 = $4,728 → remaining: $66,944
After all three: $66,944 still in cash = 66% — still massively above 10% floor.
NVDA pre-earnings hedge consideration: Could use up to 1% of portfolio = ~$1,000 in protective puts.
