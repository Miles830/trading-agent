# Opus Trader — Portfolio Memory

## Last Updated
**2026-05-20 (Wednesday) — Pre-Market routine (8:12 AM ET / 12:12 UTC).** Alpaca API blocked (HTTP 403, 11th+ consecutive session). No trades executed. Portfolio estimated from May 17 verified positions plus web-researched prices. NVDA earnings TONIGHT after close. Strategy switch MOO sells (May 18) remain unconfirmed.

Prior last-updated entry preserved below.

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

## Current Account Snapshot (2026-05-20 Pre-Market Estimate)
- **Broker:** Alpaca Paper Trading (account PA3TXVEJ19LW)
- **Total Equity (estimated):** ~$100,099 (API blocked; prices from May 20 web research)
- **Cash:** ~$85,550 (85.5%) — unchanged from May 17 (no confirmed trades since May 4/5 fills)
- **Long Market Value (estimated):** ~$14,549 (5 positions — XLE CONFIRMED non-existent; AVGO 7sh)
- **Open Positions:** 5 (TSM, GLD, NVDA, JPM, AVGO) — assuming strategy switch May 18 MOO sells did NOT execute (unconfirmed)
- **CRITICAL:** NVDA earnings TONIGHT (May 20, ~4:20 PM ET). Existing 15sh NVDA position at +11.8% unrealized (+$352). Operator should place MOC sell NVDA 15sh before 3:50 PM ET.
- **Pending Orders / Actions:** AMD MANDATORY ENTRY (score 7.33, violation #6). PLTR rejected (6.67, hovering below $134). MU pending full score.
- **API Status:** BLOCKED — "Host not in allowlist" (HTTP 403, Anthropic sandbox TLS proxy). Persistent failure since May 6. 11th+ consecutive blocked session.
- **Daytrade Count:** 0

## Bucket State (under new 85/10/5 strategy — effective 2026-05-17)
| Bucket | Target | Current $ (est.) | Current % | Positions |
|---|---|---|---|---|
| Active Trading | 85% ($85K) | ~$14,549 | 14.5% | 5 (TSM, GLD, NVDA, JPM, AVGO) |
| Crypto | 10% ($10K) | $0 | 0% | 0 |
| Cash Reserve | 5% ($5K floor) | ~$85,550 | 85.5% | — |

**Deployment gap:** Cash ~$80.5K above the 5% floor. AMD blocked 6 consecutive sessions. Massive underfillment continues. Strategy switch (close TSM/NVDA/JPM/AVGO, rebuild active book) unconfirmed since May 18.

## Open Positions (estimated — May 20 pre-market; API blocked; prices from web research)
| Symbol | Bucket | Qty | Entry | Stop (est. resting) | Target | Cost basis | Est. Price | Est. P/L | Sector |
|---|---|---|---|---|---|---|---|---|---|
| TSM | active* | 7 | 401.47 | 353.76 (-12% orig) | — | $2,810.29 | ~$392.61 | -$61.99 | Semiconductors |
| GLD | active | 7 | 418.86 | 397.92 (-5%) | — | $2,932.02 | ~$412.00 | -$47.98 | Precious metals |
| NVDA | active* | 15 | 198.83 | 175.60 (-12% orig) | — | $2,982.45 | ~$222.32 | +$352.35 | Semiconductors |
| JPM | active* | 9 | 308.30 | 272.14 (-12% orig) | — | $2,774.72 | ~$300.57 | -$69.57 | Financials |
| AVGO | active* | 7 | 418.48 | 368.36 (-12% orig) | — | $2,929.36 | ~$411.00 | -$52.36 | Semiconductors |

*Reclassified from "long-term" to "active" per strategy switch 2026-05-17. XLE CONFIRMED non-existent (verified May 17 via Alpaca). AVGO is 7sh (not 11sh — May 17 correction). Targets removed because strategy switch calls for closing these positions and rebuilding as pure active trades with 3:1 R/R targets.

**Est. total long market value (all 5):** ~$14,549
- TSM: 7 × $392.61 = $2,748
- GLD: 7 × $412.00 = $2,884
- NVDA: 15 × $222.32 = $3,335 ⚠️ EARNINGS TONIGHT
- JPM: 9 × $300.57 = $2,705
- AVGO: 7 × $411.00 = $2,877

**Net unrealized P/L: +$120.45** (NVDA +$352 partially offset by TSM -$62, GLD -$48, JPM -$70, AVGO -$52)

## Sector Exposure (estimated — May 20 pre-market)
| Sector | Est. $ | Est. % of equity |
|---|---|---|
| Semiconductors (TSM+NVDA+AVGO) | $8,960 | 8.9% |
| Financials (JPM) | $2,705 | 2.7% |
| Precious metals (GLD) | $2,884 | 2.9% |
| Cash | $85,550 | 85.5% |

**After AMD entry (MANDATORY — still pending):**
| Sector | Added $ | New % |
|---|---|---|
| Semiconductors (+AMD 12sh×$414 = $4,968) | $13,928 | 13.9% |
| Cash remaining | $80,582 | 80.5% |

All sectors well under 25% cap. NVDA is largest semiconductor exposure. Closing NVDA (strategy switch) would reduce semiconductors to ~$5,625 (5.6%). After AMD entry, semiconductors return to ~$10,593 (10.6%).

## Performance vs S&P 500
- **Portfolio total equity (est.):** ~$100,099
- **Portfolio total return:** +0.10% ($100,099 / $100,000 initial)
- **Last confirmed daily P&L:** May 14 (+$282 / +0.28%)
- **S&P 500 (estimated May 20 pre-market):** ~7,387 (pulled back from 7,511 on Moody's downgrade; Dow futures 49,436 vs ~50,000 May 14 peak)
- **S&P 500 return since strategy start (~May 1):** ~+2.6% (7,387 vs ~7,200 est.)
- **Gap vs SPX:** **~-2.5 percentage points** — improved from -3.81 pp on May 14 because S&P corrected post-Moody's while portfolio declined less (mostly cash). Root cause unchanged: 85.5% cash from API blockage.
- **NOTE:** Gap estimate is rough due to API blockage. NVDA earnings tonight could materially move the portfolio value overnight.
- **CRITICAL:** Gap approaching -4 pp in 10 trading days. If AMD, PLTR, MU entered tomorrow and markets hold, gap could narrow by ~1 pp. Operator action on May 15 is critical.

## Macro Context (as of 2026-05-20 Pre-Market)
- **Trump-Xi Summit Day 1 (TODAY):** Jensen Huang (NVDA CEO) attended with Trump delegation. Xi told US CEOs "China will open wider." H200 chips cleared for select Chinese companies. 200-jet Boeing order confirmed (below 500-jet expectation). No definitive semiconductor export framework yet — Day 2 (May 15, Friday) communiqué pending. Key pending decision: will China fully ease H20/MI308/HBM4 supply chain restrictions?
- **Market reaction to summit:** S&P 500 NEW RECORD HIGH +0.79% to 7,511. Dow retook 50,000. Nasdaq at record. NVDA +4.54% ($235.63 — 6 consecutive up sessions, +15% cumulative). Chip names broadly up. Boeing rallied to $245 intraday on order news before settling on 200-jet vs 500-jet disappointment.
- **NVDA Earnings TONIGHT:** Q1 FY2027 after close today. Analysts expect $1.78 EPS (+120% YoY), $79.2B revenue (+79.5% YoY). Existing 15sh NVDA at +$352 unrealized. Strategy switch requires closing; operator must place MOC sell before 3:50 PM ET.
- **Moody's US downgrade (May 16-17):** Aaa → Aa1. 30-year Treasury briefly 5.01%. Markets pulled back Mon-Tue. As of May 20 pre-market, S&P +0.37%, Nasdaq +0.66% — recovering ahead of NVDA earnings. Gold bid on debt/deficit concerns.
- **Fed minutes today:** No rate changes expected (CPI +3.7%, PPI +1.4% hot). Higher-for-longer reinforced. Negative for high-multiple growth; positive for GLD.
- **Oil/Iran:** WTI oil $102.20 (-1.83% today). Strait of Hormuz tensions easing. XLE does not exist in portfolio.
- **Bitcoin:** $77,428 — below $82K threshold. ETH $2,129. No crypto entry.
- **China chip deal (post-summit):** H200/H20 clearances finalized. AMD MI308 export-approved. Alibaba 40-50K MI308 units potential ($600M-$1.25B). Semiconductor AI theme intact.

## Active Themes (2026-05-20)
1. **AI broadening / China chip deal** — NVDA +11.8% (earnings tonight). AMD approved (7.33), blocked 6 sessions — MUST enter TODAY via operator. AVGO still open. MU (memory supercycle, est. 7.33) pending entry.
2. **Strategy switch execution (URGENT)** — TSM/NVDA/JPM/AVGO MOO sells still unconfirmed from May 18. Cash at 85.5% vs 5% floor. All old LT positions should be closed and cash redeployed into active trades.
3. **Macro hedge: GLD** — GLD at $412 vs entry $418.86, near stop $397.92 (3.5% cushion). Moody's downgrade creates fresh gold bid. Hold.
4. **Crypto recovery** — BTC $77,428, below $82K threshold. No entry.
5. **Government AI (PLTR AIP)** — PLTR at ~$134 trigger zone; rejected today (6.67, Technical 5). Re-score at Market Open if opens cleanly above $134.

## Pending Actions — OPERATOR MUST EXECUTE TODAY (May 20)

1. **NVDA MOC sell — URGENT:** Sell 15 shares of NVDA via MOC before 3:50 PM ET. Captures +11.8% unrealized gain ($352). Avoids binary earnings risk tonight. Strategy switch (May 17) required this close on May 18 — still unexecuted.

2. **AMD MOO — CRITICAL:** Buy 12 shares AMD via MOO before 9:25 AM ET. Entry ~$414, stop $393.30 (-5%), target $476.10 (+15%). Score 7.33, violation #6. API blocked programmatically — operator must place manually.

3. **Strategy switch closes (if not yet done):** TSM 7sh, JPM 9sh, AVGO 7sh — sell at market open or via limit. These free up ~$8,330 cash for active redeployment. GLD stays open.

3. **MU** (Micron, est. score ~7.33, ai-momentum-pullback, LT): Full 6-agent score at Pre-Market May 15. AI memory supercycle; JEDEC HBM4; May 12 pullback gives better entry at ~$788. LT entry: stop -12% = $693, target +24% = $977. Run full framework before placing.

4. **NVDA May 21 earnings:** Pre-earnings review at Daily Review May 19. No new NVDA entries after May 19. Existing stop $175.60 provides 34.2% cushion. Consider partial profit-taking or protective strategy if NVDA continues rallying (now at $235.63, +18.5% above entry).

5. **AVGO:** Still unconfirmed via API. Treating as probable fill at $418.59. Current price ~$422.50 (+0.9% above entry — recovering). If NOT filled, operator should verify account.

## Pending Deferrals (≥7 watchlist names not yet entered)
- **AMD** (7.33) — 4th consecutive deployment failure; operator must place at market open May 15
- **MU** (est. 7.33) — pending full 6-agent score at Pre-Market May 15
- **PLTR** (conditional 7.33) — re-enter if $134 reclaimed on Day 2 summit news

## Lessons Learned (running log)
- **2026-05-20 — NVDA earnings were May 20 (TODAY), not May 21:** Prior notes said "May 21". NVDA reports Q1 FY2027 TONIGHT after close. The pre-earnings review that was supposed to happen at Daily Review May 19 never ran (silent failure). This means the strategy switch NVDA close on May 18 was even more urgent than noted. Key lesson: always verify earnings dates from primary sources, not estimates, at least one week in advance.
- **2026-05-20 — Moody's US downgrade:** Happened over May 16-17 weekend. Portfolio was 85.5% cash at the time — the cash position accidentally acted as a defensive position during the post-Moody's selloff. The benchmark gap narrowed from -3.81 pp to ~-2.5 pp not because of skill but because 85% cash avoided the downside. Ironic but not repeatable.
- **2026-05-15–19 — 5-day silent failure gap:** No routine commits for 5 trading days. The scheduler appears to fire some sessions but not all. Strategy switch execution (which required operator manual orders) is unconfirmed for 5 days. This is an unacceptable operational gap.
- **2026-05-20 — AMD pullback improves R/R:** AMD went from $477 (peak) back to $414 (-13.2%). This actually improved the risk/reward for entry ($414 vs $445 prior estimate). Being blocked from entry at $445 and now having a better entry at $414 is a silver lining — but capturing this lower entry still requires API access.
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
- **NVDA earnings risk:** NVDA reports Q2 on May 21 (7 days). Pre-earnings review MUST happen at Daily Review May 19. Stop $175.60 provides 34.2% cushion vs $235.63. Consider partial profit-taking or collar if NVDA above $240 on May 19.

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
- **Market Open (9:45 AM ET — TODAY):**
  1. **Verify AMD fill** — if operator placed MOO, confirm fill price and post stop at fill×0.95.
  2. **PLTR re-score** — if PLTR opens above $134 with volume, run 2-of-5 indicator check; may reach 7.0 if Technical improves to 6.
  3. **Stop audit** — query `/v2/orders?status=open` to verify all GTC stops resting.
  4. **NVDA MOC** — confirm operator placed MOC sell for NVDA 15sh; if not, remind.
  5. **Strategy switch close check** — confirm TSM, JPM, AVGO sells if not yet executed.
- **Market Close (3:30 PM ET — TODAY):**
  1. **NVDA MOC deadline** — must place/confirm before 3:50 PM ET.
  2. Watch NVDA stock action before close; if surging on pre-earnings momentum, urgent to close.
- **Daily Review (4:30 PM ET — TODAY):**
  1. Evaluate NVDA earnings result (reported ~4:20 PM ET).
  2. If NVDA beats big: reconsider re-entry post-earnings as earnings-reaction-follow setup.
  3. Update setup performance tracker.
  4. Full weekly strategy evolution note (overdue from May 15 Friday).

## Cash Reserve Floor
$5,000 (5%). Current cash $85,550 — $80,550 available to deploy before hitting floor.
AMD entry: 12sh × $414 = $4,968 → remaining: $80,582
+ After strategy switch closes (TSM+NVDA+JPM+AVGO = ~$11,823): cash rises to ~$97,405
+ PLTR 37sh × $135 = $4,995 → remaining: $92,410
After AMD, strategy switch closes, and PLTR: $92,410 in cash = 92% — still massively above 5% floor. Deployment target (85% active) requires deploying ~$80K more. This is the persistent deployment crisis.
