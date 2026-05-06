# Klarando MVP Go-Live Checklist

Stand: 06.05.2026  
Ziel: Erster echter Imbiss soll produktiv testen können (kontrollierter Pilot).

## 1) Gesamtbewertung

| Bereich | Status | Kurzbewertung |
|---|---|---|
| 1. Auth/Login | ✅ | Admin- und App-Login vorhanden, Passwort-Hashing modernisiert, Rate Limits aktiv. |
| 2. Rollen & Tenant-Isolation | ⚠️ | Zentrale Tenant-Scope-Logik ist vorhanden; breite Absicherung wurde umgesetzt, aber E2E-Rechte-Tests fehlen. |
| 3. Produktverwaltung | ✅ | CRUD + Tenant-Bezug vorhanden. |
| 4. Kategorien | ✅ | CRUD + Tenant-Bezug vorhanden. |
| 5. Bestellungen | ⚠️ | Kernflow vorhanden (Order, Status, Routing), aber produktiver Last-/Fehlerfall-Test fehlt. |
| 6. OrderDesk | ⚠️ | Pairing/Binding/Heartbeat vorhanden, aber Feldtest auf echter Hardware steht aus. |
| 7. Fahrerfluss | ⚠️ | Driver-Login, Zuweisung, Status und Device-Session vorhanden; realer Pilotprozess muss validiert werden. |
| 8. Kunden-App/Web-App | ⚠️ | Checkout/Bestellung vorhanden; produktive UX- und Fehlerpfade noch nicht vollständig abgesichert. |
| 9. Zahlungen | ❌ | Nur Zahlungsarten/Status im System, keine echte Payment-Provider-Integration (Webhook/Capture/Refund). |
| 10. E-Mail/Benachrichtigungen | ❌ | Kein echter Versanddienst (E-Mail/Push) integriert; Kampagnen sind aktuell nur „queued“/Audit. |
| 11. Rechtliches/DSGVO | ⚠️ | Impressum/Datenschutz/AGB-Seiten vorhanden; Prozesse (Auskunft/Löschung/Protokollierung) müssen operativ sauber definiert werden. |
| 12. IONOS Deployment | ✅ | Docker/Compose/Nginx/SSL-Doku vorhanden, produktionsnahes Setup vorbereitet. |
| 13. Backup/Restore | ✅ | Backup/Restore-Skripte + Doku vorhanden, inklusive Test-Restore-Ablauf. |
| 14. Monitoring/Logs | ❌ | Healthchecks da, aber kein strukturiertes Monitoring/Alerting/zentrales Log-Setup. |
| 15. Kritische Bugs/Blocker | ⚠️ | Keine automatische Test-Suite; produktive Pilot-Checkliste als Sicherheitsnetz nötig. |

---

## 2) Go-Live-Entscheidung

**Go-Live möglich: Nein (Stand heute).**

**Begründung:**  
Für einen echten Pilotbetrieb fehlen noch harte Mindestbausteine bei Zahlungen, Benachrichtigungen und Monitoring.  
Technisch ist die Plattform weit, aber für produktiven Test mit realen Kund:innen braucht es noch klare Absicherung der Betriebsrisiken.

---

## 3) Zwingend vor erstem MVP-Pilot

1. **Monitoring + Alerting aktivieren** (API down, DB down, Fehlerquote, 5xx-Alarm).
2. **Pilot-Zahlungsstrategie festlegen**:
   - Entweder strikt „vor Ort/Bar/Karte manuell“ und im UI klar kennzeichnen,
   - oder echte Online-Payment-Integration (inkl. Webhooks).
3. **Benachrichtigungskanal festlegen**:
   - mindestens transaktionale E-Mails oder Push für Bestellstatus.
4. **E2E-Rollen-/Tenant-Tests für kritische Flows** (Admin, Filialadmin, Staff, Driver, Kunde).
5. **Pilot-Runbook fertigstellen** (Ausfallplan, Restore-Plan, Zuständigkeiten, Notfallkontakt).
6. **Hardware-Feldtest** (OrderDesk-Gerät, Drucker 80mm, Fahrergerät, QR-Pairing unter Realbedingungen).

---

## 4) Was nach MVP kommen kann

- Vollständige Online-Payment-Anbindung (PayPal/Klarna/Karte inkl. Rückerstattung).
- Kampagnen-/CRM-Versand mit echtem Provider.
- Zentrales Observability-Stack (Metriken, Tracing, Dashboards).
- Lasttests und Performance-Tuning.
- CI/CD mit Gate-Checks (Security, Env-Safety, Smoke-Tests).

---

## 5) Top 10 nächste Aufgaben (Priorität)

1. Monitoring/Alerting produktiv einführen (Uptime + 5xx + DB-Verbindung + Disk/Memory).
2. Pilot-Zahlungsmodus verbindlich festlegen und in UI/Prozess dokumentieren.
3. Transaktionale Benachrichtigungen für Bestellstatus live schalten.
4. E2E-Regressionstests für Tenant-Isolation in kritischen Routen ergänzen.
5. Pilot-Checklauf auf Staging mit echter Datenbankkopie (anonymisiert) durchführen.
6. Restore-Test praktisch ausführen und protokollieren (nicht nur dokumentieren).
7. OrderDesk + Drucker + Fahrerfluss in einem echten End-to-End-Szenario abnehmen.
8. Betriebs-Runbook für Support/Incident (inkl. „Bestellung hängt“, „Gerät offline“) finalisieren.
9. CI-Workflow ergänzen: `check:env-safety`, Typecheck, Lint, optional Smoke-Test.
10. Nach Pilotwoche: Bug-Triage, Stabilitätsfixes und erst dann breiter Rollout.

---

## 6) Praktische Empfehlung für den ersten Imbiss-Test

**Empfohlenes Vorgehen:**  
Geschlossener Pilot mit 1 Filiale, begrenzten Öffnungszeiten und klarer „Fallback auf manuelle Annahme“, bis Monitoring + Benachrichtigungen + Feldtest sauber bestätigt sind.
