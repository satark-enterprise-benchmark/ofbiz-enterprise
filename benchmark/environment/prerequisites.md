# Prerequisites

From `README.md` / `INSTALL` / Docker docs, plus host inspection.

## Required to build & run (official)

| Prerequisite | Version / notes | Host status (2026-11-17 inspection) |
|--------------|-----------------|-------------------------------------|
| JDK (full, not JRE only) | **25** per README/`build.gradle` (`INSTALL` text still mentions 17 — treat README/build as authoritative for trunk) | **Missing** — `/usr/bin/java` present but no usable JRE/JDK (`Unable to locate a Java Runtime`) |
| Gradle Wrapper | Bundled (`./gradlew`); may need `./gradle/init-gradle-wrapper.sh` first | Wrapper scripts present |
| Disk / RAM | Multi-GB heap recommended for Gradle (`org.gradle.jvmargs=-Xmx2g`) | Not measured |
| Network | First dependency resolve | Assumed available |

## Optional

| Prerequisite | When needed | Host status |
|--------------|-------------|-------------|
| Docker Engine | Container workflow / postgres-demo | **Present** — Docker 29.8.0 |
| Docker Compose | `docker/examples/postgres-demo` | Available with Docker |
| PostgreSQL | External DB without Docker | Not installed/verified |
| PowerShell ≥ 7.1.3 | Windows wrapper init only | N/A (macOS host) |
| OFBiz plugins sources | Extended apps | Not pulled |

## Benchmark scripts

Run from repo root:

```bash
./benchmark/scripts/check-prerequisites.sh
./benchmark/scripts/validate-environment.sh
./benchmark/scripts/environment-info.sh
```
