# Opus Trader — Portfolio Memory

## Last Updated
**2026-05-19 (Tuesday) — Daily Review (4:30 PM ET / 20:35 UTC).** API still blocked. Strategy switch execution UNCONFIRMED (no routine ran May 15 or May 18). NVDA earnings TOMORROW May 20 AH. Three consecutive market losing sessions from May 14 ATH. 30Y Treasury at 5.198% — 2007 high (Moody's US credit downgrade May 16). Cumulative benchmark gap: -2.42 pp (improved from -3.81 pp as market pulled back). AMD skip (6.83), PLTR skip (6.50). Primary commitment: post-NVDA-earnings chip sector entries May 21.

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
2026-05-19 (Tuesday) — Daily Review. Prior: 2026-05-17 (Sunday strategy switch). Prior-prior: 2026-05-14 (Thursday). See trades.md for full details.

## Current Account Snapshot (estimated — API blocked)
- **Broker:** Alpaca Paper Trading (account PA3TXVEJ19LW)
- **Total Equity (estimated):** ~$100,080 — Scenario B (positions open); ~$100,060 — Scenario A (strategy switch executed May 18)
- **Cash (Scenario B):** ~$85,550 (85.5%) — well above 5% floor; massive deployment gap
- **Cash (Scenario A):** ~$97,182 (97.1%) — GLD only remaining
- **Long Market Value (Scenario B):** ~$14,530 (5 positions: TSM, NVDA, JPM, AVGO, GLD)
- **Open Positions:** 5 (Scenario B) or 1 (Scenario A: GLD only)
- **Strategy Switch Status:** UNCONFIRMED — May 18 MOO closures (TSM, NVDA, JPM, AVGO) not verified. No routine ran May 15, 18, or 19 intraday.
- **API Status:** BLOCKED — "Host not in allowlist" (HTTP 403). 14th consecutive blocked session since May 6.
- **Daytrade Count:** 0

## Bucket State (Scenario B — as of May 19 close estimates)
| Bucket | Target | Current $ (est.) | Current % | Positions |
|---|---|---|---|---|
| Active Trading | 85% ($85K) | ~$14,530 (all pending closure) | 14.5% | 5 (TSM, NVDA, JPM, AVGO, GLD) |
| Crypto | 10% ($10K) | $0 | 0% | 0 |
| Cash Reserve | 5% floor ($5K) | ~$85,550 | 85.5% | — |

**Deployment gap (Scenario B):** Active target 85% ($85K), actual 14.5% ($14.5K) — gap $70.5K. All 5 open positions are legacy LT bucket positions pending strategy switch closure.

## Open Positions (estimated, API blocked — prices from May 19 web research)
| Symbol | Status | Qty | Entry | Active Stop (-5%) | May 19 Price | Est. P/L | Action |
|---|---|---|---|---|---|---|---|
| TSM | Pending closure | 7 | $401.47 | $376.20 | ~$396.00 | -$37.87 | CLOSE via MOO May 20 |
| NVDA | CLOSE TODAY | 15 | $198.83 | $209.72 | ~$220.76 | +$329.55 | CLOSE BEFORE EARNINGS (May 20 AH) |
| JPM | Pending closure | 9 | $308.30 | $283.44 | ~$298.36 | -$89.46 | CLOSE via MOO May 20 |
| AVGO | Pending closure | 7 | $418.48 | $390.43 | ~$410.98 | -$52.50 | CLOSE via MOO May 20 |
| GLD | HOLD | 7 | $418.86 | $397.92 | ~$411.21 | -$53.55 | Hold; Moody's downgrade = long-term gold bullish |

**Note:** TSM/NVDA/JPM/AVGO old LT stops ($353.76, $175.60, $272.14, $368.36) still resting at Alpaca from May 4-6 GTC bracket orders — these provide floor protection until MOO closures execute.

**Net unrealized P/L (Scenario B): +$96.17** (NVDA +$329 offsets TSM -$38, JPM -$89, AVGO -$53, GLD -$54)

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
- **S&P 500 return since strategy start (~May 1 → May 19):** ~+2.50% (7,200 → ~7,380 est.)
- **Portfolio return (May 1 → May 19):** ~+0.08% ($100,000 → ~$100,080 est.)
- **Cumulative gap vs SPX:** **-2.42 percentage points** — IMPROVED from -3.81 pp (May 14) as S&P pulled back -1.75% from ATH while cash position protected portfolio. Gap improvement is passive, not earned through active trading.
- **Today (May 19) relative performance:** +0.32 pp (portfolio ~-0.18% vs SPY ~-0.50%). Cash provides protection in down markets.
- **NOTE:** Gap was -3.81 pp on May 14 (ATH), now -2.42 pp. The ~1.4 pp improvement since May 14 reflects market weakness, not portfolio performance. Still underperforming over the full period.

## Macro Context (as of 2026-05-19 market close)
- **Moody's US credit downgrade (May 16):** Aaa → Aa1. Cited persistent fiscal deficit + compounding interest costs. 30Y Treasury spiked to 5.198% (highest since 2007). Fed rate cuts deferred to 2027. Structural USD credibility risk = BULLISH for gold long-term; near-term rising real yields = headwind for both gold and growth.
- **S&P 500 three-day losing streak:** ATH 7,511 on May 14 → ~7,380 on May 19 (-1.75%). Trump-Xi summit ended without major semiconductor breakthroughs (May 15 selloff -1.24%). Nasdaq -0.51% on May 18. Tech under pressure.
- **NVDA Earnings:** MAY 20 (TOMORROW) after close. Q1 FY2027. EPS est $1.78 (+120% YoY), Rev $79.2B (+79.5% YoY). Beat probability 90%. This is the single largest market catalyst of the week. The AI capex thesis (hyperscaler combined 2026 capex >$700B) supports the beat narrative.
- **Trump-Xi Summit outcome (May 15):** Ended without major semiconductor policy framework. No H20/MI308 framework announced. Market sold the news -1.24%. China chip deal remains the partial status quo (H200 cleared for select firms), but no comprehensive easing. AMD/NVDA/AVGO thesis partially intact.
- **Oil / Iran conflict:** ~$108/bbl Brent. Iran deal not reached. Oil elevated = CPI/PPI headwind = reinforces no-cut thesis.
- **Bitcoin:** $77,119. DOWN -4.83% on the week. Below $82K re-entry threshold. Do NOT lower threshold. Risk-off environment with rising yields.
- **Gold:** $411.21 (GLD), down -1.72% today. Rising real yields are the near-term headwind. But Moody's downgrade = long-term USD credibility risk = gold bull thesis strengthens. JPMorgan $6,000-$6,300/oz target intact. HOLD existing 7sh GLD.

## Active Themes (updated May 19)
1. **AI/Chip sector NVDA earnings catalyst** — NVDA prints tomorrow. Post-earnings re-entry plan for NVDA, AMD, TSM, AVGO. ALL chip sector entries conditioned on NVDA beat (90% probability). Anticipated May 21 deployment window.
2. **Rising real yields macro regime** — 30Y at 5.198% is 2007-level stress. This compresses multiples for growth names (tech, crypto), benefits energy. Re-score all high-multiple names with 1 pt macro penalty.
3. **Geopolitical inflation hedge** — GLD HOLD (Moody's + Iran oil = dual tailwind for gold even as yields rise short-term). NVDA earnings may provide temporary relief if beat drives risk-on rotation.
4. **Crypto: no entry** — BTC $77K and declining; $82K threshold unchanged; do not lower.
5. **Energy sector** — Oil at $108 + no rate cuts = XOM/CVX/XLE candidate for active entry. Full 6-agent score needed; pre-screen May 20.
6. **Government AI (PLTR)** — At $135.58 (above $134 trigger) but scored 6.50 today. Conditional: re-enter post-NVDA if sentiment improves. Score could hit 7.0 in favorable post-earnings environment.

## Pending Actions — OPERATOR MUST EXECUTE IMMEDIATELY

**PRIORITY 1 (URGENT — today before 4 PM ET, or after-hours limit):**
Close NVDA 15sh if still open: earnings tomorrow (May 20 AH). Place market sell or after-hours limit at current bid (~$220). Protect +$329 unrealized gain. Strategy switch mandates closure anyway.

**PRIORITY 2 (URGENT — if NVDA already closed, do this at market open May 20):**
Verify strategy switch execution status. If TSM, JPM, AVGO still open: submit MOO sells May 20 before 9:25 AM ET. These are overdue from May 18 mandate.

**PRIORITY 3 (Pre-Market May 20, before 9:25 AM ET):**
AMD full 6-agent re-score at pre-market. If NVDA pre-market reaction is positive (post-earnings beat confirmed), AMD MOO 10sh is the primary entry with conditional score ~7.67.

**PRIORITY 4 (ONGOING — operator action needed):**
- Alpaca API allowlist fix: paper-api.alpaca.markets and data.alpaca.markets must be added to Anthropic sandbox egress allowlist
- Intraday scheduler fix: Pre-Market through Market-Close sessions not firing

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
- **2026-05-15 — Trump-Xi Summit Day 2 disappointment:** Summit ended without comprehensive semiconductor export control framework. No H20/MI308 supply chain easing announced. Market sold -1.24% to 7,408.50. Chip names pulled back sharply. All May 15 routines silently failed (empty heartbeat log). AMD, PLTR, MU entries missed again.
- **2026-05-16 (weekend) — Moody's US credit downgrade:** Aaa → Aa1. First Moody's US downgrade ever. 30Y Treasury hit 5.01% briefly. Major regime shift: fiscal credibility risk now officially in play. Gold long-term thesis strengthened; risk assets headwind.
- **2026-05-18 — Moody's Monday:** S&P -0.07% (recovered from -2%+ early losses). Tech -1.1%. 10Y hit 52-week high. Strategy switch MOO orders not executed programmatically (no routine ran). Operator action unconfirmed.
- **2026-05-19 — NVDA pre-earnings review:** NVDA earnings TOMORROW May 20 AH (not May 21 as estimated). NVDA at $220.76 (ATH was $235.74 on May 14; -6.3% mean reversion). 30Y at 5.198% (2007 high). Three consecutive down sessions from ATH. AMD score 6.83 (skip). PLTR score 6.50 (skip). Cumulative gap improved to -2.42 pp as market pulled back. CRITICAL: close NVDA today if still open.
- **2026-05-19 — Earnings date correction:** NVDA Q1 FY2027 earnings are May 20 after close, NOT May 21. The 48h pre-earnings exclusion means no new NVDA entries should have been made after May 18 open. Lesson: verify exact earnings dates from multiple sources at each review.
- **2026-05-19 — AMD de-scored below threshold:** AMD at $421 (down from $448 May 13 re-score) scores 6.83 with Moody's/rising-yield macro headwind. This is a legitimate score (not a deployment bias violation). Conditional score ~7.67 post-NVDA-beat expected.

## Setup Performance Tracker (updated 2026-05-19)
| Setup type | Wins | Losses | 3-in-a-row | Status |
|---|---|---|---|---|
| ai-momentum-pullback | 0 | 0 | none | Active (TSM, NVDA, AVGO — pending strategy switch closure) |
| macro-hedge | 0 | 0 | none | Active (GLD open -1.8% vs entry; Moody's thesis intact) |
| earnings-reaction-follow | — | — | — | Pending (NVDA post-earnings re-entry May 21) |
| breakout-volume | 0 | 0 | none | AMD still not entered (10th+ blocked session) |
| earnings-reaction-fade | — | — | — | No trades |
| mean-reversion-oversold | — | — | — | No trades |
| sector-rotation | 0 | 0 | none | Active (JPM open -3.2% vs entry; pending closure) |
| crypto-flush-rebound | — | — | — | BTC $77K, no entry |
| candlestick-reversal | — | — | — | No trades |

No 3-in-a-row halt or boost rules triggered. No confirmed closed P&L.

## Strategy Evolution Notes
- **2026-05-01 (init):** Strategy initialized per CLAUDE.md. No deviations.
- **2026-05-04:** First positions opened. Strategy unchanged; execution layer needs fixing.
- **2026-05-08:** Three-week persistent API blockage causing compounding execution gaps. Portfolio 85% cash vs. 10% floor target.
- **2026-05-12:** China chip deal changes AMD thesis from earnings-follow to breakout-volume. Rate-cut thesis broken (no cuts until 2027) but partially offset by China chip deal sector tailwind. PLTR government AI revenues insulated from rate environment. NVDA May 21 earnings approaching.
- **2026-05-14 (Week 2 Thursday):** Trump-Xi Summit Day 1 delivered massive NVDA catalyst (+4.54%). Markets at all-time records. Portfolio +0.51% vs S&P +4.32% — entire gap attributable to API blockage. No strategy changes.
- **2026-05-15 to 2026-05-19 (Week 3 Tuesday):** Summit Day 2 disappointment + Moody's downgrade + Iran oil spike = macro regime shift. 30Y yields at 2007 highs. Three-day losing streak from ATH. Portfolio benefited passively from cash position (gap improved from -3.81 pp to -2.42 pp). No strategy changes — execution infrastructure remains the only problem. NVDA earnings May 20 is the next major pivot point. Post-print deployment (AMD, NVDA re-entry, TSM) is the first meaningful deployment opportunity.

## Next Routine Plan
- **Pre-Market May 20 (8:00 AM ET):**
  1. **PRIORITY 0 — Stop audit.** Verify all resting stops at Alpaca. If NVDA still open: CLOSE IMMEDIATELY via pre-market limit sell at bid (~$220). If TSM/JPM/AVGO still open: submit MOO sells before 9:25 AM ET.
  2. **Monitor pre-market reaction to Moody's/yield news.** Check for any fresh catalysts.
  3. **AMD pre-screen.** Re-score at opening price once NVDA pre-earnings sentiment is clear. If NVDA pre-market is up on bullish sentiment, AMD score may already hit 7+.
  4. **XOM / energy sector pre-screen.** Oil at $108; XOM/CVX full 6-agent score.
  5. **MU pre-screen.** AI memory supercycle. Last estimated score 7.33.
  6. **DO NOT enter new chip names on May 20 until NVDA earnings print.** The 4:00 PM ET print will reshape all chip sector scores.
- **Market Open (9:45 AM ET):** Post-MOO stops for any new entries. Confirm strategy switch fills.
- **Daily Review May 20 (4:30 PM ET):**
  - NVDA Q1 FY2027 print will be out (4 PM ET call at 5 PM ET). Score the reaction.
  - If beat: AMD, NVDA re-entry, TSM are all likely ≥7 for May 21 MOO
  - If miss: reassess all chip sector positions

## Cash Reserve Floor
**New:** $5,000 (5% floor, per strategy switch May 17). Current cash ~$85,550 — $80,550 available to deploy.
Post strategy-switch closures available cash: ~$97,182 (Scenario A) or ~$85,550 (Scenario B)
Target deployment: 85% active ($85K) + 10% crypto ($10K) = $95K deployed, $5K cash floor
Current deployment gap: ~$80K available
+ MU 6sh × $788 = $4,728 → remaining: $66,944
After all three: $66,944 still in cash = 66% — still massively above 10% floor.
NVDA pre-earnings hedge consideration: Could use up to 1% of portfolio = ~$1,000 in protective puts.
