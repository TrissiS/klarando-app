# Display Endpoints Matrix

Stand: 2026-05-20

Ziel: klare Trennung zwischen **Primary**, **Legacy** und **Internal** für das Display-System.

## Primary
- `GET /api/display-runtime/:deviceCode`
  - Status: **PRIMARY**
  - Zweck: zentrale Runtime-Auslieferung für `/screen/[deviceCode]`
  - Soll langfristig die Hauptquelle für Display-Clients sein.

## Legacy (kompatibel halten)
- `GET /api/display/content`
  - Status: **LEGACY**
  - Zweck: bestehende TV-Stick-/Flutter-Clients
  - Hinweis: weiter kompatibel, mittelfristig auf Runtime-Builder konsolidieren.

- Display-Pairing-Endpunkte unter `/api/display/pairing/*`
  - Status: **LEGACY/COMPAT**
  - Zweck: bestehendes QR-Pairing und Session-Flow
  - Muss für gekoppelte Bestandsgeräte stabil bleiben.

## Internal / Admin
- `/api/admin/displays/*`
  - Status: **INTERNAL**
  - Zweck: Admin-/Superadmin-Management von Displays und Screens.

- `/api/screen/*`
  - Status: **INTERNAL**
  - Zweck: Screen-Studio-Konfiguration, Publishing und Vorschau-bezogene Konfigurationslogik.

## Regeln
1. Neue Display-Client-Features bevorzugt über `display-runtime`.
2. Legacy-Endpunkte nicht abrupt entfernen.
3. Änderungen am Payload nur rückwärtskompatibel einführen.
4. DeviceCode-basierte TV-Stick-Links (`/screen/[deviceCode]`) bleiben stabil.
