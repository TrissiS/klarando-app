# Klarando Real World Order Flow (Pilotbetrieb)

Stand: 06.05.2026  
Ziel: Vollständiger End-to-End-Ablauf einer echten Bestellung dokumentieren, inkl. Risiken, Ausfälle und Recovery.

## Systemlandschaft (vereinfacht)

- Kunden-Frontend: Web/Flutter App
- Admin/OrderDesk/Display-Frontend: Next.js + Flutter-Geräte
- Backend/API: Express (`/api/*`)
- Datenbank: PostgreSQL (Prisma)
- Reverse Proxy: Nginx
- Realtime-Mechanik: aktuell primär **Polling/Feed-Refresh**, kein zentraler WebSocket-Core im Backend

---

## 1) Kunde öffnet App/Web

- Betroffene Systeme:
  - Web-App (`app/main-app`) / Mobile Flutter
  - Nginx
  - Backend (`/api/app-auth/*`, ggf. öffentliche Endpunkte)
- APIs/Routen:
  - `POST /api/app-auth/login`
  - `POST /api/app-auth/register`
  - `GET /api/app-auth/me`
- Rollen:
  - `customer` (AppCustomerAccount-Domain)
- Tenant-Schutz:
  - Noch kein Tenant-Fixpunkt, nur Auth-Kontext Kunde
- Mögliche Fehlerquellen:
  - Login-Fehler, Token abgelaufen, CORS/Domain-Fehler
- Bei Ausfall:
  - Kunde kann nicht einloggen, Bestellung nicht starten
- Logging/Monitoring-Bedarf:
  - Login-Fehlerrate, 401/429-Raten, `/api/health`

## 2) Restaurant/Filiale auswählen

- Betroffene Systeme:
  - Kunden-UI
  - Backend Tenant-/Katalog-APIs
- APIs/Routen:
  - tenantbezogene Listing-Routen (indirekt über Produkt-/Kategorieload)
- Rollen:
  - `customer`
- Tenant-Schutz:
  - Kritisch: Auswahl bestimmt spätere `tenantId` der Bestellung
- Mögliche Fehlerquellen:
  - Falsche Filiale im UI, stale Daten
- Bei Ausfall:
  - Bestellung kann im falschen Tenant landen (Business-Risiko)
- Logging/Monitoring-Bedarf:
  - Tenant-Auswahl-Event, Abbruchrate vor Checkout

## 3) Produkte laden

- Betroffene Systeme:
  - Kunden-UI
  - Backend (`products`, `categories`, `ingredients/modifiers`)
- APIs/Routen:
  - `GET /api/products`
  - `GET /api/categories`
- Rollen:
  - Kunde oder öffentliche App-Reads (je nach Flow)
- Tenant-Schutz:
  - Muss strikt tenantbezogen gefiltert sein
- Mögliche Fehlerquellen:
  - Leerer Katalog, falsche Preise, falscher Tenant
- Bei Ausfall:
  - Kein Bestellvorgang möglich
- Logging/Monitoring-Bedarf:
  - Katalog-Latenz, 5xx auf Produkt-/Kategorie-Endpoints

## 4) Warenkorb

- Betroffene Systeme:
  - Frontend lokal (State)
  - optional Preis-/Verfügbarkeitsvalidierung im Backend
- APIs/Routen:
  - typischerweise noch keine persistente Route bis Checkout
- Rollen:
  - `customer`
- Tenant-Schutz:
  - Warenkorb darf nur Produkte einer Filiale enthalten
- Mögliche Fehlerquellen:
  - Produkt zwischenzeitlich deaktiviert/preisgeändert
- Bei Ausfall:
  - UI inkonsistent, Checkout bricht später
- Logging/Monitoring-Bedarf:
  - Client-Validierungsfehler (optional Telemetrie)

## 5) Bestellung absenden

- Betroffene Systeme:
  - Kunden-UI
  - Backend Order-Create
- APIs/Routen:
  - `POST /api/orders` (rate limited)
  - alternativ Terminal-Flow: `POST /api/order-terminals/public/:terminalCode/orders`
- Rollen:
  - Kunde (APP/DELIVERY), Staff/Admin bei internen Orders
- Tenant-Schutz:
  - Kritisch: `tenantId` wird serverseitig geprüft/abgeleitet (je Kanal)
- Mögliche Fehlerquellen:
  - Doppelklick -> doppelte Bestellung
  - ungültige Produkte/Modifier
  - PaymentMethod ungültig
- Bei Ausfall:
  - Unsicherheit „wurde bestellt oder nicht?“
- Logging/Monitoring-Bedarf:
  - Order-Create Erfolg/Fehler, Duplicate-Indikatoren, 4xx/5xx

## 6) Backend verarbeitet Order

- Betroffene Systeme:
  - Orders-Route
  - Produkt-/Offer-Berechnung
  - DB Transaktionen
- APIs/Routen:
  - `POST /api/orders`
- Rollen:
  - Kunde/Staff/Admin je Channel
- Tenant-Schutz:
  - Resolve Tenant Scope (`resolveTenantScope`) bei nicht-öffentlichen Flows
- Mögliche Fehlerquellen:
  - race conditions bei Verfügbarkeit/Beständen
  - fehlende Idempotency-Key-Logik
- Bei Ausfall:
  - Teilweise persistierte Zustände möglich (je Fehlerzeitpunkt)
- Logging/Monitoring-Bedarf:
  - Order-ID, Tenant-ID, Channel, Fehlercode, Laufzeit

## 7) Tenant/Filiale wird bestimmt

- Betroffene Systeme:
  - Orders-Backend
  - Tenant-Scope-Layer
- APIs/Routen:
  - `backend/src/lib/tenant-scope.ts` indirekt
- Rollen:
  - `SUPERADMIN`, `CHAINADMIN`, `ADMIN`, `STAFF`, `DRIVER`, `customer`
- Tenant-Schutz:
  - Muss jede fremde `tenantId` blockieren
- Mögliche Fehlerquellen:
  - Fehlkonfiguration Rollen/Scopes
  - Legacy-Route ohne Scope-Guard
- Bei Ausfall:
  - Cross-Tenant-Datenrisiko (kritisch)
- Logging/Monitoring-Bedarf:
  - Scope-Verstöße (403), ungewöhnliche tenantId-Muster

## 8) Order landet im richtigen OrderDesk

- Betroffene Systeme:
  - Routing (`resolveDisplayRouting`)
  - OrderDisplay Feed
  - OrderDesk Binding
- APIs/Routen:
  - `GET /api/order-displays/public/:displayCode/feed`
  - `POST /api/orderdesk-devices/public/heartbeat`
- Rollen:
  - Device/Staff/Admin
- Tenant-Schutz:
  - Display/Binding sind tenantgebunden
- Mögliche Fehlerquellen:
  - falsches Display-Routing
  - inaktives Display
  - Device nicht mehr gebunden
- Bei Ausfall:
  - Bestellung bleibt offen, aber unsichtbar am POS (operativ kritisch)
- Logging/Monitoring-Bedarf:
  - Feed-Latenz, Heartbeat-Aussetzer, ungebundene Geräte

## 9) Mitarbeiter nimmt Bestellung an

- Betroffene Systeme:
  - Cash-Display UI
  - Orders/Display Status-APIs
- APIs/Routen:
  - `POST /api/order-displays/public/:displayCode/orders/:orderId/accept`
  - `PATCH /api/orders/:orderId/status`
- Rollen:
  - `STAFF`/`ADMIN` (oder Display-Code-gebundene öffentliche Display-Operation)
- Tenant-Schutz:
  - Display-Code + erlaubte Terminal-Quelle + Tenant-Prüfung
- Mögliche Fehlerquellen:
  - Statuskonflikte (gleichzeitige Bedienung)
- Bei Ausfall:
  - Order bleibt „open/pending“, Kunde wartet ohne ETA
- Logging/Monitoring-Bedarf:
  - Annahmezeit (SLA), Statuswechsel-Historie

## 10) Küche bearbeitet Bestellung

- Betroffene Systeme:
  - Kitchen-Display Feed
  - Item-Status APIs
- APIs/Routen:
  - `POST /api/order-displays/public/:displayCode/orders/:orderId/items/:itemId/status`
  - `POST /api/order-displays/public/:displayCode/orders/:orderId/status`
- Rollen:
  - Küchen-Staff/Display-Gerät
- Tenant-Schutz:
  - Display/Tenant-Bindung
- Mögliche Fehlerquellen:
  - Feed nicht aktuell (Polling-Lücke)
- Bei Ausfall:
  - Küche sieht veraltete Liste, Reihenfolgefehler
- Logging/Monitoring-Bedarf:
  - Item-Durchlaufzeiten, Feed-Refresh-Fehler

## 11) Fahrer-Zuweisung

- Betroffene Systeme:
  - Cash-Display
  - User/Driver-Daten
  - Order Dispatch
- APIs/Routen:
  - `POST /api/orders/:orderId/dispatch`
  - `POST /api/order-displays/public/:displayCode/orders/:orderId/dispatch`
- Rollen:
  - `ADMIN`/`STAFF` (cash display)
- Tenant-Schutz:
  - Nur Fahrer derselben Filiale/Tenant
- Mögliche Fehlerquellen:
  - Kein aktiver Fahrer
  - falsche Zuordnung
- Bei Ausfall:
  - Lieferung verzögert/ohne Fahrer
- Logging/Monitoring-Bedarf:
  - Dispatch-Events, unzugewiesene Delivery-Orders

## 12) Fahrer-App erhält Auftrag

- Betroffene Systeme:
  - Driver-App
  - Driver Device Session
  - Assigned Feed
- APIs/Routen:
  - `POST /api/orders/driver/device-login`
  - `GET /api/orders/driver/assigned`
  - `POST /api/orders/driver/device-heartbeat`
- Rollen:
  - `DRIVER` / Driver-Device-Session
- Tenant-Schutz:
  - Driver nur eigene Tenant/zugewiesene Orders
- Mögliche Fehlerquellen:
  - Session abgelaufen
  - Token ungültig
  - Offline-Gerät
- Bei Ausfall:
  - Fahrer sieht Auftrag nicht
- Logging/Monitoring-Bedarf:
  - aktive Driver-Sessions, Heartbeat-Alter, Assigned-Feed-Fehler

## 13) Status-Updates / Realtime-Sync

- Betroffene Systeme:
  - Order-Displays, Driver-App, Kundenansicht
  - Polling-Intervalle
- APIs/Routen:
  - primär Feed-/Status-Routen (`/public/:displayCode/feed`, `/driver/assigned`, status updates)
- Rollen:
  - Staff, Driver, Kunde
- Tenant-Schutz:
  - über DisplayCode/DriverScope/TenantScope
- Mögliche Fehlerquellen:
  - Polling verzögert, kurzzeitig inkonsistent
- Bei Ausfall:
  - Status springt verspätet; Recovery über nächsten Poll
- Logging/Monitoring-Bedarf:
  - Poll-Fehlerquote, Lastspitzen, Sync-Lag

## 14) Lieferung abgeschlossen

- Betroffene Systeme:
  - Driver-App
  - Orders Status/Signatur
- APIs/Routen:
  - `POST /api/orders/driver/route-start`
  - `POST /api/orders/driver/signature`
  - `PATCH /api/orders/:orderId/status`
- Rollen:
  - `DRIVER`, `STAFF`
- Tenant-Schutz:
  - Driver nur eigene Aufträge
- Mögliche Fehlerquellen:
  - Signaturupload scheitert
  - Status bleibt „out_for_delivery“
- Bei Ausfall:
  - Nachpflege über Cash-Display/Support nötig
- Logging/Monitoring-Bedarf:
  - Zustellzeiten, Lieferabbrüche, fehlende Abschlussstatus

## 15) Bewertung/Feedback

- Betroffene Systeme:
  - Kunden-App
  - Order Rating/Complaint Endpoints
- APIs/Routen:
  - `POST /api/orders/:orderId/rating`
  - `POST /api/orders/:orderId/complaints`
- Rollen:
  - Kunde
- Tenant-Schutz:
  - Bewertung muss zur eigenen Bestellung passen
- Mögliche Fehlerquellen:
  - Cooldown/Window-Regeln missverstanden
  - doppelte Beschwerden
- Bei Ausfall:
  - Feedbackverlust, Support sieht Probleme später
- Logging/Monitoring-Bedarf:
  - Bewertungsquote, Beschwerderate, SLA bis Bearbeitung

---

## Single Point of Failure (SPOF) Analyse

1. **Backend-API single instance**
- Risiko: kompletter Bestellstopp bei Prozessausfall.
- MVP-Workaround: aggressives Restart-Policy + schnelles Incident-Playbook.

2. **PostgreSQL single instance**
- Risiko: bei DB-Ausfall keine Bestellungen/Statusupdates.
- MVP-Workaround: häufige Backups + dokumentierter Restore + DB-Monitoring.

3. **Ein zentrales Cash-Display/OrderDesk pro Filiale**
- Risiko: lokale Betriebsunterbrechung, wenn Gerät ausfällt.
- MVP-Workaround: Fallback über Admin/Browser auf Zweitgerät.

4. **Kein zentraler Message-Queue/Event-Bus**
- Risiko: Realtime nur via Polling; bei Last höhere Latenz.
- MVP-Workaround: Polling-Intervalle und Retry-Handling sauber konfigurieren.

---

## Was passiert bei Serverneustart?

- Mit Docker `restart: unless-stopped` starten Services automatisch wieder.
- Laufende Sessions/Tokens bleiben gültig (DB-basiert/JWT), **in-memory Rate-Limiter-Zustand geht verloren**.
- Während Neustart:
  - neue Orders kurzzeitig nicht möglich
  - Clients müssen retryen
- Recovery:
  - Healthchecks abwarten
  - Feed/Polling lädt nach Neustart wieder aktuelle Orders

## Was passiert bei verlorener WebSocket-Verbindung?

- Aktuell kein zentraler WebSocket-Core als harte Abhängigkeit.
- Realtime läuft primär über Polling/Feed-Refresh.
- Bei Verbindungsverlust:
  - nächster erfolgreicher Poll synchronisiert Zustand nach
- Risiko:
  - temporäre UI-Verzögerung statt vollständiger Datenverlust

## Was passiert bei doppelter Bestellung?

- Risiko vorhanden (kein globales Idempotency-Key-Muster im Order-Create gefunden).
- Symptome:
  - Doppelorder bei Retry/Doppelklick/Netzflattern
- MVP-Workarounds:
  - clientseitige Submit-Sperre
  - serverseitige heuristische Duplicate-Checks (kurzes Zeitfenster, gleicher Payload)
  - Staff-UI-Workflow „Dubletten markieren/stornieren“

## Was passiert wenn Fahrer offline ist?

- Driver-Heartbeat/Sessions zeigen Offline-Zustand.
- Order bleibt i. d. R. zugewiesen, aber Fortschritt stagniert.
- MVP-Workarounds:
  - Reassign-Funktion am Cash-Display
  - Escalation-Regel ab X Minuten ohne Heartbeat/Statusänderung

---

## Kritische Daten

- `tenantId`, `chainId` (Isolation/Autorisierung)
- `order.id`, `status`, `paymentStatus`, `paymentMethod`
- `assignedDriverId`, Driver Session IDs
- `terminalId`, `displayCode`, `orderdesk binding serial`
- Kundendaten: Name, Telefon, Adresse
- Audit-Events (Nachvollziehbarkeit)

---

## Welche Events sollten geloggt werden?

1. Order erstellt (mit tenantId, sourceChannel)
2. Order angenommen (inkl. ETA)
3. Statuswechsel je Order
4. Fahrer zugewiesen/neu zugewiesen
5. Fahrer Heartbeat-Timeout
6. Delivery gestartet/abgeschlossen
7. Payment-Statusänderung
8. OrderDesk Pairing/Binging/Reset
9. Tenant-Scope-Verletzungen (403)
10. 5xx-Fehler je kritischer Route

---

## Pilot-Risiken (markiert) + MVP-Workarounds

1. **[Hoch] Doppelbestellungen**
- Workaround: Submit-Lock + manuelle Dublettenroutine.

2. **[Hoch] Offline-Fahrer im Delivery-Flow**
- Workaround: Heartbeat-Schwelle + Reassign-Prozess.

3. **[Hoch] Ausfall Cash-Display**
- Workaround: browserbasierter Fallback-Arbeitsplatz.

4. **[Mittel] Polling-Latenz statt echter Push-Realtime**
- Workaround: enges, aber kontrolliertes Polling + Monitoring auf API-Last.

5. **[Mittel] Fehlende echte Payment-Provider-Absicherung**
- Workaround: im Pilot nur klarer manuell bestätigter Zahlungsprozess.

---

## Top 10 kritische Produktionsfehler

1. Order wird erstellt, aber im Cash-Feed nicht sichtbar.
2. Falscher Tenant erhält Bestellung.
3. Doppelbestellung durch Retry/Doppelklick.
4. Status bleibt auf `open` trotz Küchenabschluss.
5. Fahrerauftrag kommt nicht in der Fahrer-App an.
6. Fahrer bleibt „unterwegs“, Abschluss wird nicht persistiert.
7. PaymentStatus weicht von realem Zahlungsvorgang ab.
8. OrderDesk verliert Binding mitten in Schicht.
9. Nach Neustart fehlen neue Orders im Frontend (Poll-Fehler).
10. Fehlende Alarme bei 5xx/DB-Problemen führen zu später Reaktion.

---

## Kurzfazit für Pilotbetrieb

- **Produktionsnah vorhanden:**
  - Kernorderflow, Tenant-Scopes, OrderDesk-/Display- und Driver-Basis, Deployment/Backup-Grundlagen.
- **Größte Echtbetriebsrisiken:**
  - Duplicate Handling, Offline-/Gerätefälle, fehlendes starkes Monitoring, kein vollwertiger Payment-/Notification-Stack.
