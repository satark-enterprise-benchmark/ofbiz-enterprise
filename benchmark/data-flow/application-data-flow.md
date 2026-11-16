# Application data flow

## Synchronous request path

1. Client hits component webapp (HTTP/HTTPS) or REST endpoint.
2. OFBiz controller / event maps request to a **service** or screen action.
3. Service Engine validates permissions and executes Java/Groovy/minilang implementation.
4. Implementation uses **delegator** APIs to create/store/find entities.
5. Entity Engine issues SQL through the configured datasource helper.
6. Response rendered via widget/FreeMarker or JSON for REST.

## Party / customer onboarding (logical)

```
UI form (party webapp)
  → create/update party + person services
    → insert Party, Person
    → create ContactMech + PostalAddress / TelecomNumber / email infoString
    → PartyContactMech + purpose (e.g. PRIMARY_EMAIL, SHIPPING_LOCATION)
    → PartyRole (CUSTOMER / SUPPLIER / …)
```

## Order placement (logical)

```
Order UI / API
  → order services
    → OrderHeader + OrderItem
    → OrderRole → customer Party
    → OrderContactMech → shipping/billing ContactMech (PII)
    → inventory/accounting follow-on services (may create Invoice/Payment)
```

## Authentication

```
Login form → security services → UserLogin entity lookup
  → session established in web layer
  → subsequent services enforce security permissions
```

## Demo / seed data

`gradlew loadAll` (or Docker `OFBIZ_DATA_LOAD=demo`) imports XML datasets from component `data/` folders into the Entity Engine, populating sample parties, products, and orders (PII-like demo values).
