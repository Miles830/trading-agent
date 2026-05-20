# Opus Trader — Portfolio Memory

## Last Updated
**2026-05-20 (Wednesday) — Market Open routine (9:45 AM ET / 13:45 UTC).** API STILL BLOCKED. Portfolio state estimated from May 17 Alpaca verification + strategy switch plan. NVDA reports Q1 FY2027 earnings tonight after close — binary event risk if NVDA was not sold on May 18. MU (Micron) 6-agent approved (score 7.5) — bracket order attempted, blocked. Operator must place manually. S&P 500 at ~7,403, recovering from 3-day losing streak.

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
- **Total Equity (estimated):** ~$100,084 (estimated — API blocked; assumes May 18 MOO sells of TSM/NVDA/JPM/AVGO executed)
- **Cash (estimated):** ~$97,200 (97.1%) — after assumed May 18 LT liquidations; or ~$85,550 if sells did NOT execute
- **Long Market Value (estimated):** ~$2,884 (GLD 7sh × $412.17) if sells executed; ~$12,500 if not
- **Open Positions:** 1 confirmed (GLD) — or 5 including LT names if May 18 MOO sells failed
- **Pending Orders / Actions:**
  - **MU BRACKET — OPERATOR MUST PLACE MANUALLY:** 6sh limit at $725, stop GTC $688.75, take-profit GTC $833.75. Score 7.5 approved. API blocked — could not submit.
  - **NVDA BINARY EVENT RISK:** If NVDA not sold May 18 — 15sh exposed to earnings tonight. Operator must verify and consider closing before 3:50 PM ET.
  - **STRATEGY SWITCH VERIFICATION:** Were May 18 MOO sells (TSM 7, NVDA 15, JPM 9, AVGO 7) executed? Operator must confirm via Alpaca paper account.
- **API Status:** BLOCKED — "Host not in allowlist" (HTTP 403, Anthropic sandbox TLS proxy). Persistent failure. 9th+ consecutive blocked session.
- **Daytrade Count:** 0

## Bucket State (estimated — API blocked; assumes May 18 MOO sells executed)
| Bucket | Target | Current $ (est.) | Current % | Positions |
|---|---|---|---|---|
| Active Trading | 85% ($85K) | ~$2,884 (GLD only) | 2.9% | 1 (GLD) |
| Crypto | 10% ($10K) | $0 | 0% | 0 |
| Cash Reserve | 5% ($5K floor) | ~$97,200 | 97.1% | — |

**Deployment gap (CRITICAL):** Cash ~$92,200 above the 5% floor. Target is 85% active + 10% crypto = 95% deployed. Only 2.9% deployed vs 95% target = 92 pp gap. MU bracket order approved (score 7.5) but API blocked — operator must execute manually. After MU: still need ~$87,850 more deployed.

**If May 18 MOO sells DID NOT execute:**
| Bucket | Current $ (est.) | Current % |
|---|---|---|
| Active | ~$12,500 (GLD+TSM+NVDA+JPM+AVGO) | 12.7% |
| Crypto | $0 | 0% |
| Cash | ~$85,550 | 87.3% |

## Open Positions (estimated — API blocked; prices from May 20 web research)

**Scenario A: May 18 MOO sells executed (ASSUMED LIKELY)**
| Symbol | Bucket | Qty | Entry | Stop | Target | Est. Price May 20 | Est. P/L | Sector |
|---|---|---|---|---|---|---|---|---|
| GLD | active | 7 | $418.86 | $397.92 | TBD | $412.17 | -$46.83 | Precious metals |

**Scenario B: May 18 MOO sells NOT executed (RISK SCENARIO — verify urgently)**
| Symbol | Bucket | Qty | Entry | Stop | Est. Price May 20 | Est. P/L | Sector |
|---|---|---|---|---|---|---|---|
| TSM | (was LT) | 7 | $401.47 | $353.76 | ~$395.95 | -$38.64 | Semiconductors |
| GLD | active | 7 | $418.86 | $397.92 | $412.17 | -$46.83 | Precious metals |
| NVDA | (was LT) | 15 | $198.83 | $175.60 | ~$220.61 | +$326.70 | Semiconductors EARNINGS TONIGHT |
| JPM | (was LT) | 9 | $308.30 | $272.14 | ~$292.00 est. | -$146.70 | Financials |
| AVGO | (was LT) | 7 | $418.48 | $368.36 | ~$420.71 | +$15.61 | Semiconductors |

NVDA = EARNINGS TONIGHT (May 20 after close). If still held, operator must decide: hold through binary event or close before 3:50 PM ET.

**Scenario A long market value:** $2,884 (GLD only)
**Scenario B long market value (all 5):** ~$12,500
- AVGO: 11 × $422.50 = $4,648

**Net unrealized P/L: +$513.51** (NVDA +$552 is the primary driver; JPM and XLE dragging)

## Sector Exposure (estimated — May 20 Market Open, Scenario A)
| Sector | Est. $ | Est. % of equity |
|---|---|---|
| Precious metals (GLD) | $2,884 | 2.9% |
| Cash | ~$97,200 | 97.1% |

After pending MU entry (operator-placed): Semiconductors +$4,350 = 4.35%; Cash drops to ~$92,850. All sectors well under 25% cap.

## Performance vs S&P 500 (as of May 20 open)
- **Portfolio total equity (est., Scenario A):** ~$100,084
- **Portfolio total return:** **+0.08%** ($100,084 / $100,000 initial)
- **S&P 500 level May 20:** ~7,403 (+0.34% today, recovering from Tuesday close 7,353.61)
- **S&P 500 return since strategy start (~May 1 base 7,200):** **+2.82%** (7,403 / 7,200 - 1)
- **Gap vs SPX:** **-2.74 pp** (improved from -3.81 pp on May 14 because SPX fell from 7,511 record back toward 7,403 while portfolio was flat)
- **Root cause of gap unchanged:** 97% cash from API blockage. Every trading day without deployment costs ~0.3-0.4 pp vs benchmark on average-trend days.

## Macro Context (as of May 20, 9:45 AM ET)
- **NVDA Earnings TONIGHT (May 20 after close):** Q1 FY2027 earnings. Revenue guidance $78B ± 2%. Analyst consensus EPS $8.76 (+120% YoY). Market-implied move: ±5.07%. If NVDA beats big → AI/semiconductor sector rallies broadly; if misses → sector risk-off. Do NOT enter NVDA (48h binary event rule). Post-earnings entries allowed (fade or follow-through) from May 21 market open.
- **30Y Treasury yield:** Briefly hit 5.19% (19-year high, May 19) → caused 3-day market losing streak. Bond market stress is the primary macro risk. S&P fell from 7,511 (May 14 record) to 7,353 (May 19 close) = -2.1%.
- **Market today (May 20):** S&P +0.34% at 7,403, recovering. Oil prices eased. Nasdaq +0.55%. Risk-on tone today.
- **Trump-Xi Summit outcome (May 15):** Ended with "no major deals" on chips → modest negative catalyst that caused May 15 -1.1% selloff. Chip restrictions partially eased but no framework finalized. China AI chip story remains constructive but less explosive than pre-summit expectations.
- **Semiconductors (May 20):** Mixed. MU +5% (HBM catalyst), INTC +5% (recovery). AMD -0.73%, TSM -2.08%, AVGO -1.05% (NVDA earnings uncertainty).
- **Bitcoin:** No update available. Crypto re-entry threshold remains $82K+.
- **GLD:** $412.17 today — below entry $418.86. Stop $397.92 holds (3.4% cushion). Elevated inflation (PPI +1.4%) and Middle East tensions supporting gold bid but risk-on today is mild headwind.

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
- **2026-05-15 — S&P 500 -1.1% (Trump-Xi no major chip deal).** Summit ended without semiconductor export-control framework. Chip names sold off broadly. SPX fell from 7,511 record to ~7,430. API remained blocked — no routines fired.
- **2026-05-17 — Strategy switch to 100% trading (85/10/5).** Long-term bucket retired. Actual Alpaca verified: TSM 7, GLD 7, NVDA 15, JPM 9, AVGO 7 (not 11), XLE absent. Cash $85,550. MOO sells of TSM/NVDA/JPM/AVGO queued for May 18 open.
- **2026-05-18-19 — No routine heartbeats. S&P sank Monday (10Y yield spike to highest in a year). 30Y briefly 5.19% (19-year high) May 19.** S&P May 19 close 7,353.61 — 3rd consecutive losing session. Market fragility on bond yield stress.
- **2026-05-20 — NVDA REPORTS TONIGHT. MU approved score 7.5, API blocked.** MU bracket order attempted, blocked. Operator must place manually (6sh limit $725, stop GTC $688.75, target GTC $833.75). NVDA binary event tonight — operator must verify whether NVDA still held and evaluate closing before 3:50 PM ET.

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

### TODAY (May 20) — URGENT OPERATOR ACTIONS BEFORE MARKET CLOSE
1. **NVDA VERIFICATION (BEFORE 3:50 PM ET):** Log into Alpaca paper account and check positions. If NVDA 15sh is still held, decide: (a) close via MOC order (market on close before 3:50 PM ET cutoff) to avoid earnings binary event, or (b) consciously hold through earnings (±5.07% implied move). Strategy switch required selling NVDA — holding through earnings was not the plan.
2. **MU BRACKET (ANY TIME TODAY):** 6 shares, limit buy at $725, stop GTC at $688.75, take-profit GTC at $833.75. Order class bracket, time_in_force gtc. Score 7.5 — DEPLOYMENT BIAS violation if not executed.
3. **CONFIRM MAY 18 MOO STATUS:** Were TSM/NVDA/JPM/AVGO MOO sells placed on May 18? Update trades.md with fill prices if yes.

### Mid-Morning (11:00 AM ET, 15:00 UTC)
1. Stop-loss audit — verify all open stops resting at Alpaca
2. MU position monitoring (if operator placed bracket): confirm fill
3. NVDA earnings prep — review final decision
4. Scan for additional candidates (INTC scored ~6.5 today; AMD at $420.99 — re-score vs prior 7.33)

### Market Close (3:30 PM ET, 19:30 UTC)
1. NVDA MOC close if operator decision was to exit before earnings
2. Monitor MU intraday action
3. Prepare for NVDA post-earnings reaction playbook (tomorrow)

### Post-NVDA Earnings (May 21 Pre-Market, 8:00 AM ET)
1. Read NVDA Q1 FY2027 results
2. If NVDA beats massively: semiconductor sector rally → scan MU, AMD, TSM, AVGO for follow-through entries
3. If NVDA misses: sector risk-off → monitor MU stop ($688.75), evaluate GLD macro hedge position
4. NVDA post-earnings entry (fade or follow-through) ALLOWED after print is out

## Pending Watchlist (≥7 score names — OPERATOR COMMITMENT)
| Symbol | Setup | Score | Entry | Stop | Target | Notes |
|--------|-------|-------|-------|------|--------|-------|
| **MU** | ai-momentum-pullback | **7.50** | limit $725 | $688.75 | $833.75 | APPROVED today — operator must place bracket |
| AMD | breakout-volume | **7.33***  | ~$421 | $400 | $485 | *Re-score needed at current $420.99 — prior score was at $448; re-entry may still qualify |

*AMD re-score pending: was 7.33 at $448, now $420.99 (-6.3% lower). This is closer to the $413 original breakout level. Technical may have improved (RSI normalized further). Full re-score at next routine.

## Cash Reserve Floor
$5,000 (5% of ~$100K equity). Current estimated cash ~$97,200 — $92,200 deployable above floor.
After MU: $92,850 remaining (still 92.9% vs 5% floor — massively above minimum).
Full deployment target: 85% active ($85K) + 10% crypto ($10K) = 95% deployed ($95K).
Currently deployed: ~$2,884 (GLD) = 2.9% — need $92,116 more deployed.
At $4,350/position (MU-sized), need ~21 more positions — but cap is 12 total, so need larger sizes.
Typical position: 5% = $5,000. 19 positions × $5,000 = $95K → but 12 position cap limits to $60K max at $5K each. Agent should pursue larger position counts up to the 12-cap while targeting $5K each.
