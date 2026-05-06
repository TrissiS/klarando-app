# Klarando Backup & Restore (PostgreSQL)

Diese Anleitung beschreibt sichere Backup-/Restore-Abläufe fuer Klarando auf IONOS VPS und fuer lokale Restore-Tests.

## 1) Ziele

- Keine Datenverluste bei Deployments/Updates
- Tägliche Backups mit klarer Aufbewahrung
- Restore jederzeit reproduzierbar
- Restore-Test vor größeren Releases

## 2) Vorhandene Skripte

- Backup: `deploy/backup/postgres-backup.sh`
- Restore: `deploy/backup/postgres-restore.sh`

Beide Skripte nutzen:
- `docker-compose.prod.yml`
- `.env.production`

## 3) Tägliche Dumps (Produktion)

### Manuell
```bash
cd /opt/klarando-app
chmod +x deploy/backup/postgres-backup.sh deploy/backup/postgres-restore.sh
./deploy/backup/postgres-backup.sh
```

Erzeugt:
- `backups/postgres/klarando_YYYY-mm-dd_HH-MM-SS.sql.gz`

### Automatisch (Cron)
Beispiel: täglich 02:15 Uhr
```bash
15 2 * * * cd /opt/klarando-app && ./deploy/backup/postgres-backup.sh >> /var/log/klarando-backup.log 2>&1
```

## 4) Aufbewahrung

Aktuell im Skript:
- lokale Retention: 30 Tage

Empfehlung:
- mindestens 30 Tage lokal
- zusätzlich Offsite-Backup (z. B. S3-kompatibler Speicher/IONOS Object Storage)
- regelmäßige Stichproben-Restore-Tests

## 5) Restore in Produktion

Wichtig:
- Restore nur in Wartungsfenster
- vor Restore immer aktuellen Ist-Stand zusätzlich sichern

```bash
cd /opt/klarando-app
./deploy/backup/postgres-restore.sh backups/postgres/<backup-datei>.sql.gz
```

Danach prüfen:
```bash
docker compose --env-file .env.production -f docker-compose.prod.yml logs -f backend
curl -I https://api.klarando.com/api/health
```

## 6) Lokaler Test-Restore (empfohlen vor größeren Updates)

### Option A: Eigene lokale Test-DB via Docker
1. Test-Postgres starten:
```bash
docker run --name klarando-restore-test \
  -e POSTGRES_DB=klarando_restore_test \
  -e POSTGRES_USER=klarando \
  -e POSTGRES_PASSWORD=klarando_test_pw \
  -p 55432:5432 -d postgres:16-alpine
```
2. Backup einspielen:
```bash
gunzip -c backups/postgres/<backup-datei>.sql.gz | docker exec -i klarando-restore-test psql -U klarando -d klarando_restore_test
```
3. Test-DB wieder stoppen/löschen:
```bash
docker rm -f klarando-restore-test
```

### Option B: Restore in isolierter Compose-Umgebung
- Alternativ ein separates Compose-Projekt mit anderem `COMPOSE_PROJECT_NAME` und anderem DB-Port starten.

## 7) Migrationstest nach Restore

Nach lokalem Restore:
1. `DATABASE_URL` auf Test-DB setzen
2. Migrationen gegen Test-DB prüfen:
```bash
npm --prefix backend run typecheck
npx --prefix backend prisma migrate deploy --schema backend/prisma/schema.prisma
```
3. API kurz starten und Healthcheck prüfen.

Ziel:
- Sicherstellen, dass bestehende Backups mit aktuellem Migrationsstand kompatibel sind.

## 8) Produktionsupdates: empfohlener Ablauf

1. Frisches Backup ziehen (`postgres-backup.sh`)
2. Deployment (`docker compose ... up -d --build`)
3. Prisma Migrationen laufen automatisch im Backend-Start
4. Smoke-Tests (Health, Login, Orderflow, Tenant-Scope)
5. Bei Fehlern: Restore-Entscheidung nach Runbook

## 9) Sicherheitsregeln

- Keine echten Secrets in Doku oder Repo
- Keine destruktiven DB-Aktionen ohne Freigabe
- `ALLOW_PRODUCTION_DB_DESTRUCTIVE_ACTIONS` in Produktion standardmäßig `false`
- Restore regelmäßig testen, nicht nur dokumentieren
