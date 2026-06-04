# Versioning And Releases

## Zentrale Quelle
Die zentrale Version liegt in:

- `C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app\VERSION.json`

Beispiel-Felder:
- `version`
- `releaseName`
- `buildNumber`
- `gitCommit`
- `buildTime`
- `environment`

## Version erhöhen
Im Projektroot ausführen:

```powershell
npm run bump:version
```

Optional mit Release-Name:

```powershell
npm run bump:version -- --releaseName "Pilot Display Fix"
```

Das Skript aktualisiert:
- `VERSION.json`
- `package.json`
- `backend/package.json`
- `mobile_flutter_app/pubspec.yaml`

`backend/VERSION.json` wird nicht mehr verwendet.

## Schnellprüfung lokal vs. VPS/API

```powershell
npm run version:check
```

Optional mit eigener API-URL:

```powershell
$env:KLARANDO_VERSION_API_URL="https://api.klarando.com/api/version"
npm run version:check
```

## Wo die Version sichtbar ist
- Superadmin/Backoffice Sidebar Footer:
  - `Klarando vX.Y.Z · Build N`
- Superadmin Dashboard (Plattform Version Karte)
- Backend API:
  - `GET /api/version`
- Flutter Customer App:
  - Profil → „Datenschutz, Rechtliches & Support“ → `App-Version`

## Deploy-Prüfung nach Release
1. Backend-Version:
```bash
curl -k -L https://localhost/api/version
```
2. Health:
```bash
curl https://api.klarando.com/api/health
```
3. Web:
Superadmin öffnen und Footer-Version prüfen.
4. Mobile:
In der App unter Profil die Versionszeile prüfen.

## Container und Runtime
- Das Backend liest zur Laufzeit nur noch die zentrale Root-`VERSION.json`.
- `backend/Dockerfile` kopiert diese Root-Datei direkt in den Container.
- `Dockerfile.web` kopiert dieselbe Root-Datei ebenfalls in den Web-Container.
- `docker-compose.prod.yml` baut das Backend jetzt mit Projektroot als Build-Kontext, damit beide Container dieselbe Master-Datei sehen.
