# Routine silent-failure root cause — missing GitHub push auth

## Diagnosis (2026-05-05)
- `git log --author='Opus Trader'` → 0 commits across the entire repo history.
- `git log --author='Miles830'` → 32 commits (every routine-style commit was actually a manual operator catch-up).
- Trigger config `sources: [{git_repository: {url: "https://github.com/Miles830/trading-agent"}}]` has no auth field. Public repo → cloud runner can clone, cannot push.
- Heartbeat infra (commit 47d3c71, 2026-05-05) was structurally correct but the runner can never get past its first git push.
- Failure chain on every cron firing: cron fires → model executes heartbeat START Bash command → `git push origin main` returns "could not read Username for 'https://github.com/'" → model follows prompt instruction "Surface any error and abort rather than proceed without a heartbeat" → exit. No commit, no orders, no log entry.

## Mitigation deployed 2026-05-06 (this session)
All 7 trigger prompts were patched via `RemoteTrigger update` to make git operations BEST-EFFORT:

- **STEP 0 (heartbeat START):** `(git pull --rebase ...) || true`, then `{ git add ... && git commit && git push; } 2>&1 || echo "[heartbeat-push-failed — KNOWN: cloud runner has no GitHub PAT. Alpaca is system of record. PROCEEDING.]"`. The "abort if heartbeat fails" instruction was REMOVED. New CRITICAL note explicitly tells the agent: if push fails, PROCEED with the full routine — research, Alpaca order placement, log/memory edits — exactly as if push had succeeded.
- **MIDDLE / OUTPUT CONTRACT:** "If git push fails, surface the error / do NOT swallow it" → "If git push fails (KNOWN auth gap), log the error and CONTINUE — Alpaca orders are the system of record."
- **FINAL STEP (heartbeat COMPLETE):** `{ git add -A && git commit --allow-empty && git push; } 2>&1 || echo "[final-push-failed — KNOWN auth issue. Alpaca holds the trade record.]"`.

## What this means in practice (until a PAT lands)
- **Trades will happen.** The cloud routines now place Alpaca orders even though git push fails. Alpaca paper account is the authoritative system of record.
- **Git observability is broken.** Heartbeat log files are written to the ephemeral container but lost when push fails. `logs/trades.md` and `memory/portfolio.md` edits in the container are also lost.
- **Operator visibility:** until PAT lands, the only way to see what the routines did is `GET /v2/orders?after=YYYY-MM-DDTHH:MM:SSZ` from a session with the Alpaca paper keys. Daily Review's HEARTBEAT TALLY will report all routines as silent failures (no STARTED/COMPLETED lines reach main) — that's expected; rely on Alpaca activity instead.
- **No regression risk:** if a PAT IS provisioned, the existing best-effort commands all succeed (the `||` short-circuits never fire), and full git observability returns automatically. Heartbeat infra still works.

## Permanent fix paths (require user action — assistant cannot provision tokens)
1. **PAT in prompt** — fine-grained GitHub PAT scoped to `Miles830/trading-agent` Contents:R/W, embedded in each trigger's push URL: `git push https://x-access-token:$PAT@github.com/Miles830/trading-agent.git main`. Fast, same risk model as the embedded Alpaca paper keys.
2. **PAT as env var (RECOMMENDED — wired up 2026-05-06)** — set `GH_TOKEN` in environment `env_01QmmJnoeGXZm713BBF7BZ18` via https://claude.ai/code → Environments. The new SessionStart hook (`.claude/hooks/session-start.sh`) automatically promotes `GH_TOKEN` / `GITHUB_TOKEN` into the session env AND, when the remote URL is a bare `https://github.com/...`, configures `credential.helper store` so `git push` picks the PAT up without rewriting `remote.origin.url`. No prompt edits required. When the remote is the platform's `local_proxy` URL, the hook leaves git auth alone (the proxy authenticates itself).
3. **GitHub App** — install on the repo if claude.ai/code platform exposes a GitHub App integration for routines.

## SessionStart hook deployed 2026-05-06
`.claude/hooks/session-start.sh` (registered in `.claude/settings.json`) runs at session start and:
- bridges `/workspaces/trading-agent` → actual repo root via symlink (fixes hardcoded paths in routines and the dashboard Stop hook regardless of where the repo is checked out);
- sources `.env` if present, then promotes `APCA_API_KEY_ID`, `APCA_API_SECRET_KEY`, `APCA_API_BASE_URL`, `XAI_API_KEY`, `GH_TOKEN`, `GITHUB_TOKEN` into `$CLAUDE_ENV_FILE` so they survive into agent tool calls;
- defaults `APCA_API_BASE_URL` to `https://paper-api.alpaca.markets` if unset;
- configures `credential.helper` only when a PAT is present AND the remote URL is bare `https://github.com/...`;
- pre-creates `logs/heartbeats/<today>.log` so the model's STEP 0 heartbeat-START Bash call cannot fail on a missing dir — addresses the post-fix silent-failure signature where the model never reaches its first tool call;
- prints a status banner (key-presence yes/NO without echoing values) so the agent and operator can see at a glance what's wired up.

The hook is idempotent and gates remote-only behavior on `CLAUDE_CODE_REMOTE=true`.

## Triage when "routines aren't running"
1. `curl -s "https://paper-api.alpaca.markets/v2/orders?status=all&after=$(date -u +%Y-%m-%dT00:00:00Z)" -H "APCA-API-KEY-ID: ..." -H "APCA-API-SECRET-KEY: ..."` — if non-empty, routines ARE trading even if git is silent.
2. `git log --author='Opus Trader' --oneline | wc -l` — if 0, the auth fix has not landed; the tolerant prompts are running but observability remains via Alpaca only.
3. `RemoteTrigger get <id>` — confirm `next_run_at` advanced.
4. https://claude.ai/code/routines — view per-run trace if the run history is exposed.

## Trigger IDs (for `RemoteTrigger update` if templates need refinement)
- Pre-Market: `trig_014T4XMggPEmNTfaaTRuhXVp`
- Market Open: `trig_0131GpFbVasP2LaKbzy369Da`
- Mid-Morning: `trig_01CUdoYLJaibDheoWMMNUWi8`
- Midday: `trig_012Meb9TAfwRnQnLLGRHWduq`
- Afternoon: `trig_014wAuyiXjMk6mnca7s2yfsL`
- Market Close: `trig_01FH4DTT7xchwfEVDWN7CE8S`
- Daily Review: `trig_01Fyy66iJSYdwL9hMm4C8eVB`
