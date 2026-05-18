# Opus Trader — Portfolio Memory

## Last Updated
**2026-05-18 (Monday Daily Review — 20:37 UTC)** — Strategy switch still PENDING (Pre-Market routine silently failed for 12th consecutive session). NVDA earnings Wednesday May 20 AH — MOO close MUST execute May 19. AMD formally re-scored and REJECTED (6.17). Cumulative gap vs SPX: −3.69 pp. API still blocked. May 15 daily review: complete silent failure. All prices estimated from web research.

_Prior update preserved below:_
**2026-05-17 (Sunday) — STRATEGY SWITCH to 100% trading account (operator directive from main session).** Allocation changed from 55/30/5/10 (LT/active/crypto/cash) to **85/10/5 (active/crypto/cash).** Long-term bucket retired. All 4 LT positions queued for MOO close at Monday 2026-05-18 open (TSM 7, NVDA 15, JPM 9, AVGO 7). Only GLD carries over. New 3:1 R/R minimum. New mandatory 5-indicator stack (Stochastic, Candle, Volume Oscillator, MACD, Volume Spike — 2-of-5 confirms required).

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
- **Total Equity (estimated):** ~$100,213 (API blocked; prices from May 18 web research)
- **Cash:** ~$85,550 (85.4%) — unchanged; strategy switch not executed
- **Long Market Value (estimated):** ~$14,663 (5 positions)
- **Open Positions:** 5 (TSM, GLD, NVDA, JPM, AVGO — all LT carryover pending strategy-switch close)
- **Stop Status:** TSM/NVDA/JPM/AVGO NAKED (stops cancelled May 17 as part of strategy switch prep). GLD stop $397.92 ACTIVE.
- **Pending Actions (URGENT):** Strategy switch MOO sells (TSM 7, NVDA 15, JPM 9, AVGO 7) 2 days overdue. NVDA earnings Wednesday May 20 AH creates hard deadline — execute by May 19 open or operator manually submits.
- **API Status:** BLOCKED — "Host not in allowlist" (HTTP 403, Anthropic sandbox TLS proxy). Persistent failure since May 6. 12th consecutive blocked session (intraday routines).
- **AMD:** Re-scored REJECTED (6.17). Technical deterioration. Not entering at current levels.
- **Daytrade Count:** 0

## Bucket State (as of May 18 close, estimated)
| Bucket | Target | Current $ (est.) | Current % | Positions |
|---|---|---|---|---|
| Active Trading | 85% ($85K) | ~$14,663 (all LT carryover pending close) | 14.6% | 5 (TSM, NVDA, JPM, AVGO, GLD — all pending strategy switch) |
| Crypto | 10% ($10K) | $0 | 0% | 0 |
| Cash Reserve | 5% floor | ~$85,550 | 85.4% | — |

**Deployment gap:** Post-strategy-switch cash will be ~$97K. Target is 85% deployed = $85K in active positions + $10K crypto + $5K cash floor. Currently: $80K+ available to deploy after switch executes. Operator/routine must execute MOO sells May 19 THEN place new active entries from watchlist.

## Open Positions (estimated, API blocked — prices from May 18 web research)
| Symbol | Bucket | Qty | Entry | Stop | Cost Basis | Est. Price | Est. P/L | Sector | Notes |
|---|---|---|---|---|---|---|---|---|---|
| TSM | LT→CLOSE | 7 | 401.47 | 🔴 NAKED | $2,810.29 | ~$393.43 | −$56.28 | Semiconductors | MOO sell May 19 |
| GLD | active | 7 | 418.86 | 397.92 ✅ | $2,932.02 | ~$417.00 | −$13.02 | Precious metals | Carryover; stop active |
| NVDA | LT→CLOSE | 15 | 198.83 | 🔴 NAKED | $2,982.45 | ~$224.00 | +$377.55 | Semiconductors | EARNINGS WED — MUST close May 19 |
| JPM | LT→CLOSE | 9 | 308.30 | 🔴 NAKED | $2,774.72 | ~$299.00 | −$83.70 | Financials | MOO sell May 19 |
| AVGO | LT→CLOSE | 7 | 418.48 | 🔴 NAKED | $2,933.36 | ~$419.79 | +$9.17 | Semiconductors | MOO sell May 19 |

**Est. total long market value (May 18):** ~$14,663
- TSM: 7 × $393.43 = $2,754 | GLD: 7 × $417.00 = $2,919
- NVDA: 15 × $224.00 = $3,360 | JPM: 9 × $299.00 = $2,691 | AVGO: 7 × $419.79 = $2,939

**Net unrealized P/L (vs cost basis): +$234** (NVDA +$378 primary driver; JPM −$84, TSM −$56 dragging)

## Sector Exposure (estimated — May 18 EOD; all positions pending close)
| Sector | Est. $ | Est. % of equity |
|---|---|---|
| Semiconductors (TSM+NVDA+AVGO) | $9,053 | 9.0% |
| Financials (JPM) | $2,691 | 2.7% |
| Precious metals (GLD) | $2,919 | 2.9% |
| Cash | $85,550 | 85.4% |

Post-strategy-switch (after MOO sells): ~97K cash. New active entries will redistribute into sectors per 25% cap guardrails.

## Performance vs S&P 500
- **Portfolio total equity (est.):** ~$100,213 (May 18 close)
- **Portfolio total return:** +0.21% ($100,213 / $100,000 initial)
- **May 18 P&L:** −$125 / −0.12% (from verified May 15 equity $100,338)
- **May 15 P&L (retrospective):** −$176 / −0.17% (NVDA −4.37% on summit disappointment, GLD −2.73%)
- **S&P 500 (SPY) May 18 close:** $739.17 (−1.20% from $748.17 May 15 close)
- **S&P 500 return since strategy start (~May 1, $713):** ~+3.7%
- **Portfolio return since start:** +0.21%
- **Cumulative gap vs SPX: −3.69 pp** (improved from −3.81 pp on May 14 and −4.77 pp on May 15, recovered on today's market selloff)
- **Consecutive underperforming days:** 12 (every trading day since May 1 start). Threshold for strategy review: 20 days. Root cause: infrastructure failure forcing 85% cash — not strategy failure.

## Macro Context (as of 2026-05-18 market close)
- **Iran conflict escalating:** Trump "clock is ticking" statement → 10Y Treasury yield hit year-high >4.60%, oil elevated, risk-off, crypto flush ($814M liquidated). Geopolitical premium in energy/defense/gold.
- **NVDA Earnings Wednesday May 20 AH:** Consensus $1.78 EPS (+120% YoY), $79.2B revenue. Options imply ±8-10% move. Strategy: close existing NVDA position via MOO May 19. No new NVDA entries in 48h window.
- **Summit aftermath:** Summit Day 2 (May 15) disappointed — no comprehensive chip export framework. Chip stocks corrected: NVDA −4.37%, TSM +1.14% (odd), MU −from ATH $818.
- **ServiceNow (NOW) breakout:** +8.9% today on BofA Buy reinstatement + agentic AI production deployments (Experian, Accenture, FedEx Dataworks, Boomi). Signals that enterprise AI is moving from pilot to production.
- **Bitcoin:** $76K (further below $82K re-entry threshold). Fear & Greed 37 (Fear). Do NOT enter crypto.
- **AMD:** Re-scored REJECTED (6.17). Price $412, RSI 80.6, analyst consensus target $395.65 below current price. Not entering.
- **PLTR:** $132.20 (below $134 re-entry trigger). Score ~6.5. SKIP.
- **Rate environment:** No cuts in 2026. 10Y at year-high. Growth stocks under modest pressure.

## Active Themes
1. **AI broadening / China chip deal** — TSM + NVDA + probable AVGO in LT bucket. AMD approved (7.33), blocked 4 sessions — MUST enter May 15. Summit Day 1 very positive (Jensen Huang attended). Day 2 communiqué could unlock additional chip export easing. MU (memory supercycle, est. 7.33) also pending entry.
2. **Steeper curve / financials drag** — JPM (LT) at $300.26, now -2.6% below entry $308.30. PPI hot = no rate cuts. JPM falling on every high-inflation print. Stop $272.14 provides cushion but thesis weakening. Monitor for stop management.
3. **Geopolitical inflation hedge** — GLD (active) +2.4% from entry ($429.01). XLE thin stop ($56.15 vs $57.64 = 2.65% ⚠️). Iran deal still unconfirmed.
4. **Crypto recovery** — BTC ~$79,600, dipped below $80K. Summit produced no crypto language. Threshold unchanged at $82K. Weakness — do not lower threshold.
5. **Government AI (PLTR AIP)** — PLTR recovering: $133.40 (+2.62% today, just $0.60 from $134 re-entry trigger). Summit Day 2 AI language could be the catalyst. Pre-Market May 15: re-score if PLTR opens >$134.
6. **Aerospace / Boeing** — Boeing 200-jet China order confirmed. GE Aerospace engine supplier. Monitor for entry opportunity if Day 2 summit strengthens the thesis (score ~6.2 currently, needs 7+ for entry).

## Pending Actions — OPERATOR MUST EXECUTE MAY 15

1. **AMD** (score 7.33, breakout-volume, active): Buy 10 shares at open May 15 (MOO or market limit ~$445). Post-fill: place stop at fill_price × 0.95 (active -5%). Target fill × 1.10. This has been approved and blocked/unconfirmed for 4 consecutive sessions. MANDATORY. 4th consecutive instruction.

2. **PLTR** (score 6.50, CONDITIONAL): Re-enter ONLY if PLTR opens and holds above $134 on May 15 summit Day 2 news. Full 6-agent re-score at Pre-Market. Estimated re-score: 7.33 if Technical rises to 6 on support reclaim.

3. **MU** (Micron, est. score ~7.33, ai-momentum-pullback, LT): Full 6-agent score at Pre-Market May 15. AI memory supercycle; JEDEC HBM4; May 12 pullback gives better entry at ~$788. LT entry: stop -12% = $693, target +24% = $977. Run full framework before placing.

## Active Themes (updated May 18)
1. **Iran conflict + rate fear** — Primary macro theme NOW. Trump "clock is ticking" on Iran. 10Y yield year-high >4.60%. Inflation risk. Themes: defense (LMT, RTX), gold (GLD +), energy (XOM), safe havens.
2. **AI agentic production** — Enterprise AI moving from pilot to production (ServiceNow NOW breakout +8.9%). AI infrastructure spending accelerating. Themes: NOW, ORCL, VRT (data center cooling).
3. **NVDA earnings pivot** — NVDA Q1 FY27 reports Wednesday May 20 AH. Market's single most anticipated event. Options ±8-10%. Close existing NVDA via MOO May 19 (strategy switch + pre-earnings exit).
4. **Crypto flush** — BTC $76K, Fear & Greed 37. Below $82K threshold. Do NOT enter. Watch for capitulation bottom at $70K with high-volume flush.
5. **AMD deterioration** — Formally re-scored REJECTED (6.17). Technical breakdown from $477 peak. Wait for RSI reset below 60 and price stabilization.

## Pending Actions — OPERATOR MUST EXECUTE MAY 19 MORNING

1. **STEP 1: Re-establish backup stops (GTC, before MOO):**
   ```bash
   # TSM backup stop -5%: $373.76
   # NVDA backup stop -5%: $212.80
   # JPM backup stop -5%: $284.05
   # AVGO backup stop -5%: $398.80
   ```

2. **STEP 2: Execute strategy switch MOO sells (time_in_force=opg, before 9:25 AM ET):**
   ```bash
   for SYM_QTY in "TSM 7" "NVDA 15" "JPM 9" "AVGO 7"; do
     read SYM Q <<< "$SYM_QTY"
     curl -X POST "${APCA_API_BASE_URL}/v2/orders" "${AUTH[@]}" \
       -H 'Content-Type: application/json' \
       -d "{\"symbol\":\"$SYM\",\"qty\":$Q,\"side\":\"sell\",\"type\":\"market\",\"time_in_force\":\"opg\"}"
   done
   ```

3. **STEP 3: Verify GLD stops** (`f0fd18ca` qty 6 + `26defbfa` qty 1 @ $397.92) still resting.

4. **STEP 4: At Market Open (9:45 AM ET)** — confirm MOO fills, log exits to trades.md, compute post-switch cash (~$97K).

5. **STEP 5: Deploy new active positions from watchlist** (NOW, LMT, RTX, MU full-score). All with GTC bracket orders (entry + stop −5% + take-profit +15% = 3:1 minimum).

## Pending Deferrals (watchlist entries scoring ≥7)
- **NOW** (~7.5) — breakout-volume; BofA Buy + agentic AI partnerships. Enter limit ~$98 post-switch.
- **LMT** (~7.2) — macro-hedge; Iran defense. Full 6-agent at Pre-Market.
- **RTX** (~7.0) — macro-hedge; Iran air defense. Borderline, needs full score.
- **MU** (TBD ~7.0) — mean-reversion-oversold; fell from $818 ATH. Full 6-agent at Pre-Market.
- **GDX** (~7.0) — sector-rotation; gold miners inflation play.
- **PLTR** (~6.5) — CONDITIONAL only if >$134 (currently $132.20 → SKIP).
- **AMD** (~6.17) — RE-SCORED REJECTED. Do not enter until RSI < 60 and price stabilizes.

## Lessons Learned (running log)
- **Week of 2026-04-27 (init):** No trades placed. First-run setup; benchmarking begins next week.
- **2026-05-01 — bias correction (operator-mandated):** Capital in cash earns nothing. Score ≥ 7 = enter at next routine. Only 3 valid skip exemptions per CLAUDE.md Deployment Bias.
- **2026-05-04 — remote-routine failure mode discovered:** Cron triggers produced zero commits/orders. Manual session broke the streak.
- **2026-05-05 — silent failure REPEATS:** Heartbeat infra not sufficient. Operator pre-queued brackets saved the day (NVDA, JPM filled). GLD naked stop discovered and fixed.
- **2026-05-06 — API blocked (new failure mode):** Routine ran late AND Alpaca API blocked. AMD, PLTR, BTC documented as attempts; none executed.
- **2026-05-08 — API blocked AGAIN (3rd consecutive):** AMD and PLTR MOO blocked at 12:19Z. HTTP 403 from Anthropic TLS proxy. Persistent infrastructure problem.
- **2026-05-08 to 2026-05-12 (weekend gap):** S&P 500 hit record 7,412.84 on May 11 while portfolio remained 80% cash. Gap cost: ~2.1-2.7 percentage points vs. benchmark.
- **2026-05-12 — CPI binary event note:** April CPI is NOT a CLAUDE.md-exempt binary event. MOO orders must be placed regardless.
- **2026-05-12 — AMD setup change:** AMD entry thesis changed from `earnings-reaction-follow` to `breakout-volume` due to China chip deal catalyst.
- **2026-05-13 — PPI shock:** April PPI +1.4% vs +0.5% expected. Market rose anyway. Macro data alone doesn't override strong sector narratives.
- **2026-05-13 — PLTR support break:** Correct response to broken setup: re-score and skip. $134 must reclaim before re-entry.
- **2026-05-14 — Trump-Xi Summit Day 1:** NVDA +4.54%, markets at ATH. High-inflation = financials lag even on up days.
- **2026-05-15 — Summit Day 2 disappointment:** "No major chip deals" → NVDA −4.37%, MU fell from $818 ATH. Lesson: buy-the-rumor-sell-the-news on diplomatic binary events. Pre-position reduction (30% smaller) recommended going into Day 2 communiqués.
- **2026-05-15 — May 15 Daily Review SILENT FAILURE:** Entire Friday session produced zero heartbeats. The strategy switch execution slipped from May 15 to May 18 to (hopefully) May 19 — 3+ days of naked positions and undeployed capital.
- **2026-05-18 — AMD formally REJECTED:** First re-score below 7. Technical score dropped to 4: RSI 80.6 overbought, price in downtrend from $477 to $412, analyst consensus target $395.65 below current price. Lesson: re-score aggressively when the chart changes. Don't anchor to a prior APPROVED decision.
- **2026-05-18 — NOW breakout noted:** BofA Buy reinstatement + enterprise AI production partnerships = textbook breakout-volume setup. Adding to watchlist over AMD as the primary new-entry candidate.
- **2026-05-18 — Strategy switch now 2 days overdue:** NVDA earnings Wednesday makes pre-market May 19 a HARD DEADLINE for closing the 15-share NVDA position. Operator backup manual execution is mandatory if routine fails.

## Agent Calibration Tracker (updated May 18)
No closed trades to calibrate. Will populate once strategy switch closes TSM/NVDA/JPM/AVGO and first P&L data is realized.

## Setup Performance Tracker (updated 2026-05-18)
| Setup type | Wins | Losses | 3-in-a-row | Status |
|---|---|---|---|---|
| ai-momentum-pullback | 0 | 0 | none | Active (TSM pending close; GLD active) |
| macro-hedge | 0 | 0 | none | Active (GLD −0.45% from entry; stop active) |
| breakout-volume | 0 | 0 | none | AMD rejected; NOW added to watchlist |
| sector-rotation | 0 | 0 | none | JPM pending close (−2.7% vs entry) |
| earnings-reaction-follow | 0 | 0 | none | No trades |
| earnings-reaction-fade | — | — | — | No trades |
| mean-reversion-oversold | — | — | — | No trades (MU candidate pending full score) |
| crypto-flush-rebound | — | — | — | No trades; BTC $76K below $82K threshold |
| candlestick-reversal | — | — | — | No trades |

No 3-in-a-row halt or boost rules triggered. No closed P&L to evaluate. Once strategy switch exits execute, TSM/NVDA/JPM/AVGO will log their first closed P&L results.

## Strategy Evolution Notes
- **2026-05-01 (init):** Strategy initialized per CLAUDE.md. No deviations.
- **2026-05-04:** First positions opened. Strategy unchanged; execution layer needs fixing.
- **2026-05-08:** Three-week persistent API blockage causing compounding execution gaps.
- **2026-05-12:** China chip deal changes AMD thesis. Rate-cut thesis broken; no cuts until 2027.
- **2026-05-14 (Week 2 Thursday):** Trump-Xi Day 1 catalyst. NVDA +4.54%. Markets at ATH. Gap -3.81 pp from API/execution failures.
- **2026-05-15 to 2026-05-16 (Week 2 end — RETROSPECTIVE, no review ran):** Summit Day 2 disappointed chip sector. NVDA −4.37%, MU fell from $818 ATH. Weekly evolution note was NOT written (silent failure). Key lesson: diplomatic binary events (summit communiqués) follow buy-rumor/sell-news dynamics — scale back risk-event positions.
- **2026-05-18 (Week 3 Monday):** Iran conflict escalates. Macro regime shift: 10Y at year-high >4.60%, defense/gold/energy in favor. AMD formally rejected (technical deterioration). NOW emerges as new primary watchlist entry (agentic AI breakout). Strategy is unchanged but theme evolution is: from China chip deal to Iran conflict + agentic AI production deployment. NVDA earnings Wednesday = hard deadline for strategy switch execution.

## Next Routine Plan — Pre-Market May 19 (8:00 AM ET / 12:00 UTC) CRITICAL
**HARD DEADLINE: NVDA earnings Wednesday May 20 AH. Strategy switch MOO sells MUST execute at May 19 open (9:30 AM ET).**

1. Stop audit: verify GLD stops ($397.92) still resting
2. Re-establish backup GTC stops on naked positions (TSM, NVDA, JPM, AVGO) at -5%
3. Submit 4 MOO sell orders before 9:25 AM ET (TSM 7, NVDA 15, JPM 9, AVGO 7)
4. If API blocked: OPERATOR MANUALLY SUBMITS THESE 4 ORDERS BEFORE 9:25 AM ET
5. Market Open routine (9:45 AM): confirm fills, log exits, compute post-switch cash
6. Run full 6-agent score on NOW (~$98), LMT (TBD), MU (~$760)
7. Place bracket buy orders for ≥7 scored names (max 3 MOO; remaining as limit buys)
8. Target: deploy $35-45K into new active positions from ~$97K post-switch cash
9. Crypto: BTC $76K → DO NOT ENTER. Maintain $82K threshold.

## Cash Reserve Floor
$5,000 (5% of $100K). Current cash ~$85,550 = 85.4%.
Post-strategy-switch estimated cash: ~$97,000 (85,550 + ~11,450 from closing 5 positions)
Post-switch deployment plan: 85% = $85K in active trades; 10% = $10K crypto; 5% = $5K cash floor
Available to deploy after switch: ~$92,000 (keeping $5K floor)
Target # of active positions: 8-10 (at ~$4-5K each = $32-50K deployed; remainder in additional entries)
