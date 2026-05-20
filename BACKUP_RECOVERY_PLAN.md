# Backup & Recovery Plan (Klarando)

## Ziel
Sicherstellen, dass bei Fehlern, Ausfällen oder Fehlkonfigurationen ein geordneter und getesteter Wiederanlauf möglich ist.

## Scope
- PostgreSQL (alle Mandantendaten)
- Uploads/Medien
- Konfigurationsdaten (Docker/Env/Secrets-Referenzen)
- Build-/Release-Metadaten

## Backup-Strategie

### 1) Datenbank-Backups
- Vollbackup täglich (nachts).
- Zusätzliche inkrementelle oder WAL-basierte Sicherung (falls verfügbar).
- Aufbewahrung:
  - Täglich: 14 Tage
  - Wöchentlich: 8 Wochen
  - Monatlich: 12 Monate
- Speicherung außerhalb des Produktionshosts.

### 2) Medien-/Upload-Backups
- Upload-Verzeichnis täglich sichern.
- Für spätere Skalierung: Migration zu Object-Storage + Versioning.

### 3) Konfiguration
- `.env.production` nicht im Git, aber revisionssicher im Secret-Management.
- Deployment-Dateien (`docker-compose.prod.yml`, Nginx-Konfigs) versioniert halten.

## Recovery-Ziele
- RPO Ziel (Datenverlust): <= 24h (besser mit WAL deutlich geringer)
- RTO Ziel (Wiederanlauf): <= 2h bei Standardausfall

## Restore-Prozess (MVP)
1. Staging/Recovery-Umgebung bereitstellen.
2. Datenbank aus letztem validen Backup wiederherstellen.
3. Medien/Uploads wiederherstellen.
4. Migrationsstand prüfen (`prisma migrate deploy` nur falls nötig und kompatibel).
5. Healthchecks prüfen:
   - `/api/health`
   - `/api/ready`
   - `/api/health/display-heartbeats`
6. Stichproben:
   - Login
   - Tenant-Scope
   - Display-Runtime
   - Billing-Invoices

## Restore-Testpflicht
- Monatlich mindestens ein dokumentierter Restore-Test.
- Ergebnisprotokoll:
  - Datum
  - Backup-Snapshot
  - Dauer
  - Probleme
  - Korrekturmaßnahmen

## Sicherheitsanforderungen
- Backups verschlüsseln (at rest + in transit).
- Zugriff strikt rollenbasiert.
- Keys/Secrets getrennt vom Backup-Speicher verwalten.

## Offene Punkte
- Automatisierte Backup-Validierung (Checksums + Test-Restore).
- Optionales zweites Zielsystem (Cross-Region/Cross-Provider).
- Notfall-Runbook inkl. Verantwortlichkeiten und Eskalationskette.
