# Auto-Update Strategie (Klarando OrderDesk)

Stand: 2026-05-04

## Ziel

Klarando OrderDesk soll aktualisiert werden, ohne dass lokale Daten (Einstellungen, Queue, Cache) verloren gehen.

## Harte Voraussetzungen fuer Daten-Erhalt

1. `applicationId` bleibt gleich.
2. APKs sind immer mit demselben Release-Keystore signiert.
3. `versionCode` steigt bei jedem Release.
4. Kein Deinstallieren fuer Updates.

Wenn diese 4 Punkte eingehalten werden, bleiben App-Daten bei Update erhalten.

## Verfuegbare Update-Wege

### A) Empfohlen fuer Filialbetrieb: MDM / Android Enterprise (Device Owner)

- Echte stille Updates moeglich.
- Keine Bediener-Interaktion.
- Beste Loesung fuer viele Geraete.

### B) Private App ueber Managed Google Play

- Automatische Verteilung durch Play.
- Sehr stabiler Rollout-Prozess.
- Ebenfalls daten-sicher bei korrektem Signing.

### C) In-App Update via APK-Link (hier vorbereitet)

- App prueft Manifest unter `/api/mobile-updates/<appKey>`.
- Zeigt neues Release an (`Update pruefen`).
- Installationsstart kann je nach Geraete-Policy Benutzerbestaetigung brauchen.

## Bereits umgesetzt

- Backend-Manifest Endpoints:
  - `GET /api/mobile-updates/cashier` (OrderDesk-Kanal)
  - `GET /api/mobile-updates/driver`
  - `GET /api/mobile-updates/customer`
  - Dateien:
    - `C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app\backend\mobile-updates\cashier-stable.json`
    - `C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app\backend\mobile-updates\driver-stable.json`
    - `C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app\backend\mobile-updates\customer-stable.json`
  - Route: `C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app\backend\src\routes\mobile-updates.ts`
- Flutter:
  - API Modell + Fetch: `fetchMobileUpdateManifest(...)`
  - UI Button: `Update pruefen` in Klarando OrderDesk, Fahrer- und Kunden-App

## Release-Ablauf (Template)

1. Neue Version in `pubspec.yaml` setzen (`x.y.z+build`).
2. APK bauen.
3. APK auf sicheren Download-Host legen.
4. Datei pro App aktualisieren (`cashier-stable.json`, `driver-stable.json`, `customer-stable.json`):
   - `latestVersionName`
   - `latestVersionCode`
   - `apkUrl`
   - optional `apkSha256`
   - `mandatoryFromVersionCode` setzen, falls Pflichtupdate
5. Backend neu starten/deployen.
6. App zeigt beim naechsten Check das Update an.
