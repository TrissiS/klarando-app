# Pilot Stability Backlog (aus Real-Flow + 7-Tage-Plan)

Stand: 06.05.2026  
Ziel: Stabilitäts- und Bugfix-Backlog für den ersten echten Pilotbetrieb.

## P0 — Muss vor Pilot

### P0-01: Duplicate-Order-Schutz beim Checkout
- Problem:
  - Doppelte Bestellung bei Doppelklick/Retry/Netzflattern möglich.
- Betroffene Dateien/Routen:
  - `backend/src/routes/orders.ts` (`POST /api/orders`)
  - `backend/src/routes/order-terminals.ts` (`POST /api/order-terminals/public/:terminalCode/orders`)
  - Kunden-Frontend Submit-Flow (`app/main-app` + Flutter Checkout)
- Lösungsidee:
  - Idempotency-Key pro Checkout einführen (Header/Body), serverseitig kurzzeitig speichern.
  - Zusätzlich clientseitige Submit-Sperre bis API-Antwort.
- Akzeptanzkriterium:
  - Gleiches Payload + gleicher Idempotency-Key erzeugt maximal 1 Order.
- Risiko wenn offen:
  - Doppelproduktion, falsche Auslieferung, Umsatz-/Vertrauensschaden.

### P0-02: Driver-Offline-Recovery-Workflow
- Problem:
  - Fahrer kann offline gehen; Order bleibt „unterwegs“ hängen.
- Betroffene Dateien/Routen:
  - `backend/src/routes/orders.ts` (`/driver/device-heartbeat`, `/driver/assigned`, Dispatch/Status)
  - `backend/src/lib/driver-device-sessions.ts`
  - Order-Display Driver-Assign UI (`app/order-display/[displayCode]/page.tsx`)
- Lösungsidee:
  - Heartbeat-Timeout-Regel + sichtbarer „offline“-Status + Reassign-Button mit Guardrails.
- Akzeptanzkriterium:
  - Nach Heartbeat-Timeout kann Order in <1 Minute neu zugewiesen werden.
- Risiko wenn offen:
  - Lieferabbrüche, Statuschaos, Support-Overload.

### P0-03: OrderDesk-Recovery nach Verbindungsverlust
- Problem:
  - Gerät verliert Session/Binding im Betrieb.
- Betroffene Dateien/Routen:
  - `backend/src/routes/orderdesk-devices.ts` (`/public/bind`, `/public/heartbeat`, `/bindings/:bindingId/reset`)
  - OrderDesk-Client Recovery-Logik (Flutter/Device)
- Lösungsidee:
  - Automatischer Reconnect-Flow mit klarer UI-Meldung + fallback „neu koppeln“.
- Akzeptanzkriterium:
  - Nach Netzunterbruch kommt Gerät ohne manuelle DB-Eingriffe wieder online.
- Risiko wenn offen:
  - Kasse sieht Orders nicht zuverlässig.

### P0-04: Minimal Monitoring + Alerting aktiv
- Problem:
  - Ausfälle werden zu spät erkannt.
- Betroffene Bereiche:
  - Docker-Stack, Nginx, Backend `/api/health`
- Lösungsidee:
  - Uptime-Check, 5xx-Alarm, Container-down-Alarm, DB-Erreichbarkeit.
- Akzeptanzkriterium:
  - Kritische Ausfälle erzeugen innerhalb von 2 Minuten einen Alarm.
- Risiko wenn offen:
  - Längerer unbemerkter Produktionsausfall.

### P0-05: Pilot-Supportprozess verbindlich
- Problem:
  - Keine einheitliche Incident-Bearbeitung im Echtbetrieb.
- Betroffene Bereiche:
  - Betrieb/Onboarding/Support
- Lösungsidee:
  - Schweregradmatrix (S1/S2/S3), Eskalationskette, feste Reaktionszeiten.
- Akzeptanzkriterium:
  - Jeder Pilotfehler wird in Ticket + SLA + Besitzer erfasst.
- Risiko wenn offen:
  - Unkoordinierter Support, langsame Recovery.

## P1 — Sehr wichtig

### P1-01: Event-Logging für kritische Order-Lebenszyklus-Events
- Problem:
  - Fehlende Nachvollziehbarkeit bei Streitfällen/Fehleranalyse.
- Betroffene Dateien/Routen:
  - `backend/src/routes/orders.ts`
  - `backend/src/routes/order-displays.ts`
  - `backend/src/routes/orderdesk-devices.ts`
  - `backend/src/lib/audit.ts`
- Lösungsidee:
  - Standard-Events loggen: create, accept, dispatch, status change, delivery done, payment change.
- Akzeptanzkriterium:
  - Für jede Pilotorder ist eine vollständige Event-Historie abrufbar.
- Risiko wenn offen:
  - Root-Cause-Analysen dauern zu lange.

### P1-02: Payment-Lücke klar absichern (MVP-Modus)
- Problem:
  - Payment-Methoden vorhanden, aber keine vollständige Provider-Integration/Webhooks.
- Betroffene Dateien/Routen:
  - `backend/src/routes/orders.ts` (paymentStatus/paymentMethod)
  - Checkout-UIs (Web/Flutter)
- Lösungsidee:
  - Pilot auf „vor Ort bezahlt“/klaren manuellen Payment-Prozess begrenzen.
  - UI-Hinweis und Backoffice-Checkliste pro Order.
- Akzeptanzkriterium:
  - Keine „falsch bezahlt“-Fälle im Pilot durch unklaren Prozess.
- Risiko wenn offen:
  - Finanzielle Differenzen, Konflikte mit Kunden.

### P1-03: Notification-Lücke mit Minimal-Lösung schließen
- Problem:
  - Kein echter E-Mail/Push-Versand für transaktionale Updates.
- Betroffene Dateien/Routen:
  - `backend/src/routes/customers.ts` (Kampagnen aktuell nur queued)
  - Kunden-/Driver-/OrderDesk-UI
- Lösungsidee:
  - MVP-Workaround: statuskritische Infos über In-App Polling + klare Supportnachricht.
  - Optional einfacher Mailprovider für „Bestellung eingegangen“-Mail.
- Akzeptanzkriterium:
  - Kunde hat im Pilot nachvollziehbaren Statuskanal.
- Risiko wenn offen:
  - Unsicherheit/mehr Supportanfragen.

### P1-04: Recovery nach API-/Serverneustart testen
- Problem:
  - Unklar, wie schnell Clients nach Restart wieder synchron sind.
- Betroffene Bereiche:
  - Docker Compose, Backend, Display/Driver Polling
- Lösungsidee:
  - Geplanter Restart-Test im Pilotfenster mit Messung der Wiederanlaufzeit.
- Akzeptanzkriterium:
  - Vollbetrieb nach Restart in definiertem Ziel (z. B. <5 Minuten).
- Risiko wenn offen:
  - Betriebsunterbrechung bei ungeplanten Neustarts.

### P1-05: Realtime-/Polling-Lag observierbar machen
- Problem:
  - Polling-basiertes Sync kann verzögern; aktuell wenig Messwerte.
- Betroffene Dateien/Routen:
  - `app/order-display/[displayCode]/page.tsx` (Intervalle)
  - Feed-Routen in `backend/src/routes/order-displays.ts`
- Lösungsidee:
  - Metrik für Feed-Aktualisierungslatenz und Poll-Fehler einführen.
- Akzeptanzkriterium:
  - Dashboard/Logs zeigen Lag und Fehlerquote pro Filiale.
- Risiko wenn offen:
  - schleichende Echtzeitprobleme bleiben unentdeckt.

## P2 — Kann nach Pilot

### P2-01: Vollständige Payment-Provider-Integration
- Problem:
  - Kein End-to-End Online-Payment mit Webhooks/Refunds.
- Betroffene Bereiche:
  - Checkout, Backend Payments, Finance-Prozesse
- Lösungsidee:
  - Provider auswählen, webhook-sichere Statusmaschine, Refund-Flow.
- Akzeptanzkriterium:
  - Vollautomatischer bezahlter Checkout inkl. Rückerstattung möglich.
- Risiko wenn offen:
  - Skalierung in Richtung Lieferando-ähnlicher Plattform gebremst.

### P2-02: Strukturiertes Observability-Stack
- Problem:
  - Logs/Healthchecks da, aber kein vollwertiges zentrales Observability-Setup.
- Betroffene Bereiche:
  - Backend/Ops
- Lösungsidee:
  - Zentrale Logs, Metriken, Dashboards, Alert-Routing.
- Akzeptanzkriterium:
  - Fehler/Performance aus einem zentralen System auswertbar.
- Risiko wenn offen:
  - Höhere MTTR bei komplexen Incidents.

### P2-03: Automatisierte E2E-Regression für Pilotflüsse
- Problem:
  - Kaum automatisierte Ende-zu-Ende-Tests.
- Betroffene Bereiche:
  - API + Frontends + Flows
- Lösungsidee:
  - E2E-Suite für: Bestellung, Annahme, Dispatch, Lieferung, Rating.
- Akzeptanzkriterium:
  - Kritische Flows laufen in CI reproduzierbar grün.
- Risiko wenn offen:
  - Regressionen werden spät entdeckt.

### P2-04: Erweiterte Device-Fleet-Tools
- Problem:
  - Geräteverwaltung im Pilot ausreichend, aber für Skalierung begrenzt.
- Betroffene Bereiche:
  - OrderDesk/Driver Device Management
- Lösungsidee:
  - Bulk-Tools, bessere Diagnose, Lebenszyklus-Ansicht pro Gerät.
- Akzeptanzkriterium:
  - Onboarding/Support mehrerer Geräte deutlich schneller.
- Risiko wenn offen:
  - Operative Last steigt mit jeder neuen Filiale.

---

## Empfohlene Reihenfolge (kompakt)

1. P0-01 Duplicate-Order-Schutz  
2. P0-02 Driver-Offline-Recovery  
3. P0-03 OrderDesk-Recovery  
4. P0-04 Monitoring/Alerting  
5. P0-05 Supportprozess  
6. P1-01 Event-Logging  
7. P1-02 Payment-MVP-Schutz  
8. P1-03 Notification-MVP-Schutz  
9. P1-04 Restart-Recovery-Test  
10. P1-05 Polling-Lag-Metrik
