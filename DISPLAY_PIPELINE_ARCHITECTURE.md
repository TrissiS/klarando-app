# Display Pipeline Architecture

Stand: 2026-05-24

## Ziel
Die Display-Auslieferung läuft über ein versioniertes **Display Manifest** als Single Source of Truth, mit Offline-Fallback und klarer Trennung zwischen Primary und Legacy.

## 1) Manifest-Modell (Primary)
Die primäre Laufzeitstruktur pro Display ist `displayManifest`:

- `manifestVersion`
- `tenantId`
- `branchId`
- `displayId`
- `deviceCode`
- `layout`
- `theme`
- `playlist`
- `assets`
- `products`
- `categories`
- `schedule`
- `generatedAt`
- `expiresAt`
- `checksum` / `hash`
- `fallback`

## 2) Primary Runtime Route
Neu (Primary):

- `GET /api/display-runtime/:deviceCode/manifest`

Response enthält:
- `displayManifest` (vollständig)
- `runtime` (Kompatibilität für bestehende Clients)
- `primary: true`

## 3) Asset-Modell
Assets werden strukturiert ausgeliefert:

- Typen: `logo`, `backgroundImage`, `backgroundVideo`, `productImage`, `promoImage`, `slideImage`, `slideVideo`
- Felder: `id`, `type`, `url`, `mimeType`, `size`, `width`, `height`, `duration`, `checksum`, `updatedAt`

Hinweis:
- Leere oder kaputte URLs werden nicht aktiv als nutzbare Assets behandelt.
- Für fehlende Bilder bleibt ein Fallback-Background im Manifest enthalten.

## 4) Offline-/Cache-Konzept
Display-App:
1. lädt zuerst Cache (`localStorage`) über `display-runtime` Cache-Key
2. lädt online das Manifest
3. aktiviert neues Runtime-Set nur bei valider Payload
4. nutzt bei Fehlern den letzten gültigen Stand

Sicherheitsregel:
- Kein fehlerhaftes Manifest darf den letzten validen Zustand überschreiben.

## 5) Template-/Playlist-Vorbereitung
Manifest ist vorbereitet auf:
- `menuBoard`
- `image`
- `video`
- `promo`

Playlist-Eintrag:
- `durationSeconds`
- `order`
- `validFrom`
- `validUntil`
- `daysOfWeek`
- `timeWindows`

## 6) Legacy-Endpunkte
Weiter kompatibel:
- `GET /api/display-runtime/:deviceCode`
- `GET /api/display/content`
- `/api/display/pairing/*`

Strategie:
- Neue Features zuerst auf Manifest-Route.
- Legacy bleibt zunächst bestehen, bis Migration abgeschlossen ist.

## 7) Migration (schrittweise)
1. Screen-Studio speichert weiterhin wie bisher, Runtime-Builder erzeugt daraus Manifest.
2. Display-Client nutzt primär Manifest-Route und fällt auf Legacy-Runtime zurück.
3. Nach Stabilisierung: Legacy-Pfade intern konsolidieren.

## 8) Offene APIs / Folgeaufgaben
- Asset-Head-Checks (Dateigröße/Dimension/Verfügbarkeit) serverseitig.
- Produktbild-Assets direkt aus Produktmodell in Manifest aufnehmen.
- Manifest-Publishing-Prozess mit expliziter Versionierung in DB.
- Validierungsendpunkt für Manifest-Integrität.

## 9) Testplan
- Manifest wird für gültigen `deviceCode` erzeugt.
- Display-App lädt Manifest und rendert weiter.
- Offline-Fallback: Cache bleibt nutzbar.
- Fehlerfall: ungültige Manifest-Payload überschreibt Cache nicht.
- `npm run build` und Backend-Typecheck grün.
