# Privacy Center Architecture

## Ziel
Dieses Foundation-Setup baut ein DSGVO-orientiertes Kunden- und Datenschutzcenter mit Anonymisierung als Standardpfad.

## Scope dieses Schritts
- Superadmin-APIs fuer Kunden-Datenschutzprozesse
- Customer-APIs fuer eigene Datenschutzanfragen und Einwilligungen
- Neue Datenmodelle fuer Requests, Consents und Audit
- Superadmin-Workspace "Kunden & Datenschutz"

## Datenmodell
Neue Prisma-Bausteine:
- `CustomerPrivacyRequest`
- `CustomerConsent`
- `PrivacyAuditLog`

Neue Enums:
- `CustomerPrivacyRequestType`
- `CustomerPrivacyRequestStatus`
- `CustomerConsentType`
- `PrivacyAuditActionType`

## API-Oberflaeche
### Superadmin
- `GET /api/superadmin/privacy/customers`
- `GET /api/superadmin/privacy/customers/:id`
- `GET /api/superadmin/privacy/customers/:id/export`
- `POST /api/superadmin/privacy/customers/:id/disable`
- `POST /api/superadmin/privacy/customers/:id/anonymize`
- `POST /api/superadmin/privacy/customers/:id/delete-request`
- `GET /api/superadmin/privacy/audit-log`
- `GET /api/superadmin/privacy/delete-requests`

### Customer
- `GET /api/customer/privacy/me`
- `GET /api/customer/privacy/export`
- `POST /api/customer/privacy/delete-request`
- `PATCH /api/customer/privacy/consents`

## Anonymisierungslogik
Standard ist Anonymisierung, kein Hard-Delete.
Dabei werden personenbezogene Felder ersetzt/geleert, Verknuepfungen und Einwilligungen bereinigt, Bestellungen bleiben fuer Nachvollziehbarkeit bestehen.

## Superadmin-UI
Neuer Bereich:
- `/superadmin/privacy-center`

Tabs:
- Kunden
- DSGVO-Anfragen
- Einwilligungen
- Audit-Log
- Aufbewahrung
- Verarbeitungstaetigkeiten

## Customer-App Foundation
API-Methoden fuer Privacy wurden im mobilen API-Layer vorbereitet, damit Profil-Workflows darauf aufsetzen koennen.

## Sicherheit
- Superadmin-Endpunkte sind rollenbasiert auf `SUPERADMIN` begrenzt.
- Audit-Events werden fuer Datenschutzaktionen geschrieben.
- Keine Passwort-/Token-Ausgabe.

## Offene Punkte (naechste Schritte)
- PDF/ZIP Export
- 30-Tage-Wartefrist-Workflow
- Feingranulare Aufbewahrungsregeln je Land/Steuerfall
- Ausfuehrlicher Customer-UI-Flow fuer Consent-Management direkt im Profil
