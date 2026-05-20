# Opus Trader — Portfolio Memory

## Last Updated
**2026-05-20 (Wednesday) — Market Close Routine (3:30 PM ET / 19:31 UTC).** Alpaca API STILL BLOCKED (HTTP 403 "Host not in allowlist") — 12th consecutive blocked session. Market closed for the day (4:00 PM ET). **NVDA earnings TONIGHT (May 21 after close) — OPERATOR MUST HAVE CLOSED NVDA before end of trading today.** Strategy-switch MOO execution status (May 18) remains UNCONFIRMED via API. Portfolio state below reflects best estimates; actual Alpaca state unknown.

**Prior Last Updated:** 2026-05-17 (Sunday) — STRATEGY SWITCH to 100% trading account.

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
- **Total Equity (estimated):** ~$100,500-102,000 (estimated; API blocked; no price data since May 14)
- **Cash:** ~$80,946 (Scenario B: strategy switch NOT executed) OR ~$97,000+ (Scenario A: strategy switch executed May 18)
- **Long Market Value (estimated):**
  - Scenario A (switch executed): ~$3,000-3,200 (GLD only, 7 sh)
  - Scenario B (switch NOT executed): ~$19,000-22,000 (TSM+GLD+NVDA+JPM+AVGO)
- **Open Positions:** 1 (GLD confirmed active) + 4 uncertain (TSM/NVDA/JPM/AVGO — may be closed per May 18 strategy switch)
- **CRITICAL PENDING:** NVDA earnings May 21 — if still held, OPERATOR MUST CLOSE TODAY before end of day.
- **API Status:** BLOCKED — "Host not in allowlist" (HTTP 403, Anthropic sandbox TLS proxy). Persistent failure since May 6. 11th+ consecutive blocked session.
- **Daytrade Count:** 0

## Bucket State
| Bucket | Target | Current $ (est.) | Current % | Positions |
|---|---|---|---|---|
| Long-term | 55% ($55K) | ~$13,657 (TSM+NVDA+JPM+AVGO) | 13.6% | 4 (TSM, NVDA, JPM, probable AVGO) |
| Active Trading | 30% ($30K) | ~$5,885 (GLD+XLE) | 5.9% | 2 (GLD, XLE) |
| Crypto | 5% ($5K) | $0 | 0% | 0 |
| Cash Reserve | 10% ($10K floor) | ~$80,946 | 80.5% | — |

**Deployment gap:** Cash ~$70.9K above the 10% floor. AMD entry unconfirmed for 4th consecutive session. Massive underfillment continues. MU and PLTR also pending first entries.

## Open Positions (estimated, API blocked — prices from May 14 web research)
| Symbol | Bucket | Qty | Entry | Stop | Target | Cost basis | Est. Price | Est. P/L | Sector |
|---|---|---|---|---|---|---|---|---|---|
| TSM | long-term | 7 | 401.47 | 353.76 (-12%) | 498.48 (+24%) | $2,810.29 | ~$399.80 | -$11.69 | Semiconductors |
| GLD | active | 7 | 418.86 | 397.92 (-5%) | — | $2,932.02 | ~$429.01 | +$71.05 | Precious metals |
| NVDA | long-term | 15 | 198.83 | 175.60 (-12%) | 247.44 (+24%) | $2,982.45 | ~$235.63 | +$552.00 | Semiconductors |
| JPM | long-term | 9 | 308.30 | 272.14 (-12%) | 383.47 (+24%) | $2,774.72 | ~$300.26 | -$72.36 | Financials |
| XLE | active | 50 | 59.01 | 56.15 (-5%) | 65.01 (+10%) | $2,950.50 | ~$57.64 | -$68.50 | Energy |
| AVGO* | long-term | 11 | 418.59 | 368.36 (-12%) | 519.05 (+24%) | $4,604.49 | ~$422.50 | +$43.01 | Semiconductors |

*AVGO: GTC bracket at $418.59 placed ~May 4. Treating as probable fill (AVGO range May 8 covered $418.59). Stop = bracket OCO child at $368.36 (-12%). Prev close per search = $416.79 (May 13 actual); today estimated ~$422.50.

**Est. total long market value (all 6):** ~$19,568
- TSM: 7 × $399.80 = $2,799
- GLD: 7 × $429.01 = $3,003
- NVDA: 15 × $235.63 = $3,534
- JPM: 9 × $300.26 = $2,702
- XLE: 50 × $57.64 = $2,882
- AVGO: 11 × $422.50 = $4,648

**Net unrealized P/L: +$513.51** (NVDA +$552 is the primary driver; JPM and XLE dragging)

## Sector Exposure (estimated — May 14 EOD)
| Sector | Est. $ | Est. % of equity |
|---|---|---|
| Semiconductors (TSM+NVDA+AVGO) | $10,981 | 10.9% |
| Financials (JPM) | $2,702 | 2.7% |
| Precious metals (GLD) | $3,003 | 3.0% |
| Energy (XLE) | $2,882 | 2.9% |
| Cash | $80,946 | 80.5% |

**After AMD fill (still pending for May 15):**
| Sector | Added $ | New % |
|---|---|---|
| Semiconductors (+AMD 10sh×$445 = $4,450) | $15,431 | 15.4% |
| Cash remaining | $76,496 | 76.1% |

All sectors remain well under 25% cap. After MU + PLTR fills (if entered), semis could approach 20%+ but still below 25% cap.

**LT bucket tech sub-allocation (current):**
TSM+NVDA+AVGO = $10,981 in LT tech; LT total = $10,981 + $2,702 (JPM) = $13,683
LT-tech % = 80.3% → above 60% ceiling BUT LT bucket ($13.7K) < $20K threshold → ceiling is INFORMATIONAL per CLAUDE.md. If PLTR enters ($4,800): LT total = $18,483 → still below $20K, still informational.

## Performance vs S&P 500
- **Portfolio total equity (est.):** ~$100,514
- **Portfolio total return:** +0.51% ($100,514 / $100,000 initial)
- **Today's P&L (vs May 13 est $100,232):** ~+$282 / +0.28% (NVDA +$153 + AVGO +$147 + TSM +$18 + XLE +$14 − JPM $42 − GLD $9)
- **S&P 500 close May 14:** ~7,511 (+0.79%). NEW RECORD HIGH. Dow retook 50,000. Nasdaq at record. Trump-Xi summit Day 1 catalyst.
- **S&P 500 return since strategy start (~May 1):** ~+4.32% (7,511 vs ~7,200 est.)
- **Gap vs SPX:** **-3.81 percentage points** — widened -0.54 pp today (portfolio +0.28% vs SPX +0.79%). Root cause unchanged: 80.5% cash from API blockage.
- **CRITICAL:** Gap approaching -4 pp in 10 trading days. If AMD, PLTR, MU entered tomorrow and markets hold, gap could narrow by ~1 pp. Operator action on May 15 is critical.

## Macro Context (as of 2026-05-14 market close)
- **Trump-Xi Summit Day 1 (TODAY):** Jensen Huang (NVDA CEO) attended with Trump delegation. Xi told US CEOs "China will open wider." H200 chips cleared for select Chinese companies. 200-jet Boeing order confirmed (below 500-jet expectation). No definitive semiconductor export framework yet — Day 2 (May 15, Friday) communiqué pending. Key pending decision: will China fully ease H20/MI308/HBM4 supply chain restrictions?
- **Market reaction to summit:** S&P 500 NEW RECORD HIGH +0.79% to 7,511. Dow retook 50,000. Nasdaq at record. NVDA +4.54% ($235.63 — 6 consecutive up sessions, +15% cumulative). Chip names broadly up. Boeing rallied to $245 intraday on order news before settling on 200-jet vs 500-jet disappointment.
- **PPI context:** April PPI +1.4% (reported May 13). No rate cuts in 2026. But AI/tech narrative overrides macro headwind.
- **NVDA Earnings:** May 21 (7 days). Do NOT enter new NVDA positions after May 19. Existing stop $175.60 provides 34.2% cushion vs $235.63. Pre-earnings review at Daily Review May 19. Consider partial profit-taking or protective hedge if NVDA continues to run.
- **Iran deal:** Still unconfirmed. Oil elevated. XLE stop at $56.15 is thin (2.65% cushion at $57.64). Monitor closely.
- **Bitcoin:** ~$79,600 — dipped below $80K. Summit did not produce crypto language. Re-entry threshold remains $82K+. BTC below $80K is weakness not strength — do not lower threshold.
- **Boeing:** 200-jet China order confirmed but below 500-jet expectations. BA stock volatile ($227-$245 range). Day 2 summit could add maintenance contracts or 2nd-tranche language. Monitor BA for post-summit entry if thesis strengthens.
- **Healthcare leadership:** XLV outperformed (+1.2%) while broader tech mixed. Sector rotation into defensive healthcare occurring alongside tech. Monitor for entry opportunity in specific healthcare names.

## Active Themes
1. **AI broadening / China chip deal** — TSM + NVDA + probable AVGO in LT bucket. AMD approved (7.33), blocked 4 sessions — MUST enter May 15. Summit Day 1 very positive (Jensen Huang attended). Day 2 communiqué could unlock additional chip export easing. MU (memory supercycle, est. 7.33) also pending entry.
2. **Steeper curve / financials drag** — JPM (LT) at $300.26, now -2.6% below entry $308.30. PPI hot = no rate cuts. JPM falling on every high-inflation print. Stop $272.14 provides cushion but thesis weakening. Monitor for stop management.
3. **Geopolitical inflation hedge** — GLD (active) +2.4% from entry ($429.01). XLE thin stop ($56.15 vs $57.64 = 2.65% ⚠️). Iran deal still unconfirmed.
4. **Crypto recovery** — BTC ~$79,600, dipped below $80K. Summit produced no crypto language. Threshold unchanged at $82K. Weakness — do not lower threshold.
5. **Government AI (PLTR AIP)** — PLTR recovering: $133.40 (+2.62% today, just $0.60 from $134 re-entry trigger). Summit Day 2 AI language could be the catalyst. Pre-Market May 15: re-score if PLTR opens >$134.
6. **Aerospace / Boeing** — Boeing 200-jet China order confirmed. GE Aerospace engine supplier. Monitor for entry opportunity if Day 2 summit strengthens the thesis (score ~6.2 currently, needs 7+ for entry).

## Pending Actions — OPERATOR MUST EXECUTE (Updated May 20 Market Close)

**PAST DUE — TODAY WAS THE DEADLINE:**
1. **NVDA CLOSE** (**PAST DEADLINE** — should have been closed before 4 PM ET today): NVDA earnings are May 21 after close. The 48-hour binary-event window is ACTIVE. If strategy-switch sells (May 18) did NOT execute and NVDA 15 shares are still held, OPERATOR MUST sell NVDA NOW (after-hours limit order via Alpaca) or accept the earnings binary risk. A 10-15% gap-down on a miss = $375-$562 unrealized loss. A gap-up on beat = additional gains but violates the binary-event protocol. **Do NOT hold through the print without intentional operator decision.** Use Alpaca web UI or Codespace.

**TOMORROW (May 21 Pre-Market, before 9:25 AM ET):**
2. **AMD** (score 7.33, breakout-volume, active): Buy 10 shares at MOO. Post-fill: place stop at fill_price × 0.95 (-5%). Target fill × 1.15 (+15% for 3:1 R/R). This has been approved and blocked for 5+ consecutive sessions. MANDATORY. 6th consecutive instruction.
   - If API still blocked: operator places manually from Codespace before 9:25 AM ET.

3. **PLTR** (conditional re-score): Check if PLTR is above $134. If yes, run full 6-agent framework at Pre-Market. Estimated re-score: 7.33 (Technical 3→6 on support reclaim). Enter if ≥7.
   - Entry: $134+ (MOO or limit). Stop: fill×0.95. Target: fill×1.15.

4. **Strategy-switch verification**: Run `GET /v2/positions` to confirm whether TSM/NVDA/JPM/AVGO are still held. If still open (and NVDA sold separately per #1 above), close TSM/JPM/AVGO via MOO or market orders.

5. **MU** (est. score ~7.0): Full 6-agent score at Pre-Market May 21. AI memory supercycle. Entry ~$760-800, stop fill×0.95, target fill×1.15. Run full framework before placing.

**NVDA POST-EARNINGS (May 21 Market Open / Market Close routines):**
6. **NVDA reaction play**: After May 21 print, score NVDA as:
   - Gap-up >5% on beat: `earnings-reaction-follow` setup — enter with 5% stop, 15% target
   - Gap-down >5% on miss: `earnings-reaction-fade` setup — short or put strategy (if score ≥7)
   - No gap: skip until technical setup forms

## Pending Deferrals (≥7 watchlist names not yet entered — Updated May 20)
- **AMD** (7.33) — 5th+ consecutive deployment failure; operator MUST place before May 21 open
- **MU** (est. 7.0) — pending full 6-agent score at Pre-Market May 21
- **PLTR** (conditional 7.33) — re-enter if $134+ reclaimed; re-score at Pre-Market May 21
- **NVDA post-print** (TBD) — score earnings reaction at Market Open May 21 once print is known

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
- **2026-05-20 — NVDA earnings eve:** NVDA reports Q2 May 21. Binary event exclusion window active. If NVDA still held from pre-switch LT book, OPERATOR MUST CLOSE TODAY. This is the highest-urgency action item — a gap-down of 10-15% on a miss with 15+ shares would cost $375-$562 in realized loss on top of a position that should already have been closed per the strategy switch.

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
- **Pre-Market May 21 (8:00 AM ET — THURSDAY, NVDA EARNINGS DAY):**
  1. **STOP AUDIT FIRST** — `GET /v2/orders?status=open`. Verify GLD stop $397.92 is resting. Flag any naked positions. This is mandatory first action per CLAUDE.md.
  2. **NVDA CLOSE CHECK** — If NVDA still held (strategy switch not executed), CLOSE AT OPEN as FIRST TRADE before any new entries. If NVDA earnings gap-up >5%: log as target_hit/profit if exiting into strength. If NVDA sold in after-hours by operator: verify and log.
  3. **AMD MOO 10 shares** — score 7.33, MANDATORY (7th attempt). Stop: fill×0.95. Target: fill×1.15 (+15%). If API still blocked: operator executes manually. Pre-market call: AMD ~$445-465 est.
  4. **PLTR re-score** — if price ≥$134: run full 6-agent framework. If score ≥7: enter via MOO.
  5. **MU full 6-agent score** — AI memory supercycle. Estimate score ~7.0. Entry MOO, stop -5%, target +15%.
  6. **NVDA earnings strategy** — DO NOT enter NVDA pre-market. After earnings print (after-hours May 21), pre-score the reaction setup for May 22 morning. Assess: gap-up >5% = earnings-reaction-follow; gap-down >5% = earnings-reaction-fade.
- **Market Open (9:45 AM ET):** Post-MOO stops for AMD/PLTR/MU fills. Verify all fills. NVDA reaction assessment if gap >5%.
- **Daily Review May 21 (4:30 PM ET):** NVDA earnings reaction analysis. Weekly strategy evolution note (first full week post-strategy-switch). Tally setup performance.
- **Weekly evolution note due:** Friday May 22 (or May 21 Daily Review). Document: 3 weeks of API blockage, strategy switch execution issues, deployment bias violations, AMD 6 missed entries.

## Cash Reserve Floor
$10,000 (10%). Current cash $80,946 — $70,946 available to deploy before hitting floor.
AMD fills would consume: 10sh × $445 = $4,450 → remaining: $76,496
+ PLTR 36sh × $134 = $4,824 → remaining: $71,672
+ MU 6sh × $788 = $4,728 → remaining: $66,944
After all three: $66,944 still in cash = 66% — still massively above 10% floor.
NVDA pre-earnings hedge consideration: Could use up to 1% of portfolio = ~$1,000 in protective puts.
