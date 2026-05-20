# Production Readiness Matrix

Stand: 2026-05-20

| Modul | Status | Offene Punkte | Risiko | Nächster Schritt |
|---|---|---|---|---|
| Admin Navigation & UX | READY | Feintuning je Rolle | Niedrig | Periodische UX-Review |
| Menü-Import | LIMITED | OCR/Parser-Edgecases, manuelle QA bei Sonderkarten | Mittel | Goldensatz-Testkarten + Regression-Tests |
| Display Runtime | LIMITED | Legacy/Primary-Payload sauber angleichen | Mittel | Runtime-Builder als Single-Source finalisieren |
| Display Offline-First | LIMITED | Queue-/Sync-Monitoring sichtbar machen | Mittel | Sync-Metriken + Retry-Transparenz ergänzen |
| Screen-Studio | LIMITED | Alle Controls E2E gegen echte Displays verifizieren | Mittel | Snapshots mit Referenzlayouts automatisieren |
| Modul-Billing UI | LIMITED | Geräteaktionen je Gerätetyp weiter absichern | Mittel | Einheitliche API-Fähigkeitsmatrix pro Gerätetyp |
| Billing & Rechnungen | IN_PREPARATION | Rechts-/Steuer-Review, E-Rechnung-Exportpfad | Hoch | Auditierbare Invoice-Pipeline stufenweise härten |
| Rollen & Rechte (Backend) | LIMITED | Prüfpfade bei Spezialrollen vollständig katalogisieren | Mittel | Rechte-Matrix + API-Autorisierungstests |
| Audit Logs | LIMITED | Kritische Flows vollständig abdecken | Mittel | Pflicht-Events je Kernmodul definieren |
| Notifications intern | IN_PREPARATION | Einheitliches Event-Schema fehlt | Mittel | Basis-Event-Bus und Prioritätenmodell definieren |
| Delivery Area Polygon | READY | Zusätzliche E2E-Szenarien für PLZ/Polygon-Fallback | Niedrig | Smoke-Test in Release-Checkliste |
| Monitoring/Operations | IN_PREPARATION | Readiness/Alerting noch ausbaufähig | Mittel | `/ready` + DB/Redis/Queue Health erweitern |

## Status-Definition
- **READY**: Für den aktuellen Betrieb robust nutzbar.
- **LIMITED**: Nutzbar, aber mit bekannten Grenzen/Restarbeiten.
- **IN_PREPARATION**: Architektur/Grundlagen vorhanden, noch nicht produktionsvollständig.
