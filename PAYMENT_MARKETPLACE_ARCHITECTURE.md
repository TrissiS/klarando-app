# Klarando Payment & Marketplace Architektur (Planungsstand)

Stand: 06.05.2026  
Status: Analyse + Zielbild (keine vollständige Implementierung)

## Update: Technische Grundlage ergänzt (13.05.2026)

- `TenantPaymentConfig` enthält jetzt PayPal-Betreiberfelder:
  - `paypalMerchantId`
  - `paypalEmail`
  - `paypalOnboardingStatus`
  - `paypalEnvironment`
  - `paypalPaymentsEnabled`
  - `klarandoPlatformFeePercent`
  - `klarandoPlatformFeeFixed`
- Neue PayPal-Basisrouten:
  - `GET /api/payments/paypal/config`
  - `PUT /api/payments/paypal/config`
  - `POST /api/payments/paypal/create-order`
  - `POST /api/payments/paypal/capture-order`
- PayPal-Secret-Konfiguration nur im Backend per ENV.

## 1) Zielbild (angepasst)

Klarando ist die zentrale Checkout-Plattform. Jeder Tenant/Restaurantbetrieb soll standardmäßig alle von Klarando global freigeschalteten Zahlungsmethoden nutzen können, ohne eigene Provider-Integrationen bauen zu müssen.

Kernprinzipien:
- Plattform steuert global, welche Methoden aktiv sind.
- Tenant steuert nur Onboarding, Gebühren, Fee-Bearer, Auszahlungsziel und Ausnahmen.
- Split-/Marketplace-Payment läuft zentral über Klarando.
- Keine direkte tenant-eigene PSP-Integration im MVP erforderlich.

## 2) Ist-Zustand im Repository

- `backend/prisma/schema.prisma` enthält aktuell nur Basisfelder auf `Order` (`paymentStatus`, `paymentMethod`, `paidAt`).
- Keine vollständige Payment-Domain für Transaktionen, Webhooks, Refunds, Disputes und Tips.
- Keine produktive Provider-Webhook-Verarbeitung vorhanden.

## 3) Empfohlene Provider-Strategie

MVP: Stripe Connect als primäre Infrastruktur (Cards, Wallets, Marketplace, Webhooks, Gebühren-/Payout-Modell).  
Später: PayPal als zusätzlicher Provider, danach optional Mollie/Adyen.

## 4) Datenmodell (angepasst für zentrale Methodensteuerung)

### Neue Enums (Vorschlag)
```prisma
enum PaymentProvider {
  STRIPE
  PAYPAL
  MOLLIE
  ADYEN
}

enum PaymentMethodType {
  CARD
  PAYPAL
  APPLE_PAY
  GOOGLE_PAY
  KLARNA
  SOFORT
  SEPA_DEBIT
}

enum PaymentMethodStatus {
  ENABLED
  DISABLED
  DEPRECATED
}

enum FeeBearer {
  CUSTOMER
  TENANT
  PLATFORM
}

enum PaymentStatus {
  PENDING
  REQUIRES_ACTION
  PROCESSING
  SUCCEEDED
  FAILED
  CANCELED
  PARTIALLY_REFUNDED
  REFUNDED
}
```

### Plattformweite Methode-Konfiguration
```prisma
model PlatformPaymentMethod {
  id                String              @id @default(uuid())
  provider          PaymentProvider
  methodType        PaymentMethodType
  status            PaymentMethodStatus @default(ENABLED)
  enabled           Boolean             @default(true)
  displayName       String
  checkoutSortOrder Int                 @default(100)
  countriesJson     Json?               // optional whitelisting
  currenciesJson    Json?               // optional whitelisting
  metadata          Json?
  createdAt         DateTime            @default(now())
  updatedAt         DateTime            @updatedAt

  @@unique([provider, methodType])
  @@index([enabled, status, checkoutSortOrder])
}
```

### Tenant-Overrides
```prisma
model TenantPaymentMethodOverride {
  id               String              @id @default(uuid())
  tenantId         String
  paymentMethodId  String
  enabled          Boolean?
  feeBearer        FeeBearer?
  surchargePercent Decimal?            @db.Decimal(6, 3)
  surchargeFixed   Int?
  reason           String?
  tenant           Tenant              @relation(fields: [tenantId], references: [id], onDelete: Cascade)
  paymentMethod    PlatformPaymentMethod @relation(fields: [paymentMethodId], references: [id], onDelete: Cascade)
  createdAt        DateTime            @default(now())
  updatedAt        DateTime            @updatedAt

  @@unique([tenantId, paymentMethodId])
  @@index([tenantId])
}
```

### Tenant-Basis (bleibt wichtig)
```prisma
model TenantPaymentConfig {
  id                 String   @id @default(uuid())
  tenantId           String   @unique
  paymentOnboarded   Boolean  @default(false)
  commissionPercent  Decimal  @default(0) @db.Decimal(6, 3)
  fixedFeeCents      Int      @default(0)
  defaultFeeBearer   FeeBearer @default(TENANT)
  payoutTargetJson   Json?    // Zielkonto/Connected Account Referenz
  createdAt          DateTime @default(now())
  updatedAt          DateTime @updatedAt
}
```

Weitere Domain-Tabellen bleiben wie geplant:
- `TenantProviderAccount`
- `PaymentTransaction`
- `PaymentWebhookEvent`
- `PaymentRefund`
- `PaymentDispute`
- `TipTransaction`

## 5) Checkout-Logik (zentrale Sicht)

Anzeige-Regel im Checkout:
1. Lade alle global aktiven `PlatformPaymentMethod` (`enabled=true`, `status=ENABLED`).
2. Prüfe Tenant (`TenantPaymentConfig` + `TenantProviderAccount`):
   - Onboarding vollständig?
   - Provider-/Methode technisch verfügbar?
3. Wende `TenantPaymentMethodOverride` an.
4. Ergebnis dem Kunden anzeigen.

Ausblenden nur wenn:
- global deaktiviert,
- Tenant nicht onboarded,
- tenant-spezifisch deaktiviert,
- rechtlich/technisch nicht verfügbar (Land, Währung, Provider-Limit).

## 6) Gebühren- und Auszahlungslogik

- Provision/Fixfee pro Tenant über `TenantPaymentConfig`.
- Methodenspezifische Abweichung über `TenantPaymentMethodOverride`.
- Fee-Bearer je Methode/Override: `CUSTOMER`, `TENANT`, `PLATFORM`.
- Auszahlung nicht vom Restaurant „manuell“, sondern über zentrale Marketplace-/Split-Payment-Logik.

## 7) Wichtige Sicherheits- und Architekturregeln

- Keine echten API-Keys oder Secrets im Repo.
- Webhook-Dedupe per `provider + providerEventId` unique.
- Tenant-Scope für alle Payment-Datensätze zwingend.
- Idempotency-Key für Checkout/Payment-Init.
- OrderFlow bleibt kompatibel (`Order.paymentStatus`/`paymentMethod` zunächst weiterführen).

## 8) Was vor Pilot notwendig ist

1. DB-Basis für Payment-Domain inkl. `PlatformPaymentMethod` und `TenantPaymentMethodOverride`.
2. Sichere Auflösung „verfügbare Checkout-Methoden pro Tenant“ im Backend.
3. Stripe-Connect-Onboarding-Status pro Tenant.
4. Webhook-Grundgerüst mit Signaturprüfung + Dedupe.

## 9) Was nach Pilot kommen kann

- Erweiterte Provider (PayPal Marketplace, später Mollie/Adyen)
- Feingranulare länderspezifische Regelsets
- Dynamische Surcharges mit rechtlicher Prüfung pro Markt
- Erweiterte Reporting-/Buchhaltungsexporte

## 10) Kurzfazit

Mit diesem Modell bleibt Klarando zentrale Checkout-Plattform: global aktivierte Zahlungsarten sind automatisch tenant-nutzbar, während Tenant-spezifische Unterschiede kontrolliert über Overrides, Onboarding-Status und Gebührenparameter gesteuert werden.
