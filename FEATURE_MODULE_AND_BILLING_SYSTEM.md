# Feature-, Modul- und Abrechnungssteuerung (Superadmin)

## Zielbild
Klarando steuert Module und Abrechnungslogik zentral über den Superadmin:

- Feature-Register mit festen Modulschlüsseln
- Chain-Vorgaben als Default pro Kette
- Tenant-Overrides pro Filiale/Betrieb
- Sichtbarkeit im Admin nur für aktivierte Module
- Abrechnungsmodell pro Tenant (ohne echte Rechnungserzeugung)

## Feature-Register
Das zentrale Register liegt in:

- `backend/src/lib/feature-modules.ts`

Enthalten sind u. a.:

- `ORDERS`, `PRODUCTS`, `CATEGORIES`, `INGREDIENTS`, `ALLERGENS`
- `STOCK`, `SUPPLIERS`, `STAFF`, `DRIVERS`
- `DISPLAYS`, `DISPLAY_DESIGN`, `ORDERDESK`, `TERMINALS`, `POS`
- `DELIVERY_ZONES`, `RATINGS`, `TIPS`, `LOYALTY`, `PAYMENT`
- `ANALYTICS`, `CASH_CLOSING`, `PLATFORM_BRANDING`

Pro Modul:

- `key`, `name`, `description`, `category`
- `defaultEnabled`
- optional `adminNavPath`
- optional `requiredPermissions`
- optionale `dependencies`

## Paketvorlagen
Derzeit vorbereitet:

- `STARTER`
- `DELIVERY`
- `PRO`
- `CHAIN`
- `ENTERPRISE`

Pakete setzen Tenant-Module gesammelt; danach sind Einzelanpassungen möglich.

## Datenmodell (Prisma)
Erweitert in:

- `backend/prisma/schema.prisma`
- Migration: `backend/prisma/migrations/20260510124431_add_feature_module_and_billing_control/migration.sql`

Neue Enums:

- `FeatureModuleKey`
- `BillingPlanType`
- `BillingPeriodType`
- `BillingUsagePeriodStatus`
- `BillingUsageCounterKey`
- `CommissionRuleType`

Neue Modelle:

- `ChainFeatureModuleSetting`
- `TenantFeatureModuleSetting`
- `BillingPlanTemplate`
- `TenantBillingPlan`
- `TenantBillingSettings`
- `BillingUsagePeriod`
- `BillingUsageCounter`
- `CommissionRule`

## Rollenlogik
- Superadmin:
  - darf Chain-/Tenant-Features ändern
  - darf Billing pro Tenant ändern
- Chainadmin:
  - sieht nur eigene Chain-/Tenant-Daten
  - keine Plattform-Provision-Änderung
- Admin/Staff/Driver:
  - sehen nur aktivierte Module im Admin-Menü

## API-Endpunkte
Neu unter `backend/src/routes/access.ts`:

- `GET /api/access/features/catalog`
- `GET /api/access/features/effective`
- `GET /api/access/features/overview`
- `GET /api/access/features/chain/:chainId`
- `PUT /api/access/features/chain/:chainId` (Superadmin)
- `PUT /api/access/features/tenant/:tenantId` (Superadmin)
- `POST /api/access/features/tenant/:tenantId/apply-package` (Superadmin)

Billing:

- `GET /api/access/billing/overview`
- `GET /api/access/billing/tenant/:tenantId`
- `PUT /api/access/billing/tenant/:tenantId` (Superadmin)
- `POST /api/access/billing/tenant/:tenantId/usage/sync` (Superadmin)

## Modul-Sichtbarkeit im Admin
Frontend-Logik:

- `lib/admin-module-visibility.ts`
- `app/Components/admin/AdminLayout.tsx`
- `app/admin/page.tsx`

Deaktivierte Module:

- verschwinden aus Navigation/Subnavigation
- werden im Seiteninhalt mit Meldung „Modul nicht aktiviert“ blockiert

## Superadmin-UI
Neue Seite:

- `app/superadmin/module-billing/page.tsx`

Funktionen:

- Tenant/Chain auswählen
- Paket anwenden
- Module je Tenant toggeln
- Chain-Vorgaben toggeln
- Billing-Grundwerte setzen (z. B. Monatsgebühr, Provision, Inklusivbestellungen)
- Usage-Sync auslösen

## Provisionsbeispiele
- Nur Provision:
  - `planType=REVENUE_SHARE`, `commissionPercent=5`
- Bestellpaket:
  - `planType=ORDER_PACKAGE`, `includedOrders=50`, `commissionAfterIncludedOrdersPercent=5`
- Hybrid:
  - `planType=HYBRID`, `monthlyFeeCents=4900`, `commissionPercent=3`

## Was bereits umgesetzt ist
- Persistente Feature-Freigaben auf Chain-/Tenant-Ebene
- Paketmechanik für Tenant-Features
- Admin-Menü blendet deaktivierte Module aus
- Billing-Basisdaten + Usage-Snapshot/Counter-Struktur

## Was für echte Rechnungen/Payment noch fehlt
- Rechnungslauf (periodisch), Rechnungsposten und PDF-Generierung
- steuerliche Felder/Nummernkreise
- Zahlungsabgleich (Provider-Settlement)
- Mahn-/Storno-/Gutschriftprozesse
- Accounting-Export (DATEV/CSV etc.)
