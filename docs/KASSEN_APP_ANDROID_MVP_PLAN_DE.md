# Klarando OrderDesk MVP Plan (Android, 8 Zoll + 80mm Thermaldrucker)

Stand: 2026-05-04
Status: Umsetzungsbereit

## 1) Zielbild und Entscheidung

Entscheidung:
- KassenDisplay wird kurzfristig nicht abgeschafft.
- KassenDisplay bleibt Fallback.
- Neue App `Klarando OrderDesk` wird primaerer operativer Client auf 8-Zoll-Geraeten mit integriertem Drucker.

Ziel:
- Stabiler Betrieb am POS mit zuverlaessigem Bon-Druck.
- Gleicher fachlicher Bestellfluss wie heute.
- Geringes Rollout-Risiko durch Parallelbetrieb (App + Fallback Web-Display).

## 2) Scope fuer MVP (In Scope)

In Scope:
- Android App fuer CASH-Display-Use-Case.
- Pairing/Login mit Display-Code.
- Bestellliste + Detailansicht + Kernaktionen:
  - Bestellung annehmen mit ETA.
  - Zahlungsstatus auf bezahlt setzen.
  - Fahrer zuweisen/dispatch.
  - Statuswechsel (open/preparing/done/archived).
- Auto-Druck und Reprint.
- Lokale Print-Queue mit Retry bei Druckerfehlern.
- Basis-Kiosk-Verhalten (kein App-Wechsel im Betrieb).

Nicht im MVP:
- Vollstaendige Offline-Order-Erstellung.
- Multi-Printer-Routing.
- Fortgeschrittene Reports.
- Eigene Payment-Terminal-Integration.

## 3) Bestehende Basis im Code (wiederverwenden)

Bestehende Kernrouten:
- `backend/src/routes/order-displays.ts`
  - Public Feed und CASH-Aktionen (`accept`, `payment`, `dispatch`, Status/Item-Aenderungen).
- `backend/src/routes/orders.ts`
  - Order Management und Backoffice-Funktionen.

Bestehendes Display-Frontend:
- `app/order-display/[displayCode]/page.tsx`

Bestehender API-Client:
- `lib/api.ts`

## 4) Architektur fuer MVP

### 4.1 App-Schichten

1. Presentation Layer
- Kassen-Warteschlange.
- Bestelldetails.
- Druckstatus/Fehlerbanner.

2. Domain Layer
- Order-Use-Cases (accept/pay/dispatch/status).
- Print-Use-Cases (new order print, manual reprint).
- Device Session Handling.

3. Data Layer
- REST-Client auf bestehende Endpunkte.
- Lokale Persistenz fuer Print-Queue und Session.

4. Device Layer
- PrinterAdapter (SDK oder ESC/POS).
- Kiosk-Utilities (Autostart, Bildschirm an, App-Lock soweit moeglich).

### 4.2 Realtime-Strategie

MVP:
- Polling alle 3-5 Sekunden.

Post-MVP:
- SSE/WebSocket fuer niedrigere Latenz.

## 5) API Schnittliste (MVP)

### 5.1 Bereits vorhanden (direkt nutzen)

- `GET /api/order-displays/public/:displayCode/feed`
- `POST /api/order-displays/public/:displayCode/orders/:orderId/accept`
- `POST /api/order-displays/public/:displayCode/orders/:orderId/payment`
- `POST /api/order-displays/public/:displayCode/orders/:orderId/dispatch`
- `PATCH /api/order-displays/public/:displayCode/orders/:orderId/status`
- `PATCH /api/order-displays/public/:displayCode/orders/:orderId/items/:itemId/status`

### 5.2 Optional neu fuer MVP+ (nur wenn noetig)

- `POST /api/order-displays/public/:displayCode/print/reprint`
  - Fuer serverseitig protokollierte Reprints.
- `POST /api/order-displays/public/:displayCode/printer-health`
  - Optionales Device Monitoring.

### 5.3 Neu implementiert fuer 80mm-Printing (jetzt nutzbar)

- `GET /api/order-displays/public/:displayCode/orders/:orderId/receipt-jobs`
  - Liefert druckfertige Jobs fuer `customer`, `kitchen` oder `both`.
  - Enthaelt:
    - gerenderte Druckkommandos
    - ESC/POS Bytes als Base64 (`escposBase64`)
    - ESC/POS Hex (`escposHex`)

## 6) Android App Module und Tasks

## A) Projekt-Setup (1-2 Tage)
- App-Projekt (Flutter oder Native Android) anlegen.
- Build-Flavors fuer `dev/stage/prod`.
- Config fuer Backend-Basis-URL.
- Crash-Logging und Basis-Telemetrie.

Akzeptanz:
- App startet auf Zielgeraet.
- Umgebung (`dev/stage/prod`) ist umschaltbar.

## B) Pairing und Session (1-2 Tage)
- Display-Code Eingabe/QR-Scan.
- Session speichern und erneuern.
- Logout/Unpair Funktion.

Akzeptanz:
- Geraet laesst sich sauber koppeln und erneut verbinden.

## C) Order Queue + Details (2-3 Tage)
- Polling Feed.
- Filter nach Status.
- Detailansicht mit Positionen, Kunde, ETA, Payment.
- Visuelle Priorisierung neuer Orders.

Akzeptanz:
- Neue Orders erscheinen max. 5 Sekunden nach Eingang.

## D) Kassenaktionen (2-3 Tage)
- `accept` mit ETA Auswahl.
- `payment` auf PAID.
- `dispatch` mit Fahrerwahl/Fahrername.
- Statuswechsel.

Akzeptanz:
- Jede Aktion aktualisiert Backend und UI konsistent.
- Fehler werden verstaendlich angezeigt.

## E) Druckmodul (3-5 Tage)
- `PrinterAdapter` Interface.
- Erste Implementierung fuer Zielhardware-SDK.
- Bon-Templates:
  - Kundenbon.
  - Kuechen-/Produktionbon.
- Reprint-Button.
- Lokale Queue mit Retry und Sichtbarkeit in UI.

Akzeptanz:
- 20/20 Testdrucke ohne haengende Queue.
- Reprint funktioniert auch nach App-Neustart.

## F) Kiosk + Betrieb (1-2 Tage)
- Vollbild/Kiosk-Modus.
- Autostart nach Reboot.
- Bildschirm-Timeout verhindern waehrend Betrieb.

Akzeptanz:
- Geraet bleibt im Kassenmodus ohne manuellen Eingriff.

## G) QA + Pilot (2-3 Tage)
- E2E Testlauf in Testfiliale.
- Lasttest mit simulierten Stoerungen (Netzwerk, Printer offline).
- Bugfix-Runde.

Akzeptanz:
- Pilot-Schicht erfolgreich ohne kritische Ausfaelle.

## 7) Backend-Aufgaben (konkret)

Pflicht:
- Keine kritische Erweiterung noetig, da Kernendpunkte bereits vorhanden sind.
- Stabilitaets-Checks fuer bestehende CASH-Endpunkte.

Soll:
- Idempotenz bei kritischen Aktionen sicher pruefen (`accept`, `dispatch`, `payment`).
- Rate-Limit fuer Public-Display-Write-Endpunkte definieren.
- Audit-Logs fuer Druck-Reprint erweitern (falls Reprint-Endpoint gebaut wird).

Akzeptanz:
- Keine Regression bei existierendem Web-KassenDisplay.
- Typecheck und Healthchecks gruen.

## 8) Drucker-Integration (technischer Spike vor MVP-Start)

Vor Start final klaeren:
- Exaktes Geraetemodell.
- Hersteller-SDK und Android-Version.
- Bonbreite ist fix: 80mm.
- Zeichensatz/Encoding (Umlaute, Sonderzeichen).
- Papier-Cut, Drawer-Signal, Statusabfragen.

Go/No-Go Kriterium:
- Mindestens 50 fehlerfreie Testdrucke auf Zielhardware.

## 8.1) ESC/POS Template-Spezifikation (80mm)

Ziel:
- Einheitliche, robuste Bonausgabe auf 80mm.

Layout-Defaults:
- Zeichenbreite: ca. 48 Zeichen pro Zeile (Standardfont).
- Druckmodus: Text + optional QR-Code.
- Trennlinien: durchgehende `-` Linie ueber volle Breite.
- Abschluss: Vorschub + Auto-Cut.

Kundenbon (MVP):
- Header: Filialname, Adresse/Kontakt.
- Bonkopf: Datum/Uhrzeit, Bestellnummer, Kanal, Service.
- Positionen: Menge, Name, Einzel/Positionspreis.
- Summenblock: Zwischensumme, Liefergebuehr, Gesamt.
- Footer: Danke-Text, optional QR fuer Tracking/Feedback.

Kuechenbon (MVP):
- Header: KUECHE, Bestellnummer, Zeit.
- Fokusblock: Positionen gross/lesbar, Modifier darunter.
- Servicehinweis: Lieferung/Abholung.
- Fahrer/ETA falls vorhanden.

Encoding-Strategie:
- Primaer UTF-8 via Hersteller-SDK.
- Falls SDK/Printer nur Codepage: konfigurierbare ESC/POS Codepage + Fallback-Mapping fuer Umlaute.

MVP-Drucktests (80mm):
- 50 erfolgreiche Drucke ohne Queue-Stau.
- Lange Produktnamen umbrechen sauber.
- Umlaute (`ae/oe/ue` bzw. echte Umlaute je Codepage) konsistent.
- Reprint nach App-Neustart korrekt.
- Cut funktioniert bei jedem Bon.

## 9) Sicherheits- und Betriebsanforderungen

- Geraetesession zeitlich begrenzt.
- Rotation/Revocation von Device Sessions.
- Keine Klartext-Secrets in App.
- TLS-only in Stage/Prod.
- Auditierbare Aktionen (wer hat was wann gemacht).

## 10) Rollout-Plan

Phase 1:
- 1 Pilotfiliale, 1 Geraet, 3-5 Tage.

Phase 2:
- 3-5 Filialen, Fallback immer aktiv.

Phase 3:
- Breiter Rollout.
- Web-KassenDisplay bleibt als Notfallmodus.

Rollback:
- Bei kritischem Fehler sofort auf bestehendes KassenDisplay zurueckschalten.

## 11) Aufwand gesamt (MVP)

Geschaetzt:
- 11 bis 17 Arbeitstage netto.

Puffer:
- +20 Prozent fuer Hardware-/SDK-Unbekannte.

## 12) Definition of Done (MVP)

- Klarando OrderDesk laeuft stabil auf Zielgeraet.
- Kernaktionen fachlich identisch zum bisherigen KassenDisplay.
- Druck ist stabil mit Queue + Retry + Reprint.
- Pilot erfolgreich abgeschlossen.
- Fallback auf Web-KassenDisplay dokumentiert und getestet.

## 13) Umsetzungsreihenfolge (ab morgen)

1. Hardware-Spike Drucker (Tag 1-2).
2. App-Setup + Pairing (Tag 2-4).
3. Queue/Details + Kassenaktionen (Tag 4-8).
4. Druckmodul + Reprint + Queue-Retry (Tag 7-12).
5. Kiosk/Betrieb + QA/Pilot (Tag 12-17).
