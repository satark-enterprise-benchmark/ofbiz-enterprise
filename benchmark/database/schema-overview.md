# Schema overview (entity models)

Authoritative models live primarily in `applications/datamodel/entitydef/`.

## Party / contact (high PII)

Source: `party-entitymodel.xml`

| Entity | Key fields / notes |
|--------|--------------------|
| `Party` | Root party id; person vs group |
| `Person` | `firstName`, `lastName`, `birthDate`, `gender`, `socialSecurityNumber` (encrypt), `passportNumber` (encrypt), `mothersMaidenName` (encrypt), etc. |
| `PartyGroup` | Organization name fields |
| `ContactMech` | Generic contact id + `infoString` (email often stored here) |
| `PostalAddress` | `address1/2`, `city`, `postalCode`, geo ids, `toName` |
| `TelecomNumber` | `countryCode`, `areaCode`, `contactNumber` |
| `PartyContactMech` | Links party ↔ contact mech with dates/roles |
| `PartyRole` | Customer/supplier/etc. roles |

## Security

Source: `framework/security/entitydef/entitymodel.xml`

| Entity | Notes |
|--------|-------|
| `UserLogin` | `userLoginId`, `currentPassword`, locale/timezone, lockout fields, LDAP DN |
| Password history / session related entities | Adjacent entities in same model |

## Order

Source: `order-entitymodel.xml`

| Entity | PII link |
|--------|----------|
| `OrderHeader` / `OrderItem` | Commercial data; party via roles |
| `OrderRole` | Party roles on order |
| `OrderContactMech` / `OrderItemContactMech` | Shipping/billing contacts |
| `CustRequest*` | Customer request communications |

## Accounting / payments

Source: `accounting-entitymodel.xml`

| Entity | Notes |
|--------|-------|
| `Invoice*` / `Payment*` | Financial docs linked to parties |
| `BillingAccount` | Billing relationships |
| `CreditCard` | `cardNumber` encrypt=true; name-on-card fields; billing `contactMechId` |
| `EftAccount` / `GiftCard` | Payment method variants |

## Human resources

`humanres-entitymodel.xml` — employment/person-adjacent entities; treat as PII-sensitive. Detailed field audit: unavailable / requires further investigation beyond inventory.

## Relationships (simplified)

```
Party 1─1 Person | PartyGroup
Party 1─* PartyContactMech *─1 ContactMech
ContactMech 1─0..1 PostalAddress | TelecomNumber
Party 1─* PartyRole
OrderHeader 1─* OrderRole → Party
OrderHeader 1─* OrderContactMech → ContactMech
PaymentMethod 1─0..1 CreditCard → ContactMech (billing address)
UserLogin (security) associated to Party via views/services
```
