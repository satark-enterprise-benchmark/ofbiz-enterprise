#!/usr/bin/env bash
# Print environment inventory for benchmark reports. Non-destructive.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "$ROOT"

echo "=== OFBiz benchmark environment info ==="
echo "timestamp: $(date -u +%Y-%m-%dT%H:%M:%SZ)"
echo "repo_root: $ROOT"
echo "git_branch: $(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo unavailable)"
echo "git_sha: $(git rev-parse HEAD 2>/dev/null || echo unavailable)"
echo "uname: $(uname -a)"
echo "JAVA_HOME: ${JAVA_HOME:-unset}"
if command -v java >/dev/null 2>&1; then
  java -version 2>&1 || true
else
  echo "java: not found"
fi
if [[ -x ./gradlew ]]; then
  echo "gradlew: present (executable)"
else
  echo "gradlew: missing or not executable"
fi
if command -v docker >/dev/null 2>&1; then
  docker --version 2>&1 || true
  docker compose version 2>&1 || true
else
  echo "docker: not found"
fi
echo "disk_usage_repo_du:"
du -sh . 2>/dev/null || true
exit 0
