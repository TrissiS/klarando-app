# Klarando Online-Start: Architektur und Vorgehen

Stand: 2026-05-04  
Domain: `www.klarando.com`

## Zielbild für den Live-Betrieb

Klarando läuft als zentrale Plattform mit:

- Web-Frontend (Admin/Kette/Superadmin): `https://admin.klarando.com`
- Backend API: `https://api.klarando.com`
- Kunden-App (Flutter)
- Fahrer-App (Flutter)

Alle Clients sprechen nur mit der API. Direkte DB-Zugriffe aus Apps sind nicht erlaubt.

## Empfohlene Datenbank-Strategie (sicher und skalierbar)

Für euren Fall ist diese Reihenfolge am sinnvollsten:

1. **Jetzt für den Start**: eine zentrale PostgreSQL-Instanz mit strikter Mandantentrennung (Tenant-/Ketten-/Filial-ID + serverseitige Berechtigungsprüfung auf jeder Route).
2. **Ab Wachstum**: schrittweise Trennung auf **eigene Datenbank pro Kette**.
3. **Optional für Großkunden**: eigene DB pro Filiale oder Enterprise-Kunde.

Warum so:

- Schnell live-fähig ohne Betriebschaos.
- Geringere Kosten am Anfang.
- Geplanter Migrationspfad ohne Komplett-Umbau.

## Zugriffsschutz für Datenbanken

Damit nur berechtigte Betreiber Zugriff haben:

- Keine DB-Passwörter in Apps.
- DB nur aus Backend-Netz erreichbar (private Subnetze/Firewall).
- Separate technische DB-User:
  - `klarando_app_rw` (App-Backend)
  - `klarando_migration` (nur Schema-Migration)
  - `klarando_readonly_support` (optional)
- Secrets nur in Secret Manager (nicht in Git, nicht im Klartext in `.env`).
- Audit-Logs für sensible Änderungen aktivieren.

## Infrastruktur-Empfehlung (Phase 1)

- Reverse Proxy: Nginx/Caddy mit TLS (Let's Encrypt)
- Frontend: Node/Next.js (`pm2` oder Container)
- Backend: Node/Express (`pm2` oder Container)
- DB: Managed PostgreSQL (Backups + PITR aktiv)
- Storage: S3-kompatibel für Uploads (Produktbilder, Reklamationsbilder)
- Monitoring:
  - Uptime-Checks (Frontend/API)
  - Error-Tracking (API/Apps)
  - Performance-Metriken

## Pflichtpunkte vor ersten echten Funktionstests

1. Testumgebung mit produktionsnahen Domains aufsetzen (`staging.klarando.com`).
2. API-URL in Kunden-App und Fahrer-App auf Staging setzen.
3. Zahlungsanbieter zunächst im Sandbox-Modus.
4. Testdaten je Rolle:
   - 1 Superadmin
   - 1 Kettenadmin
   - 2 Filialadmins
   - 2 Fahrer
   - 5 Kundenkonten
5. E2E-Testfälle vollständig einmal durchspielen (Bestellung bis Abschluss/Reklamation).

## Entscheidung: Online-Dashboard oder lokale Installation?

Empfehlung: **Online-first** (wie aktuell), kein lokales Einzelplatz-System als Primärmodell.

Gründe:

- Zentrale Updates für alle.
- Einheitliche Daten für 3 Apps.
- Fahrertracking, Push, Reklamationen und Live-Status funktionieren zuverlässig nur zentral.

Lokale Installation nur als Sonderfall (Offline-Kasse) und später als optionales Modul.

## Rollout in 3 Stufen

1. **Staging-Freigabe**  
   Technische Tests, Lasttests, Rechte-Tests.
2. **Pilotbetrieb (1 Kette, 1-2 Filialen)**  
   Echte Bestellungen mit begrenztem Volumen.
3. **Breiter Rollout**  
   Weitere Ketten/Filialen, Monitoring + Incident-Prozess aktiv.

## Kritischer Sicherheitshinweis

Wenn Zugangsdaten in lokalen `.env`-Dateien standen oder geteilt wurden:

- sofort alle Secrets rotieren,
- neue Secrets nur über Secret Manager verteilen,
- alte Keys deaktivieren.

