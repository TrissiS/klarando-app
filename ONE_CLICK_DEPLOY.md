# One Click Deploy (Klarando)

## Erstellte Skripte
- `C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app\scripts\release-and-deploy.ps1`
- `C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app\scripts\create-klarando-deploy-shortcut.ps1`

## Desktop-Button erstellen
Im Projektordner ausführen:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\create-klarando-deploy-shortcut.ps1
```

Danach liegt auf dem Desktop:
- `Klarando Live aktualisieren`

## Live-Deploy starten
Option 1:
- Desktop-Button `Klarando Live aktualisieren` doppelklicken

Option 2:
```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\release-and-deploy.ps1
```

## Ablauf des Deploy-Skripts
1. Release-Name abfragen
2. Live-Bestätigung `Ja/Nein`
3. Version erhöhen (`npm run bump:version -- --releaseName "..."`)
4. Checks:
   - `npm run check:env-safety`
   - `npm --prefix backend run typecheck`
   - `npm run lint`
   - `npm run build`
5. `git status`
6. `git add .`
7. `git commit -m "Release Klarando vX.X.X"`
8. `git push origin main`
9. VPS Deploy:
   - `git fetch origin`
   - `git reset --hard origin/main`
   - `docker compose --env-file .env.production -f docker-compose.prod.yml up -d --build`
   - `docker compose --env-file .env.production -f docker-compose.prod.yml ps`
   - `curl http://localhost/api/version`
   - `curl http://localhost/api/health`

## Sicherheitsverhalten
- Wenn ein Check fehlschlägt, bricht das Skript sofort ab.
- In dem Fall passiert **kein Push** und **kein Live-Deploy**.
- Es werden keine Secrets im Skript gespeichert.
