# Klarando Screen-Walls – Architekturvorbereitung (MVP-Plan)

## Ziel
2 bis 6 Displays zu einer synchronen Bildschirmwand koppeln (Menüboard-Wall), ohne lokale Drift und ohne manuelles Timing pro Gerät.

## 1) Datenmodell (Vorbereitung)
Geplante Modelle (additiv, keine destruktive Änderung):

### `ScreenWall`
- `id`
- `tenantId`
- `name`
- `layoutPreset` (`H_2X1`, `H_3X1`, `H_4X1`, `H_5X1`, `H_6X1`, später `G_2X2`, `G_3X2`)
- `columns`
- `rows`
- `timelineDurationSec`
- `startsAt`
- `isActive`
- `createdAt`
- `updatedAt`

### `ScreenWallMember`
- `id`
- `wallId`
- `displayId` (FK auf `DisplayDevice`)
- `positionIndex` (1..6)
- `row`
- `column`
- `assignedResolutionWidth`
- `assignedResolutionHeight`
- `syncStatus` (`OK`, `DRIFT`, `OFFLINE`, `UNASSIGNED`)
- `lastClockSyncAt`
- `createdAt`
- `updatedAt`

## 2) Sync-Logik (serverzeitbasiert)
Alle Geräte berechnen ihre Phase aus derselben Zeitbasis:

- `wallSessionId`: ID der aktiven Wand-Session
- `startsAt`: Startzeitpunkt (UTC)
- `timelineDurationSec`: Gesamtdauer eines Loops
- `phaseSec = (serverNow - startsAt) % timelineDurationSec`
- `frame = floor(phaseSec * fps)` (optional)

Damit startet keine Animation „lokal irgendwann“.

## 3) Virtuelles Canvas
Wand als ein großes logisches Canvas:

- Beispiel 3x FullHD: `5760 x 1080`
- Beispiel 4x FullHD: `7680 x 1080`

Jedes Display rendert nur den Ausschnitt:
- `viewportX = column * tileWidth`
- `viewportY = row * tileHeight`
- `viewportWidth = tileWidth`
- `viewportHeight = tileHeight`

## 4) Fallback-Strategie
- Wenn ein Display offline ist: andere laufen weiter.
- Admin erhält Warnung im Wall-Status.
- Bei Drift > Schwellwert (z. B. 350 ms): Device korrigiert Timeline hart/soft.
- Heartbeat enthält `lastClockSyncAt` und `syncOffsetMs`.

## 5) API-Verträge (Vorbereitung)
### Admin
- `POST /api/admin/displays/walls`
- `GET /api/admin/displays/walls`
- `GET /api/admin/displays/walls/:wallId`
- `PUT /api/admin/displays/walls/:wallId`
- `POST /api/admin/displays/walls/:wallId/members`
- `PUT /api/admin/displays/walls/:wallId/members/:memberId`
- `DELETE /api/admin/displays/walls/:wallId/members/:memberId`
- `POST /api/admin/displays/walls/:wallId/start`
- `POST /api/admin/displays/walls/:wallId/stop`

### Device
- `GET /api/display/wall-config` (per deviceToken)
- `POST /api/display/wall-sync` (offset/drift report)

## 6) Screen Studio UI (Vorbereitung)
Tab **Screen-Walls**:
- Wand erstellen
- Layout wählen (2x1 bis 6x1)
- Displays positionieren
- Sync-Status je Mitglied
- Vorschau Gesamtwand + Einzelviewport

## 7) Display-App Verhalten (Plan)
- erkennt `wallMember` in Content/Config
- rendert nur zugewiesenen Ausschnitt
- nutzt serverzeitbasierte Phase
- führt Drift-Check periodisch aus

## 8) Implementierungsreihenfolge
1. Prisma-Modelle + Migration (additiv)
2. Admin-API CRUD für Walls/Members
3. Device-Config Endpoint erweitern
4. Studio-Tab mit Wall-CRUD
5. Display-App: viewport rendering + sync correction
6. Preview-Simulator für Wall-Layouts
