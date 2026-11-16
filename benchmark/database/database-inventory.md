# Database inventory

## Default (framework config)

Configured in `framework/entity/config/entityengine.xml`:

| Datasource name | Engine | JDBC URI (summary) | User |
|-----------------|--------|--------------------|------|
| `localh2` | H2 | `jdbc:h2:file:./runtime/data/h2/ofbiz;… SCHEMA OFBIZ` | `ofbiz` |
| `localh2olap` | H2 | Separate H2 schema/file for OLAP group | ofbiz olap user via password-lookup |
| `localh2tenant` | H2 | Tenant group | tenant password-lookup |
| Additional H2 variants | H2 | e.g. `localh2odbc` | present in same file |

Field-type loaders registered for: `h2`, `mysql`, `postgres`.

## Docker Postgres demo

`docker/examples/postgres-demo/` provisions three databases (from env files):

| DB name | App user | Role |
|---------|----------|------|
| `ofbizmaindb` | `ofbiz` | Main |
| `ofbizolapdb` | `ofbizolap` | OLAP |
| `ofbiztenantdb` | `ofbiztenant` | Tenant |

Postgres image: `postgres:13`. Superuser password set via `POSTGRES_PASSWORD` in `postgres.env`.

## Schema ownership

Business tables are **not** maintained as hand-written SQL migrations. They are generated/updated by the Entity Engine from XML entity models under:

- `applications/datamodel/entitydef/*-entitymodel.xml`
- `framework/*/entitydef/entitymodel.xml`

## PII-bearing logical stores

| Store | PII classes |
|-------|-------------|
| Main DB / `org.apache.ofbiz` | Person names, DOB, SSN/passport (encrypted fields), addresses, phones, emails, UserLogin, payment cards |
| OLAP DB | Analytical copies — exact PII projection unavailable / requires further investigation |
| Tenant DB | Multi-tenant related data — exact PII projection unavailable / requires further investigation |
