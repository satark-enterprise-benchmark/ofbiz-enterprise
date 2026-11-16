# OFBiz Enterprise — Phase 1 Benchmark Documentation

Satark AI Enterprise PII Benchmark preparation package for the Apache OFBiz framework fork.

| Field | Value |
|-------|-------|
| Fork org | https://github.com/satark-enterprise-benchmark/ofbiz-enterprise |
| Upstream | https://github.com/apache/ofbiz-framework |
| Baseline SHA | `fe96fcc0dcfa71cc3db87676bc179b11652ae798` (branch `trunk`) |
| Acquisition | 2026-11-16T21:10:24Z |
| License | Apache-2.0 |
| Purpose | Phase 1 architecture, data-store, and environment readiness for enterprise PII flow analysis |

## Document map

| Area | Path |
|------|------|
| Architecture | [architecture/](architecture/) |
| Database | [database/](database/) |
| Data flow | [data-flow/](data-flow/) |
| Environment | [environment/](environment/) |
| Diagrams | [diagrams/](diagrams/) |
| Scripts | [scripts/](scripts/) |
| Reports | [reports/](reports/) |
| Metadata | [repository-metadata.json](repository-metadata.json) |

## Quick facts (from source inspection)

- Java ERP built with Gradle; JDK **25** required (`README.md`, `build.gradle` source/target 25).
- Default DB: embedded **H2** via Entity Engine (`framework/entity/config/entityengine.xml`).
- Optional external RDBMS: PostgreSQL / MySQL (documented; Docker example under `docker/examples/postgres-demo/`).
- Core engines: Entity Engine, Service Engine (incl. job poller + optional JMS), Web MVC / Catalina.
- PII-rich applications: `party`, `order`, `accounting`, plus `humanres`, `marketing`.

## Environment readiness (this host)

| Checkpoint | Status |
|------------|--------|
| Inspected | Completed |
| Structure ready | Completed |
| Environment configured | Partial (Docker present; JDK 25 not available on inspection host) |
| Startup verified | Not started |

See [reports/environment-readiness.md](reports/environment-readiness.md).
