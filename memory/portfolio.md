# Opus Trader — Portfolio Memory

## Last Updated
**2026-05-18 (Monday, ~2:00 PM ET) — Afternoon Routine.** Strategy switch in progress. LT liquidation MOC sells attempted for TSM/NVDA/JPM/AVGO — ALL BLOCKED (API HTTP 403). OPERATOR MUST MANUALLY EXECUTE before 3:50 PM ET today. NVDA earnings May 20 AMC — **do not carry NVDA through earnings**. GLD continues as active hold. Market down -0.5% today (tech -2%). AMD and PLTR on watch for Pre-Market May 19.

**PRIOR Last Updated:** 2026-05-17 (Sunday) — STRATEGY SWITCH to 100% trading account (operator directive from main session). Allocation changed from 55/30/5/10 (LT/active/crypto/cash) to **85/10/5 (active/crypto/cash).** Long-term bucket retired. All 4 LT positions queued for MOO close at Monday 2026-05-18 open (TSM 7, NVDA 15, JPM 9, AVGO 7). Only GLD carries over. New 3:1 R/R minimum. New mandatory 5-indicator stack (Stochastic, Candle, Volume Oscillator, MACD, Volume Spike — 2-of-5 confirms required).

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
- **Total Equity (estimated):** ~$100,285 (estimated; API blocked; prices from web research May 18 ~2 PM ET)
- **Cash:** ~$85,550 (85.3%) — per May 17 Alpaca verification; no new orders executed since
- **Long Market Value (estimated):** ~$14,735 (5 positions: TSM, GLD, NVDA, JPM, AVGO)
- **Open Positions:** 5 (XLE confirmed SOLD per May 17 Alpaca verification)
- **Pending Actions:**
  - **CRITICAL (before 3:50 PM ET TODAY):** Operator must manually submit MOC sells: TSM 7sh, NVDA 15sh, JPM 9sh, AVGO 7sh — all blocked by API. NVDA urgency level CRITICAL (earnings May 20 AMC).
  - If MOC sells missed today: Must execute at Pre-Market May 19 as MOO sells. NVDA must be out no later than May 19 market open.
  - AMD entry: re-score at Pre-Market May 19 (pre-score 6.8, may reach ≥7 with fresh technical read)
  - PLTR: conditional re-entry if $134 reclaimed
- **API Status:** BLOCKED — "Host not in allowlist" (HTTP 403, Anthropic sandbox TLS proxy). Persistent failure. ~12th+ consecutive blocked session.
- **Daytrade Count:** 0

## Bucket State (New Strategy: 85% Active / 10% Crypto / 5% Cash floor)
| Bucket | Target | Current $ (est.) | Current % | Positions |
|---|---|---|---|---|
| Active Trading | 85% ($85K) | ~$2,921 (GLD only; LT positions being liquidated) | 2.9% | 1 active + 4 legacy-LT |
| Crypto | 10% ($10K) | $0 | 0% | 0 |
| Cash Reserve | 5% floor ($5K) | ~$85,550 | 85.3% | — |
| Legacy LT (liquidating) | 0% (target) | ~$11,814 (TSM+NVDA+JPM+AVGO) | 11.8% | 4 (exiting) |

**Deployment gap:** Active bucket is 2.9% vs 85% target = $82K+ underdeployed. After LT liquidation closes (~$11.8K back to cash), total cash ≈ $97K. Then 85% deployment target requires ~$85K active + $10K crypto. ~$70K new active entries needed. AMD (top priority) + 10-15 additional active setups needed over coming sessions.

## Open Positions (estimated, API blocked — prices from web research May 18 ~2 PM ET)
| Symbol | Bucket | Qty | Entry | Stop | Target | Cost basis | Est. Price | Est. P/L | Sector | Status |
|---|---|---|---|---|---|---|---|---|---|---|---|
| TSM | legacy-LT (liquidating) | 7 | 401.47 | 353.76 | — | $2,810.29 | ~$404 | +$17.71 | Semiconductors | MOC sell blocked; operator must execute |
| GLD | active | 7 | 418.86 | 397.92 (-5%) | — | $2,932.02 | ~$417 | -$13.02 | Precious metals | HOLD — active bucket carryover |
| NVDA | legacy-LT (liquidating) | 15 | 198.83 | 175.60 | — | $2,982.45 | ~$225 | +$392.55 | Semiconductors | **CRITICAL: MOC sell blocked; SELL before earnings May 20** |
| JPM | legacy-LT (liquidating) | 9 | 308.30 | 272.14 | — | $2,774.72 | ~$297 | -$101.70 | Financials | MOC sell blocked; operator must execute |
| AVGO | legacy-LT (liquidating) | 7 | 418.48 | 368.36 | — | $2,933.36 | ~$420 | +$10.64 | Semiconductors | MOC sell blocked; operator must execute |
| XLE | — | — | — | — | — | — | SOLD | — | Confirmed sold per May 17 Alpaca API verification |

**Est. total long market value (5 positions):** ~$14,735
- TSM: 7 × $404 = $2,828
- GLD: 7 × $417 = $2,919
- NVDA: 15 × $225 = $3,375
- JPM: 9 × $297 = $2,673
- AVGO: 7 × $420 = $2,940

**Net unrealized P/L: +$306.18** (NVDA +$392.55 primary driver; JPM -$101.70 drag; GLD slightly below entry)

## Sector Exposure (estimated — May 18 ~2 PM ET)
| Sector | Est. $ | Est. % of equity |
|---|---|---|
| Semiconductors (TSM+NVDA+AVGO — liquidating) | $9,143 | 9.1% |
| Financials (JPM — liquidating) | $2,673 | 2.7% |
| Precious metals (GLD — active hold) | $2,919 | 2.9% |
| Cash | $85,550 | 85.3% |

**Post-LT liquidation (target state):**
| Sector | Target | Notes |
|---|---|---|
| Active equities | ~$85K (85%) | AMD, PLTR, momentum names, sector leaders |
| Crypto | ~$10K (10%) | BTC/ETH when BTC > $82K |
| Cash floor | $5K (5%) | Hard floor, never deployed below |

All sectors currently well under 25% cap. Post-liquidation, active deployment of ~$85K will require 17-20 positions at ~$4-5K each (5% cap).

## Performance vs S&P 500
- **Portfolio total equity (est.):** ~$100,285 (May 18 ~2 PM ET)
- **Portfolio total return:** +0.29% ($100,285 / $100,000 initial)
- **Today's P&L (vs May 17 est $100,359):** ~-$74 (NVDA -$11, GLD -$13, JPM -$5, TSM flat, AVGO -$35 vs May 17 prices)
- **S&P 500 May 18 intraday (~2 PM ET):** ~7,380 (-0.5% today vs 7,511 May 14 close)
- **S&P 500 return since strategy start (~May 1):** ~+2.5% (7,380 vs ~7,200 est. start)
- **Gap vs SPX:** **~-2.21 percentage points** — NARROWED from -3.81 pp (May 14) because market pulled back -1.74% from the record high while portfolio (mostly cash) barely moved. Gap closing passively as market corrects, but this is not an active improvement — still massively underdeployed.
- **Note on gap:** True improvement requires active deployment, not market pullbacks. After LT liquidation, rapid deployment into active setups (AMD, PLTR, sector leaders) is the path to closing the gap.
- **CRITICAL:** Gap approaching -4 pp in 10 trading days. If AMD, PLTR, MU entered tomorrow and markets hold, gap could narrow by ~1 pp. Operator action on May 15 is critical.

## Macro Context (as of 2026-05-18 ~2:00 PM ET)
- **Trump-Xi Summit OUTCOME:** Ended May 15 without formal chip deal. US authorized H200 exports; China has NOT formally approved shipments. Chip stocks sold off -3-6% May 15. Semiconductor overhang continues.
- **Market today (May 18):** S&P 500 ~7,380 (-0.5%), tech -2%, Russell -0.79%. Iran conflict re-escalating. 10Y Treasury yield 4.60%+ (new year high). No rate cuts in 2026.
- **NVDA Earnings:** **May 20 AMC** (CORRECTED — not May 21). Consensus: ~$78-79B revenue, $1.77 EPS. Options: ±8-10% implied move. 48h window starts tonight. DO NOT initiate NVDA positions.
- **AMD:** At $415. Mizuho PT $515. MI300X structural AI demand. Pre-score 6.8 → re-score Pre-Market May 19.
- **PLTR:** $132.20, below $134 trigger. Conditional re-entry only.
- **Bitcoin:** Monitoring $82K threshold. No entries below.
- **GLD:** $417.29 (slightly below entry). Iran + rising real yields = structural bid.
- **Iran:** Trump escalating. Oil elevated. GLD benefits.
- **NVDA post-earnings (May 21+):** Beat + gap-up = potential momentum active entry. Do NOT pre-position.

## Active Themes (Updated May 18)
1. **AI infrastructure — AMD** — AMD at $415 (down from $448 May 13 peak on China chip deal miss). China deal didn't fully materialize (US authorized H200 shipments; China hasn't approved). AMD's Western AI data center business (MI300X) remains structural. Mizuho raised PT to $515. Pre-score 6.8 → re-score at Pre-Market May 19. MUST ENTER if score ≥ 7.
2. **Inflation / Geopolitical hedge — GLD** — Active hold. At $417, below entry $418.86. Iran resurfacing, yields at 4.60%+ (new year high), no rate cuts. Gold structural bid. Stop $397.92 intact. Thesis valid.
3. **Government AI — PLTR** — At $132.20, below $134 re-entry trigger. No catalyst from chip deal. Conditional: re-enter if $134 reclaimed with volume. Pre-score 5.5 → too low to enter without $134 reclaim.
4. **Crypto** — BTC unknown current price. $82K re-entry threshold intact. No entries until threshold cleared.
5. **NVDA Earnings Catalyst (OTHER SIDE)** — Post-earnings May 20: if NVDA beats consensus ($78-79B revenue) and stock gaps +8-10%, there may be a momentum entry opportunity May 21. Do NOT pre-position. Wait for print.
6. **Sector rotation** — With tech under pressure, defensive sectors (healthcare XLV, utilities) and commodities (GLD, oil names) may outperform. Healthcare (XLV) was up +1.2% on May 14 while tech lagged. Monitor for sector-rotation entry opportunity in healthcare sector ETF or component.

## Pending Actions — OPERATOR (Updated May 18)

**TODAY (before 3:50 PM ET):**
1. **NVDA MOC SELL 15sh** — CRITICAL. Earnings May 20 AMC. 48h window tonight. API blocked, operator must manually execute. `{"symbol":"NVDA","qty":15,"side":"sell","type":"market","time_in_force":"cls"}`
2. **TSM MOC SELL 7sh** — Strategy switch LT liquidation. `{"symbol":"TSM","qty":7,"side":"sell","type":"market","time_in_force":"cls"}`
3. **JPM MOC SELL 9sh** — Strategy switch LT liquidation. `{"symbol":"JPM","qty":9,"side":"sell","type":"market","time_in_force":"cls"}`
4. **AVGO MOC SELL 7sh** — Strategy switch LT liquidation. `{"symbol":"AVGO","qty":7,"side":"sell","type":"market","time_in_force":"cls"}`

**If missed today — PRE-MARKET MAY 19 (before 9:25 AM ET):**
1. MOO SELL all 4 LT positions (same parameters, change `"time_in_force":"opg"`)
2. NVDA MUST BE OUT no later than May 19 market open (earnings window)

**MAY 19 PRE-MARKET (new entries after LT liquidation):**
1. **AMD** (pre-score 6.8, active bucket): Full 6-agent re-score at 8 AM ET. If score ≥ 7, enter: 10-12 shares at ~$415, stop $394 (-5%), target $477 (+15%), R/R 3:1. Bracket order GTC.
2. **PLTR** (conditional): Re-enter if $134 reclaimed with volume. Full 6-agent re-score.
3. **Whole-market scan**: Post-LT liquidation, deploy aggressively toward 85% target. Need 10-15 new active positions over next 5 sessions.

## Pending Deferrals (Updated May 18)
- **AMD** (pre-score 6.8 pending 6-agent confirm) — 5th+ consecutive deployment failure; re-score at Pre-Market May 19. Must enter if ≥7.
- **PLTR** (score 5.5, conditional) — below $134 trigger ($132.20 today). Re-enter only if $134 reclaimed with volume
- **MU** (Micron, est. ≥7) — AI memory supercycle. Was pending at ~$788 on May 14. Need fresh price and re-score at Pre-Market May 19. Note: JEDEC HBM4 leadership. Check if MU has earnings upcoming.
- **Whole-market active scan** — Post LT-liquidation, need to identify 10-15 active setups to hit 85% deployment target

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
- **2026-05-15 — Trump-Xi Summit Day 2 (NO DEAL):** Summit ended without a formal chip deal. Chip stocks sold off -3-6%: NVDA -3.4% to ~$227, AMD -4%, TSM -2%, AVGO -3%. The "priced for perfection" dynamic: chip stocks had run up 4-15% in 5 days pricing a deal that didn't materialize. Lesson: do not hold momentum names into binary events (even non-earnings) where disappointment risk is binary.
- **2026-05-15 to 2026-05-17 — weekend, no routines.** Strategy switch executed Sunday May 17 (operator session). All LT positions queued for liquidation. XLE confirmed SOLD between May 5-17.
- **2026-05-18 — strategy switch Day 1 (FOURTH consecutive full-day execution failure):** All 4 predecessor routines (Pre-Market, Market Open, Mid-Morning, Midday) SILENT FAILED. MOC LT liquidation sells blocked by API. NVDA still held with earnings May 20. AMD still not entered. Cash still 85%+ of portfolio. This is a systemic infrastructure failure, not a strategy failure. Root cause: Anthropic sandbox TLS proxy blocking egress to paper-api.alpaca.markets.
- **NVDA earnings correction:** Prior notes said May 21. CORRECT DATE: May 20 AMC (Q1 FY2027). 48h binary event window starts ~tonight (May 18 ~4:30 PM ET). NVDA must be closed before market open May 19 at the latest.

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

### TODAY — Operator action required before 3:50 PM ET:
1. MOC SELL: NVDA 15sh (CRITICAL — earnings May 20), TSM 7sh, JPM 9sh, AVGO 7sh
2. API in Alpaca paper account: use endpoint `POST https://paper-api.alpaca.markets/v2/orders` with `time_in_force: "cls"`

### Market Close Routine (3:30 PM ET) — automated:
1. Verify LT liquidation MOC fills (if operator executed)
2. Confirm GLD stop still resting
3. If LT MOC sells NOT done, place market limit orders at bid for all 4 symbols

### Daily Review (4:30 PM ET):
1. Verify LT liquidation fills
2. Update portfolio.md with actual fill prices and new cash balance
3. Confirm post-liquidation cash available for deployment
4. Watchlist for May 19: AMD (top priority), fresh whole-market scan

### Pre-Market May 19 (8:00 AM ET) — MANDATORY:
1. If LT positions still open: MOO sells (TSM, NVDA, JPM, AVGO) — NVDA URGENT
2. Full 6-agent re-score for AMD at ~$415. If score ≥ 7: ENTER (bracket GTC). Cap: 12 shares at $415 = $4,980 = 4.98% ✓
3. PLTR: conditional re-score if $134+ at open
4. Whole-market scan for fresh active setups to close deployment gap
5. Post-LT cash will be ~$97K — need to deploy ~$92K into active+crypto buckets over next 10 sessions

## Cash Reserve Floor
**5% of total equity** (changed from 10% in strategy switch May 17).
Current total equity: ~$100,285
Hard cash floor: ~$5,014

Current cash: ~$85,550 — $80,536 available to deploy before hitting 5% floor.

**Post-LT liquidation (anticipated):**
- Add TSM proceeds: ~$2,828
- Add NVDA proceeds: ~$3,375
- Add JPM proceeds: ~$2,673
- Add AVGO proceeds: ~$2,940
Total post-liquidation cash: ~$97,366
Available to deploy (above 5% floor): ~$92,352

**Deployment schedule:**
- 85% target = ~$85K in active equities
- 10% target = ~$10K in crypto
- Minimum 10-15 active positions needed at $4-5K each to hit target
