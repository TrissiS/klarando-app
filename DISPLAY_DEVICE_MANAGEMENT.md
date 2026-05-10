# Display Device Management (Klarando)

## Zielbild
Diese Erweiterung schafft eine zentrale Display-Geräteverwaltung für:
- Filialadmin (`/admin/display-devices`)
- Chainadmin (`/chainadmin/display-devices`)
- Superadmin (`/superadmin/display-devices`)

Ein Betrieb kann mehrere Display-Arten parallel verwalten (z. B. Menü, Küche, Abholnummern, Angebote).

## Bestehende Bausteine (wiederverwendet)

### Datenmodelle
- `OrderDisplay` (Bestell-Displays: Kasse/Küche/Abholung)
- `ScreenDevice` (Menü-/Werbe-Screens)
- `OrderDeskDeviceBinding` (gekoppelte OrderDesk-Geräte inkl. `lastSeenAt`)
- `OrderDeskPairingSession` (QR-Pairing-Basis)

### Relevante Routen
- `backend/src/routes/order-displays.ts`
  - Public Feed: `/api/order-displays/public/:displayCode/feed`
- `backend/src/routes/screen.ts`
  - Public Feed: `/api/screen/public/devices/:deviceCode/feed`
- `backend/src/routes/orderdesk-devices.ts`
  - Pairing + Bindings + Heartbeat

### Tenant-Sicherheit
- Zentrale Scope-Prüfung über `backend/src/lib/tenant-scope.ts` (`resolveTenantScope`)
- Alle neuen Admin-Display-Endpunkte prüfen Tenant-Zugriff serverseitig

## Neue API für Display-Verwaltung

### 1) Übersicht
`GET /api/access/displays/overview`

Filter:
- `tenantId`
- `chainId`
- `status` (`online|offline|inactive`)
- `displayType` (`MENU|OFFERS|PICKUP_NUMBERS|KITCHEN|ADVERTISING|MIXED`)
- `q`

Antwort enthält u. a.:
- `id` (`order:<uuid>` oder `screen:<uuid>`)
- `tenantId`, `chainId`
- `name`, `code`, `displayType`
- `isActive`
- `lastSeenAt`, `lastSyncAt`
- `deviceInfo`
- `status`
- `previewPath`
- `editablePath`
- `pairingSupported`

### 2) Vorschau-Preparation (rollen-/tenant-geschützt)
`GET /api/access/displays/:ref/preview`

- `:ref` ist `order:<id>` oder `screen:<id>`
- Liefert die freigegebene Vorschau-URL zurück
- Keine Fremd-Tenant-Vorschau möglich

### 3) Aktiv/Inaktiv schalten
`PATCH /api/access/displays/:ref/active`

Body:
```json
{ "isActive": false }
```

### 4) Pairing-Code neu erzeugen (MVP-Grundlage)
`POST /api/access/displays/:ref/pairing-code`

- Nur für `order:<id>`
- Erstellt neue `OrderDeskPairingSession`
- Liefert QR-URL + Pairing-Payload + Ablaufzeit

## Online/Offline-Erkennung

### Status-Regel
- `inactive`: `isActive=false`
- `online`: `isActive=true` und `lastSeenAt` jünger als 60 Sekunden
- `offline`: sonst

### Datenquellen
- `ScreenDevice.lastSeenAt` (wird im Public Screen Feed aktualisiert)
- `OrderDisplay`: `lastSeenAt` wird aus verbundenen `OrderDeskDeviceBinding.lastSeenAt` abgeleitet
- `lastSyncAt`:
  - Screen: `updatedAt`
  - OrderDisplay: letztes Binding-Update oder `display.updatedAt`

## Heartbeat-Erweiterung

### OrderDesk Heartbeat
`POST /api/orderdesk-devices/public/heartbeat`

Response erweitert um:
- `status`
- `serverTime`
- `displayId`
- `displayType`
- `recoveryHints`

### Screen/Public Feed
`GET /api/screen/public/devices/:deviceCode/feed`

Response erweitert um:
- `status`
- `serverTime`

### OrderDisplay/Public Feed
`GET /api/order-displays/public/:displayCode/feed`

Response erweitert um:
- `status`
- `serverTime`
- `displayType`

## UI-Seiten

Neu:
- `app/admin/display-devices/page.tsx`
- `app/chainadmin/display-devices/page.tsx`
- `app/superadmin/display-devices/page.tsx`
- Shared Panel: `app/Components/admin/DisplayDeviceManagementPanel.tsx`

Funktionen:
- Tabellenübersicht mit Status-Badges (grün/rot/grau)
- Filter: Status, Typ, Kette, Filiale, Suche
- Aktionen:
  - Vorschau öffnen
  - Bearbeiten
  - Aktivieren/Deaktivieren
  - Pairing-Code neu erzeugen (wenn unterstützt)
- Empty State: „Noch keine Displays gekoppelt.“

## Vorschau-Flow
1. Admin klickt „Vorschau öffnen“
2. Frontend ruft `GET /api/access/displays/:ref/preview` auf
3. Backend prüft Rolle + Tenant-Scope
4. Frontend öffnet die freigegebene URL in neuem Tab

## Sicherheitskonzept
- Kein ungeprüftes `tenantId` aus Frontend für kritische Zugriffe
- Scope-Prüfung über `resolveTenantScope`
- Rollen-/Tenant-Schutz auf allen neuen Display-Admin-Routen
- Device-Tokens werden in der Admin-Geräteverwaltung nicht angezeigt
- Deaktivierte Displays sind als `inactive` erkennbar und können zentral verwaltet werden

## Pairing-Stand (MVP)
- QR-Pairing für OrderDesk ist vorbereitet/aktiv
- „Pairing-Code neu erzeugen“ ist in der Geräteverwaltung verfügbar
- Vollständige neue Pairing-Architektur wurde bewusst nicht erzwungen

## Empfehlung Android TV Stick / Kiosk
Für stabile Display-Hardware im Pilot:
- Android TV / Android Box mit Auto-Start im Kiosk-Browser
- feste URL pro Display (`/screen/<code>` oder `/order-display/<code>`)
- WLAN + Fallback-Mobilfunk, falls möglich
- Screen-On/Power-Management deaktivieren
- Watchdog/Autoreload im Browser aktivieren

## Offene nächste Schritte
- Optionale eigene Heartbeat-Route speziell für OrderDisplay-Geräte (ohne OrderDesk)
- Optionales `displayType` als persistentes Feld in DB (statt Name/Role-Heuristik)
- Offline-Cache für Screen-/Order-Feeds (späterer Ausbau)
- optionales Push-/Realtime-Monitoring für Statuswechsel in Admin-Dashboards
