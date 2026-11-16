# Startup guide

## Local (Gradle)

After JDK 25 install and `loadAll` (see installation.md):

```bash
./gradlew ofbiz
```

Then open the HTTPS/HTTP URLs documented in README (commonly https://localhost:8443/ for secured demo). **Not verified** on this host.

## Docker Compose (postgres-demo)

```bash
# from repo root
docker build --tag ofbiz-docker .
cd docker/examples/postgres-demo
mkdir -p logs
docker compose up
```

Service `ofbiz` maps host **8443** → container 8443. Admin credentials default via env (`OFBIZ_ADMIN_*`) unless overridden.

## Health checks

- Montastic badge in upstream README monitors a public demo — not applicable to local fork.
- Local health: login page load + `runtime/logs` — not verified here.

## Startup verified?

**No.** Status: Not started (blocked by missing JDK 25 for native run; Docker image build/compose not executed in Phase 1 doc pass).
