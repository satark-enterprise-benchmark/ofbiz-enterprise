# Installation

Do **not** modify upstream sources for benchmark prep. Use official flows.

## A. Local JVM (official quick start)

Documented in root `README.md`:

1. Install JDK 25; set `JAVA_HOME`.
2. From repo root, initialize Gradle wrapper if needed: `./gradle/init-gradle-wrapper.sh`
3. Load data & prepare: `./gradlew cleanAll loadAll` (downloads deps; loads seed+demo — time-consuming).
4. Start: `./gradlew ofbiz` (exact task names per current README “Quick start” section).

> Startup was **not** executed on the documentation host (JDK missing).

## B. Docker image build

From `DOCKER.adoc` / root `Dockerfile`:

```bash
docker build --tag ofbiz-docker .
# or: docker build --target runtime --tag ofbiz-docker .
# demo preloaded: docker build --target demo --tag ofbiz-docker .
```

## C. Docker Compose + PostgreSQL example

Path: `docker/examples/postgres-demo/`

1. Build `ofbiz-docker` image (above).
2. Ensure host bind mount `./logs` writable by container uid (docs mention uid 1000).
3. `docker compose up` from that directory (compose file defines `db` + `ofbiz` services; ofbiz publishes `8443:8443`).

Env files ship example credentials (`ofbiz-postgres.env`, `postgres.env`) — treat as **demo secrets**, rotate for any shared environment.

## Plugins

`./pullPluginSource.sh` / `pullAllPluginsSource.sh` clone optional plugins — not required for core party/order/accounting entity inspection; not run during Phase 1.
