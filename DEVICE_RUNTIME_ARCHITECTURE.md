# Device Runtime Architecture

Stand: 2026-05-24

## 1) Gerätetypen
- Displays (TV-Stick / Browser unter `/screen/[deviceCode]`)
- OrderDesk-Geräte
- Fahrergeräte
- (vorbereitet) POS-Geräte

## 2) Pairing
- Display-Pairing läuft über `/api/display/pairing/*` (Legacy/Compat).
- Bestehende `deviceCode`-Links bleiben kompatibel.
- Zielbild: einheitlicher Pairing-Fähigkeitslayer pro Gerätetyp.

## 3) Runtime
- **Primary Runtime Endpoint:** `GET /api/display-runtime/:deviceCode`
- Zweck: zentrale Runtime-Auslieferung für Display-App.
- Enthält zukünftig konsolidiert:
  - `layoutSettings`
  - `brandingSettings`
  - `offlineSettings`
  - `easyOrderSettings`
  - `contentSettings`
  - `runtimeConfig`

## 4) Online/Offline
- Display-App nutzt Offline-Snapshot und Fallback-Rendering.
- Bei Verbindungsproblemen bleibt letzter gültiger Stand sichtbar.
- Heartbeats laufen weiterhin gegen bestehende Display-Endpunkte.

## 5) API-Klassen

### Primary
- `GET /api/display-runtime/:deviceCode`

### Legacy / Compat
- `GET /api/display/content`
- `/api/display/pairing/*`

### Internal / Admin
- `/api/admin/displays/*`
- `/api/screen/*`

## 6) Konsolidierungsplan
1. Neue Features zuerst auf Primary Runtime anbinden.
2. Legacy-Endpunkte kompatibel halten, intern auf gleiche Builderlogik führen.
3. Geräteaktionen je Typ über Capability-Matrix einheitlich absichern.
4. Nicht unterstützte Aktionen im UI klar deaktivieren (kein toter Klick).
