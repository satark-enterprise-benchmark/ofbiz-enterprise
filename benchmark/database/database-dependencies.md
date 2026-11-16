# Database dependencies

## Application → database

| Consumer | Depends on | How |
|----------|------------|-----|
| Entity Engine | JDBC datasource(s) | `entityengine.xml` delegator group-map |
| Service Engine | Entity Engine | Services read/write entities; jobs stored in DB |
| Webapps | Service + Entity | Controllers call services |
| Webtools | Entity Engine | Direct entity maintenance UI |
| Gradle `loadAll` / data load | Entity Engine | Seed/demo XML imports |

## Driver / library dependencies

- H2: `runtimeOnly libs.h2` in `dependencies.gradle` (bundled for default).
- PostgreSQL/MySQL drivers: Docker entrypoint can download drivers unless `OFBIZ_SKIP_DB_DRIVER_DOWNLOAD` is set (`DOCKER.adoc`). Exact local jar presence after clean clone: not present until build/docker init.

## Operational dependencies

| Need | Default path | Alternate |
|------|--------------|-----------|
| Schema create/update | Entity Engine check/load on start + `gradlew loadAll` | Docker `OFBIZ_DATA_LOAD=seed|demo` |
| Credentials | Password-lookup keys in entityengine for H2; env files for Postgres demo | Manual entityengine.xml edit |
| Backups | unavailable / requires further investigation | DBA practice outside OFBiz |

## Cascading failure notes

- If main datasource is down, services and webapps fail closed on persistence.
- OLAP/tenant datasources are separate; partial outage behavior unavailable / requires further investigation.
