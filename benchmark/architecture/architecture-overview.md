# Architecture overview

## Pattern

**Modular monolith**: one deployable OFBiz instance composed of framework + application components. Cross-cutting engines:

1. **Entity Engine** (`framework/entity`) — declarative entity XML → JDBC persistence, delegators, datasources.
2. **Service Engine** (`framework/service`) — service definitions, ECAs, job poller, optional JMS engine.
3. **Web / Widget / Catalina** (`framework/webapp`, `framework/widget`, `framework/catalina`) — request controllers, screens, forms, embedded Tomcat.
4. **Security** (`framework/security`, `applications/securityext`) — logins, permissions, login history.

## Component load

- Root markers: `framework/component-load.xml`, `applications/component-load.xml`.
- Each component declares resources (entity models, services, webapps, data) in `ofbiz-component.xml`.
- `applications/datamodel` holds the consolidated business entity definitions used by base apps.

## Data & control flow (high level)

```
Browser / API client
    → Catalina / webapp controller
        → Service Engine (business logic)
            → Entity Engine (CRUD)
                → JDBC datasource (H2 default | Postgres/MySQL)
```

Async path: Service Engine job poller reads `JobSandbox` (and related entities) and executes deferred/async services. Optional JMS service engine publishes/consumes via configured JNDI destinations (`serviceengine.xml`).

## Multi-database groups

Default delegator maps three logical groups (see `entityengine.xml`):

| Group | Purpose (typical) | Default datasource |
|-------|-------------------|--------------------|
| `org.apache.ofbiz` | Main transactional data | `localh2` |
| `org.apache.ofbiz.olap` | OLAP / analytics | `localh2olap` |
| `org.apache.ofbiz.tenant` | Tenant-related | `localh2tenant` |

Docker Postgres demo uses three Postgres databases (`ofbizmaindb`, `ofbizolapdb`, `ofbiztenantdb`).

## External integrations

- Email, payment gateways, and third-party libs appear as runtime dependencies (`dependencies.gradle`); specific live integrations were not exercised.
- Optional plugins live in a separate OFBiz plugins repo (`pullPluginSource.sh`) — **not present** in this clone.
