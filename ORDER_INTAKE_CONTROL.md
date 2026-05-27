# Order Intake Control

## Ziel
Filialbezogene Steuerung der Bestellannahme bei hoher Auslastung (Pause/Aktivierung), inklusive Backend-Enforcement beim Order-Create.

## Datenmodell (Business Settings JSON je Filiale/Tenant)
`orderIntake`:
- `orderIntakeEnabled: boolean`
- `orderIntakePausedReason: string | null`
- `orderIntakePausedUntil: ISO string | null`
- `orderIntakePausedByUserId: string | null`
- `orderIntakePausedAt: ISO string | null`
- `services`:
  - `deliveryEnabledNow: boolean`
  - `pickupEnabledNow: boolean`
  - `tableOrderingEnabledNow: boolean`

## API
Neue Branch-Route:
- `GET /api/branches/:branchId/order-intake-status`
- `PATCH /api/branches/:branchId/order-intake-status`

PATCH Payload (Beispiel):
```json
{
  "orderIntakeEnabled": false,
  "reason": "Aktuell sehr hohes Bestellaufkommen",
  "pausedUntil": "2026-05-27T22:30:00.000Z",
  "services": {
    "delivery": false,
    "pickup": false,
    "tableOrdering": true
  }
}
```

## Rechte
Vorbereitet im Permission-Enum:
- `ORDER_INTAKE_READ`
- `ORDER_INTAKE_MANAGE`

Hinweis: Für das Umschalten nutzt die neue Route aktuell `SETTINGS_WRITE` als sichere Rückwärtskompatibilität.

## UI-Orte
- Admin Dashboard: Statuskarte „Bestellannahme aktiv/pausiert“ mit Schnellschalter.
- API-Client-Funktionen:
  - `getBranchOrderIntakeStatus`
  - `updateBranchOrderIntakeStatus`

## Kundenmeldung
Im öffentlichen Tenant-Discovery und Katalog wird `orderIntake` mitgeliefert inkl. freundlicher `customerMessage`, wenn pausiert.

## Synchronisation
- Initial über bestehendes Dashboard-Refresh/Polling.
- Erweiterbar auf Polling 10–15s oder SSE/WebSocket.

## Backend-Enforcement (wichtig)
Beim `POST /api/orders` (App-Bestellungen):
- Wenn `orderIntakeEnabled=false` oder Service deaktiviert:
  - `423`
  - `code: ORDER_INTAKE_PAUSED`
  - freundliche Fehlermeldung + Service-Status im Response

## Audit
Bei PATCH wird ein Audit-Log-Eintrag geschrieben:
- Modul: `order-intake`
- Action: `order_intake_status_updated`
- inkl. vorher/nachher Status.
