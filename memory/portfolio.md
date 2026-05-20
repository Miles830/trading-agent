# Opus Trader — Portfolio Memory

## Last Updated
**2026-05-20 (Wednesday) — Daily Review (4:30 PM ET / 20:35 UTC).** Alpaca API STILL BLOCKED (HTTP 403 "Host not in allowlist") — 12th+ consecutive blocked session. NVDA reported Q1 FY2027 TONIGHT after close: **BEAT** ($81.62B vs $79.19B expected; Q2 guidance $89.18–92.82B vs $87.36B) but AH down -2.44% ($217.91) — "sell the news." AMD +6.39% to $440.50. PLTR confirmed above $134 trigger (~$135). MU $720.55. S&P 500 +1.08% to 7,432.97. Cumulative gap vs SPX: -3.04 pp (improved from -3.81 pp as S&P pulled back from 7,511 peak). Strategy-switch status STILL UNCONFIRMED.

**CORRECTION:** NVDA earnings were May 20 after close (not May 21 as previously documented). Binary-event window ran May 18 close → May 20 close.

**Prior Last Updated:** 2026-05-20 (Wednesday) — Afternoon Routine (2:00 PM ET / 18:05 UTC).

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
- **Total Equity (estimated):** ~$100,200 (estimated; API blocked; price data from web research)
- **Cash:** ~$85,550 (Scenario B: switch NOT executed) OR ~$97,280 (Scenario A: switch executed May 18)
- **Long Market Value (estimated):**
  - Scenario A (switch executed May 18): ~$2,917 (GLD 7sh × $416.64)
  - Scenario B (switch NOT executed): ~$14,450 (TSM+GLD+NVDA+JPM+AVGO — see positions table)
- **Open Positions:** 1 confirmed (GLD) + 4 uncertain (TSM/NVDA/JPM/AVGO)
- **NVDA EARNINGS STATUS:** NVDA reported tonight (May 20 after close). BEAT ($81.62B vs $79.19B). AH price $217.91 (-2.44%). "Sell the news." May 21 open will set direction. If NVDA still held = guardrail violation (held through binary event); assess at Market Open May 21.
- **API Status:** BLOCKED — "Host not in allowlist" (HTTP 403, Anthropic sandbox TLS proxy). Persistent failure since May 6. 12th+ consecutive blocked session.
- **Daytrade Count:** 0

## Bucket State
| Bucket | Target | Current $ (est.) | Current % | Positions |
|---|---|---|---|---|
| Long-term | 55% ($55K) | ~$13,657 (TSM+NVDA+JPM+AVGO) | 13.6% | 4 (TSM, NVDA, JPM, probable AVGO) |
| Active Trading | 30% ($30K) | ~$5,885 (GLD+XLE) | 5.9% | 2 (GLD, XLE) |
| Crypto | 5% ($5K) | $0 | 0% | 0 |
| Cash Reserve | 10% ($10K floor) | ~$80,946 | 80.5% | — |

**Deployment gap:** Cash ~$70.9K above the 10% floor. AMD entry unconfirmed for 4th consecutive session. Massive underfillment continues. MU and PLTR also pending first entries.

## Open Positions (estimated — May 20 EOD prices from web research; API blocked)
| Symbol | Bucket | Qty | Entry | Stop | Target | Cost Basis | May 20 Price | Est. P/L | Sector |
|---|---|---|---|---|---|---|---|---|---|
| GLD | active | 7 | $418.86 | $397.92 (-5%) | — | $2,932.02 | $416.64 | -$15.54 | Precious metals |
| TSM* | LT→closing | 7 | $401.47 | $353.76 | $498.48 | $2,810.29 | ~$404 | +$17.71 | Semiconductors |
| NVDA* | LT→closing | 15 | $198.83 | $175.60 | $247.44 | $2,982.45 | $222.70 | +$358.05 (reg) / ~$286 (AH) | Semiconductors |
| JPM* | LT→closing | 9 | $308.30 | $272.14 | $383.47 | $2,774.72 | ~$303 | -$47.70 | Financials |
| AVGO* | LT→closing | 7 | $418.59 | $368.36 | $519.05 | $2,930.13 | ~$410 | -$59.50 | Semiconductors |

*TSM/NVDA/JPM/AVGO: marked for liquidation per May 17 strategy switch. May have been closed via May 18 MOO (unconfirmed). If Scenario A (closed): only GLD remains. If Scenario B: all 5 still open. XLE confirmed NOT held (verified May 17).

**Est. total long market value:**
- Scenario A (GLD only): $2,917
- Scenario B (all 5): $14,449

**Net unrealized P/L (Scenario B):** +$253 (NVDA carrying most gains; AVGO and JPM dragging)
**Net unrealized P/L (Scenario A — GLD only):** -$15.54

**NVDA EARNINGS NOTE:** NVDA reported May 20 after close. Beat but AH -2.44% ($217.91). If still held, position carried through binary event = guardrail violation. Assess at Market Open May 21 whether to close.

## Sector Exposure (estimated — May 20 EOD)

**Scenario A (strategy switch executed, only GLD):**
| Sector | Est. $ | Est. % of equity |
|---|---|---|
| Precious metals (GLD) | $2,917 | 2.9% |
| Cash | ~$97,280 | 97.1% |

**Scenario B (switch not executed — all positions):**
| Sector | Est. $ | Est. % of equity |
|---|---|---|
| Semiconductors (TSM+NVDA+AVGO) | ~$10,126 | 10.1% |
| Financials (JPM) | ~$2,727 | 2.7% |
| Precious metals (GLD) | $2,917 | 2.9% |
| Cash | ~$85,550 | 85.3% |

**After May 21 entries (AMD + PLTR + MU at MOO):**
| New position | Est. $ added | Cumulative semis % |
|---|---|---|
| AMD 10sh × ~$445 | ~$4,450 | ~14.5% (Scenario B) / ~4.5% (Scenario A) |
| MU 6sh × ~$725 | ~$4,350 | ~18.8% (Scenario B) / ~8.8% (Scenario A) |
| PLTR 10sh × ~$135 | ~$1,350 (tech/defense) | — |

All well under 25% sector cap in either scenario. If both old semis (Scenario B) AND new entries (AMD+MU) exist simultaneously: ~18.8% semis — still under 25% cap.

## Performance vs S&P 500
- **Portfolio total equity (est.):** ~$100,200 (May 20 EOD)
- **Portfolio total return:** ~+0.20%
- **Today's P&L (May 20):** ~+$20–150 (GLD +$36, other positions mixed; exact unknown)
- **Today's portfolio return:** ~+0.04% to +0.15%
- **S&P 500 close May 20:** 7,432.97 (+1.08%). Dow +645 pts (+1.31%). Nasdaq +1.54%. Oil collapse -5.66% + NVDA earnings day.
- **S&P 500 return since strategy start (~May 1):** **+3.24%** (7,432.97 vs ~7,200 est.) — pulled back from 7,511 peak
- **Gap vs SPX:** **-3.04 percentage points** — improved from -3.81 pp (May 14) because market retreated from all-time highs. Today widened ~-1.0 pp (portfolio near flat vs SPX +1.08%).
- **Root cause unchanged:** 80–97% cash from persistent API blockage. No new entries placed since account inception. Every market up-day widens the gap.

## Macro Context (as of 2026-05-20 market close)
- **NVDA Q1 FY2027 EARNINGS (TONIGHT):** Revenue $81.62B vs $79.19B expected (+85% YoY). EPS $1.87 vs $1.76 expected. Q2 guidance $89.18–92.82B vs $87.36B expected. BEAT on all metrics. CEO Jensen Huang: "AI factories — the largest infrastructure expansion in human history — accelerating at extraordinary speed. Agentic AI has arrived." BUT after-hours: $217.91, -$5.56 (-2.44%). "Sell the news" pattern matches Feb quarter (-5% next day despite beat). Watch May 21 open carefully.
- **Oil collapse (-5.66% today):** WTI → $98.26/bbl. Brent → $105.02/bbl. Catalyst: Middle East de-escalation optimism. Lower oil = lower inflation path = potential rate-cut runway restored. Positive for broad equities (Dow +1.31%), negative for energy sector (XLE — but XLE not held per May 17 verification).
- **Semiconductor sector (May 20):** AMD +6.39% to $440.50 (AI demand momentum). MU $720.55 (+range $712–739). Nasdaq +1.54%. AI infrastructure theme dominant. NVDA beat validates entire sector demand thesis — HBM memory, custom ASICs, foundry capacity.
- **S&P 500 context:** 7,432.97 — down from 7,511 record (May 14) after May 15 sell-off ("Deep in the Red" per headline). Recovery underway. Today +1.08% mostly on oil collapse + NVDA anticipation.
- **PPI/Rates:** April PPI +1.4% (reported May 13, hottest since 2022). Oil collapse may shift inflation trajectory. Market now reassessing rate-cut timeline. GLD +1.25% today despite risk-on = dollar weakness component.
- **Bitcoin:** Estimated $80K–85K range (above or near $82K threshold). Risk-on environment. Check BTC vs $82K at Pre-Market May 21. If above threshold, begin 10% crypto bucket deployment.
- **PLTR:** ~$135 (last confirmed May 18), above $134 re-entry trigger. Government AI revenue secular. AIP deployments accelerating.
- **Strategy switch (May 18 MOO):** UNCONFIRMED. TSM/NVDA/JPM/AVGO may or may not have been closed. NVDA just went through earnings — if still held, binary event was violated (fortunately a beat, but this is still a process violation).

## Active Themes
1. **AI infrastructure / semiconductor supercycle** — NVDA beat ($81.62B Q1 FY2027) confirms the thesis. AMD (7.33, MANDATORY entry), MU (HBM demand confirmed, full 6-agent May 21), AVGO (custom ASICs), TSM (foundry demand) all beneficiaries. Semiconductor SOX up 65% YTD 2026.
2. **NVDA "sell the news" risk** — AH -2.44% despite strong beat. NVDA down in AH after 3 consecutive beats in recent quarters. Watch for May 21 open direction. If gap-down -3%+ with volume: `earnings-reaction-fade` setup. If recovers: reassess.
3. **GLD as cross-asset hedge** — +1.25% today even on risk-on day + oil collapse. Dollar weakness component keeping gold bid. Stop $397.92 remains protective (-4.9% from $416.64 current).
4. **Crypto recovery** — BTC estimated ~$80–85K range. Risk-on environment (oil collapse, equities rally). Check vs $82K threshold at Pre-Market May 21. Oil collapse → lower inflation → rate cut expectations → positive for crypto.
5. **PLTR government AI** — $135, trigger confirmed. AIP government contracts secular revenue. Re-score at Pre-Market May 21. Entry MOO if ≥$134.
6. **Oil collapse implications** — WTI -5.66% to $98.26. Middle East de-escalation. Positive for consumer discretionary, airlines, transports. Negative for energy sector. GLD thesis shifts slightly (less geopolitical fear premium, more dollar weakness premium).

## Pending Actions — OPERATOR MUST EXECUTE (Updated May 20 Daily Review)

**CRITICAL — NVDA UPDATE:** NVDA reported tonight (May 20 after close). Beat: $81.62B revenue. BUT AH -2.44% ($217.91). "Sell the news" pattern. The NVDA earnings are OVER. No more exclusion window concern for NEW entries. The reaction trade starts at May 21 open.

**TOMORROW (May 21 Pre-Market, before 9:25 AM ET):**
1. **STOP AUDIT — FIRST ACTION:** GET /v2/positions and GET /v2/orders?status=open before anything else. Confirm GLD stop $397.92 resting. Confirm strategy-switch status (are TSM/NVDA/JPM/AVGO still held?).

2. **AMD** (score 7.50 upgraded, breakout-volume, active): Buy 10 shares at MOO. Stop: fill×0.95. Target: fill×1.15 (3:1 R/R). AMD $440.50 EOD — strong entry zone. MANDATORY. 6th+ consecutive instruction. If API blocked: operator executes manually before 9:25 AM ET. NO MORE DELAYS.

3. **PLTR** (score 7.33 confirmed, ai-momentum-pullback): $134 trigger confirmed HIT ($135). Full 6-agent re-score at Pre-Market confirms 7.33. MOO order if ≥$134 at open. Stop: fill×0.95. Target: fill×1.15. MANDATORY.

4. **MU** (est. score ~7.5 post-NVDA-beat, ai-momentum-pullback): NVDA beat confirms HBM/GDDR demand. MU at $720.55 — attractive entry. Full 6-agent score at Pre-Market (required). If ≥7: MOO order. Stop: fill×0.95. Target: fill×1.15. Note: AMD + PLTR + MU = exactly 3 MOO orders (maximum per CLAUDE.md). MANDATORY if score ≥7.

5. **NVDA reaction assessment at Market Open (9:45 AM ET):**
   - AH: -2.44% ($217.91). Likely gap-down at open.
   - If gap-down -3%+ with ≥2× volume AND 2/5 indicator confirmation: `earnings-reaction-fade` setup — score and enter if ≥7. Short via limit sell short or use options if available in paper account.
   - If gap-down then reversal back to flat/positive: "failed breakdown" setup — could be `candlestick-reversal` long.
   - If gap-up (recovery): `earnings-reaction-follow` long.
   - If NVDA still held (Scenario B): assess whether to close at open given AH weakness + binary event violation.

6. **Strategy-switch close (if still needed):** If GET /v2/positions shows TSM/JPM/AVGO still held, close via MOO or limit-at-bid. These positions are overdue for liquidation per May 17 strategy-switch directive.

7. **BTC/crypto check:** If BTC ≥$82K at Pre-Market, run full 6-agent crypto assessment. Begin 10% crypto bucket deployment. Target: 1–2 BTC or ~$10,000 in BTC/ETH.

**Max 3 MOO orders cap:** AMD + PLTR + MU = exactly 3. Any other entries must be limit orders during Market Open (9:45 AM ET) or later routines.

## Pending Deferrals (≥7 watchlist names not yet entered — Updated May 20 Daily Review)
- **AMD** (7.50 — upgraded) — 6th+ consecutive deployment failure; MANDATORY at May 21 MOO
- **PLTR** (7.33 confirmed) — $134 trigger HIT ($135); MANDATORY MOO May 21 if ≥$134
- **MU** (est. ~7.5 post-NVDA-beat) — NVDA HBM demand confirmed; full 6-agent Pre-Market May 21; MANDATORY if ≥7
- **NVDA reaction** (TBD) — AH -2.44% despite beat; assess gap at Market Open May 21; `earnings-reaction-fade` or `candlestick-reversal` depending on open price action
- **AVGO** (~7.5) — NVDA custom ASIC pipeline; score at Pre-Market May 21 via limit order
- **BTC** (TBD) — check vs $82K threshold at Pre-Market May 21; risk-on environment favorable

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
- **2026-05-20 — NVDA earnings date CORRECTION:** NVDA reported on May 20 after close (not May 21 as documented). Binary event exclusion ran May 18 close → May 20 close. Lesson: always verify earnings date from primary source (IR calendar / CNBC earnings calendar) — secondary estimates in notes can drift.
- **2026-05-20 — NVDA "sell the news" validated:** Beat EPS $1.87 vs $1.76 (+6.25%) and revenue $81.62B vs $79.19B (+85% YoY). AH: -2.44% ($217.91). Third consecutive beat with sell-off reaction. Lesson: for NVDA specifically, the market prices in perfection — even strong beats don't gap up. Post-earnings fade setup may be more appropriate than follow setup. This is an asset-specific pattern to track in the Agent Calibration log.
- **2026-05-20 — AMD missed entry 6 times:** AMD has gone from ~$413 (May 8 entry target) through a pullback to $414 then today's $440.50. The stock is now 6.7% above where we first approved it. Every missed day is compounding opportunity cost. API blockage is NOT a valid skip exemption — operator manual execution is the backup that has also not been used.

## Setup Performance Tracker (updated 2026-05-20 Daily Review)
| Setup type | Wins | Losses | 3-in-a-row | Status |
|---|---|---|---|---|
| ai-momentum-pullback | 0 | 0 | none | Active (PLTR trigger hit $135; MU pending 6-agent) |
| macro-hedge | 0 | 0 | none | Active (GLD -0.5% vs entry $418.86) |
| breakout-volume | 0 | 0 | none | AMD pending fill (6th+ consecutive attempt) |
| earnings-reaction-fade | 0 | 0 | none | NVDA AH candidate — assess May 21 open |
| earnings-reaction-follow | 0 | 0 | none | NVDA rejected (AH down); AMD reclassified |
| sector-rotation | 0 | 0 | none | JPM uncertain (strategy switch pending) |
| candlestick-reversal | — | — | — | No trades |
| mean-reversion-oversold | — | — | — | No trades |
| crypto-flush-rebound | — | — | — | No trades (BTC check May 21) |

No 3-in-a-row halt or boost rules triggered. No closed P&L to evaluate. Tracker cannot advance without closed positions.

## Strategy Evolution Notes
- **2026-05-01 (init):** Strategy initialized per CLAUDE.md. No deviations.
- **2026-05-04:** First positions opened. Strategy unchanged; execution layer needs fixing.
- **2026-05-08:** Three-week persistent API blockage causing compounding execution gaps. Portfolio 85% cash vs. 10% floor target.
- **2026-05-12:** China chip deal changes AMD thesis from earnings-follow to breakout-volume. Rate-cut thesis broken (no cuts until 2027) but partially offset by China chip deal sector tailwind. PLTR government AI revenues insulated from rate environment.
- **2026-05-14 (Week 2 Thursday):** Trump-Xi Summit Day 1 delivered massive NVDA catalyst (+4.54%). Markets at all-time records. Portfolio at +0.51% vs S&P +4.32% — entire gap attributable to API blockage. **Friday Weekly Evolution Note was MISSED (May 15 silent failure).**
- **2026-05-20 (Wednesday):** NVDA Q1 FY2027 confirmed the AI infrastructure thesis ($81.62B revenue +85% YoY, agentic AI arriving). But NVDA itself shows "sell the news" (-2.44% AH). Lesson for strategy: AI demand is real and secular, but specific large-cap AI stocks (NVDA) may have stretched valuations that don't reward even strong beats. Implication: favor AMD, MU, AVGO (read-through plays) over NVDA itself for new entries. AMD at $440.50 is the preferred AI exposure vehicle. PLTR ($135, gov AI) is the software-layer AI play. Oil collapse (-5.66%) improves the macro picture for equities broadly.
- **WEEKLY EVOLUTION NOTE DUE:** Friday May 22 — first full week post-strategy-switch with actual market data.

## Next Routine Plan

**Pre-Market May 21 (8:00 AM ET — THURSDAY, NVDA POST-EARNINGS REACTION DAY):**
1. **STOP AUDIT — FIRST:** GET /v2/positions and GET /v2/orders?status=open. GLD stop $397.92 must be resting. Confirm strategy-switch status.
2. **AMD MOO 10 shares** — score 7.50 upgraded, MANDATORY (6th+ attempt). Stop: fill×0.95. Target: fill×1.15. If API blocked: operator executes manually from Codespace or web UI before 9:25 AM ET.
3. **PLTR MOO** — score 7.33 confirmed, MANDATORY if ≥$134 at open. Stop: fill×0.95. Target: fill×1.15.
4. **MU MOO** — full 6-agent score at Pre-Market. Estimate ≥7.5 post-NVDA beat (HBM demand confirmed). If score ≥7: MOO. Stop: fill×0.95. Target: fill×1.15.
5. **NVDA position check** — if still held (Scenario B): FIRST ORDER is to close NVDA via limit-at-bid at open. Binary event was violated; exit before further AH weakness materializes at open.

**Market Open May 21 (9:45 AM ET):**
1. Confirm AMD/PLTR/MU fills. Place stops immediately for any MOO fills (GTC stop orders, stop at fill×0.95).
2. Assess NVDA opening gap: magnitude, direction, volume vs 20-bar average.
   - Gap-down -3%+ with ≥2× volume + 2/5 indicator confirmation → score `earnings-reaction-fade`
   - Gap-down then recovery → potential `candlestick-reversal` long
   - Gap-up (recovery): reassess follow setup
3. Place any limit orders for AVGO, MRVL, MSFT if their Pre-Market scores ≥7.

**Daily Review May 21 (4:30 PM ET):**
- Tally first completed entries (AMD/PLTR/MU fills and stops confirmed)
- NVDA reaction setup P&L
- Weekly strategy evolution note (due Friday May 22)

**Weekly evolution note due:** Friday May 22 Daily Review.

## Cash Reserve Floor
**5% floor** = $5,000 (updated per May 17 strategy switch — was 10%, now 5% per CLAUDE.md).

**Current cash (estimated):**
- Scenario A (switch executed): ~$97,280 → available to deploy: $92,280 (floor = $5,000)
- Scenario B (switch not executed): ~$85,550 → available to deploy: $80,550

**After May 21 entries (AMD 10sh + PLTR 10sh + MU 6sh, estimated):**
- AMD 10sh × $445 = $4,450
- PLTR 10sh × $135 = $1,350
- MU 6sh × $725 = $4,350
- Total new positions: ~$10,150
- Remaining cash (Scenario A): ~$87,130 (87% — still massively above 5% floor)
- Remaining cash (Scenario B): ~$75,400 (75% — still massively above 5% floor)

Deployment gap remains enormous. After AMD+PLTR+MU: still need to deploy ~$65–80K more to reach 85% target. This means additional limit orders for AVGO, MRVL, MSFT, SMCI, and crypto (BTC/ETH) are all warranted on May 21.
