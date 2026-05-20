# SCALING_READINESS_REPORT

Stand: 20.05.2026

## 1) Frontend / Next.js

### Aktueller Zustand
- Next.js läuft im Docker-Selfhosting stabil (`Dockerfile.web`, Build + Start im Container).
- Healthcheck vorhanden über `GET /api/health` (Web-Container).
- `next.config.ts` ist derzeit minimal (kein `output: "standalone"` gesetzt).
- Der Großteil der Geschäftslogik läuft API-zentriert über Backend, nicht im Next-In-Memory-State.

### Risiken
- Ohne `standalone` ist das Runtime-Image größer und enthält mehr Abhängigkeiten als nötig.
- Eventuelle serverseitige In-Memory-Caches in Next (falls später ergänzt) würden bei Multi-Instance nicht geteilt.

### Empfehlung
- Kurzfristig: aktuelles Setup beibehalten (stabil), aber `output: "standalone"` für späteren Rollout vorbereiten und Dockerfile gezielt umstellen.
- Keine sessionkritische Logik in Next-In-Memory halten.

---

## 2) Backend

### Aktueller Zustand
- Backend ist weitgehend stateless (JWT/DB-basiert, API-zentriert).
- Rollen/Rechte werden serverseitig geprüft.
- Neue Idempotency-Absicherung für Orders ist tenant-sicher umgesetzt.

### Risiken
- Es existieren In-Memory-Komponenten (z. B. Order-Create-Idempotency-Reservation-Store und typische In-Memory-Rate-Limiter). Diese sind pro Instanz getrennt.
- Bei mehreren Backend-Instanzen können In-Memory-Reservierungen nicht global synchron sein.

### Empfehlung
- Kurzfristig okay durch DB-Unique-Constraints (bereits wichtigster Schutz gegen Duplikate).
- Ab ~50+ Lokalen: Redis für verteilte Idempotency-Locks und Rate-Limits einführen.
- WebSocket/SSE (falls später eingeführt): direkt mit Redis Pub/Sub oder Message-Bus planen.

---

## 3) Display-System

### Aktueller Zustand
- Display-App pollt Pairing ca. alle 2s (nur im Pairing-Zustand).
- Nach Verbindung pollt Content + Heartbeat ca. alle 30s.
- Offline-First/Cache-First ist vorbereitet (letzter Stand wird weiter angezeigt).

### Risiken
- Viele Displays können bei gleichen Polling-Intervallen Lastspitzen erzeugen.
- Medien werden aktuell über App/Backend-Pfade bezogen; für große Mengen ist CDN/Object Storage besser.

### Empfehlung
- Polling-Jitter einführen (z. B. ±10–20%), damit nicht alle Clients gleichzeitig pollen.
- Display-Content versionieren (ETag/Version-Feld), damit unveränderte Daten mit 304/leichtem Payload beantwortet werden.
- Bilder/Videos mittelfristig über Object Storage + CDN ausliefern, nicht über API-Stream.

---

## 4) Datenbank / Prisma

### Aktueller Zustand
- Migration-Flow ist produktionsnah (`prisma migrate deploy` im Backend-Container-Start).
- Relevante Idempotency-Indizes wurden ergänzt (`tenantId+idempotencyKey`, `tenantId+clientOrderId`).

### Risiken
- Wachsende Tabellen (`Order`, `OrderItem`, Heartbeat-/Event-ähnliche Daten) benötigen laufende Index- und Query-Review.
- Gefahr von tenantübergreifenden Vollscans bei unsauber gefilterten Admin-/Superadmin-Abfragen.

### Empfehlung
- Tenant-first-Indexstrategie beibehalten (immer `tenantId` in führenden Indizes für Hot Queries).
- Für große Volumen regelmäßig Slow Query Review + EXPLAIN planen.
- Optional ab 100+ Lokalen: Partitionierung/Archivierung für historische Orders & Events evaluieren.

---

## 5) Medien / Bilder

### Aktueller Zustand
- Uploads liegen aktuell backendnah (`/uploads`, lokales Filesystem im Container-Setup).

### Risiken
- Lokale Filesystem-Storage skaliert schlecht über mehrere Instanzen/Nodes.
- Medien in Git oder Container-Layer blähen Deployments auf.

### Empfehlung
- Zielbild: S3-kompatibler Object Storage + CDN.
- Backend speichert nur Metadaten/URLs.
- Bildoptimierung asynchron im Job-System.

---

## 6) Hintergrundjobs

### Aktueller Zustand
- Einige rechenintensivere Abläufe laufen noch requestnah.

### Risiken
- Höhere Latenz und Timeouts bei Last (Abrechnung, Reporting, Medienverarbeitung, E-Mail).

### Empfehlung
- Queue-Architektur vorbereiten: Redis + BullMQ.
- Kandidaten für Jobs:
  - Rechnungserstellung
  - Monatsabrechnung
  - E-Mail-Versand
  - Webhook-Nachverarbeitung
  - Reporting/Aggregation
  - Bildoptimierung
- Wichtig: idempotente Jobs + Retry-Strategie + Dead-Letter-Konzept.

---

## 7) Monitoring / Betrieb

### Aktueller Zustand
- `GET /api/health` vorhanden.
- Neu ergänzt: `GET /api/ready` mit DB-Check (`SELECT 1`).

### Empfehlung
- Health/Ready trennen (bereits gestartet):
  - `health`: Prozess lebt
  - `ready`: DB erreichbar + optional externe Dependencies
- Nächste sinnvolle Checks:
  - Redis-Ready (sobald Redis genutzt wird)
  - Queue-Lag-Metriken
  - Display-Heartbeat-Übersicht (online/offline/instabil)
- Logging:
  - strukturierte Logs (JSON)
  - Korrelation via requestId/deviceId/tenantId

---

## 8) Priorisierte Roadmap nach Größenordnung

### Sofort (jetzt)
1. `/api/ready` mit DB-Check (umgesetzt).
2. Idempotency + DB-Unique für Orders (bereits umgesetzt).
3. Tenant-sichere Query-Reviews für Hot-Endpunkte.

### Ab ~50 Lokalen
1. Redis für verteilte Idempotency/Rate-Limits.
2. Polling-Jitter + Display-Content-Versioning.
3. Erste zentrale Metriken + Alerting.

### Ab ~100 Lokalen
1. Object Storage + CDN für Medien.
2. BullMQ-Worker für schwere asynchrone Prozesse.
3. Gezieltes Query/Index-Tuning auf Produktionsdaten.

### Ab ~500 Lokalen
1. Mehrere Backend-Instanzen hinter LB als Standard.
2. Read-Scaling-Strategie DB (Read-Replicas/Reporting-DB).
3. Event- und Heartbeat-Daten archivieren/partitionieren.

### Ab ~1000 Lokalen
1. Strikte Trennung von Online-Transaktionen vs. Analytics/Reporting.
2. Vollständiges SLO/SLI-Setup mit Error Budgets.
3. Lasttests mit realistischen Display-/Order-Sync-Profilen vor Releases.

---

## 9) Konkrete kleine Umsetzung in diesem Schritt
- Neu: `GET /api/ready` in `backend/src/server.ts`.
- Liefert `ready=true/false` inkl. DB-Check, geeignet für LB/Orchestrator-Readiness.

