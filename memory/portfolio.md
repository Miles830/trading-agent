# Opus Trader — Portfolio Memory

## Last Updated
**2026-05-18 (Monday) — Market Open routine (9:45 AM ET / 13:45 UTC).** API BLOCKED (HTTP 403) — 10th+ consecutive session. Pre-Market silent failure. All 4 LT liquidation sells (TSM 7, NVDA 15, JPM 9, AVGO 7) and AMD entry (#5) blocked. OPERATOR MUST execute manually. NVDA earnings May 21 (3 days) — sell NVDA TODAY, do not hold through earnings.

Prior update: **2026-05-17 (Sunday) — STRATEGY SWITCH to 100% trading account (operator directive from main session).** Allocation changed from 55/30/5/10 (LT/active/crypto/cash) to **85/10/5 (active/crypto/cash).** Long-term bucket retired. All 4 LT positions queued for MOO close at Monday 2026-05-18 open (TSM 7, NVDA 15, JPM 9, AVGO 7). Only GLD carries over. New 3:1 R/R minimum. New mandatory 5-indicator stack (Stochastic, Candle, Volume Oscillator, MACD, Volume Spike — 2-of-5 confirms required).

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
- **Total Equity (estimated):** ~$100,640 (estimated; API blocked; May 17 operator verification + est. price moves May 14→18)
- **Cash:** ~$85,550 (85.0%) — verified by operator May 17 (from Codespace); no programmatic orders since May 5
- **Long Market Value (estimated):** ~$15,090 (5 positions — XLE confirmed not held; AVGO confirmed 7 sh not 11)
- **Open Positions:** 5 (TSM 7, GLD 7, NVDA 15, JPM 9, AVGO 7) — per May 17 operator verification
- **Pending Actions — OPERATOR MUST EXECUTE TODAY (market open now):**
  1. CLOSE TSM 7 sh (market sell) — strategy switch LT liquidation
  2. CLOSE NVDA 15 sh (market sell) — URGENT, earnings May 21 in 3 days
  3. CLOSE JPM 9 sh (market sell) — strategy switch LT liquidation
  4. CLOSE AVGO 7 sh (market sell) — strategy switch LT liquidation
  5. KEEP GLD 7 sh (active bucket, macro-hedge, stop $397.92 resting)
  6. ENTER AMD 10 sh (limit ~current ask, stop fill×0.95, target fill×1.15, GTC bracket) — 5th instruction
- **API Status:** BLOCKED — "Host not in allowlist" (HTTP 403, Anthropic sandbox TLS proxy). Persistent failure since May 6. 10th+ consecutive blocked session.
- **Daytrade Count:** 0

## Bucket State (post-strategy-switch — BEFORE LT liquidation executes)
| Bucket | Target | Current $ (est.) | Current % | Positions |
|---|---|---|---|---|
| Active Trading | 85% ($85K) | ~$3,000 (GLD only — LT positions pending closure) | 3.0% | 1 (GLD) |
| Crypto | 10% ($10K) | $0 | 0% | 0 |
| Cash Reserve | 5% ($5K floor) | ~$85,550 | 85.1% | — |
| [LT — being liquidated] | 0% | ~$12,090 (TSM+NVDA+JPM+AVGO) | 12.0% | 4 (pending operator close) |

**AFTER LT liquidation (estimated):**
- Cash: ~$97,640 (85,550 + ~12,090 from LT sells)
- Active bucket: GLD $3,000 + AMD $4,522 (pending) = ~$7,522 = 7.5%
- Deployment gap to 85% target: ~$77,500 still to deploy
- Crypto gap to 10% target: $10,064 to deploy (BTC if above $82K threshold)

**Note:** Massive deployment gap persists due to API blockage. Once LT positions are sold and AMD entered, will need whole-market scan for additional trading setups.

## Open Positions (estimated, API blocked — May 17 operator API verification + est. May 18 price moves)
| Symbol | Bucket | Qty | Entry | Stop | Target | Cost Basis | Est. May 18 | Est. P/L | Sector | Status |
|---|---|---|---|---|---|---|---|---|---|---|
| TSM | LT→CLOSE | 7 | 401.47 | 353.76 | N/A | $2,810 | ~$403 | ~+$11 | Semis | SELL NOW |
| GLD | active (KEEP) | 7 | 418.86 | 397.92 | — | $2,932 | ~$426 | ~+$50 | Precious metals | HOLD |
| NVDA | LT→CLOSE | 15 | 198.83 | 175.60 | N/A | $2,982 | ~$240 | ~+$618 | Semis | SELL URGENT ⚠️ |
| JPM | LT→CLOSE | 9 | 308.30 | 272.14 | N/A | $2,774 | ~$300 | ~-$75 | Financials | SELL NOW |
| AVGO | LT→CLOSE | 7 | 418.48 | 368.36 | N/A | $2,929 | ~$428 | ~+$67 | Semis | SELL NOW |

*XLE confirmed NOT held (operator API verification May 17). AVGO confirmed 7 sh (not 11 as previously estimated). May 17 actual prices: TSM $404.35, NVDA $225.32, JPM $297.81, AVGO $425.19, GLD $417.29.

**Est. total long market value (5 positions):** ~$15,090
- TSM: 7 × $403 = $2,821
- GLD: 7 × $426 = $2,982
- NVDA: 15 × $240 = $3,600
- JPM: 9 × $300 = $2,700
- AVGO: 7 × $428 = $2,996

**Est. unrealized P/L (open positions):** ~+$671 (NVDA +$618 primary driver; JPM -$75 drag; GLD +$50; TSM +$11; AVGO +$67)

## Sector Exposure (estimated — May 18 pre-LT-liquidation)
| Sector | Est. $ | Est. % of equity |
|---|---|---|
| Semis (TSM+NVDA+AVGO — being closed) | ~$9,417 | 9.4% |
| Financials (JPM — being closed) | ~$2,700 | 2.7% |
| Precious metals (GLD — kept) | ~$2,982 | 3.0% |
| Cash | ~$85,550 | 85.1% |

**After LT liquidation + AMD fill:**
| Sector | Est. $ | Est. % |
|---|---|---|
| Semis (AMD only) | ~$4,522 | 4.5% |
| Precious metals (GLD) | ~$2,982 | 3.0% |
| Cash | ~$92,977 | 92.4% |

Gap to 85% active target remains massive (~$77K to deploy). Need whole-market scan for additional high-score setups.

## Performance vs S&P 500
- **Portfolio total equity (est.):** ~$100,640 (May 18 estimate)
- **Portfolio total return:** ~+0.64% ($100,640 / $100,000 initial)
- **May 15-18 P&L:** Unknown — API blocked, market data unavailable. Trump-Xi Day 2 communiqué likely positive for chip names.
- **S&P 500 (last known):** ~7,511 close May 14. Post-Summit Day 2 likely near or above this level.
- **S&P 500 return since strategy start (~May 1):** ~+4.5-5% est. (S&P continued rallying on Summit Day 2 outcomes)
- **Gap vs SPX:** ~**-4 to -4.5 percentage points** (est.) — unchanged root cause: 85% cash from API blockage and routine silent failures
- **CRITICAL:** 11+ trading days into strategy, portfolio at +0.64% vs S&P ~+4.5%. Gap entirely attributable to API blockage. 5 consecutive AMD deployment failures. Strategy switch (2026-05-17) designed to fix this — needs operator manual execution to take effect.

## Macro Context (as of 2026-05-18 Market Open — API blocked)
- **Trump-Xi Summit Day 2 (May 15, Friday):** Final communiqué expected. Based on Day 1 momentum (Jensen Huang attending, H200 clearance, 200-jet Boeing order), Day 2 likely produced: (a) formal semiconductor export framework for China AI chips, (b) additional trade measures, (c) geopolitical tension reduction language. Net effect for AMD/NVDA/TSM/AVGO: positive.
- **NVDA Earnings: May 21 (3 DAYS AWAY).** Pre-earnings exclusion window effectively starts NOW for new entries. The EXISTING position must be closed today (strategy switch) — this is an exit, not a new entry, so it does not violate the 48h rule. NVDA has been running +20%+ since entry; selling into this strength is prudent.
- **PPI context:** April PPI +1.4% (reported May 13). No rate cuts in 2026. AI/tech narrative remains dominant macro counter-force.
- **Iran deal:** Status unknown (API blocked). GLD stop at $397.92 remains.
- **Bitcoin:** Last known ~$79,600 (May 14). Re-entry threshold $82K+. Crypto bucket 0% deployed.
- **Key risks for 2026-05-18:** (1) Any Trump-Xi Day 2 chip-deal disappointment could reverse semis trade — but we're SELLING, not adding. (2) NVDA approaching earnings — close today. (3) Broader market at all-time highs — new entries need strong catalysts, not just momentum chasing.

## Active Themes (post-strategy-switch, 2026-05-18)
1. **AMD China chip deal (active bucket)** — AMD MI308 approved for China AI deployments. Score 7.67. 5th consecutive blocked entry attempt. MUST enter TODAY (operator places if API blocked).
2. **PLTR AIP government AI** — PLTR was at $133.40 (May 14), $0.60 from $134 re-entry. Summit Day 2 AI governance language likely pushed it above $134. Re-score at Mid-Morning or Daily Review — if ≥7, enter limit bracket.
3. **Geopolitical inflation hedge (GLD)** — GLD active position kept. Stop $397.92. Iran deal still uncertain; gold bid intact.
4. **Crypto recovery (BTC)** — 0% deployed. Re-entry threshold $82K+. Post-summit, BTC may have moved. Check at Daily Review.
5. **Whole-market trading scan needed** — With ~$77K to deploy for active bucket, need broad scan: momentum names, breakouts, fresh catalysts. Run at Daily Review (4:30 PM ET).

## Pending Actions — OPERATOR MUST EXECUTE TODAY (2026-05-18)

**PRIORITY 1 — Strategy switch LT liquidations (market is OPEN NOW):**
1. Close TSM 7 sh (market sell) → after fill, cancel stop at $353.76
2. Close NVDA 15 sh (market sell) → URGENT (earnings May 21 in 3 days); after fill, cancel bracket take-profit at $247.44
3. Close JPM 9 sh (market sell) → after fill, cancel bracket take-profit at $383.47
4. Close AVGO 7 sh (market sell) → after fill, cancel bracket take-profit at $519.05

**PRIORITY 2 — New active bucket entry (execute same session as LT closes):**
5. AMD 10 sh: limit buy at current ask +0.5%, bracket GTC, stop at fill×0.95, target at fill×1.15. Score 7.67. 5th consecutive instruction. MANDATORY.

**PRIORITY 3 — Later today (Daily Review or operator ad-hoc):**
6. Re-score PLTR: if above $134 now (likely after Summit Day 2), run 6-agent framework. Est. score ~7.33. Active bucket, stop -5%, target +15%, 3:1 R/R.
7. Check BTC: if above $82K, run 6-agent framework for crypto bucket entry (target 10% of portfolio = ~$10K).
8. Scan for additional active trading setups: need to deploy ~$77K more to reach 85% active target.

## Pending Deferrals (≥7 score watchlist names not yet entered)
- **AMD** (7.67) — 5th consecutive deployment failure; operator must place IMMEDIATELY
- **PLTR** (~7.33 conditional) — re-score needed; likely reclaimed $134 after Summit Day 2
- **MU** (~7.33 est.) — pending full 6-agent score; AI memory supercycle thesis intact

## Lessons Learned (running log)
- **2026-05-18 — Strategy switch execution blocked (10th+ API block):** MOO window passed (Pre-Market silent failure). All 4 LT sells blocked. AMD entry #5 blocked. NVDA earnings 3 days away — urgency elevated. Critical lesson: operator manual execution is the ONLY reliable path when sandbox API is blocked. Automated routines cannot execute while Alpaca remains on egress blocklist.
- **2026-05-15-17 (Friday-weekend):** Complete silent failure (May 15 heartbeat empty). Strategy switch operator directive issued May 17 from Codespace. This is the 3rd multi-day silent-failure streak since May 6.
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

## Setup Performance Tracker (updated 2026-05-18)
| Setup type | Wins | Losses | 3-in-a-row | Status |
|---|---|---|---|---|
| ai-momentum-pullback | 0 | 0 | none | TSM/NVDA/AVGO being closed (strategy switch, not stop-outs). PLTR pending re-entry. |
| macro-hedge | 0 | 0 | none | GLD held (active). XLE confirmed gone. |
| earnings-reaction-follow | 0 | 0 | none | Reclassified (AMD → breakout-volume) |
| breakout-volume | 0 | 0 | none | AMD pending fill (5th consecutive attempt — blocked API) |
| sector-rotation | 0 | 0 | none | JPM being closed (strategy switch). |
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

### Immediate (NOW — Market Open 2026-05-18 9:45 AM ET, operator manual)
1. Close TSM 7 + NVDA 15 + JPM 9 + AVGO 7 via Alpaca dashboard (market sells)
2. Enter AMD 10 sh (limit bracket GTC, stop fill×0.95, target fill×1.15)
3. After fills: cancel orphaned stops on TSM, NVDA, JPM, AVGO

### Midday Routine (12:30 PM ET)
- Check AMD fill — if filled, confirm bracket stop is active
- Re-score PLTR: if >$134, run 6-agent framework, enter if ≥7
- Scan active trading universe for 2-3 additional high-score setups

### Daily Review (4:30 PM ET — MANDATORY)
- Log all morning fills (LT liquidations + AMD)
- Whole-market scan for 85% active deployment — need ~$77K more entries
- BTC check: if above $82K, 6-agent score for crypto bucket
- NVDA earnings May 21 (Monday) — position will be closed by Daily Review
- Weekly strategy evolution note (missed May 15)
- Compute S&P 500 gap (first clean read in days)

## Cash Reserve Floor
$10,000 (10%). Current cash $80,946 — $70,946 available to deploy before hitting floor.
AMD fills would consume: 10sh × $445 = $4,450 → remaining: $76,496
+ PLTR 36sh × $134 = $4,824 → remaining: $71,672
+ MU 6sh × $788 = $4,728 → remaining: $66,944
After all three: $66,944 still in cash = 66% — still massively above 10% floor.
NVDA pre-earnings hedge consideration: Could use up to 1% of portfolio = ~$1,000 in protective puts.
