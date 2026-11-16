#!/usr/bin/env bash
# Phase 1 benchmark prerequisite check for ofbiz-enterprise.
# Non-destructive: does not install packages, delete data, or start services.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "$ROOT"

errors=0
warns=0

pass() { printf 'PASS: %s\n' "$*"; }
warn() { printf 'WARN: %s\n' "$*"; warns=$((warns + 1)); }
fail() { printf 'FAIL: %s\n' "$*"; errors=$((errors + 1)); }

echo "=== OFBiz benchmark prerequisite check ==="
echo "Repo root: $ROOT"

if [[ -f README.md && -f build.gradle && -d framework && -d applications ]]; then
  pass "OFBiz source tree markers present"
else
  fail "Missing OFBiz source markers (README.md/build.gradle/framework/applications)"
fi

if [[ -x ./gradlew || -f ./gradlew ]]; then
  pass "gradlew present"
else
  fail "gradlew missing"
fi

if command -v java >/dev/null 2>&1; then
  if java -version >/dev/null 2>&1; then
    java_ver="$(java -version 2>&1 | head -n 1 || true)"
    if printf '%s' "$java_ver" | grep -Eq 'version "(25|25\.)"'; then
      pass "Java runtime available: $java_ver"
    else
      warn "Java available but not confirmed as 25: $java_ver"
    fi
  else
    fail "java on PATH but runtime not usable"
  fi
else
  fail "java not found on PATH"
fi

if [[ -n "${JAVA_HOME:-}" ]]; then
  pass "JAVA_HOME=$JAVA_HOME"
else
  warn "JAVA_HOME is unset"
fi

if command -v docker >/dev/null 2>&1; then
  pass "docker available: $(docker --version 2>/dev/null || echo unknown)"
else
  warn "docker not available (needed only for container workflow)"
fi

if [[ -f docker/examples/postgres-demo/docker-compose.yml ]]; then
  pass "Upstream postgres-demo compose found"
else
  warn "postgres-demo compose missing"
fi

echo "---"
echo "Warnings: $warns"
echo "Errors:   $errors"
if [[ "$errors" -gt 0 ]]; then
  exit 1
fi
exit 0
