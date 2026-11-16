# Repository assessment — ofbiz-enterprise

## Summary

Fork of Apache OFBiz framework trunk is suitable for Phase 1 PII benchmarking: rich party/order/accounting entity models, clear Entity/Service/Web architecture, and an official Docker + Postgres example.

## Strengths

- Explicit encrypted PII fields (`socialSecurityNumber`, `passportNumber`, `CreditCard.cardNumber`, etc.).
- Central datamodel component simplifies schema inventory.
- Default H2 path enables eventually-simple local bring-up once JDK 25 is available.
- Docker documentation (`DOCKER.adoc`) and postgres-demo compose are first-class.

## Risks / gaps

- Trunk targets JDK 25 — newer than many enterprise images; host lacked Java.
- `INSTALL` still mentions JDK 17 (doc drift vs README/build).
- Plugins not included; some ERP PII flows may live in plugins.
- Startup not verified in Phase 1.

## Recommendation

Proceed to Phase 2 (environment bring-up) after installing JDK 25; prefer H2 demo first, then postgres-demo for multi-DB realism.
