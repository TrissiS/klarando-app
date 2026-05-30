# Marketing Actions & Coupons Separation

## Unterschied
- **Aktionen**: Produkt-/Menue-Angebote mit Zeitfenster, Produktzuordnung und Display/App-Sichtbarkeit (`/admin/actions`, `/api/actions`)
- **Gutscheine**: Checkout-Rabattcodes mit Code-Logik, Limits und Gueltigkeit (`/admin/coupons`, `/api/coupons`)

## Datenmodell
- Bestehend: `Action`, `ActionProduct`
- Neu: `Coupon`
  - `code`, `name`, `description`
  - `discountType` (`PERCENT`, `AMOUNT`, `FREE_DELIVERY`)
  - `discountValueCents`, `discountPercent`
  - `minOrderValueCents`, `maxUses`, `maxUsesPerCustomer`, `usedCount`
  - `validFrom`, `validUntil`, `appliesToOrderType`, `newCustomersOnly`, `isActive`

## UI-Struktur
- `/admin/marketing`: Uebersicht mit getrennten Schnellaktionen
- `/admin/actions`: nur Aktionskampagnen
- `/admin/coupons`: nur Gutscheinverwaltung (eigene Form + Liste)

## API
- Aktionen unveraendert: `/api/actions`, `/api/actions/active`
- Gutscheine neu:
  - `GET /api/coupons`
  - `POST /api/coupons`
  - `PATCH /api/coupons/:id`
  - `DELETE /api/coupons/:id`
  - `POST /api/coupons/validate`

## Checkout-Status
- `POST /api/coupons/validate` ist fuer die Pruefung vorbereitet.
- Finale Checkout-Verrechnung ist **noch nicht** produktiv verdrahtet.

## Tests
- Coupon CRUD im Admin
- Coupon Validate API
- Trennung der Navigation (Aktionen vs. Gutscheine)
