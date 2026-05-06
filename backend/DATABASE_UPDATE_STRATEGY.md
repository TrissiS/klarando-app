# Klarando Datenbank-Update-Strategie

## 1) Aktueller Stand (Analyse)

### Migrationssystem
- Es existiert ein **Prisma-Migrationssystem** im Backend:
  - `backend/prisma/schema.prisma`
  - `backend/prisma/migrations/*/migration.sql`
  - `backend/prisma/migrations/migration_lock.toml` (PostgreSQL)
- Deployment nutzt bereits `prisma migrate deploy`:
  - `backend/Dockerfile` startet mit `npx prisma migrate deploy && ...`
- Neue Payment-Basismigrationen werden als additive SQL-Migrationen ergänzt (z. B. zentrale Zahlungsmethodenlogik unter `backend/prisma/migrations/20260506222000_add_platform_payment_methods/migration.sql`).

### Weitere DB-Mechanismen
- Zusätzlich existiert eine **zweite Prisma-Konfiguration im Repo-Root**:
  - `prisma/schema.prisma`
  - `prisma.config.ts`
- Diese Root-Struktur wirkt wie Legacy/Altstand und kann zu Verwechslungen führen, wenn versehentlich im falschen Ordner Prisma-Befehle ausgeführt werden.

### Seeds / Daten-Skripte
- Es gibt Seed-/Provisioning-Skripte, aber **keine automatische Ausführung im Produktionsstart**.
- Produktionsschutz ist aktiv:
  - `backend/scripts/seed-test-tenants.js` bricht bei `NODE_ENV=production` sofort ab.
  - `backend/scripts/seed-basic-data.cjs` bricht bei `NODE_ENV=production` sofort ab.
  - `scripts/seed-live-test.mjs` bricht bei `NODE_ENV=production` sofort ab.

### Destruktive Befehle gefunden
- In Prisma-Migrationen kein `DROP TABLE`/`TRUNCATE` gefunden.
- Es gibt eine historische Migration mit Spaltenverlust:
  - `backend/prisma/migrations/20260410114510_reset_schema/migration.sql` (`ALTER TABLE "Tenant" DROP COLUMN "email"`).
  - Spalte wurde später wieder eingeführt, dennoch bleibt diese Migration historisch destruktiv.
- Im DB-Management-Code existiert eine bewusste Löschfunktion:
  - `backend/src/lib/database-provisioning.ts` enthält `DROP DATABASE IF EXISTS ...`
  - Wird über `backend/src/routes/database-management.ts` aufrufbar gemacht (rollen-/permission-gebunden).
- Zusätzlicher Produktionsschutz ist aktiv:
  - In `NODE_ENV=production` sind `DROP DATABASE`, Registry-Deletes und `CREATE DATABASE` in `database-provisioning.ts` blockiert,
  - außer wenn explizit `ALLOW_PRODUCTION_DB_DESTRUCTIVE_ACTIONS=true` gesetzt ist.

## 2) Sicherer Update-Ablauf (Produktion)

1. **Vor jedem Release Backup erstellen**  
   - Empfohlen: `deploy/backup/postgres-backup.sh`
2. **Migrationen vorab prüfen**  
   - SQL-Diff/Dateien auf destruktive Statements prüfen.
3. **Nur `migrate deploy` verwenden**  
   - `npx prisma migrate deploy` im Backend-Kontext.
4. **Keine Seed-Skripte in Produktion starten**  
   - Nur gezielte, freigegebene Datenkorrekturen.
5. **Post-Deploy Smoke-Checks**  
   - Healthcheck, Login, Orderflow, Tenant-Isolation.

## 3) In Produktion verboten

- `prisma migrate reset`
- `prisma db push` (Schema-Drift-Risiko, nicht revisionssicher)
- Seed-Skripte:
  - `backend/scripts/seed-test-tenants.js`
  - `backend/scripts/seed-basic-data.cjs`
  - `scripts/seed-live-test.mjs`
- ungeprüfte Ausführung von:
  - DB-Destruktivpfaden ohne explizite Freigabevariable
- Nutzung von DB-Löschfunktionen (`DROP DATABASE`) außerhalb eines expliziten, freigegebenen Recovery-/Admin-Prozesses.

## 4) Backup-Strategie vor Updates

- Vor jedem Deploy:
  - Voll-Dump der Produktions-DB (gzip-komprimiert).
- Aufbewahrung:
  - täglich mindestens 7 Tage, besser 30 Tage.
- Bereits vorbereitet:
  - `deploy/backup/postgres-backup.sh`
  - `deploy/backup/postgres-restore.sh`
- Empfehlung:
  - zusätzlich Offsite-Backup (z. B. S3-kompatibel/IONOS Object Storage).

## 5) Rollback-Strategie

Prisma bietet standardmäßig **keine automatische sichere Down-Migration** für beliebige Änderungen. Daher:

1. Bei Fehlern zuerst **Stop/Fix Forward** prüfen (schneller Hotfix).
2. Falls nötig: **Restore aus Backup** auf vorherigen konsistenten Stand.
3. Rollback immer als geplanter Runbook-Prozess mit:
   - Timestamp des letzten guten Backups,
   - Verantwortlichem Freigabeprozess,
   - dokumentiertem Wiederanlauf.

## 6) Abwärtskompatible Schema-Änderungen (Best Practice)

- Neue Felder zunächst:
  - nullable oder mit Default einführen.
- Mehrstufige Änderungen:
  1. Feld hinzufügen
  2. Code für alt+neu kompatibel deployen
  3. Daten backfillen
  4. erst in späterem Release `NOT NULL`/Altfeld entfernen
- Keine großen, destruktiven Änderungen im selben Release wie App-Logik-Umbauten.

## 7) Konkrete Empfehlungen für Klarando

1. **Prisma konsolidieren**: ein klarer produktiver Prisma-Pfad (Backend) und Root-Prisma als Legacy markieren oder entfernen.
2. **Seed-Skripte absichern**: ist umgesetzt (`NODE_ENV=production` blockiert Ausführung).
3. **DB-Management-Härtung**: ist umgesetzt über `ALLOW_PRODUCTION_DB_DESTRUCTIVE_ACTIONS`.
4. **Release-Checkliste erzwingen**: Backup -> Migration -> Smoke-Test -> Monitoring.

---

## Kurzfazit

Ein sauberes Migrationssystem ist vorhanden (**Prisma Migrations + migrate deploy**).  
Das größte Risiko für Datenverlust liegt aktuell nicht in regulären Migrationen, sondern in **manuell ausführbaren Seed-/Admin-Skripten mit destruktivem Verhalten**.
