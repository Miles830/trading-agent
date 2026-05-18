# Opus Trader — Portfolio Memory

## Last Updated
**2026-05-18 (Monday) — Mid-Morning routine (11:08 AM ET / 15:08 UTC).** API STILL BLOCKED (HTTP 403, 10th+ consecutive session). Pre-Market and Market Open silently failed today. May 15 entirely silent (all 7 routines). Strategy switch liquidations (TSM/NVDA/JPM/AVGO) still unexecuted — API blocked + Pre-Market missed. NVDA earnings WEDNESDAY MAY 20 AMC — 48h no-new-entry window starts ~4PM ET TODAY. LMT scored 7.83 (APPROVED, sector-rotation defense play) but cannot execute. AMD re-scored 6.5 (down from 7.33 — macro headwinds). OPERATOR MUST: (1) sell NVDA 15sh TODAY before 4PM ET; (2) sell TSM 7sh, JPM 9sh, AVGO 7sh; (3) buy LMT 9sh bracket ($521.13 entry, $492.80 stop, $596.55 target).

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

## Current Account Snapshot (2026-05-18 Mid-Morning — API blocked, web-research prices)
- **Broker:** Alpaca Paper Trading (account PA3TXVEJ19LW)
- **Total Equity (estimated):** ~$100,362 (API blocked; prices from May 18 web research)
- **Cash:** ~$85,550 (85.2%) — from May 17 API verification; unchanged since no orders executed
- **Long Market Value (estimated):** ~$14,812 (5 positions — XLE confirmed non-existent per May 17 API check)
- **Open Positions:** 5 (TSM 7sh, GLD 7sh, NVDA 15sh, JPM 9sh, AVGO 7sh) — NOTE: TSM/NVDA/JPM/AVGO stops possibly NAKED (May 17 cancels may have cleared without replacement)
- **Pending Orders / Actions:** Strategy switch liquidations (TSM/NVDA/JPM/AVGO) BLOCKED 3rd time. NVDA MUST be sold TODAY before 4PM ET (earnings May 20 AMC). LMT bracket entry (score 7.83) also blocked. OPERATOR MUST execute all 5 orders manually.
- **API Status:** BLOCKED — "Host not in allowlist" (HTTP 403, Anthropic sandbox TLS proxy). Persistent failure since May 6. 10th+ consecutive blocked session.
- **Daytrade Count:** 0
- **NVDA Earnings:** May 20 AMC (Wednesday). 48h no-new-entry window starts ~4PM ET TODAY. Existing NVDA position must be sold before window opens.

## Bucket State (2026-05-18 — Post-Strategy-Switch allocation; LT bucket retired)
| Bucket | Target | Current $ (est.) | Current % | Positions |
|---|---|---|---|---|
| Active Trading | 85% (~$85K) | ~$14,812 (all 5 positions) | 14.8% | 5 (TSM/NVDA/JPM/AVGO pending liq + GLD) |
| Crypto | 10% (~$10K) | $0 | 0% | 0 (BTC $76.8K < $82K threshold) |
| Cash Reserve | 5% ($5K floor) | ~$85,550 | 85.2% | — |

**Post-liquidation target state (once TSM/NVDA/JPM/AVGO sold):**
| Bucket | Target | Est. $ after liq | Est. % | Action |
|---|---|---|---|---|
| Active Trading | 85% (~$85K) | ~$2,921 (GLD only) | 2.9% | Deploy ~$82K into new active trades |
| Crypto | 10% (~$10K) | $0 | 0% | BTC still below $82K threshold |
| Cash Reserve | 5% floor | ~$97,441 | 97.1% | Above floor — deploy remainder |

**Deployment gap after liq:** ~$82K available for active deployment (LMT = $4,669 = first step). Need ~16 more LMT-sized positions or 8 larger ones to reach 85% target.

## Open Positions (estimated, API blocked — prices from May 18 web research)
| Symbol | Bucket | Qty | Entry | Stop | Target | Cost basis | Est. Price | Est. P/L | Status | Sector |
|---|---|---|---|---|---|---|---|---|---|---|
| TSM | active* | 7 | 401.47 | $384.13** | n/a | $2,810.29 | ~$404.35 | +$20.16 | ⚠️ LIQUIDATE (strategy switch) | Semiconductors |
| GLD | active | 7 | 418.86 | $397.92 (-5%) | n/a | $2,932.02 | ~$417.29 | -$10.99 | ✓ KEEP | Precious metals |
| NVDA | active* | 15 | 198.83 | $216.60** | n/a | $2,982.45 | ~$228.00 | +$437.55 | 🔴 URGENT LIQUIDATE (earnings May 20 AMC) | Semiconductors |
| JPM | active* | 9 | 308.30 | $282.42** | n/a | $2,774.72 | ~$297.28 | -$99.18 | ⚠️ LIQUIDATE (strategy switch) | Financials |
| AVGO | active* | 7 | 418.59 | $402.33** | n/a | $2,930.13 | ~$423.50 | +$34.37 | ⚠️ LIQUIDATE (strategy switch) | Semiconductors |

*Reclassified from long-term → active per 2026-05-17 strategy switch (pending liquidation)
**Temporary emergency stop level (-5%) — original stops may be NAKED (May 17 bracket cancels may have cleared). If original stops still resting: TSM=$353.76, NVDA=$175.60, JPM=$272.14, AVGO=$368.36.

**Est. total long market value (5 positions):** ~$14,812
- TSM: 7 × $404.35 = $2,830
- GLD: 7 × $417.29 = $2,921
- NVDA: 15 × $228.00 = $3,420
- JPM: 9 × $297.28 = $2,676
- AVGO: 7 × $423.50 = $2,965

**Net unrealized P/L: +$382** (NVDA +$437 primary driver; JPM -$99 and GLD -$11 are drags)

## Sector Exposure (estimated — May 18 Mid-Morning)
| Sector | Est. $ | Est. % of equity |
|---|---|---|
| Semiconductors (TSM+NVDA+AVGO — pending liquidation) | $9,215 | 9.2% |
| Financials (JPM — pending liquidation) | $2,676 | 2.7% |
| Precious metals (GLD — KEEP) | $2,921 | 2.9% |
| Aerospace & Defense (LMT — approved, blocked) | $0 | 0% |
| Cash | $85,550 | 85.2% |

**Post-liquidation + LMT entry (target state):**
| Sector | Est. $ | Est. % |
|---|---|---|
| Aerospace & Defense (LMT 9sh) | $4,669 | 4.65% |
| Precious metals (GLD 7sh) | $2,921 | 2.91% |
| Cash | ~$92,772 | 92.4% |

Still massively under-deployed at 7.6% active (vs 85% target). LMT is first step. Need 15-20 more entries of similar size.

## Performance vs S&P 500
- **Portfolio total equity (est.):** ~$100,362 (May 18 mid-morning)
- **Portfolio total return:** +0.36% ($362 / $100,000 initial)
- **Since May 14 (est $100,514):** -$152 / -0.15%
- **S&P 500 current May 18:** ~7,392 (-0.22% today; -1.58% from May 14 record 7,511)
- **S&P 500 return since strategy start (~May 1, ~7,200):** ~+2.67%
- **Gap vs SPX: -2.31 percentage points** — IMPROVED from -3.81 pp on May 14 (SPX correction reduced benchmark while portfolio held steady in cash). Gap improvement came from SPX falling, not portfolio outperforming — do not mistake this for genuine alpha.
- **Iran conflict impact:** SPX fell -1.58% from record. Portfolio -0.15% (cash buffer). Net gap improvement: +1.50 pp (May 14 to May 18).
- **CRITICAL:** Gap approaching -4 pp in 10 trading days. If AMD, PLTR, MU entered tomorrow and markets hold, gap could narrow by ~1 pp. Operator action on May 15 is critical.

## Macro Context (as of 2026-05-18 mid-morning)
- **Iran conflict (dominant theme):** Trump rejected proposed peace framework on May 15. Oil $104-109/bbl. Strait of Hormuz risk ongoing. US-Israel-Iran conflict started Feb 28, 2026. No de-escalation signal. Defense stocks (LMT, RTX, NOC) outperforming. Energy (XLE) elevated but volatile.
- **Rate hike fears:** 10Y Treasury yield 4.60%+ — highest in a year. War-stoked inflation + no rate cuts expected 2026. Growth stocks (tech) under pressure.
- **S&P 500:** ~7,392 today (-0.22%). Down -1.58% from May 14 record (7,511). Cautious tone ahead of NVDA earnings Wednesday.
- **NVDA Earnings (CRITICAL):** May 20 AMC (WEDNESDAY). 48h no-new-entry window starts ~4PM ET TODAY (May 18). Existing NVDA position must be sold TODAY per strategy switch. Earnings = binary event; holding naked into AMC is unacceptable risk.
- **Bitcoin:** $76,800-77,400 (May 18 morning). Rate hike fears + whale liquidations = continued weakness. Re-entry threshold remains $82K+. DO NOT lower threshold.
- **Trump-Xi Summit outcomes (May 14-15):** H200 cleared for select Chinese companies. 200-jet Boeing order confirmed. Summit optimism peaked May 14 but reversed May 15 on Iran escalation. AMD China chip deal thesis still intact at longer horizon.
- **Aerospace & Defense:** LMT $518.74 (+0.53% on -0.22% day). RTX, NOC also outperforming. Direct Iran conflict tailwind. Approved entry setup (7.83 avg) blocked by API.
- **AMD:** ~$428 (ATH $469 on May 11). Pulled back on Iran/rate fears. China chip deal thesis intact but macro headwinds drag score to 6.5 (below 7 threshold). Monitor for recovery.

## Active Themes
1. **Defense / Iran conflict** — LMT scored 7.83 (APPROVED, blocked by API). RTX, NOC also in play. Iran conflict escalating = sustained defense spending tailwind. This is now the PRIMARY new theme for the trading book.
2. **AI broadening / China chip deal** — AMD (6.5 today, below entry threshold) and MU (6.5 today). NVDA positions being liquidated per strategy switch. Once NVDA sold, can re-engage with the AI theme via AMD when macro recovers. Summit outcomes still positive for chip exports longer-term.
3. **Geopolitical inflation hedge (GLD)** — GLD at $417.29 (-$10.99 vs entry). Iran conflict and war-stoked inflation support gold at medium horizon. Keep position; stop $397.92 = 4.9% cushion.
4. **Crypto recovery** — BTC $76,800-77,400. Rate hike fears driving down. Threshold unchanged at $82K. No action.
5. **Government AI (PLTR AIP)** — PLTR $132.20. Intraday high touched $135.62 but retreated. Re-entry condition: sustained close above $134. No action today.
6. **Energy (XLE)** — Oil $104-109. XLE ~$59.44. Score 6.5 today (below entry threshold). Monitor: if macro stabilizes and oil holds above $100, XLE score could recover to 7+.

## Pending Actions — OPERATOR MUST EXECUTE MAY 18 (TODAY)

**🔴 PRIORITY 1 — NVDA SELL (URGENT — earnings May 20 AMC):**
Sell NVDA 15 shares at limit ~$228 (or market). Must execute BEFORE 4PM ET today. After 4PM ET, we enter 48h NVDA earnings window (no new NVDA entries; existing position EXIT is still allowed after 4PM but gap risk accumulates). Unrealized P/L ~+$437 — lock it in.

**🔴 PRIORITY 2 — Strategy Switch Liquidations:**
Sell TSM 7sh ~$404 (limit), JPM 9sh ~$297 (limit), AVGO 7sh ~$423 (limit). All returning HTTP 403 from cloud runner. Use operator Codespace.

**🟡 PRIORITY 3 — Stop Verification:**
Run GET /v2/orders?status=open to verify TSM/NVDA/JPM/AVGO still have resting stops (May 17 pending_cancel orders may have cleared). If naked: place emergency GTC stops at -5% from current prices before selling.

**🟢 PRIORITY 4 — LMT Entry (approved, score 7.83):**
Once liquidations execute, place LMT bracket order:
- Buy 9 shares at limit $521.13 (0.5% above current ask ~$518.74)
- Stop loss: $492.80 (5% below entry)
- Take profit: $596.55 (15% above entry)
- time_in_force: gtc, order_class: bracket

```bash
curl -X POST "${APCA_API_BASE_URL}/v2/orders" "${AUTH[@]}" -H 'Content-Type: application/json' -d '{
  "symbol":"LMT","qty":9,"side":"buy","type":"limit","limit_price":"521.13",
  "time_in_force":"gtc","order_class":"bracket",
  "stop_loss":{"stop_price":"492.80"},
  "take_profit":{"limit_price":"596.55"}
}'
```

**PLTR** (conditional 6.50): Re-enter ONLY if $134 reclaims and sustains. Intraday $135.62 today but retreated. Condition not met.

**AMD** (6.5 today, was 7.33): Score dropped below 7 due to technical breakdown and macro headwinds. Not required. Will re-score at next Pre-Market with real API data.

**MU** (6.5 estimated): Score dropped below 7 due to macro. Not required. Will re-score at next Pre-Market.

## Pending Deferrals
- **LMT** (7.83) — APPROVED, blocked by API. Operator must place manually.
- **PLTR** ($132.20 < $134) — condition not met; monitor
- **AMD** (6.5, re-scored below 7) — not required until score recovers or macro improves
- **MU** (~6.5 estimated) — not required; re-score at next Pre-Market

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
- **2026-05-15 — Iran escalation (all 7 routines silent-failed):** Trump rejected peace framework. S&P -0.88% to ~7,408. Oil $109/bbl. 10Y yield 4.55%. AMD fell from $449 to $420. Nothing ran. Strategy switch from May 17 could not be prepped.
- **2026-05-17 (Sunday) — Strategy switch:** Operator converted account to 100% trading. LT bucket retired. MOO liquidations for TSM/NVDA/JPM/AVGO queued for May 18 open. GLD stays. New 3:1 R/R minimum. 5-indicator stack mandatory.
- **2026-05-18 — NVDA earnings clarified (Mid-Morning):** NVDA earnings are Wednesday May 20 AMC (NOT May 21 as previously believed). 48h window starts ~4PM ET today. Operator must sell NVDA today. This is the most urgent single action.
- **2026-05-18 — LMT identified (Mid-Morning):** Defense sector-rotation on Iran conflict. LMT scored 7.83, APPROVED. New primary theme for the trading book. 5 of 6 agents agreed. API blocked; must execute manually.
- **2026-05-18 — Score framework works in both directions:** AMD dropped from 7.33 (May 14) to 6.5 (May 18) due to macro deterioration (Iran, 4.60% yield). Score ≤ 7 = no entry. This is the framework working correctly — not a failure.

## Setup Performance Tracker (updated 2026-05-18)
| Setup type | Wins | Losses | 3-in-a-row | Status |
|---|---|---|---|---|
| ai-momentum-pullback | 0 | 0 | none | Active (GLD -$11; TSM/NVDA/AVGO being liquidated) |
| macro-hedge | 0 | 0 | none | Active (GLD -$11, stop $397.92 resting) |
| earnings-reaction-follow | 0 | 0 | none | AMD reclassified to breakout-volume |
| breakout-volume | 0 | 0 | none | AMD re-scored 6.5 (below entry threshold) |
| earnings-reaction-fade | — | — | — | No trades |
| mean-reversion-oversold | — | — | — | No trades |
| sector-rotation | 0 | 0 | none | LMT APPROVED (7.83) — pending API fix for execution |
| crypto-flush-rebound | — | — | — | No trades |
| candlestick-reversal | — | — | — | No trades |

No 3-in-a-row halt or boost rules triggered. Still no closed P/L (no fills since May 4/5).

## Strategy Evolution Notes
- **2026-05-01 (init):** Strategy initialized per CLAUDE.md. No deviations.
- **2026-05-04:** First positions opened. Strategy unchanged; execution layer needs fixing.
- **2026-05-08:** Three-week persistent API blockage causing compounding execution gaps. Portfolio 85% cash vs. 10% floor target.
- **2026-05-12:** China chip deal changes AMD thesis from earnings-follow to breakout-volume.
- **2026-05-14 (Week 2 Thursday):** Trump-Xi Summit Day 1. NVDA +4.54%. Markets at ATH. Portfolio +0.51% vs S&P +4.32% — entire gap from API blockage.
- **2026-05-17 (Strategy switch):** LT bucket retired. 100% trading book. New guardrails: 3:1 R/R min, 5-indicator stack, 5% stop (active), cash floor 5%.
- **2026-05-18 (Week 3 Monday):** Iran conflict replaces China deal as dominant theme. Defense (LMT) identified as new primary opportunity. NVDA earnings May 20 AMC (not May 21) — sell today. Market at 7,392 (off record); gap vs SPX narrowed to -2.31 pp due to benchmark pullback. AMD re-scored below threshold — framework working correctly. Infrastructure still broken (API HTTP 403, 10+ days).

## Next Routine Plan — Midday May 18 (12:30 PM ET / 16:30 UTC)
1. **Stop audit:** Verify TSM/NVDA/JPM/AVGO stop status (if API somehow unblocked). If still blocked: document.
2. **NVDA liquidation status:** Check if operator placed NVDA sell. If not yet: URGENT re-alert. 48h window starts ~4PM ET.
3. **LMT:** If API unblocked: attempt LMT bracket entry. If still blocked: re-alert operator.
4. **AMD:** Re-check price. If AMD holds $420 and macro shows any stabilization, re-score. Entry threshold: needs 2/5 technical indicators bullish.
5. **PLTR:** Check if $134 reclaimed. If sustained above $134: run full 6-agent, likely score 7.33.
6. **GLD:** Trail stop if price recovers above entry $418.86 (never trail down).

## Cash Reserve Floor
$5,000 (5% floor per new strategy). Current cash ~$85,550 — ~$80,550 available to deploy before hitting floor.
Post-liquidation (TSM/NVDA/JPM/AVGO sold): ~$97,441 cash — ~$92,441 deployable.
LMT fill: ~$92,441 - $4,669 = $87,772 remaining → 87.4% of equity → still above 5% floor by $82,772.

## Cash Reserve Floor
$10,000 (10%). Current cash $80,946 — $70,946 available to deploy before hitting floor.
AMD fills would consume: 10sh × $445 = $4,450 → remaining: $76,496
+ PLTR 36sh × $134 = $4,824 → remaining: $71,672
+ MU 6sh × $788 = $4,728 → remaining: $66,944
After all three: $66,944 still in cash = 66% — still massively above 10% floor.
NVDA pre-earnings hedge consideration: Could use up to 1% of portfolio = ~$1,000 in protective puts.
