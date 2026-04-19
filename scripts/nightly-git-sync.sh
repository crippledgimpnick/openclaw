#!/usr/bin/env bash
set -euo pipefail

REPO="/home/openclaw/.openclaw/workspace"
LOGDIR="$REPO/state/git-sync"
mkdir -p "$LOGDIR"
LOGFILE="$LOGDIR/$(date -u +%F).log"

exec >>"$LOGFILE" 2>&1

echo "[$(date -u +'%F %T UTC')] nightly git sync starting"
cd "$REPO"

branch="$(git branch --show-current)"
if [[ -z "$branch" ]]; then
  echo "ERROR: no current git branch"
  exit 1
fi

remote_url="$(git remote get-url origin)"
if [[ -z "$remote_url" ]]; then
  echo "ERROR: origin remote not configured"
  exit 1
fi

if ! git fetch origin "$branch" --quiet; then
  echo "ERROR: git fetch failed"
  exit 1
fi

local_sha="$(git rev-parse HEAD)"
remote_sha="$(git rev-parse "origin/$branch")"
if [[ "$local_sha" != "$remote_sha" ]]; then
  echo "ERROR: local branch is not aligned with origin/$branch, refusing auto-commit"
  exit 1
fi

# Stage tracked changes and new files except ignored paths.
git add -A

if git diff --cached --quiet; then
  echo "NO_CHANGES"
  exit 0
fi

commit_msg="Nightly vault sync: $(date -u +'%F %R UTC')"
git commit -m "$commit_msg"
git push origin "$branch"

echo "SYNCED: $commit_msg"
