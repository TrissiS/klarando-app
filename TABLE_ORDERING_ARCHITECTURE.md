# Table Ordering Architecture

## Ziel
Table Ordering als neues optionales Klarando-Modul vorbereiten, ohne bestehende Bestell-/Display-Flows zu brechen.

## Modul & Rechte
- Feature-Modul: `TABLE_ORDERING`
- Neue Permissions:
  - `TABLES_READ`
  - `TABLES_MANAGE`
  - `TABLE_ORDERS_READ`
  - `TABLE_ORDERS_MANAGE`
  - `SERVICE_CALLS_READ`
  - `SERVICE_CALLS_MANAGE`

## Datenmodell (Foundation)
Neue Modelle:
- `RestaurantArea`
- `RestaurantTable`
- `TableSession`
- `ServiceCall`

Order-Integration vorbereitet über optionale Felder:
- `Order.tableId`
- `Order.tableSessionId`

## API Foundation
`backend/src/routes/table-ordering.ts`
- `GET /api/table-ordering/areas`
- `POST /api/table-ordering/areas`
- `GET /api/table-ordering/tables`
- `POST /api/table-ordering/tables`
- `PATCH /api/table-ordering/tables/:id`
- `GET /api/table-ordering/session/:qrCodeToken`
- `POST /api/table-ordering/session/:qrCodeToken/start`
- `POST /api/table-ordering/session/:qrCodeToken/service-call`
- `POST /api/table-ordering/session/:qrCodeToken/payment-request`

## Sicherheit
- QR-Code Tokens werden zufällig erzeugt (`crypto.randomBytes`).
- Tenant-Admin-Routen laufen über Tenant-Scope und Permission Middleware.
- Service-Call rudimentär gegen Spam geschützt (Cooldown auf offene Calls).
- Öffentliche QR-Route liefert nur minimale Tisch-/Sessiondaten.

## Admin Workspace
Neue Foundation-Seite:
- `/admin/table-ordering`

Tabs (Foundation):
- Übersicht
- Räume/Bereiche
- Tische
- QR-Codes
- Service-Rufe
- Einstellungen

## Gastflow Foundation
Neue öffentliche Seite:
- `/table/:qrCodeToken`

Zeigt:
- Restaurant/Tisch/Bereich/Status
- vorbereitete Actions: Bestellung starten, Kellner rufen, Rechnung anfordern, Nachbestellen

## Display-Integration vorbereitet
Manifest-Felder:
- `tableOrderingEnabled`
- `qrOrderingEnabled`
- `callWaiterEnabled`

## Offene nächste Schritte
- Vollständiger Gast-Warenkorb + Checkout
- OrderDesk/Küche Live-Einblendung für Service-Calls
- Role-Seeding für neue Permissions
- Rate Limit pro Token/IP verfeinern
- Migration ausrollen und API-Tests ergänzen
