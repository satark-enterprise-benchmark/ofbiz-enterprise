# Application overview — Apache OFBiz

## What it is

Apache OFBiz is a Java enterprise resource planning (ERP) platform. The inspected tree is the **ofbiz-framework** trunk at baseline `fe96fcc0…`, forked as `satark-enterprise-benchmark/ofbiz-enterprise`.

It provides shared framework components plus base business applications for parties (customers/suppliers), products, orders, accounting, manufacturing, content, HR, and marketing.

## Repository layout (verified)

| Path | Role |
|------|------|
| `framework/` | Platform engines: `entity`, `service`, `webapp`, `catalina`, `security`, `common`, `minilang`, `widget`, `rest-api`, `start` |
| `applications/` | Business apps: `datamodel`, `party`, `order`, `accounting`, `product`, `manufacturing`, `content`, `humanres`, `marketing`, `workeffort`, `securityext`, `commonext` |
| `themes/` | UI themes (e.g. helveticus, rainbowstone) |
| `config/` | Build/checkstyle/codenarc config; `config/Trunk` |
| `docker/` | Dockerfile support scripts + `examples/postgres-demo` compose |
| `runtime/` | Runtime data/logs (generated; H2 files under `runtime/data/h2` when using default DB) |
| `build.gradle` / `gradlew` | Gradle build; Java 25 |

## User-facing surfaces

- HTTPS/HTTP webapps per component (Catalina embedded Tomcat). Default HTTP port property: `port.http=8080` in `framework/webapp/config/url.properties`; Docker example exposes **8443**.
- Webtools / entity and service browser for operators (`framework/webtools`).
- REST API component under `framework/rest-api` (OpenAPI-oriented docs present).

## PII-relevant business domains

1. **Party** — persons, organizations, contact mechanisms, roles (customer/supplier).
2. **Order** — order headers/items, order contact mechs, customer requests.
3. **Accounting** — invoices, payments, payment methods including encrypted credit-card fields.
4. **Security** — `UserLogin` and related auth entities.
5. **Humanres** — employee PII (entity model in `applications/datamodel/entitydef/humanres-entitymodel.xml`).

## Runtime model

Single JVM process loads enabled OFBiz components from `ofbiz-component.xml` descriptors. Services are invoked synchronously or scheduled via JobSandbox; Entity Engine maps XML entity models to RDBMS tables.
