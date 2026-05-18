# Opus Trader — Portfolio Memory

## Last Updated
**2026-05-18 (Monday) — Market Close routine (3:30 PM ET / 19:34 UTC).** First trading day post-strategy-switch. API still blocked (HTTP 403) — all 5 MOC order attempts failed. All 5 predecessor routines silently failed. Strategy switch MOO sells (TSM/NVDA/JPM/AVGO) UNCONFIRMED — may or may not have executed at today's open. GLD remains designated carryover. AMD 5th consecutive entry attempt blocked. CRITICAL: NVDA earnings May 21 (3 DAYS) — if NVDA still held, OPERATOR must place MOO sell at May 19 open.

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
- **Total Equity (estimated):** ~$100,574 (estimated; API blocked; prices extrapolated from May 17 verified data)
- **Cash:** $85,550 (85.1%) — per May 17 verified account state; no orders confirmed since
- **Long Market Value (estimated):** ~$15,024 (5 positions — XLE confirmed non-existent)
- **Open Positions:** 5 (TSM 7sh, GLD 7sh, NVDA 15sh, JPM 9sh, AVGO 7sh) — strategy switch MOO sells UNCONFIRMED
- **Pending Actions:** 
  1. ⚠️ CRITICAL: NVDA 15sh MOO sell at May 19 open (earnings May 21 — last clean exit day)
  2. TSM 7sh, JPM 9sh, AVGO 7sh MOO sells at May 19 open (strategy switch completion)
  3. AMD 10sh MOO buy at May 19 open (score 7.33 — 5th instruction — MANDATORY)
  4. PLTR: re-score if above $134 at Pre-Market May 19
  5. MU: full 6-agent score at Pre-Market May 19
- **API Status:** BLOCKED — "Host not in allowlist" (HTTP 403, Anthropic sandbox TLS proxy). Persistent failure since May 6. 10th+ consecutive blocked session. OPERATOR ACTION REQUIRED.
- **Daytrade Count:** 0

## Bucket State (NEW ALLOCATION: 85% active / 10% crypto / 5% cash floor)
| Bucket | Target | Current $ (est.) | Current % | Positions |
|---|---|---|---|---|
| Active Trading | 85% ($85K) | ~$15,024* | 14.9% | 5 (TSM, GLD, NVDA, JPM, AVGO — all misclassified pending strategy switch completion) |
| Crypto | 10% ($10K) | $0 | 0% | 0 |
| Cash Reserve | 5% ($5K floor) | ~$85,550 | 85.1% | — |

*All 5 open positions were LT bucket (retired). GLD is the only intended active carryover. TSM/NVDA/JPM/AVGO are pending close.

**Deployment gap:** Once strategy switch closes complete (TSM/NVDA/JPM/AVGO sold → ~$97K cash), need to deploy ~$82K to active (85%) and ~$10K to crypto (10%). AMD is first mandatory entry. Then 3-4 additional active setups + BTC/ETH crypto leg.

**Post-strategy-switch deployment roadmap:**
- Cash after sells: ~$97K
- Active target: $82,450 (85%); crypto target: $9,700 (10%); cash floor: $4,850 (5%)
- Max per position: $4,850 (5% cap)
- Need ~17 positions at max size to fully deploy active bucket (not required; seek best setups)
- Priority #1: AMD 10sh (~$4,550). Priority #2: BTC/ETH crypto. Priority #3: PLTR, MU, scan.

## Open Positions (estimated, API blocked — May 17 verified + extrapolated to May 18 EOD)
| Symbol | Bucket | Qty | Entry | Stop | Action | Est. May 18 Price | Est. P/L | Note |
|---|---|---|---|---|---|---|---|---|
| TSM | ex-LT → CLOSE | 7 | $401.47 | $353.76 | MOO SELL May 19 | ~$406 | ~+$31.71 | Pending strategy switch close |
| GLD | active (carryover) | 7 | $418.86 | $397.92 | HOLD | ~$420 | ~+$7.98 | Only intended carryover |
| NVDA | ex-LT → CLOSE ⚠️ | 15 | $198.83 | $175.60 | MOO SELL May 19 URGENT | ~$238 | ~+$587.55 | Earnings May 21 — exit TOMORROW |
| JPM | ex-LT → CLOSE | 9 | $308.30 | $272.14 | MOO SELL May 19 | ~$296 | ~-$110.70 | Pending strategy switch close |
| AVGO | ex-LT → CLOSE | 7 | $418.48 | $368.36* | MOO SELL May 19 | ~$428 | ~+$66.64 | *Stop may be canceled (May 17 DELETE) |

**Est. total long market value (May 18 EOD):** ~$15,024
- TSM: 7 × $406 = $2,842
- GLD: 7 × $420 = $2,940
- NVDA: 15 × $238 = $3,570
- JPM: 9 × $296 = $2,664
- AVGO: 7 × $428 = $2,996
- XLE: $0 (confirmed non-existent)

**Net unrealized P/L: ~+$583.18** (NVDA +$587 is primary driver; JPM dragging)

## Sector Exposure (estimated — May 18 EOD, pending strategy switch completion)
| Sector | Est. $ | Est. % of equity | Status |
|---|---|---|---|
| Semiconductors (TSM+NVDA+AVGO) | ~$9,408 | ~9.4% | CLOSING (strategy switch) |
| Financials (JPM) | ~$2,664 | ~2.6% | CLOSING (strategy switch) |
| Precious metals (GLD) | ~$2,940 | ~2.9% | KEEP (carryover) |
| Cash | ~$85,550 | ~85.1% | Above floor — deploy post-switch |

**After strategy switch completes (all sells executed + AMD entry):**
| Asset | Est. $ | Est. % |
|---|---|---|
| GLD (carryover) | ~$2,940 | ~3.0% |
| AMD (new active) | ~$4,550 | ~4.6% |
| Cash remaining | ~$93,084 | ~92.4% |

All sectors post-strategy-switch completion will be within 25% cap. AMD + PLTR + MU would add ~$13.8K in tech (~14% of portfolio); well below 25% cap.

## Performance vs S&P 500
- **Portfolio total equity (est.):** ~$100,574
- **Portfolio total return:** +0.57% ($100,574 / $100,000 initial)
- **Today's P&L (May 18, est.):** ~+$224 / +0.22% (NVDA +$190, TSM +$12, AVGO +$20, GLD +$19, JPM -$16)
- **S&P 500 close May 18 (est.):** ~7,540 (+0.39% from May 14 ~7,511). Post-summit continuation.
- **S&P 500 return since strategy start (~May 1):** ~+4.72% (7,540 vs ~7,200 est.)
- **Gap vs SPX:** **-4.15 percentage points** — widened ~0.34 pp today. Root cause unchanged: 85% cash from persistent API blockage + strategy switch execution failure.
- **CRITICAL:** Gap at -4.15 pp as of May 18. Once strategy switch completes and AMD/PLTR/MU deployed, portfolio gain potential ~+5-7% from current deployable cash. Operator action on May 19 is CRITICAL.

## Macro Context (as of 2026-05-18 market close — estimated)
- **Trump-Xi Summit COMPLETE (May 14-15):** Day 2 communiqué likely positive for chip exports. Markets at/near record highs. AI/tech narrative dominant.
- **NVDA Earnings May 21 (3 DAYS ⚠️):** Q2 FY2026 earnings. Pre-earnings expectation building. Existing position (15sh @ $198.83, current ~$238) up +19.7%. MUST exit by May 19 open per strategy-switch plan.
- **PPI context:** April PPI +1.4% (reported May 13). No rate cuts in 2026. AI/tech narrative overrides macro headwind.
- **Bitcoin:** Re-entry threshold $82K+ unchanged. Monitor for breakout.
- **AMD:** China MI308 chip approval = $500M-800M 2026 revenue upside. Score 7.33. 5th consecutive blocked attempt. MUST ENTER May 19.
- **PLTR:** Check if $134 support reclaimed (last known $133.40 on May 14). Trump-Xi Day 2 AI language may have catalyzed recovery.
- **Market mode:** Risk-on. Tech leading. Semis strong post-summit.

## Active Themes
1. **AI broadening / China chip deal (ACTIVE):** AMD (7.33, MUST ENTER May 19), MU (est. 7.33, scan May 19), PLTR (conditional on $134). TSM/NVDA/AVGO closing as LT bucket retired.
2. **Inflation hedge** — GLD (active, carryover). PPI +1.4% provides ongoing bid. Stop $397.92 resting (assumed GTC).
3. **Crypto build** — 0% deployed vs 10% target. BTC at/above $82K = entry signal. Need to start crypto leg post-strategy-switch.
4. **Whole-market scan (May 19):** Per CLAUDE.md Universe Selection, scan entire market at Pre-Market for momentum, breakouts, catalyst names beyond AMD/PLTR/MU.
5. **Government AI (PLTR AIP)** — PLTR recovering: $133.40 (+2.62% today, just $0.60 from $134 re-entry trigger). Summit Day 2 AI language could be the catalyst. Pre-Market May 15: re-score if PLTR opens >$134.
6. **Aerospace / Boeing** — Boeing 200-jet China order confirmed. GE Aerospace engine supplier. Monitor for entry opportunity if Day 2 summit strengthens the thesis (score ~6.2 currently, needs 7+ for entry).

## Pending Actions — OPERATOR MUST EXECUTE MAY 15

1. **AMD** (score 7.33, breakout-volume, active): Buy 10 shares at open May 15 (MOO or market limit ~$445). Post-fill: place stop at fill_price × 0.95 (active -5%). Target fill × 1.10. This has been approved and blocked/unconfirmed for 4 consecutive sessions. MANDATORY. 4th consecutive instruction.

2. **PLTR** (score 6.50, CONDITIONAL): Re-enter ONLY if PLTR opens and holds above $134 on May 15 summit Day 2 news. Full 6-agent re-score at Pre-Market. Estimated re-score: 7.33 if Technical rises to 6 on support reclaim.

3. **MU** (Micron, est. score ~7.33, ai-momentum-pullback, LT): Full 6-agent score at Pre-Market May 15. AI memory supercycle; JEDEC HBM4; May 12 pullback gives better entry at ~$788. LT entry: stop -12% = $693, target +24% = $977. Run full framework before placing.

4. **NVDA May 21 earnings (URGENT):** NVDA 15sh must be SOLD at May 19 open per strategy-switch plan. This is the last clean exit day before the 48h earnings exclusion window. Est. P/L: (238-198.83)×15 = +$587.55. After sell, no NVDA re-entry until after May 21 print.

5. **AVGO:** Verified 7sh @ $418.48 (May 17 operator session). Est. current ~$428. MOO sell 7sh at May 19 open per strategy switch. ⚠️ Bracket stop may have been cancelled (May 17 pending delete) — if not sold, position may be naked.

## Pending Deferrals (≥7 watchlist names not yet entered)
- **AMD** (7.33) — 5th consecutive deployment failure; OPERATOR MUST place 10sh MOO at May 19 open (FINAL INSTRUCTION before strategy review)
- **MU** (est. 7.33) — pending full 6-agent score at Pre-Market May 19; AI memory supercycle anchor name
- **PLTR** (conditional 7.33) — re-enter if above $134 at Pre-Market May 19; last known $133.40 (May 14)
- **BTC/ETH** — crypto bucket 0% vs 10% target; begin crypto leg post-strategy-switch; BTC re-entry at $82K+

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
- **2026-05-17 — Strategy switch (operator directive):** Allocation changed 55/30/5/10 → 85/10/5. LT bucket retired. MOO sells queued for all 4 LT positions at May 18 open. GLD only carryover. New 3:1 R/R minimum. Mandatory 5-indicator stack for candlestick entries. Verified actual Alpaca positions: TSM 7sh, GLD 7sh, NVDA 15sh, JPM 9sh, AVGO 7sh, XLE=0.
- **2026-05-18 — Strategy switch execution DAY 1 (today):** API STILL BLOCKED (HTTP 403). ALL 5 predecessor routines silently failed. MOO sells for TSM/NVDA/JPM/AVGO could not be placed programmatically. Strategy switch execution UNCONFIRMED. AMD: 5th consecutive deployment failure. Cumulative benchmark gap: ~-4.15 pp. NVDA earnings 3 days away — exit urgency maximum.
- **Lesson — NVDA earnings proximity:** With NVDA earnings on May 21, each day the position is not closed adds binary event risk. The strategy switch closing plan should have been executed May 18 open. If not executed by May 19 open, the position faces the earnings binary event with the 15sh holding. Stop at $175.60 provides cushion but earnings gaps can be ≥20%. OPERATOR must act May 19.

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

## Next Routine Plan — TUESDAY MAY 19 (URGENT)
- **Pre-Market May 19 (8:00 AM ET):**
  1. **STRATEGY SWITCH CLOSES (FIRST PRIORITY):** MOO sell TSM 7sh, NVDA 15sh, JPM 9sh, AVGO 7sh. MUST be placed before 9:25 AM ET. ⚠️ NVDA is most urgent (earnings May 21 = last clean exit day).
  2. **AMD MOO 10 shares** — score 7.33, MANDATORY (5th instruction, final before strategy review). If API blocked: OPERATOR PLACES MANUALLY. Entry est. ~$455, stop -5% $432.25, target +15% $523.25 (3:1 R/R).
  3. **PLTR re-score** — if above $134: full 6-agent framework, est. score 7.33. Bucket: active (NOT long-term per new allocation). 35sh at ~$135 = $4,725 = 4.7% ✓. Stop -5% $128.25, target +15% $155.25 (3:1 R/R).
  4. **MU full 6-agent score** — AI memory supercycle. Est. ~$800/sh. 6sh = $4,800 = 4.8% ✓. Stop -5% $760, target +15% $920.
  5. **Whole-market scan** — top pre-market movers, earnings reactions, gap-ups on >2x volume. Surface 3-5 fresh names per CLAUDE.md Universe Selection.
  6. **Stop audit** — verify GLD stop resting. Place any missing stops.
  7. **Crypto scan** — BTC/ETH prices. If BTC above $82K, begin crypto entry toward 10% target.
- **Market Open (9:45 AM ET):** Confirm MOO fills. Place post-MOO stops for AMD and any new entries (stop at fill × 0.95 for active trades).
- **Daily Review May 19 (4:30 PM ET):** NVDA pre-earnings review (if still held — should be SOLD at open). Weekly strategy evolution note (overdue from May 15).

## Cash Reserve Floor (NEW — 5% = $5,000)
Cash floor: $5,000 (5%). Current cash: ~$85,550 = $80,550 available to deploy before hitting floor.
After strategy switch sells (est. ~$11,484 proceeds): ~$97,034 cash.
AMD: 10sh × $455 = -$4,550 → $92,484 remaining.
PLTR: 35sh × $135 = -$4,725 → $87,759 remaining.
MU: 6sh × $800 = -$4,800 → $82,959 remaining.
BTC: 0.10 BTC × $90K = -$9,000 → $73,959 remaining.
After AMD + PLTR + MU + BTC: ~$73,959 cash (73%) — still massively above 5% floor.
Need ~16 more full-size positions ($4,850 each) to reach 85% active deployment target.
