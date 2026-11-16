# Component inventory

Inventoried from top-level `framework/` and `applications/` directories at baseline SHA.

## Framework components

| Component | Path | Notes |
|-----------|------|-------|
| base | `framework/base` | Shared utilities |
| catalina | `framework/catalina` | Embedded Tomcat container |
| common | `framework/common` | Common entities/services |
| entity | `framework/entity` | Entity Engine core + `entityengine.xml` |
| entityext | `framework/entityext` | Entity extensions |
| minilang | `framework/minilang` | Simple-method DSL |
| resources | `framework/resources` | Shared resources/templates |
| rest-api | `framework/rest-api` | REST / OpenAPI surface |
| security | `framework/security` | UserLogin and security entities |
| service | `framework/service` | Service Engine, job poller, JMS |
| start | `framework/start` | Bootstrap |
| testtools | `framework/testtools` | Test support |
| webapp | `framework/webapp` | Web framework, URL props |
| webtools | `framework/webtools` | Operator tools |
| widget | `framework/widget` | Screen/form widgets |

## Application components

| Component | Path | PII relevance |
|-----------|------|---------------|
| datamodel | `applications/datamodel` | Authoritative entity XML for party/order/accounting/etc. |
| party | `applications/party` | Customers, suppliers, persons, contacts |
| order | `applications/order` | Orders, ship groups, cust requests |
| accounting | `applications/accounting` | Invoices, payments, cards (encrypted fields) |
| product | `applications/product` | Catalog; shipping addresses via order/party links |
| manufacturing | `applications/manufacturing` | Production; limited direct PII |
| content | `applications/content` | CMS; may store party content |
| humanres | `applications/humanres` | Employee PII |
| marketing | `applications/marketing` | Campaigns / contact lists |
| workeffort | `applications/workeffort` | Tasks/assignments |
| securityext | `applications/securityext` | Extended security |
| commonext | `applications/commonext` | Common extensions |

## Themes

`themes/helveticus`, `themes/rainbowstone`, `themes/common-theme` — presentation only.

## Docker / packaging

| Artifact | Path |
|----------|------|
| Dockerfile | repo root `Dockerfile` (multi-stage; targets include runtime/demo) |
| Entrypoint | `docker/docker-entrypoint.sh` |
| Postgres example | `docker/examples/postgres-demo/` |
| EntityEngine Postgres template | `docker/templates/postgres-entityengine.xml` |
