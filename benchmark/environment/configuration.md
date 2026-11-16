# Configuration

## Primary config files

| File | Purpose |
|------|---------|
| `framework/entity/config/entityengine.xml` | Datasources, delegators, field types |
| `framework/service/config/serviceengine.xml` | Engines, thread pools, JMS |
| `framework/service/config/service.properties` | e.g. `enableJMS` |
| `framework/webapp/config/url.properties` | HTTP/HTTPS ports, URL prefixes |
| `framework/security/config/*` | Security properties |
| `gradle.properties` | Gradle JVM args |
| `docker/templates/postgres-entityengine.xml` | Postgres-oriented entityengine template for containers |

## Docker environment variables

From `DOCKER.adoc` / entrypoint:

| Variable | Default | Meaning |
|----------|---------|---------|
| `OFBIZ_ADMIN_USER` | admin | Admin username |
| `OFBIZ_ADMIN_PASSWORD` | ofbiz | Admin password |
| `OFBIZ_DATA_LOAD` | seed | `none` / `seed` / `demo` |
| `OFBIZ_HOST` | empty | Host header / allowed host |
| `OFBIZ_CONTENT_URL_PREFIX` | empty | Content URL prefix |
| `OFBIZ_ENABLE_AJP_PORT` | empty | Enable AJP if set |
| `OFBIZ_SKIP_INIT` | empty | Skip container init |
| `OFBIZ_SKIP_DB_DRIVER_DOWNLOAD` | empty | Skip JDBC driver download |
| `OFBIZ_DISABLE_COMPONENTS` | empty | Comma-separated component paths to disable |

Postgres demo adds `OFBIZ_POSTGRES_*` DB names/users/passwords.

## Benchmark note

Prefer documenting and using upstream configs. No `benchmark/environment/docker-compose.benchmark.yml` was added because a suitable compose example already exists upstream.
