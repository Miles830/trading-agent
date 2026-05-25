# Opus Trader — Portfolio Memory

## Last Updated
**2026-05-25 (Monday) — Memorial Day / Non-Trading Day, Midday heartbeat (16:31 UTC).** Markets CLOSED (Memorial Day US federal holiday). Alpaca API STILL BLOCKED ("Host not in allowlist" — 18th+ consecutive blocked session). No orders placed. Next trading day: **May 26, 2026 (Tuesday)**. Watchlist for May 26 is binding: AMD limit ~$470 (score 7.5, MANDATORY — 10th+ consecutive session), PLTR limit ~$138 (score 7.5, MANDATORY), MU confirm fill ($765.91), MRVL INELIGIBLE through May 27 earnings, GLD stop $397.92 to verify. Pre-Market, Market-Open correctly absent today (holiday); Mid-Morning fired 15:08Z confirming non-trading day; Midday fired 16:31Z. MRVL earnings May 27 AH — prepare 6-agent reanalysis for May 28 entry decision.

**Prior Last Updated:** 2026-05-23 (Saturday) — Non-Trading Day / Weekend Context Update (01:37 UTC). Pre-Market heartbeat fired on Saturday but markets are closed. Friday May 22 close data from web research: S&P 500 **7,473.47** (+0.37%, 8th consecutive weekly gain); AMD **$467.58** (+4% — 2nm AI ramp, multiple target hikes; our limit $449 NOT filled — gapped above at open); MU **~$771** (low $747.27 — limit $765.91 LIKELY FILLED on intraday dip; to confirm May 26); PLTR high **$139.02** (limit $140.35 NOT filled); GLD **$414.44** (stop $397.92 safe). MRVL ~$190-198 (pre-earnings squeeze; Stifel upgrade PT $210; INELIGIBLE through May 27 earnings). AVGO $414.14. BTC ~$77,447 (below $82K threshold). Goldman Sachs warned of correction risk (rising yields+inflation). Iran peace talks ongoing. Memorial Day May 25 = market holiday. Next trading day: **May 26, 2026 (Tuesday)**. Alpaca API STILL BLOCKED (HTTP 403) — 16th+ consecutive blocked session.

**Prior Last Updated:** 2026-05-22 (Friday) — Mid-Morning (11:00 AM ET / 15:09 UTC). Alpaca API BLOCKED (HTTP 403 "Host not in allowlist") — 15th+ consecutive blocked session. All three routine API calls (positions, open orders, new orders) blocked. Market is UP +0.55% (S&P 500 ~7,487, Dow +300+, Nasdaq +0.53%). Key drivers: Kevin Warsh sworn in as Fed Chair today (hawkish — 20-30% rate hike odds by Dec 2026); Iran war talks progress (risk-on). AMD fresh catalyst: $10B Taiwan AI ecosystem investment announced May 21. Three limit bracket order re-attempts (AMD 7.5, PLTR 7.5, MU 7.67) — all blocked. MRVL: SKIPPED (Exemption 2 — Memorial Day May 25 creates binary-event-equivalent constraint: no safe exit before May 27 earnings window). AVGO: REJECTED (score 6.0 — bearish divergence, down ~3% vs market up +0.55%, Warsh hawkish headwind for high-multiple). MRVL price note: ~$183-184 today (multiple analyst upgrades — Citi PT $215 — not $190.95 as May 21 estimate had; $190.95 appears to have been wrong). MRVL ineligible until post-May 27 earnings.

**Prior Last Updated:** 2026-05-22 (Friday) — Market Open / Pre-Market Catch-Up (9:45 AM ET / 13:45 UTC). Alpaca API BLOCKED — 14th+ consecutive blocked session. Pre-Market silently failed today. S&P 500 May 21 close: 7,445.72; today intraday ~7,413 (-0.26%). AMD $449.59 (up from $447.58 May 21 close — thesis intact). PLTR $139.65 open (broke above $134 resistance — technical upgraded to 7; score 7.5). MU $762.10 (+4.76% — strong NVDA HBM read-through; score 7.67). NVDA $221.06 (recovered from AH selloff; $80B buyback supporting). GLD ~$416.99. BTC $77,447 (below $82K threshold — not mandatory entry). MRVL $190.95 (May 21 close); earnings **May 27** (CORRECTED from May 21 — prior date was wrong). Three limit bracket orders scored+attempted (AMD 7.5, PLTR 7.5, MU 7.67) — all blocked. MRVL skipped (3-order cap; recommend Mid-Morning score). Weekly evolution note written below.

**Prior Last Updated:** 2026-05-21 (Thursday) — Pre-Market (8:00 AM ET / 12:02 UTC). Alpaca API BLOCKED — 13th+ consecutive session. NVDA Q1 FY2027 POST-EARNINGS: Beat ($81.62B, +85% YoY), $80B additional buyback. NVDA day close $219.51 (absorbed "sell the news"; recovered from AH $217.91). AMD day close $447.58. PLTR ~$134–135. MU $720.55. 3 MOO orders attempted (AMD/PLTR/MU) — all blocked. MRVL skip on May 21 used incorrect earnings date (see correction below).

**Prior Last Updated:** 2026-05-20 (Wednesday) — Daily Review (4:30 PM ET / 20:35 UTC). NVDA reported Q1 FY2027 TONIGHT after close: BEAT ($81.62B vs $79.19B) but AH down -2.44% ($217.91) — "sell the news." AMD +6.39% to $440.50. PLTR confirmed above $134 trigger (~$135). MU $720.55. S&P 500 +1.08% to 7,432.97. Cumulative gap vs SPX: -3.04 pp.

**CORRECTION (preserved):** NVDA earnings were May 20 after close (not May 21 as previously documented). Binary-event window ran May 18 close → May 20 close.

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

## Current Account Snapshot (as of 2026-05-23 Weekend — all estimates; API blocked)
- **Broker:** Alpaca Paper Trading (account PA3TXVEJ19LW)
- **Total Equity (estimated):** ~$100,600 (S&P up 8 straight weeks; portfolio still ~85-97% cash due to API blockage)
- **Cash:** ~$85,550 (Scenario B: switch NOT executed) OR ~$97,280 (Scenario A: switch executed May 18) — minus ~$4,595 if MU filled ($765.91 × 6)
- **Long Market Value (estimated):**
  - GLD: 7sh × $414.44 = $2,901
  - MU (if filled May 22): 6sh × $771 = $4,626 → total $7,527
  - Scenario B (switch NOT executed + MU filled): ~$14,443
- **Order status (estimated — API blocked):**
  - GLD 7sh — confirmed open (resting stop $397.92 expected)
  - MU 6sh @ $765.91 — LIKELY FILLED (intraday low $747 < limit $765.91); stop $727.61 expected
  - AMD — limit $449 NOT filled (AMD ran to $467-474 all day)
  - PLTR — limit $140.35 NOT filled (high $139.02)
  - TSM/NVDA/JPM/AVGO — strategy switch status still UNKNOWN (unconfirmed)
- **API Status:** BLOCKED — "Host not in allowlist" (HTTP 403, Anthropic sandbox TLS proxy). 16th+ consecutive blocked session.

## Prior Account Snapshot (as of 2026-05-22 Mid-Morning ~11:00 AM ET — all estimates; API blocked)
- **Broker:** Alpaca Paper Trading (account PA3TXVEJ19LW)
- **Total Equity (estimated):** ~$100,600 (estimated; API blocked; market up +0.55% today, GLD ~$417, positions unknown)
- **Cash:** ~$85,550 (Scenario B: switch NOT executed) OR ~$97,280 (Scenario A: switch executed May 18) — unchanged, orders blocked
- **Long Market Value (estimated):**
  - Scenario A (switch executed May 18): ~$2,919 (GLD 7sh × $417)
  - Scenario B (switch NOT executed): ~$15,400 (TSM+GLD+NVDA+JPM+AVGO estimated with today's market +0.55%)
- **Open Positions:** 1 confirmed (GLD) + unknowns (strategy switch unconfirmed; AMD/PLTR/MU fills from May 21 MOO and May 22 Market Open limit attempts all unknown due to API blockage)
- **MRVL NOTE:** MRVL price CORRECTED to ~$183-184 (was $190.95 in Market Open estimate — that was wrong). MRVL INELIGIBLE for new entry until post-May 27 earnings (Memorial Day May 25 creates unavoidable binary-event-equivalent constraint).
- **AVGO NOTE:** AVGO trading ~$394-404 today (bearish divergence — DOWN vs market UP). Scored 6.0, REJECTED. Re-score if it recovers to $415+ in later routine.
- **API Status:** BLOCKED — "Host not in allowlist" (HTTP 403, Anthropic sandbox TLS proxy). 15th+ consecutive blocked session.
- **Daytrade Count:** 0
- **3% Circuit Breaker:** NOT TRIGGERED (market up, portfolio estimated flat to slightly positive)

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
- **Portfolio total equity (est.):** ~$100,600 (May 23 weekend estimate)
- **Portfolio total return:** ~+0.6%
- **S&P 500 close May 22:** 7,473.47 (+0.37% from May 21 close 7,445.72). 8th consecutive weekly gain.
- **S&P 500 return since strategy start (~May 1):** **+3.7%** (7,473.47 vs ~7,200 est.)
- **Gap vs SPX:** **~-3.1 percentage points** — unchanged from prior update. Persistent API blockage prevents deployment; AMD alone has missed 4.1% in the 9+ sessions we tried to enter.
- **Root cause unchanged:** 85-97% cash from persistent API blockage. Every market up-day widens the gap. Only cure is operator manual execution OR Alpaca API allowlist fix.

## Prior Performance vs S&P 500
- **Portfolio total equity (est.):** ~$100,400 (May 22 intraday)
- **Portfolio total return:** ~+0.40%
- **S&P 500 close May 21:** 7,445.72 (+0.17% from May 20 close of 7,432.97). Today (May 22) intraday ~7,413 (-0.26%).
- **S&P 500 return since strategy start (~May 1):** **+3.4%** (7,445.72 vs ~7,200 est.)
- **Gap vs SPX:** **~-3.0 percentage points** (improved marginally — S&P down -0.26% today while portfolio estimated flat or tiny positive from GLD/NVDA if still held).
- **Root cause unchanged:** 85-97% cash from persistent API blockage. 8+ consecutive entry blocks on AMD alone. Every market up-day widens the gap further. The only cure is operator manual execution OR Alpaca API allowlist fix.

## Macro Context (as of 2026-05-23 Weekend — web research)
- **S&P 500 May 22 close: 7,473.47** (+0.37%). Dow 50,579.70 (+0.58%, fresh record high). Nasdaq 26,343.97 (+0.19%). **8th consecutive weekly gain.**
- **Memorial Day weekend:** US markets closed Monday May 25. Reopen Tuesday May 26.
- **Goldman Sachs correction warning:** Rising yields + inflation = growing correction risk. Consumer sentiment (UMich) fell to new low (gas costs, inflation concerns). This creates a potential headwind for Tuesday's open.
- **U.S.-Iran peace talks:** Negotiations continue (de-escalation = risk-on). Markets focused on any Strait of Hormuz developments.
- **AMD May 22 surge (+4%, $467.58):** 2nm AI ramp confirmed; multiple analyst target hikes. AMD is now ~4.4% above our $449 limit from Mid-Morning. AMD ATH $469.22 (May 11) — AMD is approaching all-time highs again. New limit for May 26: ~$471.
- **MU ~$771 (low $747.27):** Limit $765.91 likely filled on dip. Stop $727.61 and target $880.80 should be resting via bracket. MU Manassas fab milestone announced May 22 (additional catalyst). Next earnings: June 24.
- **PLTR ~$136-139 (high $139.02):** Limit $140.35 not filled. PLTR pulled back from mid-day highs. Need revised limit ~$138.50 for May 26.
- **MRVL ~$190-198 on May 22:** Pre-earnings squeeze. Stifel raised PT to $210 (up from $140). Still INELIGIBLE through May 27 earnings. Post-earnings entry May 28-29.
- **AVGO $414.14 May 22 close:** Recovered somewhat (was $394-404 at mid-morning May 22). Still ~1% below May 21 close. Thesis: NVDA custom ASIC pipeline. Re-score for May 26 entry if macro supports.
- **BTC ~$77,447:** Below $82K threshold. Not a mandatory entry.
- **Kevin Warsh (new Fed Chair):** Hawkish. 20-30% probability of rate hike by December 2026. First FOMC June 16-17.
- **Rates concern:** Goldman Sachs and consumer sentiment both flagging rising yields + inflation as near-term risk. May 26 open tone TBD.

## Prior Macro Context (as of 2026-05-22 Mid-Morning — web research)
- **S&P 500 +0.55% today (~7,487):** Dow +300+ pts, Nasdaq +0.53%. Key drivers: Warsh swearing-in (risk-on initially), Iran war talks progress (de-escalation = risk-on). Oil up +1.8% (WTI $98.05) — mild inflationary headwind.
- **Kevin Warsh NEW FED CHAIR (sworn in today May 22):** Hawkish stance — rates held through 2026, 20-30% probability of hike by December. First FOMC meeting as chair: June 16-17. Higher-for-longer = mild headwind for high-multiple semis (AVGO, MRVL). Lower-multiple value/financials may benefit.
- **Iran war talks progress:** Geopolitical de-escalation → risk-on → equities bid. Oil up but equities also up (market reading de-escalation as more important than oil supply risk).
- **AMD $441-451 range today:** Prev close $447.58. NEW CATALYST: $10B Taiwan AI ecosystem investment (May 21). AMD is going big on AI chip manufacturing capacity (TSM CoWoS partnerships). Thesis strengthened. 9th+ consecutive entry attempt blocked.
- **MU:** Was $762.10 at open; mid-morning price unknown (API blocked). Melius PT $1,100. HBM3e demand validated. Limit $765.91 may be above current price — OPERATOR should check and adjust.
- **PLTR ~$138-142 range:** Risk-on day should support PLTR continuation. Limit $140.35 may fill.
- **MRVL ~$183-184:** Multiple analyst upgrades today (Citi PT $215, Oppenheimer, Wells Fargo, Melius). New 52-week high. UP 105% YTD. INELIGIBLE for new entry until post-May 27 earnings due to Memorial Day constraint. Post-earnings entry candidate (May 28+).
- **AVGO ~$394-404:** Significantly down from May 21 ($410-422). Bearish divergence in up market. Scored 6.0, rejected. Monitor for recovery to $415+.
- **NVDA ~$221+ today:** Up from May 21 close $219.51. $80B buyback supporting. Not a new entry target — thesis is AMD/MU as cleaner AI vehicles with better R/R.
- **BTC ~$77K:** Still below $82K threshold. Not a mandatory entry.
- **GLD ~$417:** Remains near current levels. Stop $397.92 resting (expected — GLD ~4.9% above stop). Thesis: dollar weakness hedge.

## Active Themes
1. **AI infrastructure / semiconductor supercycle** — NVDA beat ($81.62B Q1 FY2027) confirms the thesis. AMD (7.33, MANDATORY entry), MU (HBM demand confirmed, full 6-agent May 21), AVGO (custom ASICs), TSM (foundry demand) all beneficiaries. Semiconductor SOX up 65% YTD 2026.
2. **NVDA "sell the news" risk** — AH -2.44% despite strong beat. NVDA down in AH after 3 consecutive beats in recent quarters. Watch for May 21 open direction. If gap-down -3%+ with volume: `earnings-reaction-fade` setup. If recovers: reassess.
3. **GLD as cross-asset hedge** — +1.25% today even on risk-on day + oil collapse. Dollar weakness component keeping gold bid. Stop $397.92 remains protective (-4.9% from $416.64 current).
4. **Crypto recovery** — BTC estimated ~$80–85K range. Risk-on environment (oil collapse, equities rally). Check vs $82K threshold at Pre-Market May 21. Oil collapse → lower inflation → rate cut expectations → positive for crypto.
5. **PLTR government AI** — $135, trigger confirmed. AIP government contracts secular revenue. Re-score at Pre-Market May 21. Entry MOO if ≥$134.
6. **Oil collapse implications** — WTI -5.66% to $98.26. Middle East de-escalation. Positive for consumer discretionary, airlines, transports. Negative for energy sector. GLD thesis shifts slightly (less geopolitical fear premium, more dollar weakness premium).

## Pending Actions — OPERATOR MUST EXECUTE (Updated May 23 Weekend)

**NEXT TRADING DAY: May 26, 2026 (Tuesday) — Memorial Day May 25 = market holiday**

### FRIDAY MAY 22 ORDER STATUS (API blocked — not confirmed)
- **AMD limit $449.00** → **DID NOT FILL** (AMD gapped up to ~$474 at open, closed $467.58 — well above $449 limit all day). GTC order on Alpaca may still be resting unfilled — CANCEL and replace with new limit (see below).
- **MU limit $765.91** → **LIKELY FILLED** (intraday low $747.27 < limit $765.91). Stop $727.61 and target $880.80 should have been auto-placed via bracket. CONFIRM on Alpaca May 26.
- **PLTR limit $140.35** → **DID NOT FILL** (intraday high $139.02 < limit $140.35). GTC order on Alpaca may still be resting — CANCEL and replace with new limit (see below).

### MANDATORY MAY 26 PRE-MARKET (8:00 AM ET)

1. **STOP AUDIT (FIRST ACTION):** Verify all open positions have resting GTC stops at https://app.alpaca.markets. GLD 7sh stop $397.92 must be resting. If MU filled: stop $727.61 must be resting.

2. **CANCEL STALE GTC ORDERS:** Cancel any unfilled GTC orders from May 22 (AMD $449.00 limit, PLTR $140.35 limit — both were not filled and need price updates).

3. **AMD** (score **7.5+**, breakout-volume, active): AMD closed $467.58 on May 22. 2nm AI ramp catalyst + $10B Taiwan investment + multiple analyst upgrades. Place MOO order (max 3 MOO/day) or revised limit:
   - MOO: **10 shares AMD** (fill at open ~$467-475)
   - OR limit: BUY 10sh AMD limit **$471.00** (est. ask+0.5% if pre-market ~$469), stop $447.45 (-5%), target $541.65 (+15%), R/R 3:1, `order_class:bracket, tif:gtc`
   - Position size: 10sh × $470 ≈ $4,700 = 4.7% ✓; Stop risk: $23.50 × 10 = $235 = 0.23% ✓

4. **PLTR** (score **7.5**, ai-momentum-pullback, active): PLTR closed ~$136-139 on May 22. High was $139.02. Reset limit lower:
   - Revised limit: BUY 10sh PLTR limit **$138.50** (est. ask+0.5% if pre-market ~$137.80), stop $131.58 (-5%), target $159.28 (+15%), R/R 3:1, `order_class:bracket, tif:gtc`
   - Position size: 10sh × $138.50 = $1,385 = 1.4% ✓; Stop risk: $6.93 × 10 = $69.30 = 0.07% ✓

5. **MU** (if NOT confirmed filled from May 22): Re-enter BUY 6sh MU limit at ask+0.5% (~$774), stop fill×0.95, target fill×1.15, bracket gtc.

6. **MRVL — DO NOT ENTER.** MRVL earnings May 27 after close. 48-hour window opens May 25 close (Memorial Day = closed). Any MRVL position from May 26 cannot be safely exited before the binary event. EXEMPT via Exemption 2. Post-earnings entry candidate May 28-29.

7. **Max 3 MOO orders:** If using MOO — AMD (1) + any others (up to 2 more). Prioritize AMD (highest score + biggest opportunity cost). PLTR and MU can be limits if MOO cap hit.

### PRIOR PENDING ACTIONS (Updated May 22 Mid-Morning)

**CRITICAL — TODAY (Friday May 22, before 3:50 PM ET close):**

1. **STOP AUDIT (HIGHEST PRIORITY):** Verify at https://app.alpaca.markets — confirm ALL open positions have resting GTC stop orders. GLD stop $397.92 must be resting. If AMD/PLTR/MU filled from May 21 MOO or any May 22 limits, place stops at fill×0.95 immediately.

2. **AMD** (score **7.5**, breakout-volume, active): If NOT already open — BUY **11 shares** limit bracket: limit **$449.00** (UPDATED from $451.84 — better fill odds, today range $441-$451.20), stop **$426.55** (-5%), target **$516.35** (+15%, R/R 3:1), `order_class: bracket, time_in_force: gtc`. NEW CATALYST: $10B Taiwan AI investment. **9th+ consecutive deployment failure. MANDATORY.** Note: Cathie Wood selling AMD (mild contrarian signal — often precedes rallies). GTC limit carries to May 26 (first day post-Memorial Day) if not filled today.

3. **PLTR** (score **7.5**, ai-momentum-pullback, active): If NOT already open — BUY **10 shares** limit bracket: limit $140.35, stop $133.33, target $161.40, `order_class: bracket, time_in_force: gtc`. PLTR ~$138-142 today (risk-on). Limit may fill. GTC carries to May 26 if not filled.

4. **MU** (score **7.67**, ai-momentum-pullback, active): If NOT already open — Check current MU price first. If below $762, LOWER the limit to (current ask × 1.005). Place BUY **6 shares** limit bracket, stop at fill×0.95, target at fill×1.15, `order_class: bracket, time_in_force: gtc`. GTC carries to May 26.

5. **MRVL — DO NOT ENTER.** MRVL is INELIGIBLE until post-May 27 earnings. Reason: Memorial Day May 25 (markets closed) eliminates the safe exit window between today and the 48h earnings window. Any MRVL entered today that isn't closed by today's close would be held into the binary event window on May 26. If accidentally entered: EXIT via MOC order before 3:50 PM ET today.

6. **AVGO — DO NOT ENTER.** Scored 6.0 (rejected). AVGO bearish divergence today (down ~3-4% vs market up +0.55%). Re-score if it recovers to $415+ with renewed buying volume.

**MEMORIAL DAY NOTE:** May 25 is a market holiday. No trading. GTC limit orders placed today (AMD/PLTR/MU) will be eligible for filling on May 26 (next trading day). No MOO orders May 25. No routine fires May 25. Next scheduled session: May 26 Pre-Market (8:00 AM ET).

**WEEKLY EVOLUTION NOTE DUE:** Friday May 22 Daily Review (4:30 PM ET) — this is the first Friday post-strategy-switch requiring a weekly review update.

## Pending Actions — OPERATOR MUST EXECUTE (Prior — May 21 Pre-Market)

**CRITICAL — PRE-MARKET TODAY (before 9:25 AM ET May 21):**

1. **STOP AUDIT:** Verify at https://app.alpaca.markets — GLD stop $397.92 resting. Confirm strategy-switch status (are TSM/NVDA/JPM/AVGO still held?). API BLOCKED from cloud routine.

2. **AMD** (score **7.67**, breakout-volume, active): Buy **10 shares MOO** (`type: market, time_in_force: opg`). Stop: fill×0.95. Target: fill×1.15. **MANDATORY — 7th consecutive attempt. ORDER ATTEMPTED AND BLOCKED.** AMD pre-market ~$429 (−3.6% sector contagion). AMD Q1: $10.3B +38% YoY, Data Center $5.8B +57%. OPERATOR MUST MANUALLY PLACE.

3. **PLTR** (score **7.17**, ai-momentum-pullback, active): Buy **10 shares MOO** only if open ≥$134 (pre-market $134.01). Stop: fill×0.95. Target: fill×1.15. **MANDATORY if open ≥$134. ORDER ATTEMPTED AND BLOCKED.** PLTR Q1: $1.63B +39% YoY, EPS $0.33 beat $0.24 by 37.5%. OPERATOR MUST MANUALLY PLACE.

4. **MU** (score **7.67**, ai-momentum-pullback, active): Buy **6 shares MOO**. Stop: fill×0.95. Target: fill×1.15. **MANDATORY. ORDER ATTEMPTED AND BLOCKED.** MU ATH $818.67 (May 11), now at $720.55 (-12% pullback). NVDA beat = HBM demand confirmed. Next earnings June 24. OPERATOR MUST MANUALLY PLACE.

**MAX 3 MOO ORDERS CAP = AMD + PLTR + MU (filled).**

**MARKET OPEN (9:45 AM ET — MANDATORY):**
5. After confirming AMD/PLTR/MU fills: POST separate GTC stop orders for each fill (fill×0.95). This is the MANDATORY stop-placement step per CLAUDE.md MOO workflow.
6. NVDA reaction assessment: NVDA trading ~$220.66 (range $216.25–$226.94). $80B buyback + 25¢ dividend = bullish catalysts offset sell-the-news. If NVDA gap-down -3%+ with ≥2× volume + 2/5 indicator confirmation: score `earnings-reaction-fade`. If recovery: `earnings-reaction-follow` or `candlestick-reversal`.
7. Strategy-switch close (if still needed): If TSM/JPM/AVGO still held, post limit sells at bid (NOT MOO — 3-order cap used today).
8. AVGO limit order: AVGO ~$416–427 today, 52-week high area, NVDA custom ASIC thesis intact. Score ~7.5. BUY 10 shares AVGO limit at ask+0.5% (~$418–$430 range) if API accessible.

**SUBSEQUENT ROUTINES (limit orders):**
9. AVGO (score ~7.5): 10 shares limit — NVDA custom ASIC pipeline.
10. TSM (score ~7.0): 7 shares limit — NVDA fab demand surge.
11. MSFT (score ~7.0): 5 shares limit — Azure AI, Copilot enterprise.

**BTC/CRYPTO:** BTC $77,852 (below $82K threshold, score 5.3 — not mandatory entry). Monitor vs $82K. If BTC crosses $82K in a subsequent routine, run full 6-agent and enter if ≥7.

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
- **2026-05-22 — Memorial Day binary event trap identified:** MRVL earnings May 27 (Wed). Prior routines said "must exit by May 25 close" — but May 25 is Memorial Day (market CLOSED). Any MRVL position entered today (Fri May 22) that is not closed by today's MOC would carry to May 26, which is within the 48-calendar-hour binary event window. Lesson: always check holiday calendar when computing binary event windows, especially around 3-day weekends. A "must exit by May 25" instruction is invalid if May 25 is a holiday. The effective last entry date for MRVL was May 22 as a same-day trade only — which is operationally impossible without live API access. Correctly invoked Exemption 2.
- **2026-05-22 — Warsh hawkish headwind for high-multiple semis:** New Fed Chair Kevin Warsh sworn in today. Markets pricing 20-30% probability of rate hike by December 2026. Higher-for-longer rates = valuation headwind for AVGO (high PE) and other high-multiple semis. This was a contributing factor in AVGO scoring 6.0 (rejected). Future entries in this sector should note Warsh policy trajectory.
- **2026-05-22 — AVGO bearish divergence signal:** AVGO down ~3-4% on a day when S&P is up +0.55%. This type of bearish divergence (individual stock falling in a rising market) is a meaningful technical signal — suggests specific selling pressure (institutional rebalancing, profit-taking from ATH levels). Correct response: reject entry on negative divergence, wait for recovery to prior support ($415+) with renewed buying volume.
- **2026-05-22 — AMD $10B Taiwan AI investment catalyst:** AMD announced $10B investment in Taiwan's AI ecosystem (TSM CoWoS, AI chip partnerships). This is a POSITIVE catalyst that strengthens the AI accelerator thesis and supports the $449 entry thesis. AMD has now scored ≥7 for 9+ consecutive sessions without a fill due to API blockage.
- **2026-05-22 — MRVL price estimate was wrong in Market Open:** Portfolio.md had MRVL at $190.95 (from May 21 close). Mid-Morning web research shows MRVL ~$183-184 (new 52-week high after analyst upgrades). The $190.95 figure was from an earlier data source that may have been incorrect. Lesson: web-research price estimates can drift significantly from actual market prices. Always note the source and time of any price estimate.
- **2026-05-22 — AMD limit too low; missed a $467 close after limit set at $449:** AMD limit order set at $449 (a slight pullback buy) was never in play — AMD opened up ~5.89% (~$474) and traded all day in the $455-$467 range. Lesson: for strong-momentum breakout stocks (AMD -ai-momentum), buying at a discount below the prior close is NOT the right strategy. The entry should be at ask+0.5% (momentum entry, not pullback entry), even if that feels aggressive. The prior limit was set too low and cost another full day of missed exposure. For May 26, limit set at $471 (ask+0.5%) to ensure execution.
- **2026-05-22-23 — MRVL pre-earnings squeeze validated skip:** MRVL ran from ~$183-184 (mid-morning May 22) to ~$190-198 (by close May 22), then further pre-earnings excitement. The Exemption 2 skip was correct — the stock was being driven by earnings speculation, not a clean technical setup. Post-earnings entry (May 28-29) if results are strong will be a cleaner risk/reward. Note: had we entered MRVL at $184 on Friday, we'd be sitting on a 3-5% gain going into a binary event with no clean exit — exactly the scenario the exemption is designed to prevent.

## Setup Performance Tracker (updated 2026-05-22 Mid-Morning)
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
- **2026-05-20 (Wednesday):** NVDA Q1 FY2027 confirmed the AI infrastructure thesis ($81.62B revenue +85% YoY, agentic AI arriving). But NVDA itself shows "sell the news" (-2.44% AH). Lesson for strategy: AI demand is real and secular, but specific large-cap AI stocks (NVDA) may have stretched valuations that don't reward even strong beats. Implication: favor AMD, MU, AVGO (read-through plays) over NVDA itself for new entries.

### WEEKLY EVOLUTION NOTE — Week of May 18-22, 2026 (First Full Week Post-Strategy-Switch)

**What changed this week:**
1. **Strategy switch executed (May 17/18):** Retired long-term bucket. Account is now 100% active trading (85% active + 10% crypto + 5% cash). Prior LT positions (TSM/NVDA/JPM/AVGO) flagged for MOO liquidation May 18 — status unconfirmed due to API blockage.
2. **AI infrastructure thesis massively validated:** NVDA Q1 FY2027 $81.62B (+85% YoY), $80B buyback, agentic AI declared by Jensen Huang. Every AI read-through name (AMD, MU, AVGO, MRVL, PLTR) repriced higher.
3. **"Sell the news" at scale confirmed for NVDA:** Despite record Q1 beat, NVDA AH -2.44%. Recovered to $221 by May 22. Lesson: for a stock priced for perfection, even strong beats don't gap up. Prefer AMD/MU/AVGO/MRVL as cleaner AI vehicles.
4. **AMD $447→$449 (May 18-22):** Thesis intact. MI450 exceeding projections. 8th+ consecutive entry block — pure execution failure. Score: 7.5. Every day without entry is compounding the opportunity cost.
5. **PLTR $134→$140 (May 18-22):** Broke decisively above $134 resistance. Gov AI AIP revenue accelerating. Score upgraded from 7.17 to 7.5 on improved technical.
6. **MU $720→$762 (May 18-22, +5.8%):** HBM3e demand confirmed by NVDA. Best R/R of the three. Score: 7.67.
7. **MRVL date correction:** Earnings incorrectly logged as May 21 — actually May 27. Entry window still open through May 25 close. Recommend Mid-Morning score today.
8. **Oil and rates:** WTI -5.66% May 20 (Middle East de-escalation). Lower inflation path = potential rate-cut runway. Positive for broad equities. GLD bid on dollar weakness theme (not geopolitical fear).

**What the strategy says but the execution layer hasn't delivered:**
- Deployment bias is MANDATORY. Score ≥7 = enter. AMD has scored ≥7 for 8+ consecutive sessions. Portfolio is ~85-97% cash. This is the LARGEST systemic failure: the strategy is correct but the execution infrastructure (Alpaca API blockage) prevents orders.
- **Operator must manually execute** until the API allowlist issue is resolved. There is no algorithmic solution until `paper-api.alpaca.markets` is added to the cloud runner's egress allowlist.

**What to watch next week (May 25-29):**
- **MRVL earnings May 27 (Q1 FY2027):** AI ASIC networking — custom silicon for AWS/Google/MSFT. Consensus $2.4B revenue. PT Citi $215. Score at Mid-Morning May 22 for last pre-earnings entry; exit by May 25 close if entered.
- **AMD breakout continuation:** Key levels: $450 breakout = momentum extends. Stop $429. Target $520.
- **MU continued HBM rally:** ATH $818.67 in sight. Target $881.
- **PLTR $140+ support test:** If pulls back to $134, re-evaluate technical score.
- **BTC vs $82K:** Still below. Monitor risk-on conditions.

**Core guardrails: NO CHANGES.** Stop-losses, position size, sector caps, R/R minimum — all unchanged. Only the execution infrastructure needs fixing.

## Next Routine Plan

**Weekend / Non-Trading Days May 23-25 (Saturday, Sunday, Memorial Day Monday):**
- No routines. No orders. GTC limit orders from May 22 may be resting on Alpaca — AMD $449 (cancel on May 26), PLTR $140.35 (cancel on May 26), MU $765.91 (likely filled — verify on May 26).
- MRVL reports earnings May 27 after close. DO NOT ENTER before that.

**Pre-Market May 26 (8:00 AM ET — NEXT REQUIRED ROUTINE):**
1. STOP AUDIT: All positions, all stops. GLD stop $397.92, MU stop $727.61 (if filled).
2. Cancel stale GTC orders: AMD $449 limit, PLTR $140.35 limit (both were above market on May 22; prices have moved).
3. AMD MOO (preferred) or limit $471: 10 shares. Score 7.5+. Must enter — 10th+ consecutive missed session.
4. PLTR revised limit $138.50: 10 shares. Score 7.5. Prior limit abandoned.
5. MU confirmation: If Alpaca shows fill, log as entry. If not filled, re-enter at market (~$773).
6. Circuit breaker: If May 26 opens down ≥3% from May 22 close (7,473.47 → below 7,249), halt new entries.
7. Watchlist for May 26: AMD (mandatory), PLTR (mandatory), AVGO (re-score — $414 close, score estimate ~6.5, may upgrade if macro improves), MRVL post-earnings May 28-29.

**Afternoon / Market Close May 27:**
- MRVL earnings release after close May 27. Monitor reaction.

**Daily Review May 27 (4:30 PM ET) / Pre-Market May 28:**
- Full 6-agent re-score of MRVL post-earnings. Entry decision for May 28 morning.

**Prior Next Routine Plan entries below:**

**Market Open May 22 (9:45 AM ET — COMPLETED):**
- Pre-Market silently failed → catch-up ran.
- 3 limit bracket orders scored and attempted (AMD 7.5, PLTR 7.5, MU 7.67) — all BLOCKED by API.
- MRVL skipped (3-order cap). MRVL date corrected (earnings May 27, not May 21).
- OPERATOR: manually place AMD/PLTR/MU limit brackets before market close today.

**Mid-Morning May 22 (11:00 AM ET — THIS ROUTINE — COMPLETED):**
- Pre-Market predecessor: MISSING (violation logged, duplicate noted).
- Stop audit: BLOCKED (HTTP 403, 15th+ consecutive).
- MRVL: SKIPPED (Exemption 2 — Memorial Day May 25 creates binary-event-equivalent constraint; MRVL ineligible until post-May 27 earnings).
- AVGO: REJECTED (score 6.0 — bearish divergence in up market, Warsh hawkish headwind for high-multiple semis).
- AMD/PLTR/MU: re-attempted limit brackets — all BLOCKED by API.
- AMD updated limit: $449.00 (down from $451.84 for better fill odds; today range $441-$451.20).
- MRVL price corrected: ~$183-184 (not $190.95 as previously estimated).
- KEY MACRO: Warsh sworn in as Fed Chair (hawkish — rate hike odds 20-30% by Dec), Iran talks progress (risk-on), S&P +0.55%.
- OPERATOR: Please execute AMD/PLTR/MU manually at https://app.alpaca.markets today. AMD: 11sh limit $449, stop $426.55, target $516.35. PLTR: 10sh limit $140.35, stop $133.33, target $161.40. MU: 6sh limit check current price, stop at fill×0.95, target at fill×1.15.

**Midday May 22 (12:30 PM ET — NEXT ROUTINE):**
1. **Stop audit:** Re-attempt GET /v2/orders?status=open (API likely still blocked — log result).
2. **Confirm AMD/PLTR/MU order status** if operator has placed them.
3. **AVGO recovery check:** If AVGO has recovered to $415+, re-score — entry may be valid if technical improves.
4. **Circuit breaker check:** If S&P down 3% from open, halt all new entries.
5. **Memorial Day reminder:** US markets CLOSED May 25. Next trading day after today = May 26. All GTC orders placed today will be eligible May 26.
6. **MRVL remains INELIGIBLE** through May 27 earnings. Post-earnings entry possible May 28+ if reaction is bullish.

**Afternoon May 22 (2:00 PM ET):**
- Position P&L review.
- Any trailing stops upward on winners.

**Market Close May 22 (3:30 PM ET — CRITICAL for today):**
- Place MOC orders to close any winning day trades.
- OPERATOR: Ensure no MRVL position is held into close — if any MRVL accidentally entered, MUST close by 3:50 PM ET (last valid trading day before 48h earnings window + Memorial Day).
- AMD/PLTR/MU limit orders: if not filled and thesis intact, GTC limits can carry to May 26 (next trading day post-Memorial Day).

**Daily Review May 22 (4:30 PM ET — WEEKLY EVOLUTION NOTE DUE):**
- First full week post-strategy-switch (May 18-22) with actual market data.
- Tally all order execution (AMD/PLTR/MU — operator-placed or still pending).
- Updated benchmark gap vs S&P 500 (prior gap: -3.04 pp vs SPX; today market up another +0.55% ≈ further widening gap).
- Write weekly evolution note (overdue since Friday).
- MRVL post-earnings (May 27) analysis — prep for May 28 entry decision.
- NOTE: No trading May 25 (Memorial Day). Weekend = May 23-24, holiday = May 25. Next session = May 26 Pre-Market.

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
