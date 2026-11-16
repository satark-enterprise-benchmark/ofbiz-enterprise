#!/usr/bin/env bash
# Validate benchmark documentation structure and key upstream paths.
# Non-destructive.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "$ROOT"
errors=0

check_file() {
  if [[ -e "$1" ]]; then
    printf 'PASS: %s\n' "$1"
  else
    printf 'FAIL: missing %s\n' "$1"
    errors=$((errors + 1))
  fi
}

echo "=== OFBiz benchmark environment validation ==="

# Benchmark package
check_file "benchmark/README.md"
check_file "benchmark/repository-metadata.json"
check_file "benchmark/architecture/application-overview.md"
check_file "benchmark/architecture/architecture-overview.md"
check_file "benchmark/architecture/component-inventory.md"
check_file "benchmark/architecture/technology-stack.md"
check_file "benchmark/architecture/dependency-map.md"
check_file "benchmark/database/database-inventory.md"
check_file "benchmark/database/schema-overview.md"
check_file "benchmark/database/database-dependencies.md"
check_file "benchmark/data-flow/application-data-flow.md"
check_file "benchmark/data-flow/api-to-database-mapping.md"
check_file "benchmark/data-flow/asynchronous-data-flow.md"
check_file "benchmark/environment/prerequisites.md"
check_file "benchmark/environment/installation.md"
check_file "benchmark/environment/configuration.md"
check_file "benchmark/environment/startup-guide.md"
check_file "benchmark/environment/shutdown-guide.md"
check_file "benchmark/environment/troubleshooting.md"
check_file "benchmark/diagrams/architecture.mmd"
check_file "benchmark/diagrams/component-dependencies.mmd"
check_file "benchmark/diagrams/data-flow.mmd"
check_file "benchmark/reports/repository-assessment.md"
check_file "benchmark/reports/environment-readiness.md"
check_file "benchmark/reports/known-limitations.md"

# Upstream anchors used by docs
check_file "framework/entity/config/entityengine.xml"
check_file "applications/datamodel/entitydef/party-entitymodel.xml"
check_file "docker/examples/postgres-demo/docker-compose.yml"

echo "---"
if [[ "$errors" -gt 0 ]]; then
  echo "Validation failed with $errors error(s)"
  exit 1
fi
echo "Validation passed"
exit 0
