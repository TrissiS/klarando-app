# Klarando Professionalization Roadmap

## Zielbild
Klarando wird schrittweise zu einer belastbaren SaaS-Plattform mit sauberer Mandantentrennung, nachvollziehbarer Abrechnung, stabiler Display-Laufzeit und prüfbaren Betriebsprozessen ausgebaut.

## Aktueller Stand (Kurzbewertung)
- Multi-Tenant: gutes Fundament über Tenant-Scope-Prüfungen in zentralen Routen.
- Rollen & Rechte: Permission-Checks sind in vielen API-Bereichen vorhanden; weiterhin punktuell konsolidierungsbedürftig.
- Billing: deutlicher Ausbau vorhanden (Pläne, Profile, Runs, Invoices, PaymentCollections, Mailbox, Audit-Events).
- Display/Device: Runtime, Pairing, Offline-First und Heartbeats sind vorhanden; Studio als zentrale Oberfläche weit fortgeschritten.
- Audit: globales AuditLog-Modell vorhanden; wichtige Billing-Aktionen sind bereits protokolliert.
- Monitoring: `/api/health`, `/api/ready`, `/api/version` vorhanden; Display-Heartbeat-Health ergänzt.
- Backup/Recovery: technisch möglich, aber als Prozess noch zu formalisieren (siehe separates Dokument).
- Skalierung: Architektur ist grundsätzlich container-fähig/stateless, jedoch mit klaren nächsten Schritten für 100+ Betriebe.

## Risiko- und Schuldenprofil

### Hoch
- E-Rechnung noch vorbereitet, aber kein finaler ZUGFeRD/XRechnung-Export.
- Einige Geschäftsprozesse laufen noch request-synchron statt über Job/Queue-System.
- Audit-Abdeckung nicht in allen fachkritischen Pfaden einheitlich vollständig.

### Mittel
- Billing-/Profilfelder teils historisch über `notes` ergänzt; Ziel ist vollständige strukturierte Persistenz.
- Monitoring/Alerting noch ohne zentrales Dashboard und ohne Incident-Playbook.
- Geräteaktionen und Statusdarstellungen sind konsistent, aber müssen weiter durchgängig backend-seitig vereinheitlicht werden.

### Niedrig
- UI-Redundanzen in Teilbereichen (historische Admin-Pfade) sind größtenteils entschärft, aber weiter aufräumbar.

## Bereichsanalyse

### 1) Multi-Tenant-Sicherheit
- Positiv:
  - Tenant-Scope-Resolver ist breit im Einsatz.
  - Rollenprüfung im Backend vorhanden.
- ToDo:
  - Systematischer Endpoint-Audit: jede schreibende Route mit explizitem Tenant/Chain-Scope-Check dokumentieren.
  - Automatisierte Security-Regression-Tests (Tenant A darf niemals Daten von Tenant B sehen).

### 2) Rollen & Rechte
- Positiv:
  - Rollenmodell und PermissionKey-basierte Guards sind etabliert.
- ToDo:
  - Rollenmatrix als technische Quelle (`ROLE_CAPABILITY_MATRIX.md`) ergänzen.
  - Device-Rollen (Display/OrderDesk/Kitchen/Pickup) noch klarer als Maschinenrollen abgrenzen.

### 3) Billing/Rechnung
- Positiv:
  - Fortlaufende Rechnungsnummern vorhanden.
  - Status-, Finalisierungs-, Mailbox- und Payment-Kontexte sind angelegt.
  - Storno-/Korrekturgrundlagen vorbereitet.
  - Strukturierte Unternehmens-/Profilfelder deutlich erweitert.
- ToDo:
  - E-Rechnung Export-Layer (EN16931/ZUGFeRD/XRechnung) umsetzen.
  - PDF als Darstellung, strukturierte Rechnung als primäre Wahrheit konsequent weiterführen.
  - Versand- und Zahlungsstatus-Automation mit Freigabegates finalisieren.

### 4) Display-/Device-System
- Positiv:
  - Offline-First und Snapshot-Strategie vorhanden.
  - TV-Stick-/`deviceCode`-Kompatibilität bleibt Kernanforderung.
  - Heartbeat-Tracking vorhanden; Health-Endpoint ergänzt.
- ToDo:
  - Polling-Jitter/ETag-Versionierung überall konsequent nutzen.
  - Medienpfad mittelfristig auf Objektstorage/CDN verlagern.

### 5) Notifications/Internes Nachrichtensystem
- Positiv:
  - Mailbox-Modell und Billing-Ereignisse sind integriert.
- ToDo:
  - Ereigniskatalog zentralisieren:
    - Rechnung erstellt/freigegeben/versendet
    - Zahlung fehlgeschlagen/Rücklastschrift
    - Display offline/neu gekoppelt
    - Modul/Limits Ereignisse

### 6) Audit-Logs
- Positiv:
  - Zentrales AuditLog-Modell vorhanden.
- ToDo:
  - Standardisierte Payload-Konvention:
    - `entityType`, `entityId`, `action`, `actorUserId`, `tenantId`, `branchId`, `before`, `after`, `createdAt`.
  - `before/after` in kritischen Finanz- und Rechtepfaden schrittweise ergänzen.

### 7) Monitoring/Health
- Vorhanden:
  - `/api/health`, `/api/ready`, `/api/health/ready`, `/api/version`.
  - Neu: `/api/health/display-heartbeats`.
- ToDo:
  - zentrales Alerting (z. B. uptime/5xx/db-latency/display-offline-rate).
  - Readiness künftig optional um Redis-/Queue-Checks ergänzen.

### 8) Backup/Recovery
- Siehe `BACKUP_RECOVERY_PLAN.md`.
- Muss als Betriebspflicht mit Restore-Tests etabliert werden.

### 9) Modul-/Lizenzsystem
- Positiv:
  - Module/Billing werden sichtbar zusammengeführt.
- ToDo:
  - Lizenzlogik als eigene Domänenschicht härten (Featureflag + Vertragsstatus + Laufzeit + Audit).

### 10) Datenschutz / DSGVO-Basics
- Positiv:
  - Mandantentrennung und rollenbasierte APIs sind gute Basis.
- ToDo:
  - Lösch-/Anonymisierungsprozesse dokumentieren.
  - Datenminimierung für sensible Zahlungs-/IBAN-Felder (Verschlüsselung/Tokenisierung) priorisieren.

## Reihenfolge der Umsetzung

### Sofortmaßnahmen (jetzt)
1. Roadmap + Backup/Recovery-Dokumente pflegen.
2. Health/Readiness und Versionssichtbarkeit standardisieren.
3. Billing-Felder strukturiert halten, keine wild wachsenden JSON-Insellösungen.
4. Audit-Ereignisse für alle kritischen Billing-Aktionen vollständig machen.

### Vor Pilotbetrieb
1. Rollenmatrix + Security-Regression-Tests.
2. Storno-/Korrekturworkflow UI-seitig abschließen (nur kontrollierte Pfade).
3. Notification-Katalog produktiv sichtbar machen.
4. Restore-Test nach dokumentiertem Backup-Plan durchführen.

### Vor öffentlichem GoLive
1. E-Rechnungs-Empfangs-/Exportfähigkeit finalisieren.
2. Provider-/SEPA-Prozesse mit klaren Freigabegates produktiv schalten.
3. Incident-Runbooks + Alerting + Oncall-Basis etablieren.
4. Sicherheitsreview (Tenant-Isolation, Rechte, API-Härtung, Secrets).

## Skalierungsstufen

### Ab ~50 Betrieben
- Query- und Index-Review für Orders, Invoice, PaymentCollections, DisplayHeartbeats.
- Einheitliche Caching-Strategie für Display-Runtime.

### Ab ~100 Betrieben
- Job-Queue (Redis + BullMQ) für:
  - Rechnungs-/Monatslauf
  - E-Mail
  - Webhooks
  - Reporting
- Rate-Limits und Retry-Policies härten.

### Ab ~500 Betrieben
- Medien auf Object Storage + CDN.
- Asynchrone Event-Pipeline für Geräte-/Abrechnungsereignisse.
- Metriken/Tracing zentral (APM + Logs + Dashboards).

### Ab ~1000 Betrieben
- Horizontale Skalierung mit klarer SLO-Steuerung.
- DB-Optimierung: Read-Strategie, Partitionierungs-/Archivkonzept für große Events.
- Chaos-/Failover-Tests regelmäßig.

## Was bereits als erste sichere Grundlage umgesetzt wurde
- Erweiterte strukturierte Billing-/Unternehmens-/Zahlungsfelder.
- Verbesserte Billing-Historie-/Korrektur-/Storno-Basis.
- Display-Heartbeat-Health-Endpunkt.
- Dokumentation zu rechtlich sensiblen Billing-Prozessen ohne „Zertifizierungs“-Behauptung.

## Offene Folgeaufgaben (empfohlen als nächste Codex-Tickets)
1. `ROLE_CAPABILITY_MATRIX.md` + automatisierte Rechte-Tests.
2. Einheitliches Audit-Payload-Schema (`before/after`) in kritischen Routen.
3. E-Rechnung Export-Engine (ZUGFeRD/XRechnung, EN16931 Mapping).
4. Queue-First-Refactor für Monatslauf, Mail, Webhooks.
5. Monitoring-Dashboard + Alert-Regeln + Restore-Drill-Protokoll.
