# Klarando Go-Live Checkliste (Deutschland)

Stand: 2026-04-15

## 1) Recht und Compliance

- [ ] Impressum, Datenschutzerklaerung und AGB fuer Klarando sind erreichbar (Web + App).
- [ ] Support-E-Mail und Konto-Loeschung-E-Mail sind gesetzt und werden aktiv bearbeitet.
- [ ] Cookie-/Tracking-Einwilligung ist aktiv, dokumentiert und testbar.
- [ ] Checkout nutzt den korrekten Button-Text "zahlungspflichtig bestellen".
- [ ] AV-Vertraege mit allen Auftragsverarbeitern liegen vor (Hosting, E-Mail, Push, Analytics, Payment).
- [ ] Prozess fuer Betroffenenrechte (Auskunft, Loeschung, Berichtigung) ist intern definiert.
- [ ] Prozess fuer Datenpannen (72h-Meldung) ist als Runbook vorhanden.

## 2) Security und Betrieb

- [ ] AUTH_ENFORCE=true in Produktion.
- [ ] AUTH_SECRET, APP_AUTH_SECRET, PASSWORD_SALT sind produktiv gesetzt (kein Default).
- [ ] Alle alten Schlüssel wurden rotiert, falls sie jemals in lokalen Dateien standen.
- [ ] Secrets liegen nur in Secret-Store (nicht in Git / nicht in Klartext-Dateien im Team).
- [ ] Backup und Restore wurden einmal real getestet.
- [ ] Monitoring und Alerts fuer Backend, DB, Queue und Deployments sind aktiv.
- [ ] Rollenrechte fuer Superadmin, Kettenadmin, Admin, Staff sind getestet.

## 2.1) Datenbank-Trennung und Mandantenschutz

- [ ] API erzwingt Tenant-/Ketten-/Filialgrenzen auf jeder Route.
- [ ] Keine App hat direkten Datenbankzugriff.
- [ ] DB ist nur privat erreichbar (kein offener Public Access).
- [ ] Technische DB-User sind getrennt (App, Migration, optional Readonly).
- [ ] Protokollierung für kritische Änderungen (Audit-Log) aktiv.

## 3) App und Bestellfluss

- [ ] Es gibt freigegebene Filialen mit aktivem Listing und Ordering.
- [ ] Pro freigegebener Filiale sind Pflichtdaten gesetzt (Adresse, Kontakt, Rechtstexte).
- [ ] Produktdaten sind vorhanden (Kategorien, Produkte, Zutaten).
- [ ] Liefer-/Abholgebiete sind korrekt konfiguriert (keine unbeabsichtigte "alle PLZ offen"-Konfiguration).
- [ ] App-Bestellungen erscheinen auf Kassenanzeige inkl. Annahme mit Zeitvorgabe.
- [ ] Mindestbestellwert und Liefergebuehr werden korrekt geprueft.
- [ ] Statusrueckmeldung an Kunden funktioniert (angenommen, in Bearbeitung, fertig).

## 4) Payment und Finanzen

- [ ] PayPal/Klarna laufen mit Live-Credentials und verifizierten Webhooks.
- [ ] Doppelte Events/Retry sind idempotent abgesichert.
- [ ] Auszahlungsdaten je Kette/Filiale sind vollstaendig gepflegt (Kontoinhaber, Bank, IBAN).
- [ ] Buchhaltungsexport/Abgleichprozess ist festgelegt.

## 5) Mobile Release (Android/iOS)

- [ ] Datenschutzhinweise im Store und in der App sind konsistent.
- [ ] App-Berechtigungen sind minimal und begruendet.
- [ ] Crash-freier Test auf echten Geraeten (Android + iOS) wurde durchgefuehrt.
- [ ] Barrierefreiheit fuer Kernflows (Login, Suche, Checkout, Zahlung) wurde geprueft.

## 6) Automatischer Readiness-Check

Backend-Check starten:

```powershell
cd C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app\backend
& "C:\Program Files\nodejs\npm.cmd" run go-live:check
```

Der Check liefert:

- `CRITICAL`: Muss vor Livegang behoben werden.
- `WARN`: Sollte vor Livegang geklaert werden.

Optionale Beschleuniger:

```powershell
# Fehlende Displays/Terminals automatisch anlegen (nur wenn nicht vorhanden)
& "C:\Program Files\nodejs\npm.cmd" run go-live:provision

# Fehlende Pflichtangaben fuer App-Filialen bulk setzen (nur leere Felder)
& "C:\Program Files\nodejs\npm.cmd" run go-live:apply-legal -- --imprint-url=https://... --privacy-url=https://... --terms-url=https://... --support-email=support@... --deletion-email=delete@...
```

Hinweis: Der technische Check ersetzt keine Rechtsberatung.

## 7) Ergänzende Runbooks

- Architektur: `docs/ONLINE_START_ARCHITEKTUR_DE.md`
- Funktionstests: `docs/FUNKTIONSTEST_RUNBOOK_DE.md`
