# Klarando Deployment auf IONOS VPS (Linux)

Diese Anleitung beschreibt ein produktionsnahes Docker-Setup fuer Klarando auf einem IONOS VPS.

## 1) Architekturueberblick

### Apps im Repository
- `backend/`: Express + Prisma API (Port `4000`)
- Root-App (`app/`, `components/`, `lib/`): Next.js Web (Port `3000`)
- `mobile-app/` (Expo) und `mobile_flutter_app/` (Flutter): reine Clients, keine eigenen Server-Prozesse fuer VPS

### Compose-Services
- `postgres` (PostgreSQL 16)
- `backend` (Node/Express + Prisma)
- `web` (Next.js)
- `nginx` (Reverse Proxy)
- `redis` (optional vorbereitet, aktuell nicht von Backend genutzt)

### Deployment-Analyse (Ist-Stand)
- Backend-Startprozess:
  - Container startet mit `npx prisma migrate deploy && node -r ts-node/register/transpile-only src/server.ts`
- Prisma-Migrationsflow:
  - Produktion: nur `prisma migrate deploy`
  - Kein `migrate reset`/`db push` in Produktionsprozess
- Build-Schritte:
  - Backend-Image aus `backend/Dockerfile`
  - Web-Image aus `Dockerfile.web`
- Exponierte interne Ports:
  - Backend `4000`
  - Web `3000`
  - Postgres `5432` (intern)
  - Redis `6379` (intern, optional)
- Production-Start:
  - `docker compose --env-file .env.production -f docker-compose.prod.yml up -d --build`

### Domain-Routing (Nginx)
- `api.klarando.com` -> `backend:4000`
- `app.klarando.com` -> `web:3000`
- `admin.klarando.com` -> `web:3000`
- `orderdesk.klarando.com` -> `web:3000`
- `driver.klarando.com` -> `web:3000`
- `klarando.com`, `www.klarando.com` -> `web:3000`

## 2) Voraussetzungen auf IONOS VPS

```bash
sudo apt update && sudo apt upgrade -y
sudo apt install -y ca-certificates curl gnupg
```

### Docker installieren (Ubuntu/Debian, offizielle Methode)
```bash
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo $VERSION_CODENAME) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo usermod -aG docker $USER
```

Danach einmal neu einloggen (`logout/login`) und pruefen:
```bash
docker --version
docker compose version
```

Docker beim Reboot automatisch starten:
```bash
sudo systemctl enable docker
sudo systemctl start docker
```

## 3) Projekt deployen

```bash
cd /opt
sudo git clone <EURE-REPO-URL> klarando-app
sudo chown -R $USER:$USER /opt/klarando-app
cd /opt/klarando-app
```

## 4) Produktions-ENV anlegen

1. Vorlage kopieren:
```bash
cp .env.production.example .env.production
```
2. Werte in `.env.production` setzen:
- `POSTGRES_PASSWORD`
- `DATABASE_URL` (muss zum Postgres-Container passen)
- `JWT_SECRET`, `AUTH_SECRET`, `APP_AUTH_SECRET`
- `NEXT_PUBLIC_API_BASE_URL=https://api.klarando.com`
- optional `NEXT_PUBLIC_GOOGLE_MAPS_API_KEY`

Wichtig: Keine echten Secrets ins Git committen.

## 5) Container starten

```bash
docker compose --env-file .env.production -f docker-compose.prod.yml up -d --build
```

Status pruefen:
```bash
docker compose --env-file .env.production -f docker-compose.prod.yml ps
docker compose --env-file .env.production -f docker-compose.prod.yml logs -f backend
```

## 6) Datenbankmigrationen

Die Backend-Container-Startsequenz fuehrt automatisch aus:
- `npx prisma migrate deploy`
- danach Start des API-Servers

Manuell (falls noetig):
```bash
docker compose --env-file .env.production -f docker-compose.prod.yml exec backend npx prisma migrate deploy
```

## 7) Nginx und Domains

### Standard (ohne SSL, fuer Erststart)
Compose nutzt initial:
- `deploy/nginx/klarando.http.conf`

Damit kannst du Erreichbarkeit testen, solange DNS schon zeigt:
```bash
curl -I http://api.klarando.com/api/health
curl -I http://app.klarando.com/api/health
```

## 8) SSL mit Let's Encrypt / Certbot

### DNS vorher setzen
- `A`-Records auf die VPS-IP:
  - `klarando.com`
  - `www.klarando.com`
  - `api.klarando.com`
  - `app.klarando.com`
  - `admin.klarando.com`
  - `orderdesk.klarando.com`
  - `driver.klarando.com`

### Certbot auf Host installieren
```bash
sudo apt install -y certbot
sudo mkdir -p /var/www/certbot
```

### Zertifikate holen
```bash
sudo certbot certonly --webroot -w /var/www/certbot \
  -d api.klarando.com \
  -d app.klarando.com \
  -d admin.klarando.com \
  -d orderdesk.klarando.com \
  -d driver.klarando.com \
  -d klarando.com \
  -d www.klarando.com
```

### Nginx auf SSL-Konfig umstellen
In `docker-compose.prod.yml` bei Service `nginx`:
- statt `deploy/nginx/klarando.http.conf`
- `deploy/nginx/klarando.ssl.conf` mounten

Dann neu laden:
```bash
docker compose --env-file .env.production -f docker-compose.prod.yml up -d nginx
```

### Zertifikatserneuerung testen
```bash
sudo certbot renew --dry-run
```

Empfohlen als Cronjob:
```bash
0 3 * * * certbot renew --quiet && docker compose --env-file /opt/klarando-app/.env.production -f /opt/klarando-app/docker-compose.prod.yml restart nginx
```

## 9) Backup-Konzept (PostgreSQL)

### Enthaltene Skripte
- `deploy/backup/postgres-backup.sh`
- `deploy/backup/postgres-restore.sh`

### Backup manuell
```bash
chmod +x deploy/backup/postgres-backup.sh deploy/backup/postgres-restore.sh
./deploy/backup/postgres-backup.sh
```

Ergebnis:
- `backups/postgres/klarando_YYYY-mm-dd_HH-MM-SS.sql.gz`
- lokale Retention: 30 Tage

### Restore
```bash
./deploy/backup/postgres-restore.sh backups/postgres/<datei>.sql.gz
```

### Empfehlung fuer spaeter
- Zusaetzlich externe Backups (S3-kompatibel/IONOS Object Storage)
- Mindestens taeglicher Offsite-Export
- Regelmaessige Restore-Tests

## 10) Betrieb / Troubleshooting

Logs:
```bash
docker compose --env-file .env.production -f docker-compose.prod.yml logs -f
```

Nur API-Logs:
```bash
docker compose --env-file .env.production -f docker-compose.prod.yml logs -f backend
```

Healthchecks:
- Backend: `GET /api/health`
- Web: `GET /api/health`
- Nginx: `GET /healthz`

Update-Deployment:
```bash
git pull
docker compose --env-file .env.production -f docker-compose.prod.yml up -d --build
```

### Verhalten nach Server-Reboot
- `restart: unless-stopped` ist fuer alle produktiven Services gesetzt.
- Sobald Docker-Dienst startet, fahren die Container automatisch hoch.
- Pruefen nach Reboot:
```bash
docker ps
docker compose --env-file .env.production -f docker-compose.prod.yml ps
```

## 11) Wichtige Hinweise

- `redis` ist nur vorbereitet (`profile: optional`), noch nicht aktiv genutzt.
- Mobile Clients laufen nicht als VPS-Services, sondern als Apps auf Endgeraeten.
- Dieses Setup aendert keine bestehende lokale Dev-Startlogik.
- Details zu Backups/Restore: `BACKUP_AND_RESTORE.md`
