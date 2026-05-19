# Opus Trader — Portfolio Memory

## Last Updated
**2026-05-19 (Tuesday) — Market Close routine (3:30 PM ET / 19:35 UTC).** NVDA earnings confirmed for **tomorrow May 20 after close** (was mislogged as May 21). Strategy switch (close TSM/NVDA/JPM/AVGO via MOO) still unexecuted — API blocked for 10th+ consecutive day. All 4 LT positions NAKED (stops canceled May 17, never replaced). Critical operator action required before May 20 market open.

Prior "Last Updated" entry preserved below for context.

## 🚨 URGENT OPERATOR ACTION — May 20 Market Open (before 9:25 AM ET)

**API is still blocked in the cloud runner environment (HTTP 403 "Host not in allowlist"). Operator must manually execute from their own access:**

1. **SELL TSM 7sh — MOO** (`time_in_force=opg, side=sell, type=market`)
2. **SELL NVDA 15sh — MOO** (`time_in_force=opg`) — ⚠️ EARNINGS TODAY (May 20 after close)
3. **SELL JPM 9sh — MOO** (`time_in_force=opg`)
4. **SELL AVGO 7sh — MOO** (`time_in_force=opg`)
5. **BUY AMD 10sh — MOO** (`time_in_force=opg`) — score 7.17 (3:1 R/R: stop $fill×0.95, target $fill×1.15)

After MOO fills: place standalone GTC stop for AMD (sell stop qty 10 at fill_price×0.95). GLD stops f0fd18ca + 26defbfa already resting at $397.92 — verify they still exist.

**All 4 naked positions (TSM/NVDA/JPM/AVGO) are GUARDRAIL VIOLATIONS. Their bracket/stop orders were canceled on May 17 as part of the strategy switch. The replacement MOO sells never executed. These positions have been trading without floor protection since May 18.**

---

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
- **Total Equity (estimated):** ~$100,192 (prices from May 19 web research)
- **Cash:** ~$85,550 (85.4%) — from May 17 Alpaca verification; unchanged (no new orders executed)
- **Long Market Value (estimated):** ~$14,642 (5 positions)
- **Open Positions:** 5 (TSM 7, GLD 7, NVDA 15, JPM 9, AVGO 7) — XLE confirmed NOT existing per May 17 Alpaca verification
- **Pending Orders / Actions:** See URGENT block above. AMD 5th consecutive deployment failure. Strategy switch (TSM/NVDA/JPM/AVGO MOO sells) 3rd consecutive failed day.
- **API Status:** BLOCKED — "Host not in allowlist" (HTTP 403). 10th+ consecutive blocked session.
- **Daytrade Count:** 0
- **NVDA Earnings:** Tomorrow May 20 after close. Q1 FY27 consensus $79.2B rev (+79.5% YoY), EPS $1.78. Key risk: China revenue modeled at zero. Options pricing 5-10% move. Must close position before earnings.

## Bucket State (post-strategy-switch target; LT sells still pending)
| Bucket | Target | Current $ (est.) | Current % | Positions |
|---|---|---|---|---|
| Active Trading | 85% ($85K) | ~$14,642 (TSM+GLD+NVDA+JPM+AVGO) | 14.6% | 5 (should be 1 after closes — GLD only) |
| Crypto | 10% ($10K) | $0 | 0% | 0 |
| Cash Reserve | 5% ($5K floor) | ~$85,550 | 85.4% | — |

**Deployment gap:** After strategy switch closes (TSM/NVDA/JPM/AVGO → cash), cash will be ~$100K → need to deploy ~$80K+ into active trading immediately. AMD ($4.2K), PLTR (re-score), and additional names must be identified and entered at May 20 Pre-Market.

## Open Positions (prices from May 19 web research — API blocked)
| Symbol | Bucket | Qty | Entry | Stop | Target | Cost basis | Est. Price May 19 | Est. P/L | Sector | Stop Status |
|---|---|---|---|---|---|---|---|---|---|---|
| TSM | active* | 7 | $401.47 | ⚠️ NONE | strategy-switch close | $2,810.29 | ~$395.95 | -$38.64 | Semiconductors | 🔴 NAKED |
| GLD | active | 7 | $418.86 | $397.92 (-5%) | — | $2,932.02 | ~$418.43 | -$3.01 | Precious metals | ✓ assumed resting |
| NVDA | active* | 15 | $198.83 | ⚠️ NONE | strategy-switch close | $2,982.45 | ~$220.76 | +$328.95 | Semiconductors | 🔴🚨 NAKED + EARNINGS MAY 20 |
| JPM | active* | 9 | $308.30 | ⚠️ NONE | strategy-switch close | $2,774.72 | ~$298.36 | -$89.46 | Financials | 🔴 NAKED |
| AVGO | active* | 7 | $418.48 | ⚠️ NONE | strategy-switch close | $2,933.36 | ~$420.71 | +$15.61 | Semiconductors | 🔴 NAKED |

*Bucket re-tagged active per May 17 strategy switch. These positions are to be CLOSED via MOO May 20 (or as soon as API access allows).

**Est. total long market value:** ~$14,642
- TSM: 7 × $395.95 = $2,771.65
- GLD: 7 × $418.43 = $2,928.01
- NVDA: 15 × $220.76 = $3,311.40
- JPM: 9 × $298.36 = $2,685.24
- AVGO: 7 × $420.71 = $2,944.97

**Net unrealized P/L: +$213.45** (NVDA +$328.95 is primary driver; JPM -$89.46 is biggest drag)

## Sector Exposure (estimated — May 19 EOD; all except GLD scheduled for closure)
| Sector | Est. $ | Est. % of equity | Action |
|---|---|---|---|
| Semiconductors (TSM+NVDA+AVGO) | $9,028 | 9.0% | CLOSING via MOO May 20 |
| Financials (JPM) | $2,685 | 2.7% | CLOSING via MOO May 20 |
| Precious metals (GLD) | $2,928 | 2.9% | HOLD |
| Cash | ~$85,550 | 85.4% | |

**After AMD fill (still pending for May 15):**
| Sector | Added $ | New % |
|---|---|---|
| Semiconductors (+AMD 10sh×$445 = $4,450) | $15,431 | 15.4% |
| Cash remaining | $76,496 | 76.1% |

All sectors remain well under 25% cap. After MU + PLTR fills (if entered), semis could approach 20%+ but still below 25% cap.

**LT bucket tech sub-allocation (current):**
TSM+NVDA+AVGO = $10,981 in LT tech; LT total = $10,981 + $2,702 (JPM) = $13,683
LT-tech % = 80.3% → above 60% ceiling BUT LT bucket ($13.7K) < $20K threshold → ceiling is INFORMATIONAL per CLAUDE.md. If PLTR enters ($4,800): LT total = $18,483 → still below $20K, still informational.

## Performance vs S&P 500 (updated May 19)
- **Portfolio total equity (est.):** ~$100,192
- **Portfolio total return:** +0.19% ($100,192 / $100,000 initial)
- **Today's P&L (vs May 17 verified ~$100,338):** ~-$146 / -0.14%
- **S&P 500 close May 19:** ~7,391 (down 0.32%). Summit no-deal disappointment continuing to weigh.
- **S&P 500 return since strategy start (~May 1):** ~+2.65% (7,391 vs ~7,200 est. May 1 start)
- **Gap vs SPX:** **-2.46 percentage points** (improved from -3.81 pp on May 14 because market pulled back from its records)
- **NVDA earnings tomorrow:** If NVDA beats and rallies 5%, unrealized P/L from NVDA improves by +$165. If NVDA drops 10%, unrealized P/L from NVDA drops by -$331. MUST close before earnings.

## Macro Context (updated May 19, 2026)
- **Trump-Xi Summit CONCLUDED (May 14-15):** Chip export controls were NOT on the bilateral agenda. H200 chips still not shipping despite approvals (Beijing won't allow Chinese companies to take delivery). No major policy breakthroughs. Chip sector sold off Friday May 15 (S&P -1.24%) and has continued lower.
- **Market:** S&P 500 ~7,391, down from record 7,511 (May 14). Up 5.7% YTD. Uncertainty from Iran war + tariff complexity + Fed-cut timeline pushed to H2 2027.
- **NVDA Earnings:** TOMORROW **May 20 after close** (CORRECTED from May 21). Q1 FY27 consensus: $79.2B rev (+79.5% YoY), EPS $1.78 (+120%). Key risk: China revenue guidance (modeled at zero). Options pricing 5-10% move. Historical: closed lower 4 of last 5 earnings reports. **CLOSE NVDA POSITION BEFORE EARNINGS.**
- **Bitcoin:** No confirmed update. Re-entry threshold remains $82K. No crypto positions.
- **AI capex theme:** Despite summit disappointment on chips, domestic AI capex remains intact. NVDA data center + AMD + AVGO still in secular growth.
- **Iran war:** Still unconfirmed resolution. Geopolitical inflation premium sustains GLD bid (though gold has pulled back from $430 peak to ~$418).

## Active Themes (updated May 19, 2026)
1. **AI capex (domestic)** — Summit disappointment on China chips does NOT kill domestic AI capex. NVDA, AMD, AVGO still in structural growth. AMD score 7.17 at $421 — ENTER at May 20 Pre-Market after closes.
2. **Geopolitical inflation hedge** — GLD at $418.43 (entry $418.86, near flat). Iran war ongoing, no deal. Gold still supported. Hold.
3. **Crypto** — No position; BTC threshold $82K still applies. No confirmed BTC price today.
4. **Government AI (PLTR)** — Summit produced no domestic AI language that would catalyze PLTR specifically. Need re-score at May 20 Pre-Market. If PLTR reclaimed $134 on May 15-19, it may qualify.
5. **Post-strategy-switch rebuild** — After TSM/NVDA/JPM/AVGO closes, ~$100K cash available to deploy. Need 15-20 high-conviction active entries at $3-5K each. Full market scan required at May 20 Pre-Market.

## Pending Actions — OPERATOR MUST EXECUTE MAY 20 PRE-MARKET

🚨 **ALL 4 ITEMS BELOW ARE MANDATORY. API WILL LIKELY STILL BE BLOCKED. OPERATOR MUST EXECUTE FROM THEIR OWN CODESPACE/ACCESS.**

1. **SELL TSM 7sh — MOO** (strategy switch — LT close). Must be in before 9:25 AM ET. After fill: do NOT place new stop (position closed).

2. **SELL NVDA 15sh — MOO** (strategy switch + ⚠️ EARNINGS TODAY after close). Must sell before earnings. After fill: no new stop.

3. **SELL JPM 9sh — MOO** (strategy switch — LT close). After fill: no new stop.

4. **SELL AVGO 7sh — MOO** (strategy switch — LT close). After fill: no new stop.

5. **BUY AMD 10sh — MOO** (score 7.17, breakout-volume, 5th mandatory instruction). Entry ~$421, stop fill×0.95, target fill×1.15 (3:1 R/R). After fill: place GTC stop sell at fill_price × 0.95.

6. **PLTR re-score** — check if PLTR has reclaimed $134 during May 15-19. If yes, run full 6-agent; estimate ~7.33. Enter 36sh conditional on score ≥7.

7. **Post-close cash rebuild** — after 4 MOO sells fill, ~$14.6K LMV converts back to cash → total cash ~$100K. Begin whole-market scan for new active entries. Target: 12+ positions at $3-5K each.

## Pending Deferrals (≥7 watchlist names not yet entered)
- **AMD** (7.17) — 5th consecutive deployment failure; operator MUST place at market open May 20
- **PLTR** — conditional on $134 reclaim re-score; last known: 6.50 on May 14

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
- **2026-05-15-18 — Trump-Xi Summit Day 2 no-deal:** Chip export controls unresolved. H200 chips not shipping despite approvals. S&P 500 fell -1.24% on May 15. Markets continued lower May 18-19. Lesson: diplomatic "approvals" without physical deliveries are worthless for chip stocks — the market priced the non-event correctly. NVDA fell from $235.63 (May 14) to $220.76 (May 19) = -6.3%.
- **2026-05-17 — Strategy switch unexecuted (critical):** Sunday strategy switch committed to close all LT positions via MOO May 18. Pre-Market and Market Open routines for May 18-19 silently failed. Stops had already been canceled (Sunday operator action). Result: 4 naked positions trading without floor protection for 2+ trading days. Lesson: canceling existing protection BEFORE replacement executes is the most dangerous sequence in any strategy switch. The correct order is: (1) place MOO sell orders, (2) confirm fills, (3) THEN cancel old stops. Never cancel stops before exit orders fill.
- **2026-05-19 — NVDA earnings date error corrected:** NVDA earnings are May 20 (tomorrow), NOT May 21. This 1-day error is material — the 48-hour pre-earnings window started Saturday May 18, meaning no new NVDA entries should have been placed since May 18. Error was in historical notes from May 13-14 period ("May 21, 7 days") — source was likely an early estimate. Always verify earnings dates from multiple sources at the pre-earnings routine, not from notes that may be days old.

## Setup Performance Tracker (updated 2026-05-19)
| Setup type | Wins | Losses | 3-in-a-row | Status |
|---|---|---|---|---|
| ai-momentum-pullback | 0 | 0 | none | TSM closing (strategy switch); PLTR pending re-score |
| macro-hedge | 0 | 0 | none | GLD active: -$3 from entry (neutral); XLE closed/non-existent |
| earnings-reaction-follow | — | — | — | Reclassified to breakout-volume (AMD) |
| breakout-volume | 0 | 0 | none | AMD pending fill (5th consecutive attempt) |
| earnings-reaction-fade | — | — | — | No trades |
| mean-reversion-oversold | — | — | — | No trades |
| sector-rotation | 0 | 0 | none | JPM closing (strategy switch); open P/L -$89 |
| crypto-flush-rebound | — | — | — | No trades |
| candlestick-reversal | — | — | — | No trades |

No 3-in-a-row halt or boost rules triggered. No closed P&L recorded — all open positions. Closing TSM/NVDA/JPM/AVGO via strategy switch will record first realized P&L entries.

## Strategy Evolution Notes
- **2026-05-01 (init):** Strategy initialized per CLAUDE.md. No deviations.
- **2026-05-04:** First positions opened. Strategy unchanged; execution layer needs fixing.
- **2026-05-08:** Three-week persistent API blockage causing compounding execution gaps. Portfolio 85% cash vs. 10% floor target.
- **2026-05-12:** China chip deal changes AMD thesis from earnings-follow to breakout-volume. Rate-cut thesis broken (no cuts until 2027) but partially offset by China chip deal sector tailwind. PLTR government AI revenues insulated from rate environment. NVDA earnings approaching.
- **2026-05-14 (Week 2 Thursday):** Trump-Xi Summit Day 1 delivered massive NVDA catalyst (+4.54%). Boeing 200-jet order confirmed. PLTR near $134 re-entry. Markets at all-time records. Portfolio at +0.51% vs S&P +4.32%.
- **2026-05-15-18 (Week 3 start — 3 missing trading days):** Summit ended in disappointment (no chip deal). Market retreated. NVDA fell -6.3% from May 14 peak. Strategy switch executed on paper but not in execution (API blocked). Three trading days (May 15, 18, 19) with no functional agent coverage except this one manual Market Close session on May 19.
- **2026-05-19 (Week 3 Tuesday — STRATEGY INFLECTION):** Portfolio at +0.19% vs S&P +2.65% (gap -2.46 pp). Strategy switch still pending execution. Four naked positions. NVDA earnings tomorrow. The period May 15-19 produced the first material drawdown: NVDA gave back $218 of unrealized P/L from its May 14 peak, while JPM/GLD also declined. No realized losses yet. Post-close strategy: (1) execute strategy switch immediately, (2) rebuild 85% active deployment with fresh whole-market scan, (3) comply with 3:1 R/R on ALL new entries.

## Next Routine Plan
- **Pre-Market May 20 (8:00 AM ET — NVDA EARNINGS DAY):**
  1. **Strategy switch MOO sells** (MANDATORY — if API blocked, operator executes manually before 9:25 AM ET):
     - Sell TSM 7sh MOO
     - Sell NVDA 15sh MOO (⚠️ EARNINGS TODAY after close — sell at open, not at close)
     - Sell JPM 9sh MOO
     - Sell AVGO 7sh MOO
  2. **AMD MOO 10sh** — score 7.17, 3:1 R/R (stop fill×0.95, target fill×1.15) — 5th mandatory instruction
  3. **PLTR re-score** — check current price; if >$134, run full 6-agent framework (est. ~7.17-7.33)
  4. **NVDA earnings positioning** — confirm NVDA sold at step 1. Do NOT hold NVDA through earnings.
  5. **Post-sell market scan** — with ~$100K cash after closes, run whole-market scan per CLAUDE.md Universe Selection. Find 5-10 more names scoring ≥7 for MOO entry or same-day limit orders.

- **Market Open May 20 (9:45 AM ET):**
  1. Verify all 4 MOO sells filled (TSM/NVDA/JPM/AVGO)
  2. Verify AMD MOO fill; place GTC stop at fill×0.95
  3. For PLTR if entered: place GTC stop at fill×0.95, target fill×1.15 (3:1 R/R)
  4. Begin deploying cash into high-score names identified at Pre-Market
  5. **Stop audit** — verify all 6 existing stops still resting (assumed GTC from May 4-6 bracket placements).
- **Market Open (9:45 AM ET):** Post-MOO stops for AMD (and PLTR/MU if entered). Verify fills.
- **Daily Review May 15 (4:30 PM ET — FRIDAY):** Weekly strategy evolution note. NVDA pre-earnings prep begins (6 days to May 21).

## Cash Reserve Floor
**$5,000 (5%) per May 17 strategy switch** (lowered from prior 10% floor).

**Current cash:** ~$85,550. After strategy switch closes (TSM/NVDA/JPM/AVGO): ~$100,150.
Deployment headroom: $100,150 - $5,000 floor = $95,150 available to deploy.
GLD ($2,928) stays as active position.
Target: 85% active = ~$85,000 deployed in active trades.
Positions needed at ~$4,500/each: ~18-19 positions (capped at 12 max open). More realistically: 8-10 positions at $4-5K each, reaching ~$40-50K deployed initially, then build toward 85% over 1-2 weeks as high-conviction setups materialize.

AMD fills: 10sh × ~$421 = $4,210 → remaining post-AMD: ~$95,940
PLTR (if re-scored ≥7): 36sh × ~$134 = $4,824 → remaining: ~$91,116
After AMD + PLTR: ~$91,116 + GLD $2,928 = $94,044 deployed/cash total; active bucket = ~$11,962 = 11.9% (still massively below 85% target).
