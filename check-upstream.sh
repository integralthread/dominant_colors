#!/usr/bin/env bash
set -euo pipefail

UPSTREAM_URL="https://github.com/29decibel/dominant_colors.git"
UPSTREAM_BRANCH="main"
LOCAL_BRANCH="main"

# Ensure upstream remote exists
if ! git remote get-url upstream &>/dev/null; then
  git remote add upstream "$UPSTREAM_URL"
fi

git fetch upstream "$UPSTREAM_BRANCH" --quiet

BEHIND=$(git rev-list --count "$LOCAL_BRANCH..upstream/$UPSTREAM_BRANCH")
AHEAD=$(git rev-list --count "upstream/$UPSTREAM_BRANCH..$LOCAL_BRANCH")

if [ "$BEHIND" -eq 0 ] && [ "$AHEAD" -eq 0 ]; then
  echo "In sync with upstream."
  exit 0
fi

if [ "$BEHIND" -gt 0 ]; then
  echo "Upstream is $BEHIND commit(s) ahead:"
  echo
  git log --oneline "$LOCAL_BRANCH..upstream/$UPSTREAM_BRANCH"
  echo
fi

if [ "$AHEAD" -gt 0 ]; then
  echo "Fork is $AHEAD commit(s) ahead of upstream."
  echo
  git log --oneline "upstream/$UPSTREAM_BRANCH..$LOCAL_BRANCH"
  echo
fi

exit 1
