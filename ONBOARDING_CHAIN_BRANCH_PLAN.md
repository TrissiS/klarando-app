# Onboarding Chain/Branch Plan

## 1. Zielbild
Ein geführter Superadmin-Wizard legt Unternehmen strukturiert an:
- Chain (Unternehmen)
- Tenant (Filiale)
- Admin-Benutzer
- optional Template-Import

Der Ablauf ist transaktionssicher und auditierbar.

## 2. Datenmodell
MVP-Erweiterung:
- `Chain.type`: `INDEPENDENT | CHAIN | FRANCHISE`
- `Chain.status`: `ACTIVE | PAUSED | ARCHIVED | LOCKED`
- `Tenant.status`: `ACTIVE | PAUSED | ARCHIVED | LOCKED`
- ergänzende Kontaktfelder:
  - `Chain.contactName`, `Chain.contactEmail`, `Chain.contactPhone`
  - `Tenant.addressLine`

## 3. Unterschied Einzelunternehmen vs. Kette
- Einzelunternehmen (`INDEPENDENT`): in der Regel 1 Filiale, Admin-Rolle oft `ADMIN`
- Kette (`CHAIN`) / Franchise (`FRANCHISE`): mehrere Filialen möglich, Start-Admin meist `CHAINADMIN`

## 4. Wizard-Schritte (MVP)
1. Unternehmensdaten
2. Admin-Benutzer
3. Filiale
4. Vorlagen-Import (optional)
5. Prüfung & Abschluss

## 5. Sicherheitskonzept
- Route nur für `SUPERADMIN`
- Anlage läuft atomar in DB-Transaktion
- Audit-Log für Abschluss
- Keine Delete-Funktionen im Wizard
- Statusmodell statt Löschaktionen
- vorhandene Production-Guards für destructive DB-Aktionen bleiben gültig

## 6. Backup-/Archivierungsstrategie
- Vor strukturellen Massenänderungen: bestehende DB-Dump-Strategie nutzen (siehe `BACKUP_AND_RESTORE.md`)
- Für diesen Wizard (einzelne Anlagevorgänge) keine destructive Aktionen
- Bei Deaktivierung künftig `PAUSED/ARCHIVED/LOCKED` statt Löschen

## 7. MVP-Umfang
Enthalten:
- neue Superadmin-Seite `/superadmin/onboarding`
- neue API `POST /api/onboarding/business`
- optionale Template-Importintegration
- Schnellaktionen im Superadmin-Dashboard

Nicht enthalten:
- Bulk-Onboarding
- CSV-Import
- erweiterter Wiederaufnahme-/Entwurfsmodus

## 8. Spätere Erweiterungen
- Entwurfsmodus + Wiederaufnahme
- Validierungs-/Compliance-Checks pro Schritt
- optionaler Geräte-/OrderDesk-Onboarding-Schritt
- automatisierte Initialmodule/Billing-Paketzuweisung
