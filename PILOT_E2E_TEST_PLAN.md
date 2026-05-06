# Pilot E2E Testplan (1 Filiale)

Stand: 06.05.2026  
Ziel: End-to-End absichern, dass eine Bestellung in einer echten Pilotfiliale stabil von Anlage bis Abschluss durchläuft.

## Testumgebung
- Umgebung: Staging/Test-System (nicht Produktion)
- Testfiliale: `TENANT_PILOT_01`
- Test-Chain: `CHAIN_PILOT_01`
- Testnutzer:
  - Superadmin
  - Chainadmin (optional)
  - Filialadmin
  - Fahrer (User + Fahrergerät)
  - Testkunde (App/Web)
- Pflicht vor Start:
  - Datenbank-Backup durchgeführt
  - Health/Ready grün
  - OrderDesk- und Fahrergerät verfügbar

## Testfälle

### TC-01 Superadmin legt Chain an
- Ziel: Neue Kette ist sauber angelegt und sichtbar.
- Schritte:
  1. Als Superadmin einloggen.
  2. Chain mit eindeutiger Testkennung erstellen.
  3. Chain-Liste neu laden.
- Erwartetes Ergebnis: Chain wird mit korrekten Stammdaten gespeichert und angezeigt.
- Betroffene Route/API: `backend/src/routes/chains.ts` (Create/List)
- Bestanden/Nicht bestanden: `[ ]`

### TC-02 Superadmin legt Filiale/Tenant an
- Ziel: Filiale ist korrekt einer Chain zugeordnet.
- Schritte:
  1. Als Superadmin Tenant anlegen und Chain zuweisen.
  2. Tenant-Liste öffnen und Filter auf Chain setzen.
- Erwartetes Ergebnis: Tenant erscheint nur unter der gewählten Chain.
- Betroffene Route/API: `backend/src/routes/tenant.ts` (Create/List)
- Bestanden/Nicht bestanden: `[ ]`

### TC-03 Filialadmin wird angelegt
- Ziel: Filialadmin hat nur Tenant-Scope der Pilotfiliale.
- Schritte:
  1. Filialadmin-User anlegen.
  2. Neu einloggen als Filialadmin.
  3. Versuch, fremde Tenant-Daten zu öffnen.
- Erwartetes Ergebnis: Eigene Filiale sichtbar, fremde Filialdaten gesperrt (`403/404`).
- Betroffene Route/API: `backend/src/routes/access.ts`, `backend/src/routes/staff.ts`
- Bestanden/Nicht bestanden: `[ ]`

### TC-04 Produkte/Kategorien pflegen
- Ziel: Katalog für Pilotfiliale vollständig nutzbar.
- Schritte:
  1. Kategorie anlegen.
  2. Produkte inkl. Preis/Verfügbarkeit anlegen.
  3. Produktliste laden.
- Erwartetes Ergebnis: Produkte/Kategorien korrekt gespeichert, nur im Pilottenant sichtbar.
- Betroffene Route/API: `backend/src/routes/categories.ts`, `backend/src/routes/products.ts`
- Bestanden/Nicht bestanden: `[ ]`

### TC-05 OrderDesk-Gerät koppeln
- Ziel: OrderDesk ist mit richtiger Filiale verbunden.
- Schritte:
  1. Pairing-Session/QR aus Admin erzeugen.
  2. QR am OrderDesk scannen und binden.
  3. Heartbeat senden.
- Erwartetes Ergebnis: Binding aktiv, Heartbeat erfolgreich, Tenant korrekt.
- Betroffene Route/API:
  - `POST /api/orderdesk-devices/pairing-session`
  - `POST /api/orderdesk-devices/public/bind`
  - `POST /api/orderdesk-devices/public/heartbeat`
- Bestanden/Nicht bestanden: `[ ]`

### TC-06 Fahrergerät koppeln
- Ziel: Fahrergerät ist funktionsfähig angemeldet.
- Schritte:
  1. Fahrer-Session/QR erzeugen.
  2. Fahrergerät anmelden.
  3. Heartbeat senden.
- Erwartetes Ergebnis: Fahrergerät aktiv, als online sichtbar.
- Betroffene Route/API:
  - `POST /api/orders/driver/device-login`
  - `POST /api/orders/driver/device-heartbeat`
- Bestanden/Nicht bestanden: `[ ]`

### TC-07 Kunde erstellt Bestellung
- Ziel: Normale Bestellung wird korrekt erstellt.
- Schritte:
  1. Kunde öffnet App/Web, wählt Pilotfiliale.
  2. Produkte in Warenkorb.
  3. Checkout absenden.
- Erwartetes Ergebnis: Bestellung mit korrekter `tenantId`, `201 Created`.
- Betroffene Route/API: `POST /api/orders`
- Bestanden/Nicht bestanden: `[ ]`

### TC-08 Duplicate-Order-Test (gleicher Idempotency-Key)
- Ziel: Doppelbestellungen werden verhindert.
- Schritte:
  1. Gleiche Checkout-Anfrage 2x mit identischem `x-idempotency-key` senden.
  2. Antwort und Orderanzahl prüfen.
- Erwartetes Ergebnis: Maximal 1 neue Order; zweiter Request liefert Replay/409, keine zweite Order.
- Betroffene Route/API:
  - `POST /api/orders`
  - optional Terminalfluss: `POST /api/order-terminals/public/:terminalCode/orders`
- Bestanden/Nicht bestanden: `[ ]`

### TC-09 Order landet im richtigen OrderDesk
- Ziel: Routing zur korrekten Filiale/Anzeige.
- Schritte:
  1. Bestellung aus TC-07 erzeugen.
  2. OrderDesk Feed/Anzeige prüfen.
- Erwartetes Ergebnis: Order erscheint nur im OrderDesk der Pilotfiliale.
- Betroffene Route/API: OrderDesk/Display Feed (`backend/src/routes/order-displays.ts`)
- Bestanden/Nicht bestanden: `[ ]`

### TC-10 Order wird angenommen
- Ziel: Annahme inklusive ETA funktioniert.
- Schritte:
  1. Im OrderDesk/Display „Annehmen“ klicken.
  2. Zeitvorgabe setzen.
  3. Orderstatus prüfen.
- Erwartetes Ergebnis: Statuswechsel erfolgreich, ETA/acceptedAt gesetzt.
- Betroffene Route/API: `PATCH /api/orders/:orderId/status` (bzw. Display-Aktionen)
- Bestanden/Nicht bestanden: `[ ]`

### TC-11 Fahrer wird zugewiesen
- Ziel: Dispatch funktioniert nur im Tenant-Scope.
- Schritte:
  1. Order dispatchen an Pilotfahrer.
  2. Fahrer-App „assigned orders“ abrufen.
- Erwartetes Ergebnis: Zuweisung erfolgreich, Fahrer sieht nur eigene Pilot-Orders.
- Betroffene Route/API:
  - `POST /api/orders/:orderId/dispatch`
  - `GET /api/orders/driver/assigned`
- Bestanden/Nicht bestanden: `[ ]`

### TC-12 Fahrer-Offline-Szenario
- Ziel: Offlinefall ist erkennbar und recoverbar.
- Schritte:
  1. Fahrergerät-Heartbeat stoppen.
  2. Dispatch/Assigned erneut prüfen.
  3. Recovery-Hinweise auswerten.
- Erwartetes Ergebnis: Offline-Zustand erkennbar (`driverDeviceStatus`/`recoveryHint`), Reassign möglich.
- Betroffene Route/API:
  - `POST /api/orders/:orderId/dispatch`
  - `GET /api/orders/driver/assigned`
  - `POST /api/orders/driver/device-heartbeat`
- Bestanden/Nicht bestanden: `[ ]`

### TC-13 Statuswechsel bis geliefert
- Ziel: Vollständiger Lifecycle bis `done`.
- Schritte:
  1. Status auf `preparing`/`out_for_delivery`.
  2. Route-Start und Standort-Update senden.
  3. Abschluss auf `done`.
- Erwartetes Ergebnis: Statusfolge korrekt, keine unzulässigen Übergänge.
- Betroffene Route/API:
  - `PATCH /api/orders/:orderId/status`
  - `POST /api/orders/driver/route-start`
  - `POST /api/orders/driver/location`
- Bestanden/Nicht bestanden: `[ ]`

### TC-14 Kunde bewertet Bestellung
- Ziel: Bewertungsfluss für eigene bezahlte Order.
- Schritte:
  1. Kunde ruft Bewertungsaktion für abgeschlossene Order auf.
  2. Bewertung absenden.
  3. Zweitbewertung derselben Order versuchen.
- Erwartetes Ergebnis: Erste Bewertung erfolgreich, Zweitbewertung blockiert (`409`).
- Betroffene Route/API: `POST /api/orders/:orderId/rating`
- Bestanden/Nicht bestanden: `[ ]`

### TC-15 Backup vor Test
- Ziel: Wiederherstellungspunkt vor Pilotlauf.
- Schritte:
  1. DB-Dump erzeugen.
  2. Dump-Datei validieren (Dateigröße, Timestamp, Lesbarkeit).
- Erwartetes Ergebnis: Konsistenter Backup-Dump vorhanden.
- Betroffene Route/API: Ops/DB-Tooling (`pg_dump`, Deployment-Doku)
- Bestanden/Nicht bestanden: `[ ]`

### TC-16 Restore-Test nach Test (auf Testdatenbank)
- Ziel: Restore-Prozess ist belastbar.
- Schritte:
  1. Backup in separate Test-DB einspielen.
  2. App gegen Test-DB starten.
  3. Stichprobe wichtiger Tabellen/Orders.
- Erwartetes Ergebnis: Daten konsistent wiederhergestellt, App funktionsfähig.
- Betroffene Route/API: Ops/DB-Tooling (`psql` Restore), Migration-Flow
- Bestanden/Nicht bestanden: `[ ]`

### TC-17 Health/Ready Endpoints prüfen
- Ziel: Monitoring-Basissignale korrekt.
- Schritte:
  1. `GET /api/health` aufrufen.
  2. `GET /api/health/ready` aufrufen.
  3. Ergebnis bei normalem Betrieb dokumentieren.
- Erwartetes Ergebnis: Beide Endpoints `ok: true`; Ready enthält DB-Check.
- Betroffene Route/API:
  - `GET /api/health`
  - `GET /api/health/ready`
- Bestanden/Nicht bestanden: `[ ]`

### TC-18 Logs/Audit-Events prüfen
- Ziel: Kritische Ereignisse sind nachvollziehbar.
- Schritte:
  1. Order aus TC-07 bis TC-13 komplett durchführen.
  2. Audit/Serverlogs auf Kernereignisse prüfen:
     - Order Create
     - Duplicate Replay
     - Dispatch
     - Driver Offline Warning
     - OrderDesk Recovery
  3. Ticket/Incident-Doku ergänzen.
- Erwartetes Ergebnis: Vollständige Eventkette für Testorder vorhanden.
- Betroffene Route/API:
  - `backend/src/lib/audit.ts`
  - Order-/OrderDesk-Routen
- Bestanden/Nicht bestanden: `[ ]`

## Go/No-Go Kriterien
- Go nur wenn:
  - Alle P0-relevanten Testfälle bestanden: `TC-07` bis `TC-13`, `TC-17`, `TC-18`
  - Keine Tenant-Scope-Verletzung
  - Duplicate-Order-Schutz bestätigt
  - Backup + Restore erfolgreich (`TC-15`, `TC-16`)
  - Keine offenen S1/S2 Blocker
- No-Go wenn:
  - Bestellungen tenant-fremd sichtbar/manipulierbar
  - Doppelbestellungen reproduzierbar
  - Fahrer/OrderDesk Recovery unzuverlässig
  - Health/Ready oder DB-Stabilität unzureichend

## Blocker-Liste (während Test auszufüllen)
- `[ ]` B1: ______________________________________
- `[ ]` B2: ______________________________________
- `[ ]` B3: ______________________________________
- `[ ]` B4: ______________________________________

## Pilot-Freigabeentscheidung
- Datum: ____________________
- Verantwortlich: ____________________
- Entscheidung:
  - `[ ]` GO (Pilotstart freigegeben)
  - `[ ]` NO-GO (Nacharbeit erforderlich)
- Begründung:
  - ______________________________________________
  - ______________________________________________
