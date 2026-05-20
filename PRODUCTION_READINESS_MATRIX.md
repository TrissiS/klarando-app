# Production Readiness Matrix

Stand: 2026-05-20

| Bereich | Status | Aktueller Stand | Offene Punkte | Risiko | Nächster sinnvoller Schritt |
|---|---|---|---|---|---|
| Admin Navigation & Workspaces | READY | Hauptbereiche vereinfacht, Workspace-Einstiege angelegt | Feinschliff je Rolle und Tenant-Kontext | Niedrig | UX-Review mit 3 Pilotkunden |
| Menü-Import | LIMITED | OCR + Parser stabil, Vorschau und Warnungen aktiv | Sonderkarten/Edgecases weiter absichern | Mittel | Referenz-Testset + Regressionen |
| Display Runtime | LIMITED | Runtime-Zentralisierung begonnen, Legacy kompatibel | Rest-Endpunkte auf zentralen Builder vereinheitlichen | Mittel | Primary/Legacy schrittweise konsolidieren |
| Display Offline-First | LIMITED | Snapshot/Fallback vorhanden | Sync-Telemetrie und Queue-Transparenz ausbauen | Mittel | Sync-Metriken + Retry-Anzeige |
| Screen-Studio | LIMITED | Zentrale Steuerseite aktiv | E2E-Validierung aller Controls gegen Live-Geräte | Mittel | Snapshot-Tests für Templates |
| Geräteverwaltung | LIMITED | Typisierte Geräteaktionen weitgehend geschützt | Nicht angebundene Typaktionen final angleichen | Mittel | Capability-Matrix je Gerätetyp |
| Billing & Rechnungen | IN_PREPARATION | Struktur und Statusmodell vorbereitet | Rechts-/Steuerdetails, E-Rechnungsexporte | Hoch | Steuer-/Legal-Review + Pilotabrechnung |
| Payment/Einzüge | IN_PREPARATION | Vorbereitung vorhanden, kein Live-Einzug | Provider- und Mandatsfluss finalisieren | Hoch | Sandbox-Integration mit Auditpfad |
| Rollen & Rechte | LIMITED | Modul-/Rechtegating aktiv | Vollständige API-Autorisierungstests | Mittel | Rechte-Regressionstests automatisieren |
| Audit Logs | LIMITED | Grundstruktur vorhanden | Kritische Flows vollständig abdecken | Mittel | Pflicht-Events je Kernmodul erzwingen |
| Notifications intern | IN_PREPARATION | Teilweise vorhanden | Einheitliches Event-Schema fehlt | Mittel | Event-Typkatalog + Routing |
| Delivery Polygon | READY | Persistenz und Validierung produktiv nutzbar | Erweiterte E2E-Szenarien | Niedrig | Smoke-Test in Release-Gates |
| Monitoring/Operations | IN_PREPARATION | Health-Bausteine vorhanden | Readiness/Alerting ausbauen | Mittel | `/ready` plus externe Checks |

## Statusdefinition
- **READY**: Für den aktuellen Betrieb robust nutzbar.
- **LIMITED**: Nutzbar, aber mit bekannten Grenzen/Restarbeiten.
- **IN_PREPARATION**: Architektur/Grundlagen vorhanden, noch nicht produktionsvollständig.
- **BROKEN**: Aktuell nicht stabil einsetzbar; priorisierte Fehlerbehebung nötig.
