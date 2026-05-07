# Root Cause: Cloud Runner GitHub Auth Gap

## Summary
The cloud runner that executes Opus Trader routines does not have a GitHub PAT provisioned. Git push to `origin` fails with:
```
remote: Permission to Miles830/trading-agent.git denied to Miles830.
fatal: unable to access '...': The requested URL returned error: 403
```

## Root Cause
The runner authenticates via a local proxy (`http://local_proxy@127.0.0.1:42727`), which does not have write permissions for the GitHub repository. The GH_TOKEN env var is set but is not being used by the git credential helper.

## Impact
- Heartbeat commits are created locally but not pushed to GitHub
- Trade logs and portfolio updates are committed locally but not synced
- Alpaca orders (if API were accessible) would still execute — Alpaca is the system of record

## Secondary Issue: Alpaca API IP Block
The Alpaca paper trading API (`paper-api.alpaca.markets`) returns HTTP 403 "Host not in allowlist" from this runner. This is separate from the GitHub auth issue and means orders CANNOT be submitted.

## Resolution Steps
1. **GitHub push**: Configure git credential helper to use `GH_TOKEN`. Or push via `git push https://${GH_TOKEN}@github.com/Miles830/trading-agent.git main`
2. **Alpaca API**: Whitelist the runner's outbound IP in Alpaca dashboard, OR disable IP restriction for the paper account.

## Workaround Attempted
Using `git push https://${GH_TOKEN}@github.com/...` in a future run.

## First Noted
2026-05-07 Pre-Market routine
