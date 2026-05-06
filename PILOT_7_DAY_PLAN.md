# Klarando Pilotplan (7 Tage)

Ziel: Ein echter Imbiss/Restaurant soll innerhalb von 7 Tagen in einen kontrollierten Pilotbetrieb gehen.  
Leitprinzip: **Stabilität vor Feature-Masse**.

## Tag 1

### Ziele
- Technische Go/No-Go-Basis herstellen.
- Pilot-Filiale und Verantwortlichkeiten fixieren.

### Konkrete Aufgaben
- MVP-Go-Live-Check final mit Team durchgehen (`MVP_GO_LIVE_CHECKLIST.md`).
- Pilot-Filiale auswählen (eine Filiale, begrenzte Öffnungszeiten).
- Rollenmatrix bestätigen:
  - Superadmin
  - Chainadmin/Filialadmin
  - Staff
  - Fahrer
- Tenant-/Scope-Schnelltest auf kritischen Endpunkten (Orders, Produkte, Staff, OrderDesk).
- Pilot-Datenmodell festlegen (Produktkatalog, Kategorien, Liefergebiet, Zahlungsmodus).
- Support-Kanal festlegen (z. B. WhatsApp/Telefon + Ticketliste).

### Betroffene Bereiche
- Backend/API
- Tenant-/Rollenlogik
- Produktverwaltung
- Pilot-Onboarding

### Risiken
- Unklare Verantwortungen verzögern alle Folgetage.
- Fehlende Scope-Abnahme erzeugt Cross-Tenant-Risiko.

### Abnahmekriterien (fertig wenn...)
- Pilot-Filiale + Ansprechpartner schriftlich bestätigt.
- Rollen-/Tenant-Check protokolliert.
- Pilot-Zahlungsmodus festgelegt.

### Aufwand
- mittel

---

## Tag 2

### Ziele
- Produktivnahe Infrastruktur auf IONOS stabil bereitstellen.

### Konkrete Aufgaben
- VPS vorbereiten (Docker, Compose, Benutzerrechte, Firewall).
- `.env.production` sauber setzen (keine Secrets im Repo).
- Compose-Stack starten (Postgres, Backend, Web, Nginx optional Redis).
- Healthchecks validieren (`/api/health`, `/healthz`).
- Reboot-Test durchführen (Container kommen automatisch wieder hoch).
- Basis-Logs prüfen (`docker compose logs -f`).

### Betroffene Bereiche
- Deployment auf IONOS
- Backend/API
- Monitoring/Logs (Basis)

### Risiken
- Falsche ENV/DB-URL blockiert Start.
- Port-/Proxy-Konflikte.

### Abnahmekriterien (fertig wenn...)
- Alle Kernservices laufen dauerhaft.
- Healthchecks grün.
- Reboot-Test erfolgreich.

### Aufwand
- mittel bis groß

---

## Tag 3

### Ziele
- Domains + HTTPS + sichere Erreichbarkeit herstellen.

### Konkrete Aufgaben
- DNS setzen:
  - `api.klarando.com`
  - `app.klarando.com`
  - `admin.klarando.com`
  - `orderdesk.klarando.com`
- Certbot/Let's Encrypt Zertifikate ausrollen.
- Nginx SSL-Konfiguration aktivieren.
- CORS-Origins gegen produktive Domains prüfen.
- Externe Erreichbarkeit und Browser-Flow testen (Admin, App, API).

### Betroffene Bereiche
- SSL/Domains
- Deployment
- Security

### Risiken
- DNS-Propagation verzögert Tests.
- Zertifikatspfade/Reload fehlerhaft.

### Abnahmekriterien (fertig wenn...)
- HTTPS für alle Pilot-Domains aktiv.
- API + Web + Admin + OrderDesk extern erreichbar.
- Keine CORS-Blocker in Pilotdomänen.

### Aufwand
- mittel

---

## Tag 4

### Ziele
- Pilotdaten und Kernprozesse im System produktionsnah bereitstellen.

### Konkrete Aufgaben
- Pilot-Tenant/Filiale mit echten Stammdaten anlegen.
- Kategorien + Produkte + Preise + Verfügbarkeiten pflegen.
- OrderFlow-End-to-End testen:
  - Kundenbestellung
  - Annahme
  - Statuswechsel
  - Abschluss
- Zahlungsmodus für Pilot strikt dokumentieren (z. B. Cash/Card vor Ort).
- Test für Realtime-Verhalten (Bestellaktualisierung an OrderDesk/Displays).

### Betroffene Bereiche
- Produktverwaltung
- Kategorien
- OrderFlow
- Kundenbestellung
- Realtime

### Risiken
- Schlechte Datenqualität (falsche Preise/Zuordnung) erzeugt Chaos im Pilot.
- Realtime-Lücken führen zu Doppelbearbeitung.

### Abnahmekriterien (fertig wenn...)
- Mindestens 20 repräsentative Produkte korrekt eingepflegt.
- 10 Testbestellungen ohne kritischen Fehler durchgelaufen.
- Realtime-Updates für offene Bestellungen nachvollziehbar.

### Aufwand
- mittel bis groß

---

## Tag 5

### Ziele
- OrderDesk und Fahrerfluss für echten Betrieb stabilisieren.

### Konkrete Aufgaben
- OrderDesk-Gerät per QR koppeln und Persistenz prüfen.
- Druckpfad (80mm) im Tagesablauf testen.
- Fahrer-Login/Session/Assignment testen:
  - Anmeldung
  - Zuweisung
  - Statuswechsel
  - Abschluss inkl. Signatur/Übergabe
- Karten-/Adressfluss und Routenlink testen.
- Fehlerfalltests:
  - Gerät offline
  - Session abgelaufen
  - Fahrerwechsel

### Betroffene Bereiche
- OrderDesk
- Fahrerfluss
- OrderFlow
- Realtime

### Risiken
- Hardware-/Netzprobleme stören die Abnahme.
- Fahrer-Session-Fehler führen zu „hängenden“ Lieferstatus.

### Abnahmekriterien (fertig wenn...)
- OrderDesk bleibt über Schicht stabil gekoppelt.
- Fahrerprozess läuft in mindestens 5 Testlieferungen korrekt.
- Druck/Statusfluss ohne manuelle DB-Eingriffe.

### Aufwand
- groß

---

## Tag 6

### Ziele
- Betriebsstabilität absichern: Backup/Restore, Monitoring, Supportprozess.

### Konkrete Aufgaben
- Backup-Job (täglich) aktivieren und ersten echten Dump prüfen.
- Restore-Test in lokaler Test-DB durchführen und protokollieren.
- Migrationstest nach Restore prüfen.
- Minimal-Monitoring definieren:
  - Uptime-Check
  - API-Fehlerquote
  - Container-Status
- Supportprozess live schalten:
  - Incident-Schweregrade
  - Eskalationskette
  - Reaktionszeiten

### Betroffene Bereiche
- Backup/Restore
- Monitoring/Logs
- Fehler-/Supportprozess

### Risiken
- Restore nur dokumentiert, aber nie getestet.
- Kein Alarm bei Ausfällen.

### Abnahmekriterien (fertig wenn...)
- Backup täglich automatisiert.
- Ein Restore-Test erfolgreich durchgespielt.
- Support-/Eskalationsprozess schriftlich verfügbar.

### Aufwand
- mittel

---

## Tag 7

### Ziele
- Pilot-Onboarding im echten Betrieb und kontrollierter Soft-Launch.

### Konkrete Aufgaben
- Onboarding-Session mit Imbiss-Team (Admin, Kasse, Fahrer).
- „Day-in-the-life“-Probe:
  - Öffnung
  - Peak-Phase
  - Lieferungen
  - Tagesabschluss
- Soft-Launch mit begrenztem Zeitfenster (z. B. 2–3 Stunden).
- Fehlerprotokoll + Sofortmaßnahmen erfassen.
- Go/No-Go für Woche 2 entscheiden.

### Betroffene Bereiche
- Pilot-Onboarding
- Kundenbestellung
- OrderDesk
- Fahrerfluss
- Supportprozess

### Risiken
- Bedienfehler bei Erstnutzung.
- Unerwartete Lastspitzen.

### Abnahmekriterien (fertig wenn...)
- Soft-Launch ohne kritischen Betriebsabbruch.
- Kritische Bugs priorisiert und zugewiesen.
- Pilot-Woche-2-Plan freigegeben.

### Aufwand
- mittel bis groß

---

## MVP vor Pilot zwingend

1. Tenant-/Rollenlogik für kritische Flows validiert.
2. Produktionsdeployment inkl. HTTPS stabil.
3. Backup aktiv + Restore-Test nachgewiesen.
4. OrderFlow (Kunde -> Annahme -> Fertig) stabil getestet.
5. OrderDesk + Fahrerfluss im Realgerätetest verifiziert.
6. Support-/Eskalationsprozess mit klaren Verantwortlichen vorhanden.

## Kann nach Pilot kommen

1. Vollständige Payment-Provider-Integration mit Webhooks.
2. Erweiterte CRM-/Kampagnenautomatisierung.
3. Tiefes Observability-Stack (Tracing, Dashboards, SLOs).
4. Vollautomatische CI/CD-Gates inkl. E2E.

## Größte Risiken im Pilotbetrieb

1. Fehlende Echtzeit-/Statussynchronität bei hoher Last.
2. Hardware-/Netzinstabilität bei OrderDesk/Fahrergeräten.
3. Unsaubere Betriebsprozesse bei Störung (wer macht was?).
4. Unklare Zahlungsprozesse im Kundenkontakt.

## Empfohlene minimale Teamrollen

1. Technische Leitung (Deployment, API, Incident-Entscheidungen)
2. Backend/Integrationsverantwortliche:r (Orders, Tenant-Scope, Hotfixes)
3. Ops/Infra-Verantwortliche:r (VPS, Docker, Nginx, Backup, Monitoring)
4. Pilot-Operator (Onboarding Imbiss, Tagesbegleitung, Feedbackaufnahme)
5. Optional: Support-Fokusrolle in Pilotzeiten (schnelle Erstreaktion)
