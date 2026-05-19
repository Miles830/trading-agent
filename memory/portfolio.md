# Opus Trader — Portfolio Memory

## Last Updated
**2026-05-19 (Tuesday) — Market Open routine 9:45 AM ET.** Alpaca API still blocked (HTTP 403, 10th+ consecutive blocked session). Pre-Market silently failed. NVDA earnings May 20 AH — within 48-hour binary-event window. Chip sell-off 3rd consecutive session: NVDA $220.35 (−6.5% from May 14), AMD $421 (−6%), AVGO $420.71, TSM $395.95. GLD $411 (−1.78%, Iran peace deal = risk premium unwinding). PLTR opened $139.65 (above $134 trigger but stale catalyst, re-scored 6.3). AMD re-scored 6.0. No orders placed. **STRATEGY SWITCH STATUS UNKNOWN** — May 18 MOO sells (TSM/NVDA/JPM/AVGO) may or may not have executed. Operator must confirm.

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

## Current Account Snapshot (2026-05-19 Market Open — ESTIMATED, API blocked)
- **Broker:** Alpaca Paper Trading (account PA3TXVEJ19LW)
- **Total Equity (estimated):** ~$100,170 (API blocked; prices from May 19 web research; strategy switch execution status unknown)
- **Cash (est.):** ~$97,221 if strategy switch executed May 18 (~97.0%); ~$85,550 if NOT executed (~85.4%)
- **Long Market Value (est.):** ~$2,877 if switch executed (GLD only); ~$14,606 if NOT executed (all 5 positions)
- **Open Positions:** 1 confirmed (GLD 7sh); 4 uncertain (TSM/NVDA/JPM/AVGO — strategy switch may have closed May 18)
- **API Status:** BLOCKED — "Host not in allowlist" (HTTP 403, Anthropic sandbox TLS proxy). Persistent failure since May 6. 10th+ consecutive blocked session.
- **URGENT — NVDA earnings May 20 AH:** Within 48-hour binary-event window. If NVDA 15sh still open, operator must decide pre-earnings close vs. hold. Recommendation: close before May 20 market open.
- **Daytrade Count:** 0

## Strategy Switch Status (as of May 19)
**UNKNOWN — Operator must confirm.** Plan was to sell TSM 7sh, NVDA 15sh, JPM 9sh, AVGO 7sh at May 18 MOO (strategy switch 2026-05-17). API-blocked cloud runner could not place these. Operator may have manually executed via Codespace. Two scenarios:

| Scenario | Cash | Positions | Total Equity (est.) |
|----------|------|-----------|---------------------|
| Switch EXECUTED May 18 | ~$97,221 | GLD 7sh only | ~$100,098 |
| Switch NOT executed | $85,550 | TSM/NVDA/JPM/AVGO/GLD | ~$100,156 |

Either way, total equity ≈ $100,100–$100,200.

## Bucket State (2026-05-19 — post-strategy-switch, status uncertain)
| Bucket | Target | Current $ (est.) | Current % | Positions |
|---|---|---|---|---|
| Active Trading | 85% ($85K) | ~$2,877–$14,606 | 2.9–14.6% | GLD confirmed; TSM/NVDA/JPM/AVGO uncertain |
| Crypto | 10% ($10K) | $0 | 0% | 0 |
| Cash Reserve | 5% ($5K floor) | $85,550–$97,221 | 85.4–97.0% | — |

**Deployment gap:** Massive cash overhang regardless of scenario. Active target 85%, current est. 3–15%. Crypto target 10%, current 0%. Total deployment gap: ~70–82% of portfolio sitting in cash above floor. New entries blocked by API and current market sell-off (AMD/PLTR re-scored below 7). Operator action needed on API allowlist.

## Open Positions (estimated, API blocked — prices from May 19 web research)
**CONFIRMED: XLE does not exist (May 17 Alpaca verification). Strategy switch status uncertain — TSM/NVDA/JPM/AVGO may have been closed on May 18 MOO. AVGO confirmed 7sh (not 11sh).**

| Symbol | Bucket | Qty | Entry | Stop | Est. Price May 19 | Est. P/L | Status |
|---|---|---|---|---|---|---|---|
| GLD | active | 7 | 418.86 | 397.92 | ~$411 | -$55 | ✓ CONFIRMED OPEN — stop assumed resting (GTC) |
| TSM | active (to close) | 7 | 401.47 | 353.76 | $395.95 | -$38 | ⚠️ UNCERTAIN — may be closed May 18 MOO |
| NVDA | active (to close) | 15 | 198.83 | 175.60 | $220.35 | +$321 | ⚠️ UNCERTAIN — **🚨 EARNINGS MAY 20 AH** |
| JPM | active (to close) | 9 | 308.30 | 272.14 | ~$300.73 | -$68 | ⚠️ UNCERTAIN — may be closed May 18 MOO |
| AVGO | active (to close) | 7 | 418.59 | 368.36 | $420.71 | +$15 | ⚠️ UNCERTAIN — may be closed May 18 MOO |

**Est. total long market value (if strategy switch NOT executed):** ~$14,606
- GLD: 7 × $411 = $2,877
- TSM: 7 × $395.95 = $2,772
- NVDA: 15 × $220.35 = $3,305
- JPM: 9 × $300.73 = $2,707
- AVGO: 7 × $420.71 = $2,945

**Net unrealized P/L (if NOT executed):** −$38 (TSM) + +$321 (NVDA) − $68 (JPM) + +$15 (AVGO) − $55 (GLD) = **+$175 total**

## Sector Exposure (estimated — May 19, strategy switch NOT executed scenario)
| Sector | Est. $ | Est. % of equity |
|---|---|---|
| Semiconductors (TSM+NVDA+AVGO) | $9,024 | 9.0% |
| Financials (JPM) | $2,707 | 2.7% |
| Precious metals (GLD) | $2,877 | 2.9% |
| Cash | $85,550 | 85.4% |

All sectors well under 25% cap. Cash massively above 5% floor (deployment emergency).

## Performance vs S&P 500 (2026-05-19 market open estimate)
- **Portfolio total equity (est.):** ~$100,170
- **Portfolio total return:** ~+0.17%
- **Since May 14 (last update):** ~−$344 (chip sell-off hurt positions; GLD fell; but mostly cash protected portfolio from worst of sell-off)
- **S&P 500 level May 15:** 7,501 (record). May 16: 7,408 (−1.24%). May 19 futures: ~7,388 (−0.27%)
- **S&P 500 return since strategy start (~May 1):** ~+2.6% (7,388 / 7,200 est.)
- **Gap vs SPX:** ~**−2.4 percentage points** — IMPROVED from −3.81 pp on May 14 because: (a) S&P pulled back from 7,511 to 7,388 (−1.6%) while portfolio was 80%+ cash and largely protected; (b) cash acted as buffer during May 16-19 chip sell-off
- **Note:** Portfolio's massive cash position — previously a performance drag during the May 1-15 rally — is now acting as partial protection during the sell-off. This is silver lining of the API blockage.

## Macro Context (as of 2026-05-19 market open)
- **Trump-Xi Summit (CONCLUDED May 16):** Ended with no major semiconductor policy breakthroughs → markets disappointed, sold off −1.24% May 16. Chips broadly lower. No definitive framework for H20/MI308/HBM4 supply chains announced.
- **Chip sell-off (3rd consecutive session):** S&P −1.24% May 16, estimated further declines May 18-19. NVDA −6.5% from May 14 peak. AMD −6%. TSM −2%. Qualcomm had been −11%, INTC −7%.
- **HSBC downgraded AMD** on 2026 semiconductor capacity worries — negative catalyst for AMD entry thesis.
- **NVDA earnings May 20 AH (TOMORROW):** Analysts expect $1.78 EPS (+120% YoY) on $79.2B revenue. Wedbush bullish (Blackwell demand + H200 China clearance). Binary risk: ±10-20% gap possible. **NO NEW NVDA ENTRIES. Operator must confirm position status.**
- **Iran peace deal (BREAKING):** Trump called off scheduled attack on Iran; "serious negotiations" underway toward peace deal. Oil price plunging. Gold falling (geopolitical risk premium unwinding). GLD at $411 (−1.78% at open) — stop $397.92 = 3.18% cushion. Watch closely.
- **High yields / no rate cuts:** PPI +1.4% in April. No rate cuts expected in 2026. Headwind for growth stocks and financials.
- **Bitcoin:** ~$79,600 range (below $82K re-entry threshold). Summit produced no crypto language. Threshold unchanged.
- **GLD thesis under pressure:** Iran peace deal = reduced geopolitical risk premium. Stop at $397.92 is 3.18% below current $411. If Iran deal confirmed, gold could fall further. Monitor stop closely — may need operator action to tighten or close.
- **Healthcare leadership:** XLV outperformed (+1.2%) while broader tech mixed. Sector rotation into defensive healthcare occurring alongside tech. Monitor for entry opportunity in specific healthcare names.

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
- **NVDA earnings risk:** NVDA reports Q1 FY27 on May 20, 2026 AH (CORRECTED — not May 21). Pre-earnings review at Daily Review May 19 (today). Stop $175.60 provides 22.4% cushion vs $220.35 current price. Analyst consensus: $1.78 EPS +120% YoY, $79.2B revenue. Wedbush bullish. Binary risk ±10-20%. Strategy switch directive: close NVDA before earnings.
- **2026-05-19 — 3rd consecutive chip sell-off:** Summit ended May 16 with no major breakthroughs. NVDA −6.5% from May 14 peak, AMD −6%, semis broadly weak. AMD re-scored 6.0 (was 7.33), PLTR re-scored 6.3 (was conditional 7.33). LESSON: post-summit sentiment reversal confirms the need to re-score at each routine using current market data, not carry prior scores forward mechanically. A week-old score in a volatile market is stale.
- **2026-05-19 — Iran peace deal breakthrough:** Trump called off Iran attack; serious negotiations underway. Oil plunging. Gold falling (GLD −1.78%). This negates the geopolitical risk premium thesis for GLD. GLD stop at $397.92 becomes critical watch point. LESSON: macro-hedge positions require constant catalyst monitoring; when the hedging catalyst resolves, exit or tighten stop aggressively.
- **2026-05-19 — Benchmark gap narrowed on sell-off:** Gap vs S&P 500 improved from −3.81 pp (May 14) to ~−2.4 pp (May 19) because portfolio's massive cash position protected it during the May 16-19 chip sell-off (S&P −1.6% from peak, portfolio nearly flat). Unintended benefit of the API blockage. Once markets stabilize and entries can be made, the gap should continue to close.

## Setup Performance Tracker (updated 2026-05-19)
| Setup type | Wins | Losses | 3-in-a-row | Status |
|---|---|---|---|---|
| ai-momentum-pullback | 0 | 0 | none | GLD, TSM open (uncertain); PLTR re-scored 6.3, deferred |
| macro-hedge | 0 | 0 | none | GLD open (−$55 unrealized, Iran deal headwind) |
| breakout-volume | 0 | 0 | none | AMD re-scored 6.0, deferred; was 5th consecutive attempt |
| earnings-reaction-fade | — | — | — | No trades |
| mean-reversion-oversold | — | — | — | No trades |
| sector-rotation | 0 | 0 | none | JPM open (uncertain); financials soft on no-rate-cut thesis |
| crypto-flush-rebound | — | — | — | No trades |
| candlestick-reversal | — | — | — | No trades |

No 3-in-a-row halt or boost rules triggered. No closed P/L to evaluate (no positions closed yet).

## Strategy Evolution Notes
- **2026-05-01 (init):** Strategy initialized per CLAUDE.md. No deviations.
- **2026-05-04:** First positions opened. Strategy unchanged; execution layer needs fixing.
- **2026-05-08:** Three-week persistent API blockage causing compounding execution gaps. Portfolio 85% cash vs. 10% floor target.
- **2026-05-12:** China chip deal changes AMD thesis from earnings-follow to breakout-volume. Rate-cut thesis broken (no cuts until 2027) but partially offset by China chip deal sector tailwind. PLTR government AI revenues insulated from rate environment. NVDA May 21 earnings approaching.
- **2026-05-14 (Week 2 Thursday):** Trump-Xi Summit Day 1 delivered massive NVDA catalyst (+4.54%). Boeing 200-jet order confirmed. PLTR near $134 re-entry. Markets at all-time records. Portfolio at +0.51% vs S&P +4.32% — entire gap attributable to API blockage keeping portfolio 80% in cash. No strategy changes warranted; execution infrastructure is the only problem. If API fixed and AMD/PLTR/MU deployed, portfolio would be ~+4-5% aligned with benchmark.
- **2026-05-19 (Week 3 Tuesday):** Strategy switch committed May 17 (operator). May 15 S&P hit 7,501 record on summit Day 1 momentum. May 16 sold off −1.24% as summit ended with disappointment. May 18-19 continued chip sell-off. API still blocked. Pre-Market still failing. Gap narrowed to −2.4 pp from −3.81 pp (cash protected portfolio during sell-off). AMD and PLTR re-scored below 7 — no entries. NVDA earnings May 20 AH = critical decision point. GLD under pressure (Iran peace deal). Strategy broadly intact; execution infrastructure remains broken. Weekly evolution note overdue (was due May 15 Daily Review which also silently failed).

## Next Routine Plan (as of May 19 Market Open)

### IMMEDIATE OPERATOR ACTIONS REQUIRED:
1. 🚨 **NVDA position confirm + pre-earnings close:** Confirm NVDA 15sh status on Alpaca. If still open, close before May 20 market open. NVDA earnings May 20 AH = binary event risk.
2. 🚨 **Strategy switch confirm:** Confirm whether TSM/NVDA/JPM/AVGO MOO sells executed on May 18. Log fills in trades.md.
3. **GLD stop watch:** GLD at $411, stop $397.92 (3.18% cushion). Iran peace deal = gold headwind. Monitor.

### Mid-Morning (11:00 AM ET — TODAY):
- Re-assess chip sector direction: if Nasdaq stabilizes and recovers >0.5%, re-score AMD and PLTR
- AMD needs 440+ with volume confirmation + 2-of-5 indicator stack before re-entering
- PLTR: if holds $137+ with market stabilizing, re-score may reach 7.0
- GLD stop audit
- Scan for fresh whole-market setups (non-chip): healthcare (XLV recovering), energy (Iran deal close = XLE bearish), defensive names

### Daily Review (4:30 PM ET — TODAY):
- **MANDATORY: NVDA pre-earnings review** (as noted since May 19 deadline)
- Confirm strategy switch execution status
- Update P/L accounting with actual position counts
- Re-evaluate AMD and PLTR final scores for tomorrow's Pre-Market
- Crypto scan: BTC status vs $82K threshold
- Watchlist for May 20 (with NVDA earnings AH — plan for post-earnings fade or follow)

### Scan themes for recovery:
- **Healthcare (XLV):** Was outperforming. Defensive names during chip sell-off. Score potential entries.
- **PLTR:** Government AI, defensive. Above $134. Re-score if market stabilizes.
- **Energy (XLE bearish?):** Iran peace deal = lower oil = XLE headwind. Potential short thesis.
- **BTC/ETH:** Near $82K threshold. Watch for re-entry.
- **Post-NVDA earnings plays:** If NVDA beats May 20 AH — follow-through long next day. If miss — fade short.

## Cash Reserve Floor
$5,000 (5% of $100K). Current cash est. $85,550–$97,221.
Available to deploy before hitting floor: ~$80,550–$92,221.
AMD fills would consume (10sh × $421 = $4,210) → ample room.
PLTR fills (35sh × $138 = $4,830) → ample room.
Both together: ~$9,040 deployed → still ~$71,510–$83,181 above floor. Massive deployment gap remains.
