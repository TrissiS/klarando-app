# DSGVO-/Compliance-Gap-Analyse fuer Klarando

Stand: 06.05.2026
Scope: Technische und organisatorische Voranalyse fuer Pilotbetrieb (Deutschland/EU)

## 1) Kurzfazit

Klarando ist technisch schon auf einem soliden Sicherheitsfundament (Rollen, Tenant-Scope, Passwort-Hashing, Rate-Limits, CORS-Haertung, Backup-Doku).

Fuer einen echten Pilot in Deutschland sind aber noch mehrere Compliance-Bausteine noetig, vor allem:
- belastbarer DSAR-Prozess (Auskunft/Export/Loeschung),
- sauberes TOM-/AVV-Paket,
- finalisierte Rechtstexte (keine Platzhalter),
- Logging-/Datenminimierungsregeln als verbindlicher Betriebsstandard.

## 2) Einordnung nach Themen

### 2.1 DSGVO-Grundlagen
- Befund: Datenschutz/Impressum/AGB-Seiten sind vorhanden, aber als Vorlagen mit Platzhaltern.
- Einstufung: `kritisch vor Pilot`
- Warum: Rechtstexte muessen reale Gesellschafts-, Dienstleister- und Verarbeitungsangaben enthalten.

### 2.2 Personenbezogene Daten
- Befund: Es werden typische personenbezogene Daten verarbeitet (Name, E-Mail, Telefon, Adresse, Bestellungen, Fahrer-/Positionsdaten, Support/Audit-Metadaten).
- Einstufung: `MVP ausreichend`
- Warum: Technisch erfassbar und strukturierbar, aber Loesch-/Aufbewahrungsregeln noch nicht konsistent dokumentiert.

### 2.3 Rollen/Permissions
- Befund: Rollenmodell mit `SUPERADMIN/CHAINADMIN/ADMIN/STAFF/DRIVER` ist implementiert; Permission-Checks vorhanden.
- Einstufung: `bereits gut`
- Warum: Serverseitige Rollen- und Permission-Pruefung ist breit umgesetzt.

### 2.4 Tenant-Isolation
- Befund: Zentrale Tenant-Scope-Guard-Logik vorhanden und auf kritische Routen angewendet.
- Einstufung: `bereits gut`
- Warum: Multi-Tenant-Isolation ist als Architekturprinzip technisch erkennbar umgesetzt.

### 2.5 Audit-Logs
- Befund: AuditLog-Struktur und `writeAuditLog` sind vorhanden, inkl. Modul/Aktion/Actor/Tenant.
- Einstufung: `MVP ausreichend`
- Warum: Gute Basis, aber Aufbewahrung, Redaction und Zugriffskonzept muessen formalisiert werden.

### 2.6 Passwort-/Auth-Sicherheit
- Befund: bcrypt aktiv, Legacy-SHA-Migration beim Login, Token-TTL, Rate-Limits, CORS-Whitelist.
- Einstufung: `bereits gut`
- Warum: Fuer Pilot technisch ausreichend, Restpunkte eher operativ (Secret-Rotation, verteiltes Rate-Limit).

### 2.7 Loesch-/Exportfaehigkeit
- Befund: Account-Loeschanfrage (`request-deletion`) vorhanden, aber kein vollstaendiger DSAR-Export/automatisierter Loeschworkflow ueber alle Tabellen.
- Einstufung: `kritisch vor Pilot`
- Warum: Art. 15/17/20 DSGVO braucht reproduzierbaren Prozess.

### 2.8 Backup/Restore
- Befund: Backup-/Restore-Runbook und Skripte vorhanden, inklusive Retention-Hinweisen.
- Einstufung: `MVP ausreichend`
- Warum: Gute technische Basis, aber Restore-Test-Frequenz und Nachweisprozess sollten verpflichtend sein.

### 2.9 Hosting/Standort
- Befund: IONOS-VPS-Doku vorhanden, aber konkrete Auftragsverarbeitungs- und Standortnachweise sind organisatorisch zu finalisieren.
- Einstufung: `kritisch vor Pilot`
- Warum: Datentransparenz, Subprocessor-Liste und AVV muessen vor produktiver Verarbeitung final sein.

### 2.10 Payment-/Marketplace-Themen
- Befund: Payment-Domain wird vorbereitet, aber keine produktive PSP-Integration/Webhook-Governance live.
- Einstufung: `kritisch vor groesserem Rollout`
- Warum: Sobald Live-Payment startet, steigen regulatorische und buchhalterische Anforderungen deutlich.

### 2.11 Cookie/Tracking
- Befund: Kein offensichtlicher Tracking-Stack im Frontend-Basisstand, aber auch kein expliziter Consent-Manager etabliert.
- Einstufung: `kritisch vor groesserem Rollout`
- Warum: Bei spaeterem Analytics/Marketing-Tracking ist Consent-Management zwingend.

### 2.12 Datenschutzerklaerung/Impressum
- Befund: Seiten existieren, enthalten aktuell Platzhaltertext.
- Einstufung: `kritisch vor Pilot`
- Warum: Rechtliche Pflichtangaben muessen finalisiert sein.

### 2.13 AVV-Themen
- Befund: Technische Doku vorhanden, aber AVV-/TOM-/Subprocessor-Dokumentation nicht als abgeschlossen nachweisbar.
- Einstufung: `kritisch vor Pilot`
- Warum: Ohne AVV/TOM-Freigabe kein sauberer B2B-Produktivbetrieb.

### 2.14 Push-Notifications/E-Mail
- Befund: Kampagnen sind aktuell eher „queued“/auditierbar, aber kein vollstaendiger produktiver Zustell- und Consent-Governance-Prozess.
- Einstufung: `kritisch vor groesserem Rollout`
- Warum: Kommunikationskanaele brauchen Rechtsgrundlage, Widerruf und Zustell-/Fehlerprotokoll.

### 2.15 Logging sensibler Daten
- Befund: Keine offensichtlichen Passwort-Logs, aber Fehlerlogs koennen technisch personenbezogene Inhalte enthalten.
- Einstufung: `MVP ausreichend`
- Warum: Vor Rollout sollte Log-Redaction standardisiert und technisch erzwungen werden.

### 2.16 Zugriff auf Kundendaten durch Restaurants/Admins
- Befund: Rollen- und Tenant-Scope begrenzen Zugriff weitgehend.
- Einstufung: `bereits gut`
- Warum: Trennung zwischen Filialen/Ketten ist technisch angelegt.

## 3) Top 10 Compliance-Risiken

1. Platzhalter in Impressum/Datenschutz/AGB bleiben versehentlich live.
2. Kein belastbarer DSAR-Exportprozess (Auskunft/Datenportabilitaet).
3. Kein verbindlicher End-to-End-Loeschprozess inkl. Fristen und Nachweis.
4. AVV/TOM/Subprocessor-Verzeichnis unvollstaendig vor Produktivstart.
5. Fehlende formale Aufbewahrungs- und Loeschfristen pro Datendomäne.
6. Fehler-/Audit-Logs enthalten mehr personenbezogene Daten als noetig.
7. Consent-Management fuer spaeteres Tracking/Marketing nicht vorbereitet.
8. Fahrer-/Standortdaten ohne klare Speicher- und Zugriffspolitik.
9. Payment-Webhooks/Dispute/Refund-Governance vor Rollout unklar.
10. Operative Nachweise (Restore-Tests, Zugriffsreviews, Incident-Prozess) fehlen oder sind nicht regelmaessig.

## 4) Empfohlene Reihenfolge (Pilot-fokussiert)

1. Rechtstexte finalisieren (Impressum, Datenschutz, AGB, Verantwortlichkeiten).
2. AVV/TOM/Subprocessor-Paket finalisieren und freigeben.
3. DSAR-Runbook erstellen: Auskunft, Export, Loeschung, Fristen, Verantwortliche.
4. Technischen DSAR-MVP bauen: Export-Endpunkt + Loesch-Orchestrierung + Audit-Nachweis.
5. Datenklassifikation + Aufbewahrungsfristen je Tabelle/Modul festlegen.
6. Logging-Haertung: Redaction-Regeln und Logging-Minimierung fuer PII.
7. Regelmaessige Restore-Tests mit Nachweisroutine etablieren.
8. Zugriffsreview-Prozess fuer Admin/Chainadmin/Superadmin etablieren.
9. Driver-Tracking-Policy (Zweck, Frist, Einsichtsrechte) dokumentieren.
10. Payment-Compliance-Paket vorbereiten, bevor Live-Payment aktiviert wird.

## 5) Was ist technisch loesbar vs. juristisch zu pruefen

### Technisch loesbar (direkt im Projekt)
- DSAR-Export-API fuer Kundenkonto + Bestellhistorie + relevante Audit-Metadaten.
- DSAR-Loeschworkflow mit Soft-/Hard-Delete-Strategie je Datentyp.
- Log-Redaction (z. B. E-Mail/Telefon masking in Error-Kontexten).
- Retention-Jobs (z. B. alte Driver-Location-Events bereinigen).
- Zugriffs-/Audit-Reporting fuer periodische Kontrollen.

### Juristisch/organisatorisch zu pruefen
- Rollenmodell nach DSGVO-Rollen (Verantwortlicher/Auftragsverarbeiter) je Use Case.
- AVV-Inhalte und TOMs mit allen Dienstleistern.
- Rechtsgrundlagen je Verarbeitung (insb. Marketing, Geodaten, Payment).
- Aufbewahrungspflichten (Steuer/Handelsrecht) vs. Loeschpflichten.
- Zahlungsfluss-/Marketplace-rechtliche Einordnung (inkl. Verbraucherinformationen).

## 6) Priorisierte Einstufung fuer Go-Live

### Kritisch vor Pilot
- Finale Rechtstexte ohne Platzhalter.
- AVV/TOM/Subprocessor-Dokumente final.
- DSAR-Prozess (mind. dokumentiert + operativ testbar).
- Loesch- und Aufbewahrungsregeln verbindlich.

### Kritisch vor groesserem Rollout
- Vollautomatisierter DSAR-Workflow.
- Consent-Management fuer Tracking/Marketing.
- Payment-/Webhook-/Dispute-Compliance in Produktion.
- Erweiterte Monitoring-/Incident-Prozesse mit Compliance-Nachweis.

## 7) Praktische Pilot-Empfehlung

Pilot ist machbar, wenn die kritischen Vor-Pilot-Punkte organisatorisch und technisch vor dem ersten echten Restaurant verbindlich abgeschlossen werden.  
Fuer den Piloten reicht ein „DSAR-MVP + klare Prozesse“, solange groessere Marketing-/Tracking-/Payment-Ausbaustufen erst nachgezogen werden.
