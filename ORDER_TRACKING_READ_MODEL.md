# ORDER_TRACKING_READ_MODEL

## Ziel
- Ein zentrales serverseitiges Read-Model fuer Bestell- und Liefertracking bereitstellen.
- Standardstatus und Timeline kommen primaer aus stabilen `Order`-/`OrderItem`-Feldern.
- AuditLogs ergaenzen nur noch Zusatzinfos wie Fahrerposition, Beschwerden und Signaturen.

## Zentrale Datei
- `backend/src/lib/order-tracking-read-model.ts`

## Hauptfunktion
- `buildOrderTrackingReadModel(order)`

## Gelieferte Felder
- `orderId`
- `publicTrackingCode`
- `orderStatus`
- `paymentStatus`
- `productionStatus`
- `deliveryType`
- `assignedDriverId`
- `assignedDriverName`
- `acceptedAt`
- `estimatedReadyAt`
- `driverAssignedAt`
- `driverDepartedAt`
- `deliveredAt`
- `completedAt`
- `canceledAt`
- `customerVisibleStatus`
- `customerVisibleLabel`
- `timeline[]`

## Statusableitung
- `orderStatus`
  - direkt aus `Order.status`
- `paymentStatus`
  - direkt aus `Order.paymentStatus`
- `productionStatus`
  - wenn `Order.items[].productionStatus` vorhanden:
    - alle `DONE` -> `DONE`
    - mindestens ein `DONE` -> `IN_PROGRESS`
    - sonst -> `PENDING`
  - ohne Itemdaten fallback ueber `Order.status`

## Customer-visible Status
- `pending_payment` -> `Zahlung ausstehend`
- `open` -> `Bestellung angenommen`
- `preparing` -> `In Zubereitung`
- `out_for_delivery` -> `Fahrer unterwegs` oder `Bereit`
- `done`
  - `DELIVERY` -> `Geliefert`
  - `PICKUP` -> `Abholbereit`
  - sonst -> `Abgeschlossen`
- `archived`
  - wird heuristisch in `Geliefert`, `Abgeschlossen` oder `Storniert` eingeordnet

## Timeline-Regeln
- `received`
  - aus `createdAt`
- `accepted`
  - aus `acceptedAt` oder abgeleitetem Fortschritt
- `processing`
  - aus `forwardedToKitchenAt` bzw. Fortschritt
- `preparing`
  - aus Item-/Order-Fortschritt
- `driver_assigned`
  - aus `assignedDriverId` / `assignedDriverName` / `driverAssignedAt`
- `out_for_delivery`
  - aus `driverDepartedAt` oder Statusfortschritt
- `delivered`
  - aktuell best effort fuer Lieferbestellungen
- `completed`
  - aktuell best effort fuer nicht-Lieferbestellungen
- `cancelled`
  - aktuell best effort fuer archivierte, nicht abgeschlossene Bestellungen

## Umgestellte APIs
- `GET /api/orders/:orderId/live-tracking`
  - nutzt jetzt `trackingReadModel`
  - liefert zusaetzlich:
    - `trackingReadModel`
    - `customerVisibleStatus`
    - `customerVisibleLabel`
    - `timeline`
- `GET /api/orders/driver/assigned`
  - liefert pro Order zusaetzlich `trackingReadModel`

## AuditLog-Nutzung
- Bleibt erhalten fuer:
  - Fahrerpositionen
  - Beschwerden
  - Signaturen
- AuditLogs sind nicht mehr die Primaerquelle fuer Standard-Trackingstatus.

## Bekannte Grenzen
- Es existieren aktuell keine dedizierten persistierten Felder fuer:
  - `deliveredAt`
  - `completedAt`
  - `canceledAt`
- Diese Felder werden daher derzeit nur defensiv/best-effort abgeleitet.
- Beschwerden und Signaturen bleiben vorerst auditlogbasiert.
- Es wurde bewusst keine Realtime-Schicht und keine Migration eingefuehrt.
