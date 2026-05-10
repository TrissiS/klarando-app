# Lokales Deploy & Versionierung (Windows)

## Ziel
Dieses Setup ermöglicht dir ein Windows-first Desktop-Deployment für Klarando:

- lokal entwickeln
- per Desktop-Button deployen
- automatische Versionsanhebung (SemVer)
- klare Release-Notizen
- VPS-Rollout über SSH + Docker Compose

## Neue Kernbausteine

- Zentrale Version: `C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app\klarando-version.json`
- Version-Manager: `C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app\scripts\version-manager.mjs`
- Live-Deploy Script: `C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app\scripts\deploy-klarando-live.ps1`
- Test-Compose: `C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app\docker-compose.test.yml`
- Shortcut-Generator: `C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app\scripts\create-klarando-live-deploy-shortcut.ps1`
- Release-Notizen: `C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app\docs\releases\RELEASE_NOTES.md`

## Versionierung

### Zentrale SemVer
- `klarando-version.json` ist die zentrale Quelle.
- Versionstyp: `major.minor.patch` (z. B. `0.8.1`).

### Automatisches Sync
Beim Bump werden synchron aktualisiert:
- `klarando-version.json`
- `package.json` (Frontend)
- `backend/package.json` (Backend)

### Befehle
- Version anzeigen:
  - `npm run version:show`
- Patch:
  - `npm run version:bump:patch`
- Minor:
  - `npm run version:bump:minor`
- Major:
  - `npm run version:bump:major`

## Desktop-Deploy

### Script starten
- Live:
  - `npm run deploy:live`
- Test:
  - `npm run deploy:test`
- Quick:
  - `npm run deploy:quick`

### Was das Deploy-Script macht
`deploy-klarando-live.ps1` führt aus:
1. Git-Status + Konfliktcheck
2. Qualitätschecks (Live/Test):
   - `npm run lint`
   - `npm --prefix backend run typecheck`
   - `npm run build`
   - `npm --prefix backend run build`
3. Version erhöhen
4. Release-Notiz ergänzen
5. Commit erstellen
6. Push (optional)
7. VPS-Deploy via SSH:
   - `git pull --ff-only`
   - optional Backup-Script
   - `docker compose ... up -d --build`
   - Healthchecks lokal/public

### Sicherheitsstopps
Deployment bricht ab bei:
- ungelösten Git-Konflikten
- fehlender Toolchain (`git`, `node`, `npm`, `ssh`)
- fehlenden Build/Typecheck-Ergebnissen
- fehlender `.env.production` auf dem VPS

## Desktop-Buttons

Shortcut-Erstellung:
- `npm run shortcut:desktop:deploy`

Erzeugt:
- `Klarando Deploy LIVE`
- `Klarando Deploy TEST`
- `Klarando Deploy QUICK`

## VPS-Strategie

Aktuell bewusst einfach/stabil:
- Git-Push vom PC
- SSH auf VPS
- `git pull --ff-only`
- Docker Compose Rebuild/Restart

Kein schweres CI/CD erforderlich.

### Ports LIVE vs TEST
- LIVE bleibt auf Standard-Ports über `docker-compose.prod.yml`:
  - nginx `80/443`
- TEST nutzt `docker-compose.test.yml` mit separaten Ports:
  - nginx `8080:80`
  - backend `4001:4000`
- TEST läuft mit eigenem Compose-Project-Name:
  - `klarando-app-test`
  - dadurch getrennte Container-/Volume-Namen

## Konkrete IONOS-VPS Werte (gesetzt)
- Host/IP: `31.70.76.55`
- User: `root`
- Projektpfad (LIVE): `/opt/klarando-app`
- Compose-Datei: `docker-compose.prod.yml`
- ENV-Datei: `.env.production`
- Public Healthcheck: `http://31.70.76.55/api/health`
- Public Healthcheck TEST: `http://31.70.76.55:8080/api/health`

## Superadmin Versionsanzeige

Die Superadmin-Übersicht zeigt:
- Plattform-Version
- Frontend-Version
- Backend-Version
- Display/API-Version
- Build-Datum
- Backend-Startzeit

Datenquellen:
- `klarando-version.json`
- Backend `/api/health`

## Vorbereitung für spätere Mobile Deploys

Die Struktur ist vorbereitet für getrennte Deployment-Targets:
- Frontend
- Backend
- Mobile Customer
- Mobile Driver
- Displays

Aktuell produktiv umgesetzt ist der Full-Deploy-Pfad (Web + Backend).

## Was du anpassen musst

In `scripts/deploy-klarando-live.ps1` kannst du optional noch anpassen:
- `$VpsPort` (Standard: `22`)
- `$VpsProjectPathTest` (optional für TEST-Umgebung)
- `$SshKeyPath` (optional für Key-Login)

## Vor dem ersten Klick prüfen
- SSH-Zugriff funktioniert:
  - `ssh root@31.70.76.55`
- Auf dem VPS existiert:
  - `/opt/klarando-app`
  - `.env.production` im Projektordner
- Docker Compose läuft auf dem VPS:
  - `docker compose version`
- Lokale Git-Remote zeigt auf das richtige Repository:
  - `git remote -v`
- Du bist auf dem richtigen Branch (normalerweise `main`).

## Nicht tun
- Keine echten Secrets in Git committen.
- Keine `.env.production` in das Repo legen.
- Keine Live-Deploys ohne Backup bei kritischen Änderungen.
