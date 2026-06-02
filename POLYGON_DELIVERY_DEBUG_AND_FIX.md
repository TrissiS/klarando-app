# Polygon Delivery Debug And Fix

## Problem

Ein Kunde befindet sich innerhalb des definierten Polygon-Liefergebiets, die Customer App zeigt aber trotzdem:

- `Laden geschlossen`
- oder `Bestellung nicht möglich`

Die Ursache war eine uneinheitliche Entscheidungslogik zwischen:

- `GET /api/tenants/public/discovery`
- `POST /api/orders`
- Öffnungszeiten / Delivery-Hours / Ordering-Settings
- Order-Intake-Flags
- Service-Area-Prüfung

## Relevante Stellen

- `backend/src/lib/business-settings.ts`
  - `matchServiceArea(...)`
  - entscheidet über Polygon / Radius / PLZ / Ausschlüsse
- `backend/src/lib/ordering-availability.ts`
  - `getTenantOrderingAvailabilityFromSettings(...)`
  - entscheidet über `isOpen`, `canOrderNow`, `canPreorder`
- `backend/src/routes/tenant.ts`
  - `GET /api/tenants/public/discovery`
- `backend/src/routes/orders.ts`
  - `POST /api/orders`
- `app/Components/admin/ServiceAreaEditor.tsx`
  - Pflege von Polygon / Radius / PLZ-Regeln

## Hauptursache

Die Discovery-Route hat die Lieferbarkeit bisher mit einer separaten `deliveryScheduling`-Logik bewertet, statt dieselbe Öffnungs-/Bestelllogik wie die eigentliche Bestellstrecke zu verwenden.

Dadurch konnte folgendes passieren:

- Polygon-Treffer = `ja`
- Betrieb real geöffnet = `ja`
- Discovery meldet trotzdem `OUTSIDE_SCHEDULE`
- Customer App zeigt daraus `Geschlossen / aktuell keine Bestellannahme möglich`

## Fix

Die Discovery-Route nutzt jetzt zusätzlich dieselbe zentrale Bestellbarkeitslogik aus:

- `getTenantOrderingAvailabilityFromSettings(settings, 'DELIVERY', now)`
- `getTenantOrderingAvailabilityFromSettings(settings, 'PICKUP', now)`

Damit wird jetzt konsistent berücksichtigt:

- Öffnungszeiten
- Delivery-Hours
- Ordering-Settings
- Order-Intake-Status
- Service-Area-Match

## Neue Debug-Ausgabe

### Discovery-Logs

`PUBLIC_BRANCH_SEARCH_DELIVERY_CHECK`

Enthält jetzt zusätzlich:

- `customerLat`
- `customerLng`
- `matchedByZip`
- `matchedByRadius`
- `matchedByPolygon`
- `openingStatus.isOpen`
- `openingStatus.canOrderNow`
- `openingStatus.canPreorder`
- `openingStatus.nextAvailableTime`
- `openingStatus.message`
- `orderIntakeEnabled`
- `deliveryEnabledNow`
- `rejectionReason`

### Order-Submit-Logs

`DELIVERY_VALIDATION_ACTIVE_PATH`

Enthält jetzt zusätzlich:

- `matchedByZip`
- `matchedByRadius`
- `matchedByPolygon`
- `openingStatus.isOpen`
- `openingStatus.canOrderNow`
- `openingStatus.canPreorder`
- `openingStatus.nextAvailableTime`
- `openingStatus.message`
- `orderIntakeEnabled`
- `deliveryEnabledNow`
- `rejectionReason`

### API-Responses

Discovery liefert unter `services.delivery.debug` und `services.pickup.debug` jetzt zusätzlich:

- `customerLatitude`
- `customerLongitude`
- `matchedByZip`
- `matchedByRadius`
- `matchedByPolygon`
- `openingStatus`
- `canOrderNow`
- `canPreorder`
- `orderIntakeEnabled`
- `serviceEnabledNow`
- `rejectionReason`
- `debugMessage`

Fehlerantworten von `POST /api/orders` liefern unter `debug` jetzt ebenfalls die relevante Diagnose zurück.

## Ablehnungsgründe

Aktuell verwendete Debug-Reasons:

- `LOCATION_REQUIRED`
- `CONFIG_PENDING`
- `OUT_OF_AREA`
- `ORDER_INTAKE_PAUSED`
- `SERVICE_DISABLED_NOW`
- `PREORDER_ONLY`
- `CLOSED`
- `OUTSIDE_SCHEDULE`
- `MISSING_COORDINATES`

## Erwartetes Verhalten nach dem Fix

Wenn:

- Kunde im Polygon liegt
- keine Ausschluss-PLZ / Ausschluss-Straße greift
- Betrieb geöffnet ist
- Delivery-Service jetzt bestellbar ist
- Order-Intake nicht pausiert ist

dann muss:

- Discovery `services.delivery.available = true` liefern
- die Customer App Lieferung anbieten
- `POST /api/orders` die Bestellung zulassen

## Noch gezielt prüfen bei Live-Diagnose

Falls weiterhin ein Betrieb fälschlich als geschlossen erscheint:

1. `services.delivery.debug.rejectionReason`
2. `services.delivery.debug.debugMessage`
3. `matchedByPolygon`
4. `openingStatus`
5. `orderIntakeEnabled`
6. `serviceEnabledNow`

Damit lässt sich direkt erkennen, ob das Problem aus:

- Polygon
- Radius
- PLZ
- Öffnungszeiten
- Order-Intake
- oder einer unvollständigen Standortauflösung kommt.
