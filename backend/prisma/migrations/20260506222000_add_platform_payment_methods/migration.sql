DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'PaymentProvider') THEN
    CREATE TYPE "PaymentProvider" AS ENUM ('STRIPE', 'PAYPAL', 'MOLLIE', 'ADYEN');
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'FeeBearer') THEN
    CREATE TYPE "FeeBearer" AS ENUM ('CUSTOMER', 'TENANT', 'PLATFORM');
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'PaymentMethodType') THEN
    CREATE TYPE "PaymentMethodType" AS ENUM ('CARD', 'PAYPAL', 'APPLE_PAY', 'GOOGLE_PAY', 'KLARNA', 'SOFORT', 'SEPA_DEBIT');
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'PaymentMethodStatus') THEN
    CREATE TYPE "PaymentMethodStatus" AS ENUM ('ENABLED', 'DISABLED', 'DEPRECATED');
  END IF;
END $$;

CREATE TABLE "PlatformPaymentMethod" (
  "id" TEXT NOT NULL,
  "provider" "PaymentProvider" NOT NULL,
  "methodType" "PaymentMethodType" NOT NULL,
  "status" "PaymentMethodStatus" NOT NULL DEFAULT 'ENABLED',
  "enabled" BOOLEAN NOT NULL DEFAULT true,
  "displayName" TEXT NOT NULL,
  "checkoutSortOrder" INTEGER NOT NULL DEFAULT 100,
  "countriesJson" JSONB,
  "currenciesJson" JSONB,
  "metadata" JSONB,
  "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updatedAt" TIMESTAMP(3) NOT NULL,

  CONSTRAINT "PlatformPaymentMethod_pkey" PRIMARY KEY ("id")
);

CREATE TABLE "TenantPaymentMethodOverride" (
  "id" TEXT NOT NULL,
  "tenantId" TEXT NOT NULL,
  "paymentMethodId" TEXT NOT NULL,
  "enabled" BOOLEAN,
  "feeBearer" "FeeBearer",
  "surchargePercent" DECIMAL(6,3),
  "surchargeFixed" INTEGER,
  "reason" TEXT,
  "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updatedAt" TIMESTAMP(3) NOT NULL,

  CONSTRAINT "TenantPaymentMethodOverride_pkey" PRIMARY KEY ("id")
);

CREATE UNIQUE INDEX "PlatformPaymentMethod_provider_methodType_key"
ON "PlatformPaymentMethod"("provider", "methodType");

CREATE INDEX "PlatformPaymentMethod_enabled_status_checkoutSortOrder_idx"
ON "PlatformPaymentMethod"("enabled", "status", "checkoutSortOrder");

CREATE UNIQUE INDEX "TenantPaymentMethodOverride_tenantId_paymentMethodId_key"
ON "TenantPaymentMethodOverride"("tenantId", "paymentMethodId");

CREATE INDEX "TenantPaymentMethodOverride_tenantId_idx"
ON "TenantPaymentMethodOverride"("tenantId");

ALTER TABLE "TenantPaymentMethodOverride"
ADD CONSTRAINT "TenantPaymentMethodOverride_tenantId_fkey"
FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id")
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "TenantPaymentMethodOverride"
ADD CONSTRAINT "TenantPaymentMethodOverride_paymentMethodId_fkey"
FOREIGN KEY ("paymentMethodId") REFERENCES "PlatformPaymentMethod"("id")
ON DELETE CASCADE ON UPDATE CASCADE;
