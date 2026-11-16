# API / UI to database mapping

OFBiz does not use a single OpenAPI-only surface; most business writes go **Service → Entity**. Mapping below is derived from component layout and entity models (not from a live trace).

## Party domain

| Entry surface | Typical services / apps | Entities written/read |
|---------------|-------------------------|----------------------|
| `applications/party` webapp | Party/contact services under `servicedef/` | `Party`, `Person`, `PartyGroup`, `ContactMech`, `PostalAddress`, `TelecomNumber`, `PartyContactMech`, `PartyRole` |
| REST (`framework/rest-api`) | Service invocations exposed as REST | Same entities when party services are called |
| Webtools entity UI | Direct entity maintenance | Any entity (operator privilege) |

## Order domain

| Entry surface | Entities |
|---------------|----------|
| `applications/order` webapp + services | `OrderHeader`, `OrderItem`, `OrderRole`, `OrderContactMech`, `OrderItemShipGroup`, `CustRequest*` |

## Accounting domain

| Entry surface | Entities |
|---------------|----------|
| `applications/accounting` | `Invoice*`, `Payment*`, `PaymentMethod`, `CreditCard` (encrypted card number), `EftAccount`, `BillingAccount` |

## Security

| Entry surface | Entities |
|---------------|----------|
| Login / securityext | `UserLogin`, password history, related security entities |

## Notes for PII benchmarking

- Email often resides in `ContactMech.infoString` with type email, not always a dedicated Email entity row shape — confirm per contactMechType at runtime.
- `CreditCard.cardNumber`, `Person.socialSecurityNumber`, `Person.passportNumber`, `Person.mothersMaidenName` declare `encrypt="true"` in entity XML.
- Exact REST path → service name catalog: unavailable / requires further investigation (generate from running instance or parse `rest-api` + servicedef exhaustively).
