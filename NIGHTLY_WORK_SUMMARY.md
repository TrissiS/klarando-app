# Nightly Work Summary

Datum: 14.05.2026

## Erledigte Aufgaben
- MVP-Grundlage für **Klarando Billing** umgesetzt.
  - Datenmodell erweitert (BillingProfile, Invoice, InvoiceItem, InvoiceSequence, BillingRun, SepaMandate, PaymentCollection, KlarandoMailboxMessage).
  - Billing-API-Routen ergänzt (Preview, Finalize, Invoices, Mailbox, PDF-Platzhalter).
  - Superadmin-Seite `/superadmin/billing` ergänzt.
  - Admin-Finanzseite um Rechnungen/Postfach erweitert.
- MVP-Grundlage für **zentrale Aktionen & News (Promotions)** umgesetzt.
  - Datenmodell erweitert (PlatformPromotion, PromotionPlacement, PromotionTargeting, optional PromotionClickLog).
  - Promotions-API ergänzt (`/api/promotions/admin`, `/api/promotions/active`).
  - Superadmin-Seite `/superadmin/promotions` ergänzt.
  - `PromotionSlider` gebaut und in `/main-app` vorbereitet.
- **Display-/Screen-System** verbessert.
  - Auflösungsprofil + Skalierungsanzeige in Vorschau ergänzt.
  - Vorschau-Link „in neuem Tab öffnen“ ergänzt.
  - Warnung bei möglichem Content-Clipping (zu viele Karten/lange Namen/große Schrift).
  - Produktzuweisung erweitert: „Alle Produkte dieser Kategorie anzeigen“.
  - Doku ergänzt.
- **Rechtsseiten + Consent** technisch abgesichert.
  - Rechtslinks in Admin-/Backoffice-Footer ergänzt.
  - Google Maps im Admin-Polygon-Editor nur noch nach Consent `Standort/Maps` laden.
  - Doku ergänzt.

## Geänderte Dateien (heutiger Kernumfang)
- `backend/prisma/schema.prisma`
- `backend/prisma/migrations/20260514113000_add_billing_mvp_foundation/migration.sql`
- `backend/prisma/migrations/20260514125000_add_platform_promotions_mvp/migration.sql`
- `backend/src/routes/billing.ts`
- `backend/src/routes/promotions.ts`
- `backend/src/server.ts`
- `lib/api.ts`
- `app/superadmin/billing/page.tsx`
- `app/superadmin/promotions/page.tsx`
- `app/superadmin/nav.ts`
- `app/admin/finanzen/page.tsx`
- `components/PromotionSlider.tsx`
- `app/main-app/page.tsx`
- `app/admin/screen/page.tsx`
- `app/Components/admin/ServiceAreaEditor.tsx`
- `app/Components/admin/AdminLayout.tsx`
- `app/Components/admin/BackofficeLayout.tsx`
- `DISPLAY_DESIGNER_AND_PRODUCT_ASSIGNMENT.md`
- `BILLING_AND_PROMOTIONS_ARCHITECTURE.md`
- `LEGAL_AND_CONSENT_IMPLEMENTATION.md`

Hinweis: Es gibt zusätzlich bereits ältere, noch uncommittete Änderungen im Workspace.

## Erfolgreiche Checks
- `cd backend && npx prisma generate` ✅
- `npm --prefix backend run typecheck` ✅
- `npm run lint` ✅
- `npm run build` ✅

## Fehlgeschlagene Checks
- Keine fehlgeschlagenen Checks im finalen Stand.

## Offene Risiken
- Billing-PDF ist aktuell nur als API-Platzhalter vorhanden (noch keine finale PDF-Engine).
- Billing-MVP ist keine finale steuerrechtliche/GobD/E-Rechnungs-Implementierung.
- Promotions haben noch kein erweitertes Edit-UI (MVP: anlegen + status togglen + patch API).
- Display-Layout-Warnung ist heuristisch (nicht pixelgenaue harte Safe-Area-Prüfung).
- Viele parallele uncommittete Änderungen im Repo erhöhen Merge-/Regression-Risiko.

## Nächste sinnvolle Schritte
1. Billing: PDF-Erzeugung + immutable Snapshot finalisieren.
2. Billing: Rechnungsdetailseite + Download-Flow + Mailbox-Detail.
3. Promotions: Vollständiges Bearbeiten/Löschen im Superadmin-UI.
4. Display: Preset-Buttons für Layout-Modi (Grid/Liste/Preisliste/Großkarten).
5. Workspace bereinigen: in thematische Commits aufteilen und nacheinander deployen.

## Befehle lokal
```powershell
cd "C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app"
cd backend
npx prisma migrate deploy
npx prisma generate
cd ..
npm --prefix backend run typecheck
npm run lint
npm run build
```

## Befehle auf VPS
```bash
cd /opt/klarando-app
git fetch origin
git reset --hard origin/main

docker compose --env-file .env.production -f docker-compose.prod.yml up -d --build

docker compose --env-file .env.production -f docker-compose.prod.yml ps
curl -k https://localhost/api/health
```

Wenn Migrationen neu sind und noch nicht liefen:
```bash
docker compose --env-file .env.production -f docker-compose.prod.yml exec backend npx prisma migrate deploy
```
