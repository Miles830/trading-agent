#!/bin/bash
# SessionStart hook — prepares Opus Trader for a routine or interactive run.
#
# Responsibilities (in order):
#   1. Bridge legacy /workspaces/trading-agent path used by hardcoded paths in
#      routines and the dashboard Stop hook to wherever the repo actually lives.
#   2. Source .env if it exists locally (operator-provisioned secrets).
#   3. Promote known API keys (Alpaca, xAI, GitHub PAT) into $CLAUDE_ENV_FILE so
#      they survive into the agent's tool calls.
#   4. Configure git credentials when a PAT is available AND the remote is a
#      bare https://github.com/ URL (no-op when the platform proxy is in use).
#   5. Pre-create today's heartbeat log so the model's first Bash call doesn't
#      have to mkdir -p (a known failure point — see
#      memory/project_routine_github_auth_root_cause.md).
#   6. Print a short status block so the agent can see at session-start what is
#      and isn't available, and skip features that need missing keys.
#
# The hook is idempotent and safe to run on local sessions too. Auth and path
# bridging only fire when CLAUDE_CODE_REMOTE=true; everything else (heartbeat
# pre-create, status echo) runs everywhere.

set -euo pipefail

REPO_ROOT="${CLAUDE_PROJECT_DIR:-$(git rev-parse --show-toplevel 2>/dev/null || pwd)}"
ENV_FILE="${CLAUDE_ENV_FILE:-/dev/null}"
IS_REMOTE="${CLAUDE_CODE_REMOTE:-false}"

# 1. Bridge /workspaces/trading-agent → actual repo root.
# Routines and the Stop hook in .claude/settings.json reference
# /workspaces/trading-agent/dashboard-data.json. On any container where the
# repo is checked out elsewhere (e.g. /home/user/trading-agent), we symlink so
# those writes resolve correctly without touching the routine prompts.
if [ "$IS_REMOTE" = "true" ] && [ "$REPO_ROOT" != "/workspaces/trading-agent" ]; then
  if [ ! -e /workspaces/trading-agent ]; then
    mkdir -p /workspaces 2>/dev/null || true
    ln -sfn "$REPO_ROOT" /workspaces/trading-agent 2>/dev/null || true
  fi
fi

# 2. Source repo-local .env (gitignored) if the operator dropped one in.
if [ -f "$REPO_ROOT/.env" ]; then
  set -a
  # shellcheck disable=SC1091
  . "$REPO_ROOT/.env"
  set +a
fi

# 3. Promote API keys to the session env. Quote values so spaces/specials are
# safe; skip any var that's empty so we don't clobber a downstream default.
promote_var() {
  local name="$1"
  local value="${!name:-}"
  if [ -n "$value" ]; then
    # Escape single quotes for safe single-quoted export.
    local escaped
    escaped=$(printf "%s" "$value" | sed "s/'/'\\\\''/g")
    printf "export %s='%s'\n" "$name" "$escaped" >> "$ENV_FILE"
  fi
}

for VAR in APCA_API_KEY_ID APCA_API_SECRET_KEY APCA_API_BASE_URL \
           XAI_API_KEY GH_TOKEN GITHUB_TOKEN; do
  promote_var "$VAR"
done

# Default Alpaca base URL to paper if the operator forgot to set it.
if [ -z "${APCA_API_BASE_URL:-}" ]; then
  echo "export APCA_API_BASE_URL='https://paper-api.alpaca.markets'" >> "$ENV_FILE"
  export APCA_API_BASE_URL='https://paper-api.alpaca.markets'
fi

# 4. Git credential setup — only when (a) we're remote, (b) a PAT exists, and
# (c) the remote URL is a bare github.com URL. The platform's local_proxy
# remote (http://local_proxy@127.0.0.1:.../git/...) authenticates itself; do
# not rewrite it.
PAT="${GH_TOKEN:-${GITHUB_TOKEN:-}}"
if [ "$IS_REMOTE" = "true" ] && [ -n "$PAT" ]; then
  REMOTE_URL=$(git -C "$REPO_ROOT" remote get-url origin 2>/dev/null || true)
  case "$REMOTE_URL" in
    https://github.com/*)
      # Use credential.helper store rather than rewriting remote.origin.url so
      # `git remote -v` stays clean and the PAT isn't visible in casual config
      # listings.
      git -C "$REPO_ROOT" config --local credential.helper \
          "store --file=$REPO_ROOT/.git/.credentials" >/dev/null 2>&1 || true
      umask 077
      printf "https://x-access-token:%s@github.com\n" "$PAT" \
        > "$REPO_ROOT/.git/.credentials"
      chmod 600 "$REPO_ROOT/.git/.credentials" 2>/dev/null || true
      ;;
  esac
fi

# 5. Pre-create today's heartbeat log. The model's STEP 0 heartbeat-START
# Bash call should be append-only (no mkdir, no touch) so it cannot fail on
# a fresh container.
HB_DIR="$REPO_ROOT/logs/heartbeats"
mkdir -p "$HB_DIR"
TODAY_UTC=$(date -u +%Y-%m-%d)
HB_FILE="$HB_DIR/$TODAY_UTC.log"
[ -f "$HB_FILE" ] || : > "$HB_FILE"

# 6. Status block — prints to the session start banner so the agent knows
# what's wired up. NEVER echo the secrets themselves.
yn() { [ -n "${1:-}" ] && echo yes || echo NO; }
echo "session-start: opus-trader hook ready"
echo "  repo:               $REPO_ROOT"
if [ "$IS_REMOTE" = "true" ] && [ -L /workspaces/trading-agent ]; then
  echo "  symlink:            /workspaces/trading-agent → $(readlink /workspaces/trading-agent)"
fi
echo "  alpaca_key_id:      $(yn "${APCA_API_KEY_ID:-}")"
echo "  alpaca_secret:      $(yn "${APCA_API_SECRET_KEY:-}")"
echo "  alpaca_base_url:    ${APCA_API_BASE_URL:-unset}"
echo "  xai_api_key:        $(yn "${XAI_API_KEY:-}")"
echo "  github_pat:         $(yn "$PAT")"
echo "  heartbeat_log:      $HB_FILE"
echo "  remote:             $(git -C "$REPO_ROOT" remote get-url origin 2>/dev/null | sed 's|://[^@]*@|://<auth>@|')"
