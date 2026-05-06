# Production Security Checklist (Backend)

## 1) Passwort-Sicherheit
- [x] Neue Passwoerter werden mit `bcrypt` gehasht (`PASSWORD_BCRYPT_COST`, Default 12).
- [x] Legacy-SHA-Hashes werden nur noch zur Verifikation akzeptiert.
- [x] Legacy-Hashes werden beim erfolgreichen Login automatisch auf bcrypt migriert.
- [x] Keine Passwort- oder Secret-Ausgaben in Logs.
- [ ] Nach erfolgreicher Migration aller Accounts: Legacy-SHA-Unterstuetzung entfernen.

## 2) Rate Limits
- [x] Login-Rate-Limit (`/api/auth/login`, `/api/app-auth/login`).
- [x] Registrierungs-Rate-Limit (`/api/app-auth/register`, `/api/app-auth/social-quickstart`).
- [x] Passwort-Reset-Rate-Limit vorbereitet (`/api/auth/reset-password`).
- [x] Token-Refresh-Rate-Limit vorbereitet (`/api/auth/refresh`, `/api/app-auth/refresh`).
- [x] Public-Order-Rate-Limit (`/api/orders`, `/api/order-terminals/public/:terminalCode/orders`).
- [x] Driver-Device-Login-Rate-Limit (`/api/orders/driver/device-login`).
- [x] Display-/OrderDesk-Pairing-Rate-Limits (`/api/order-displays/public/:displayCode/driver-devices/session`, `/api/orderdesk-devices/pairing-session`, `/api/orderdesk-devices/public/bind`).
- [ ] Optional: Redis-basiertes, verteiltes Rate-Limiting fuer Multi-Instance-Betrieb einfuehren.

## 3) CORS
- [x] Kein `*` in Produktion erlaubt.
- [x] Origins per `CORS_ORIGINS` konfigurierbar.
- [x] Klarando-Domains als Produktions-Defaults hinterlegt:
  - `https://klarando.com`
  - `https://www.klarando.com`
  - `https://app.klarando.com`
  - `https://admin.klarando.com`
  - `https://orderdesk.klarando.com`
  - `https://driver.klarando.com`
- [ ] Optional: Monitoring fuer CORS-Block-Events aktivieren.

## 4) Secrets / Environment
- [x] `.env.example` mit Sicherheits-Defaults vorhanden.
- [x] `JWT_SECRET` / `AUTH_SECRET` / `APP_AUTH_SECRET` fuer Produktion verpflichtend (kein stilles Fallback).
- [x] `DATABASE_URL`, `NODE_ENV`, `CORS_ORIGINS` in `.env.example` dokumentiert.
- [x] `.env` ist via `.gitignore` ausgeschlossen.
- [ ] CI-Secret-Scanner (z. B. Gitleaks) im Build aktivieren.

## 5) Betriebs-Hinweise
- [ ] `NODE_ENV=production` in Produktion erzwingen.
- [ ] `AUTH_ENFORCE=true` in Produktion erzwingen.
- [ ] HTTPS/TLS am Edge + sichere Cookie-/Header-Policies (falls Cookies spaeter eingesetzt werden).
- [ ] Regelmaessige Rotation der Secrets (JWT/AUTH/APP_AUTH).

## 6) Seed-/DB-Destruktionsschutz
- [x] Test-/Seed-Skripte blockieren in Produktion (`NODE_ENV=production`):
  - `backend/scripts/seed-basic-data.cjs`
  - `backend/scripts/seed-test-tenants.js`
  - `scripts/seed-live-test.mjs`
- [x] Destruktive DB-Aktionen in Produktion standardmaessig blockiert:
  - `DROP DATABASE`
  - Registry-`DELETE`/Assignment-Reset in `database-provisioning`
  - `CREATE DATABASE` in Provisioning-Pfaden
- [x] Explizite Freigabe nur ueber `ALLOW_PRODUCTION_DB_DESTRUCTIVE_ACTIONS=true`.
- [ ] Empfohlen: diese Variable nur kurzzeitig im Wartungsfenster setzen und danach sofort wieder entfernen.

## 7) Ops-Guard fuer ENV-Dateien
- [x] `npm run check:env-safety` vorhanden (`scripts/check-env-safety.mjs`).
- [x] Check blockiert, wenn `ALLOW_PRODUCTION_DB_DESTRUCTIVE_ACTIONS=true` in `.env*.example` committed wird.
- [x] Check blockiert, wenn Secret-Felder (`JWT_SECRET`, `AUTH_SECRET`, `APP_AUTH_SECRET`, `POSTGRES_PASSWORD`, `DATABASE_URL`, `PASSWORD_SALT`) nicht wie Platzhalter aussehen oder `changeme` enthalten.
- [x] Check blockiert, wenn `CORS_ORIGINS` eine Wildcard (`*`) in Example-Dateien enthaelt.
- [ ] Empfohlen: denselben Check zusaetzlich in CI/GitHub Actions ausfuehren, sobald CI-Workflow vorhanden ist.
