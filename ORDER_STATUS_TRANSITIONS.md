# Order Status Transitions

## Statusmodell

### Order.status

- `pending_payment`
- `open`
- `preparing`
- `out_for_delivery`
- `done`
- `archived`

### OrderItem.productionStatus

- `OPEN`
- `DONE`

### Order.paymentStatus

- `UNPAID`
- `PAID`
- `FAILED`
- `REFUNDED`

## Erlaubte Übergänge

### Order.status

- `pending_payment -> open, preparing, out_for_delivery, done, archived`
- `open -> pending_payment, preparing, out_for_delivery, done, archived`
- `preparing -> open, done, out_for_delivery, archived`
- `out_for_delivery -> preparing, done, archived`
- `done -> archived`
- `archived ->` keine weiteren Übergänge

### OrderItem.productionStatus

- `OPEN -> DONE`
- `DONE -> OPEN`

### Order.paymentStatus

- `UNPAID -> PAID, FAILED`
- `FAILED -> PAID`
- `PAID -> REFUNDED`
- `REFUNDED ->` keine weiteren Übergänge

## Zentrale Logik

Datei:

- [backend/src/lib/order-status-transitions.ts](C:\Users\Tristan%20Stenger\Documents\New%20project\klarando\klarando-app\backend\src\lib\order-status-transitions.ts)

Enthält:

- Status-Konstanten
- Normalisierung
- Transition-Validierung
- Builder für:
  - Order-Statuswechsel
  - Item-Statuswechsel
  - Zahlungsstatuswechsel
  - Annahme mit ETA
  - Dispatch an Fahrer
  - Ableitung `Order.status` aus Item-Status

## Umgestellte Routen

### backend/src/routes/orders.ts

- `POST /api/orders/driver/route-start`
- `POST /api/orders/driver/orders/:orderId/mark-paid`
- `POST /api/orders/:orderId/dispatch`
- `PATCH /api/orders/:orderId/status`

### backend/src/routes/order-displays.ts

- `POST /api/order-displays/public/:displayCode/orders/:orderId/status`
- `POST /api/order-displays/public/:displayCode/orders/:orderId/items/:itemId/status`
- `POST /api/order-displays/public/:displayCode/orders/:orderId/payment`
- `POST /api/order-displays/public/:displayCode/orders/:orderId/accept`
- `POST /api/order-displays/public/:displayCode/orders/:orderId/dispatch`

### Payment-Callbacks

- `POST /api/payments/paypal/...capture...`
- `POST /api/webhooks/stripe`

Diese Pfade verwenden jetzt ebenfalls die zentrale Zahlungsstatus-Transition.

## Bewusst nicht umgestellte Bereiche

- Order-Erstellung in `orders.ts` und `order-terminals.ts`
  - setzt Initialzustände beim Anlegen, keine operative Transition
- reine Lese- und Tracking-Endpunkte
  - Customer-Tracking
  - Driver-Assigned-Read-Model
  - Display-Feeds
- Billing-/Finance-Auswertungen
  - lesen Status, ändern sie aber nicht

## Wichtige Regeln

- Keine Route soll Statuswerte mehr frei als beliebige Strings schreiben.
- Ungültige Übergänge liefern `409`.
- Ungültige Statuswerte liefern `400`.
- Bestehende sinnvolle Kernabläufe bleiben erlaubt:
  - Kassendisplay-Annahme
  - Kassendisplay-Dispatch
  - Fahrer-Route-Start
  - Fahrer-Barzahlung
  - Item-Fortschritt `OPEN <-> DONE`

## Typische jetzt blockierte Fehlerfälle

- `archived -> open`
- `done -> preparing`
- `REFUNDED -> PAID`
- unbekannte Statusstrings wie `finished`, `paid`, `delivered_now`

