# Billing & Promotions Architecture

## Umsetzungsstand (MVP-Grundlage)
- Prisma-Datenbasis für Billing ist angelegt:
  - `BillingProfile`
  - `Invoice`
  - `InvoiceItem`
  - `InvoiceSequence`
  - `BillingRun`
  - `SepaMandate`
  - `PaymentCollection`
  - `KlarandoMailboxMessage`
- Neue Status-/Typ-Enums sind ergänzt:
  - `InvoiceStatus`
  - `InvoiceRecipientType`
  - `SepaMandateStatus`
  - `PaymentCollectionStatus`
  - `MailboxMessageType`
- Backend-MVP-Routen sind vorbereitet:
  - `GET /api/billing/superadmin/preview`
  - `POST /api/billing/superadmin/finalize`
  - `GET /api/billing/invoices`
  - `GET /api/billing/invoices/:invoiceId/pdf` (MVP-Platzhalter)
  - `GET /api/billing/mailbox`
  - `POST /api/billing/mailbox/:messageId/read`
- UI-MVP ist vorbereitet:
  - `GET /superadmin/billing` für Monatslauf + Vorschau + Finalisierung
  - Erweiterung in `/admin/finanzen` für Rechnungen + Postfach

Hinweis: PDF-Erzeugung und E-Rechnungsausgabe sind bewusst noch nicht final implementiert.

## Zielbild
Klarando erhält zwei neue, sauber getrennte Plattform-Module:

1. **Klarando Billing** für Monatsabrechnungen, Rechnungsarchiv, Zustellung und SEPA-Vorbereitung.
2. **Klarando News & Aktionen** für zentral gesteuerte Promotion-Inhalte mit rotierender Ausspielung.

Beide Module werden als **MVP-sichere Grundlage** geplant, ohne riskante Vollautomatisierung (Steuer/SEPA) im ersten Schritt.

---

## Modul 1: Klarando Billing

## Kernprinzipien
- Rechnungsdaten werden **immutable** nach Finalisierung (keine stille Überschreibung).
- Abrechnung läuft als **Billing Run** (monatlicher Lauf mit Preview, Prüfungen, Finalisierung).
- Rechnungsempfänger kann **Tenant oder Chain** sein.
- Gebührenlogik nutzt bestehende Strukturen (u. a. `TenantBillingPlan`, `TenantBillingSettings`, `calculateKlarandoFees`).
- Jede kritische Aktion erzeugt Audit-Logs.

## Geplante Statusmodelle
- Invoice Status:
  - `draft`
  - `issued`
  - `sent`
  - `paid`
  - `failed`
  - `cancelled`
  - `corrected`
- Billing Run Status:
  - `created`
  - `previewed`
  - `finalized`
  - `failed`

## Datenmodell-Vorschlag

## `BillingProfile`
Zweck: Abrechnungsstammdaten pro Tenant/Chain.
- `id`
- `tenantId` nullable
- `chainId` nullable
- `billingRecipientType` (`TENANT` | `CHAIN`)
- `companyName`
- `addressLine1`
- `addressLine2` nullable
- `zipCode`
- `city`
- `countryCode` (default `DE`)
- `vatId` nullable
- `taxNumber` nullable
- `emailForInvoices`
- `isActive`
- `createdAt`, `updatedAt`

## `InvoiceSequence`
Zweck: fortlaufende Rechnungsnummern (z. B. `2026-000123`).
- `id`
- `seriesKey` (z. B. `KLARANDO-DE`)
- `year`
- `lastNumber`
- `updatedAt`
- Unique: (`seriesKey`, `year`)

## `BillingRun`
Zweck: Monatslauf mit Snapshot und Prüfkontext.
- `id`
- `periodStart`
- `periodEnd`
- `triggeredByUserId`
- `status`
- `previewSummaryJson`
- `finalizedAt` nullable
- `createdAt`

## `Invoice`
Zweck: Kopf einer Rechnung.
- `id`
- `invoiceNumber` (unique)
- `billingRunId`
- `tenantId` nullable
- `chainId` nullable
- `billingProfileId`
- `status`
- `currency` (`EUR`)
- `netAmountCents`
- `vatAmountCents`
- `grossAmountCents`
- `issuedAt` nullable
- `dueAt` nullable
- `paidAt` nullable
- `pdfPath` nullable
- `immutableSnapshotJson`
- `correctionOfInvoiceId` nullable
- `createdAt`, `updatedAt`

## `InvoiceItem`
Zweck: Positionen (Grundgebühr, Provision, Fixgebühr etc.).
- `id`
- `invoiceId`
- `itemType` (`BASE_FEE`, `ORDER_COMMISSION`, `ORDER_FIXED_FEE`, `EXPRESS_SHARE`, `MODULE_FEE`, `CREDIT`, `CANCELLATION`, `OTHER`)
- `description`
- `quantity`
- `unitPriceCents`
- `netAmountCents`
- `vatRatePercent`
- `vatAmountCents`
- `grossAmountCents`
- `sourceRefType` nullable (z. B. `ORDER`, `BILLING_PLAN`)
- `sourceRefId` nullable
- `metadataJson` nullable

## `SepaMandate`
Zweck: Mandatsverwaltung (nur Vorbereitung/MVP-Speicherung).
- `id`
- `tenantId` nullable
- `chainId` nullable
- `mandateReference`
- `ibanMasked` (nur maskiert im UI)
- `bic` nullable
- `accountHolder`
- `signedAt`
- `status` (`active`, `revoked`, `pending`)
- `preNotificationDays` default 5
- `createdAt`, `updatedAt`

## `PaymentCollection`
Zweck: spätere Lastschrift-/Zahlungseinzüge je Rechnung.
- `id`
- `invoiceId`
- `method` (`SEPA`, `MANUAL_TRANSFER`, `OTHER`)
- `status` (`pending`, `submitted`, `succeeded`, `failed`, `cancelled`)
- `amountCents`
- `scheduledFor` nullable
- `executedAt` nullable
- `failureReason` nullable
- `providerRef` nullable
- `createdAt`, `updatedAt`

## `KlarandoMailboxMessage`
Zweck: In-App-Postfach (Rechnungen, Hinweise, Zahlungsstatus).
- `id`
- `tenantId` nullable
- `chainId` nullable
- `targetRole` nullable (`ADMIN`, `CHAINADMIN`)
- `messageType` (`INVOICE`, `REMINDER`, `SYSTEM`)
- `subject`
- `body`
- `attachmentInvoiceId` nullable
- `readAt` nullable
- `createdAt`

---

## Rechnungslogik (Monatslauf)

## 1. Billing Run erzeugen
- Superadmin wählt Zeitraum.
- System erstellt `BillingRun` im Status `created`.
- System berechnet Preview pro Tenant/Chain.

## 2. Preview
- Summen und Warnungen zeigen:
  - fehlendes BillingProfile
  - fehlendes Mandat (falls SEPA gewünscht)
  - negative Positionen / ungewöhnliche Werte
- Keine finalen Invoice-Nummern bis Finalisierung.

## 3. Finalisieren
- Pro Empfänger:
  - `InvoiceSequence` atomar erhöhen
  - `Invoice` + `InvoiceItems` schreiben
  - Status `issued`
- Danach immutable Snapshot setzen.

## 4. Zustellen
- In `KlarandoMailboxMessage` veröffentlichen.
- Optional E-Mail-Queue vorbereiten (kein Hard-Sync-Mailversand im MVP zwingend).
- Statuswechsel auf `sent`.

## 5. Zahlung
- Manuelles Markieren `paid` im MVP.
- SEPA-Collection später als eigener Schritt via `PaymentCollection`.

---

## Berechnungsfunktionen (Plan)
- `calculateKlarandoFees(orderLikeInput)` (bestehend, als Basiskomponente)
- `calculateInvoiceForTenant({ tenantId, periodStart, periodEnd })`
  - sammelt Orders, Gebührenregeln, Credits, Module
  - liefert strukturierte Invoice-Items + Summen
- `calculateBillingRun({ periodStart, periodEnd, scope })`
  - iteriert über betroffene Tenants/Chains
  - liefert Preview inkl. Warnungen

---

## UI-Plan Billing

## Superadmin `/superadmin/billing`
- Zeitraum wählen
- Button: „Monatsabrechnung Vorschau“
- Tabelle: Empfänger, Netto, MwSt, Brutto, Warnungen
- Button: „Monatsrechnungen final erstellen“
- Rechnungsliste mit Status, Download, Postfach-Senden, Zahlung markieren

## Admin/Chainadmin
- `Postfach`: Rechnungen/Hinweise
- `Rechnungen`: Verlauf, Status, Download
- `SEPA-Mandat`: Hinterlegen/Status/Revocation

---

## Recht/Steuer/GoBD Hinweise
- **Extern prüfen vor Livebetrieb**:
  - Rechnungsformatpflichten (Pflichtangaben nach UStG)
  - GoBD-konforme Archivierung
  - Behandlung von Gutschriften/Stornorechnungen
  - E-Rechnungsformat (XRechnung/ZUGFeRD) je Kundensegment
  - Mahn-/Fälligkeitslogik
- MVP darf nur als „technische Grundlage“ betrachtet werden, nicht als finale steuerrechtliche Lösung.

---

## SEPA-Konzept (MVP-sicher)
- Keine automatische Abbuchung ohne aktives Mandat.
- Mandat wird verwaltet, aber nicht blind eingezogen.
- Pre-Notification Felder und Fristen werden modelliert.
- Einzugslauf als späteres Modul (`PaymentCollection`) mit expliziter Freigabe.

---

## Modul 2: News & Aktionen / Promotion Slider

## Umsetzungsstand Promotions (MVP-Grundlage)
- Prisma-Modelle ergänzt:
  - `PlatformPromotion`
  - `PromotionPlacement`
  - `PromotionTargeting`
  - `PromotionClickLog` (optional vorbereitet)
- Backend-Routen ergänzt:
  - `GET /api/promotions/admin` (SUPERADMIN)
  - `POST /api/promotions/admin` (SUPERADMIN)
  - `PATCH /api/promotions/admin/:id` (SUPERADMIN)
  - `GET /api/promotions/active` (öffentliche Ausspielung)
- Superadmin-UI ergänzt:
  - `/superadmin/promotions` mit Anlage, Basisverwaltung, Aktiv/Inaktiv-Status.
- Frontend-Komponente ergänzt:
  - `PromotionSlider` mit Rotation (Default 10 Sekunden), responsivem Layout und Fallback.
  - Eingebunden in `/main-app` als erster öffentlicher Placement-Punkt.

## Ziel
Zentrale redaktionelle Promotionsteuerung mit zeitlicher Ausspielung nach Zielgruppe und Placement.

## Datenmodell-Vorschlag

## `PlatformPromotion`
- `id`
- `title`
- `description`
- `ctaText` nullable
- `ctaUrl` nullable
- `imageUrl` nullable
- `linkType` (`INTERNAL`, `EXTERNAL`, `PRODUCT`, `TENANT`)
- `productId` nullable
- `tenantId` nullable
- `category` nullable
- `priority` (int)
- `isActive`
- `startsAt` nullable
- `endsAt` nullable
- `rotationSeconds` (default 10)
- `createdByUserId`
- `createdAt`, `updatedAt`

## `PromotionPlacement`
- `id`
- `promotionId`
- `placement` (`PUBLIC_HOMEPAGE`, `ADMIN_DASHBOARD`, `CUSTOMER_APP`, `MERCHANT_APP`, `DRIVER_APP`, `DISPLAY_FUTURE`)
- `isEnabled`

## `PromotionTargeting`
- `id`
- `promotionId`
- `targetRole` (`CUSTOMER`, `ADMIN`, `DRIVER`, `CHAINADMIN`, `ALL`)
- optional später:
  - tenant/chain Einschränkung
  - locale

## `PromotionClickLog` (später)
- `id`
- `promotionId`
- `placement`
- `clickedAt`
- `tenantId` nullable
- `sessionHash` nullable

---

## Promotions-Ausspielung (MVP)
- `GET /api/promotions/active?placement=...&role=...`
- Filter:
  - `isActive=true`
  - Zeitfenster gültig
  - Placement aktiv
  - Zielrolle passt
- Sortierung:
  - `priority DESC`, `updatedAt DESC`
- Frontend:
  - Slider mit Rotation (z. B. 10s)
  - Fallback bei leerer Liste
  - keine unsicheren HTML-Inhalte

---

## UI-Plan Promotions

## Superadmin
- Bereich: `/superadmin/promotions` (neu, später)
- Liste + Filter (aktiv, Zielgruppe, Placement)
- Formular:
  - Titel, Beschreibung, CTA, Bild, Zielgruppe, Zeitraum, Priorität, Rotation
- Vorschaukarte vor Veröffentlichung

## Sichtbare Plätze
- Public Startseite
- Admin-Dashboard
- später Customer-/Merchant-App

---

## Sicherheit Promotions
- Schreibzugriff nur SUPERADMIN.
- URL-Validierung für externe Links.
- Kein ungefiltertes HTML/Script.
- Bild-Upload nur über sichere Upload-Pipeline (MIME/Size/Sanitize).

---

## MVP vs. später

## MVP jetzt
- Architektur + Datenmodell + UI-Fluss definieren
- sichere Zustände, Statusmodelle, Rollenprüfung
- vorbereitete Berechnungs-/Ausspielungsfunktionen

## Später
- E-Rechnung Export (XRechnung/ZUGFeRD)
- SEPA-Einzugsläufe mit Provider-Anbindung
- Mahnwesen
- Promotion-Klicktracking + Conversion
- A/B Rotation / Segmentierung
