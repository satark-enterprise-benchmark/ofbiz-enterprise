# Dependency map

## Build-time

- Gradle resolves libraries declared in `dependencies.gradle` (version catalog via Gradle libs).
- Subprojects auto-included from active OFBiz components (`settings.gradle` → `activeComponents()`).

## Runtime component dependencies (logical)

```
start / catalina
  ├── webapp + widget + themes
  ├── security (+ securityext)
  ├── service ──► entity ──► JDBC (H2 | Postgres | MySQL)
  ├── common / commonext
  └── applications/*
        ├── datamodel (entity XML SoT for business tables)
        ├── party
        ├── order ──► party, product, accounting (via services/entities)
        ├── accounting ──► party, order
        └── product / manufacturing / content / humanres / marketing / workeffort
```

## External system dependencies

| Dependency | Required for local demo? | Notes |
|------------|--------------------------|-------|
| JDK 25 | Yes | Not found on documentation host |
| Network (Gradle deps) | First build | Can use offline mode after cache warm |
| H2 | Default — embedded | No separate process |
| PostgreSQL 13 image | Only for Docker postgres-demo | `docker/examples/postgres-demo` |
| JMS broker | No (optional) | Config present; broker provisioning unavailable / requires further investigation |

## Docker image dependency

Compose example expects a locally built `ofbiz-docker` image (`docker build` per `DOCKER.adoc`), plus `postgres:13`.
