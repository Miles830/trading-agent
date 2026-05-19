# Opus Trader — Portfolio Memory

## Last Updated
**2026-05-19 (Tuesday) — Pre-Market routine (8:00 AM ET / 12:03 UTC).** Alpaca API still blocked (HTTP 403) — 10th consecutive blocked session. No routines ran May 15-18 (all silent failures). Strategy switch MOO sells (TSM, NVDA, JPM, AVGO) for May 18 UNCONFIRMED — operator manual action required. NVDA earnings TOMORROW (May 20 AMC) — CRITICAL. Chip sector SOX -6% in 2 days. All candidates re-scored below 7.0 (AMD 6.17, PLTR 5.50, MU 6.17). No MOO orders placed.

**PRIOR UPDATE:** 2026-05-17 (Sunday) — STRATEGY SWITCH to 100% trading account (operator directive from main session). Allocation changed from 55/30/5/10 (LT/active/crypto/cash) to **85/10/5 (active/crypto/cash).** Long-term bucket retired. All 4 LT positions queued for MOO close at Monday 2026-05-18 open (TSM 7, NVDA 15, JPM 9, AVGO 7). Only GLD carries over. New 3:1 R/R minimum. New mandatory 5-indicator stack (Stochastic, Candle, Volume Oscillator, MACD, Volume Spike — 2-of-5 confirms required).

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

## Current Account Snapshot (May 19, 2026 Pre-Market — API Blocked)
- **Broker:** Alpaca Paper Trading (account PA3TXVEJ19LW)
- **Total Equity (estimated):** ~$100,200 (estimated; API blocked; prices from May 19 web research)
- **Cash:** $80,945.53 (est.) — unchanged from last confirmed state
- **Long Market Value (estimated — TWO SCENARIOS):**
  - **SCENARIO A (if May 18 strategy switch sells executed):** ~$2,929 (GLD 7sh only)
  - **SCENARIO B (if NOT executed — conservative assumption):** ~$18,150 (TSM+GLD+NVDA+JPM+AVGO at May 19 PM prices)
- **Open Positions (SCENARIO B — conservative):** TSM(7), GLD(7), NVDA(15), JPM(9), AVGO(7) = 5 positions
- **CRITICAL PENDING:** Strategy switch May 18 MOO sells UNCONFIRMED. NVDA earnings May 20 AMC = 48h window in effect. Operator MUST verify and act.
- **API Status:** BLOCKED — "Host not in allowlist" (HTTP 403, Anthropic sandbox TLS proxy). Persistent failure since May 6. **10th consecutive blocked session.**
- **Daytrade Count:** 0

## Bucket State (May 19 — NEW 85/10/5 ALLOCATION after 2026-05-17 strategy switch)
| Bucket | Target | Current $ (est. Scenario B) | Current % | Positions |
|---|---|---|---|---|
| Active Trading | 85% ($85K) | ~$18,150 (TSM+GLD+NVDA+JPM+AVGO — if not yet sold) | ~18.1% | 5 (unconfirmed; should be GLD only) |
| Crypto | 10% ($10K) | $0 | 0% | 0 |
| Cash Reserve | 5% ($5K floor) | ~$80,946 | ~80.7% | — |

**Deployment gap:** Cash ~$75.9K above the 5% floor ($5K). If strategy switch executed (Scenario A): only GLD remains + ~$97K cash = even larger gap. Chip sector sell-off means entering chip names NOT advisable today. NEED to wait for stabilization before deploying.

**Scenario A (strategy switch executed):** Active: $2,929 (GLD 7sh only, 2.9%), Cash: ~$97K (96.8%) → Massive underfillment. Cash floor 5% = $5K, deployed limit 95%, need to deploy ~$85K+ into active + $10K into crypto. CANNOT deploy in risk-off chip sell-off with NVDA earnings tomorrow. Watchlist building phase.

**Scenario B (not executed):** See open positions below. OPERATOR ACTION REQUIRED.

## Open Positions — SCENARIO B (if May 18 strategy switch sells did NOT execute; API blocked, cannot verify)
| Symbol | Bucket | Qty | Entry | Stop (old) | Required Stop (active -5%) | Est. Price May 19 PM | Est. P/L | Sector | Action Needed |
|---|---|---|---|---|---|---|---|---|---|
| TSM | active | 7 | 401.47 | 353.76 (-12% OLD) | $381.40 (-5%) | ~$395.95 | -$38.64 | Semiconductors | CLOSE per strategy switch |
| GLD | active | 7 | 418.86 | 397.92 (-5%) ✓ | $397.92 | ~$418.43 | -$3.01 | Precious metals | RETAIN — only holdover |
| NVDA | active | 15 | 198.83 | 175.60 (-12% OLD) | $211.61 (-5%) | ~$222.75 | +$359.00 | Semiconductors | CLOSE URGENT before earnings May 20 |
| JPM | active | 9 | 308.30 | 272.14 (-12% OLD) | $293.00 (-5%) | ~$297.81 | -$94.41 | Financials | CLOSE per strategy switch |
| AVGO | active | 7 | 418.59 | 368.36 (-12% OLD) | $397.66 (-5%) | ~$416.88 | -$11.97 | Semiconductors | CLOSE per strategy switch |

**Est. total long market value (Scenario B):** ~$18,150
- TSM: 7 × $395.95 = $2,772
- GLD: 7 × $418.43 = $2,929
- NVDA: 15 × $222.75 = $3,341
- JPM: 9 × $297.81 = $2,680
- AVGO: 7 × $416.88 = $2,918
- XLE: CONFIRMED DOES NOT EXIST (verified May 17)

**Net unrealized P/L (Scenario B): +$211** (NVDA +$359 carrying the book; JPM -$94 drag; all chips declining)

## Open Positions — SCENARIO A (if May 18 strategy switch sells executed)
| Symbol | Bucket | Qty | Entry | Stop | Est. Price May 19 PM | Est. P/L | Sector |
|---|---|---|---|---|---|---|---|
| GLD | active | 7 | 418.86 | 397.92 (-5%) | ~$418.43 | -$3.01 | Precious metals |

**If Scenario A:** Cash ~$97K + GLD $2,929 = Total equity ~$100K. Need to build new active book (85% target = $85K active). Cannot deploy in current risk-off chip sell-off. Building watchlist.

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

## Performance vs S&P 500 (May 19 Pre-Market Update)
- **Portfolio total equity (est.):** ~$100,200 (estimated; API blocked)
- **Portfolio total return:** +0.20% (estimated)
- **S&P 500 close May 18:** ~7,403.05 (down from 7,511 record on May 14)
- **S&P 500 return since strategy start (~May 1):** ~+2.82% (7,403 vs ~7,200 est.) — S&P ALSO pulled back from record
- **Gap vs SPX:** **~-2.62 percentage points** (improved from -3.81 pp as S&P corrected; portfolio mostly cash benefited from non-participation in sell-off)
- **Note:** The chip sector -6% in 2 days actually helped the mostly-cash portfolio relative to the benchmark. If strategy switch sold NVDA/TSM on May 18 (chip sell-off day), those sells likely came at lower prices than the May 14 peak.
- **CRITICAL:** Gap approaching -4 pp in 10 trading days. If AMD, PLTR, MU entered tomorrow and markets hold, gap could narrow by ~1 pp. Operator action on May 15 is critical.

## Macro Context (as of 2026-05-19 Pre-Market)
- **Trump-Xi Summit (concluded May 15):** Summit produced some chip export easing language. H200 clearance for select Chinese companies confirmed. No full reset of semiconductor controls. Market initially rallied to records then pulled back as "sell the news" dynamic set in.
- **Chip sector sell-off (May 15-18):** SOX (Philadelphia Semiconductor Index) -6% in 2 trading days. Drivers: (1) valuation/sustainability concerns on data center spend, (2) South Korea lawmakers considering AI profit tax, (3) NVDA earnings overhang. "AI run in memory gone too far, too fast" narrative emerged specifically targeting MU.
- **NVDA Earnings: TOMORROW May 20 AMC** — Reports Q1 FY2027. Analysts: EPS $1.78 (+120% YoY), Revenue $79.2B (+79.5% YoY). Stock: $222.75 PM (down from $235.63 peak). 48-hour binary event window in effect.
- **Trump called off Iran military strike** (announced May 19) — Gulf allies (Saudi Arabia, Qatar, UAE) requested pause for negotiations. Oil fell ~2% (Brent ~$109, WTI ~$102.90). Iran risk premium fading → GLD loses some safe-haven bid, but rate concern + geopolitical uncertainty still supports gold.
- **Yields rising:** 2-yr 3.99%, 10-yr 4.46%. Fed meeting June 16-17 = no near-term cut. Rising rates = headwind for growth/tech, benefit for bank NIMs but concerns about consumer stress.
- **Bitcoin:** ~$76,771 — down from $80,120 on May 15. Below $82K threshold. No crypto entry. Risk-off environment hurting crypto.
- **ETH:** ~$2,113 — declining. No entry.
- **S&P 500:** 7,403 on May 18, down from 7,511 record. Market in correction mode after AI-summit euphoria.

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

4. **NVDA May 21 earnings:** Pre-earnings review at Daily Review May 19. No new NVDA entries after May 19. Existing stop $175.60 provides 34.2% cushion. Consider partial profit-taking or protective strategy if NVDA continues rallying (now at $235.63, +18.5% above entry).

5. **AVGO:** Still unconfirmed via API. Treating as probable fill at $418.59. Current price ~$422.50 (+0.9% above entry — recovering). If NOT filled, operator should verify account.

## Pending Deferrals (≥7 watchlist names not yet entered)
- **AMD** (7.33) — 4th consecutive deployment failure; operator must place at market open May 15
- **MU** (est. 7.33) — pending full 6-agent score at Pre-Market May 15
- **PLTR** (conditional 7.33) — re-enter if $134 reclaimed on Day 2 summit news

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
- **Market Open May 19 (9:45 AM ET / 13:45 UTC):**
  1. **Stop audit** — if API unblocked: verify GLD stop at $397.92 resting; verify strategy switch status (TSM/NVDA/JPM/AVGO)
  2. **HD post-open reaction** — if HD shows Bullish Engulfing + volume spike ≥2x at open, re-score (currently 6.33; candle bonus could push to 7+)
  3. **AMD/MU/PLTR** — if chip sector stabilizes and any name shows reversal pattern with ≥2 indicator confirms, re-score; otherwise maintain skip status
  4. **NVDA check** — if still in portfolio, verify stop or consider closing before earnings tomorrow
- **Daily Review May 19 (4:30 PM ET — MANDATORY NVDA pre-earnings review):**
  1. NVDA earnings tomorrow — decide: hold through earnings, partial exit, or full close
  2. Chip sector assessment — is the sell-off done or continuing?
  3. Build fresh watchlist for May 20 (post-NVDA earnings day)
  4. Weekly strategy evolution note (if AVGO/TSM/JPM closed, document outcomes)
- **Market Open May 20 (9:45 AM ET — post-NVDA-earnings day):**
  1. Read NVDA earnings print (May 20 AMC → available May 21 pre-market, but May 20 after close = visible before May 21 market open)
  2. Decide NVDA position if still open
  3. Scan for NVDA earnings reaction plays (fade or follow-through)

## Cash Reserve Floor
$10,000 (10%). Current cash $80,946 — $70,946 available to deploy before hitting floor.
AMD fills would consume: 10sh × $445 = $4,450 → remaining: $76,496
+ PLTR 36sh × $134 = $4,824 → remaining: $71,672
+ MU 6sh × $788 = $4,728 → remaining: $66,944
After all three: $66,944 still in cash = 66% — still massively above 10% floor.
NVDA pre-earnings hedge consideration: Could use up to 1% of portfolio = ~$1,000 in protective puts.
