DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'FeatureModuleKey') THEN
    CREATE TYPE "FeatureModuleKey" AS ENUM (
      'ORDERS',
      'PRODUCTS',
      'CATEGORIES',
      'INGREDIENTS',
      'ALLERGENS',
      'STOCK',
      'SUPPLIERS',
      'STAFF',
      'DRIVERS',
      'DISPLAYS',
      'DISPLAY_DESIGN',
      'ORDERDESK',
      'TERMINALS',
      'POS',
      'DELIVERY_ZONES',
      'RATINGS',
      'TIPS',
      'LOYALTY',
      'PAYMENT',
      'ANALYTICS',
      'CASH_CLOSING',
      'PLATFORM_BRANDING'
    );
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'BillingPlanType') THEN
    CREATE TYPE "BillingPlanType" AS ENUM (
      'REVENUE_SHARE',
      'MONTHLY_FIXED',
      'ORDER_PACKAGE',
      'HYBRID',
      'CUSTOM'
    );
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'BillingPeriodType') THEN
    CREATE TYPE "BillingPeriodType" AS ENUM ('MONTHLY', 'WEEKLY');
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'BillingUsagePeriodStatus') THEN
    CREATE TYPE "BillingUsagePeriodStatus" AS ENUM ('OPEN', 'CLOSED', 'FINALIZED');
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'BillingUsageCounterKey') THEN
    CREATE TYPE "BillingUsageCounterKey" AS ENUM (
      'ORDERS_TOTAL',
      'ORDERS_COUNTED',
      'ORDERS_CANCELED',
      'REVENUE_GROSS_CENTS',
      'REVENUE_COUNTED_CENTS'
    );
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'CommissionRuleType') THEN
    CREATE TYPE "CommissionRuleType" AS ENUM ('PERCENT', 'FIXED_PER_ORDER', 'HYBRID', 'THRESHOLD');
  END IF;
END $$;

CREATE TABLE IF NOT EXISTS "ChainFeatureModuleSetting" (
  "id" TEXT NOT NULL,
  "chainId" TEXT NOT NULL,
  "featureKey" "FeatureModuleKey" NOT NULL,
  "enabled" BOOLEAN NOT NULL DEFAULT true,
  "enabledBySuperadmin" BOOLEAN NOT NULL DEFAULT true,
  "updatedBy" TEXT,
  "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updatedAt" TIMESTAMP(3) NOT NULL,
  CONSTRAINT "ChainFeatureModuleSetting_pkey" PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "TenantFeatureModuleSetting" (
  "id" TEXT NOT NULL,
  "tenantId" TEXT NOT NULL,
  "chainId" TEXT,
  "featureKey" "FeatureModuleKey" NOT NULL,
  "enabled" BOOLEAN NOT NULL DEFAULT true,
  "enabledBySuperadmin" BOOLEAN NOT NULL DEFAULT true,
  "updatedBy" TEXT,
  "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updatedAt" TIMESTAMP(3) NOT NULL,
  CONSTRAINT "TenantFeatureModuleSetting_pkey" PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "BillingPlanTemplate" (
  "id" TEXT NOT NULL,
  "key" TEXT NOT NULL,
  "name" TEXT NOT NULL,
  "description" TEXT,
  "planType" "BillingPlanType" NOT NULL,
  "monthlyFeeCents" INTEGER NOT NULL DEFAULT 0,
  "includedOrders" INTEGER NOT NULL DEFAULT 0,
  "commissionPercent" DECIMAL(6,3) NOT NULL DEFAULT 0,
  "commissionAfterIncludedOrdersPercent" DECIMAL(6,3),
  "fixedFeePerOrderCents" INTEGER NOT NULL DEFAULT 0,
  "billingPeriod" "BillingPeriodType" NOT NULL DEFAULT 'MONTHLY',
  "isActive" BOOLEAN NOT NULL DEFAULT true,
  "metadata" JSONB,
  "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updatedAt" TIMESTAMP(3) NOT NULL,
  CONSTRAINT "BillingPlanTemplate_pkey" PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "TenantBillingPlan" (
  "id" TEXT NOT NULL,
  "tenantId" TEXT NOT NULL,
  "chainId" TEXT,
  "planType" "BillingPlanType" NOT NULL,
  "monthlyFeeCents" INTEGER NOT NULL DEFAULT 0,
  "includedOrders" INTEGER NOT NULL DEFAULT 0,
  "commissionPercent" DECIMAL(6,3) NOT NULL DEFAULT 0,
  "commissionAfterIncludedOrdersPercent" DECIMAL(6,3),
  "fixedFeePerOrderCents" INTEGER NOT NULL DEFAULT 0,
  "billingPeriod" "BillingPeriodType" NOT NULL DEFAULT 'MONTHLY',
  "activeFrom" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "activeUntil" TIMESTAMP(3),
  "isActive" BOOLEAN NOT NULL DEFAULT true,
  "notes" TEXT,
  "updatedBy" TEXT,
  "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updatedAt" TIMESTAMP(3) NOT NULL,
  CONSTRAINT "TenantBillingPlan_pkey" PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "TenantBillingSettings" (
  "id" TEXT NOT NULL,
  "tenantId" TEXT NOT NULL,
  "chainId" TEXT,
  "paymentFeeBearer" "FeeBearer" NOT NULL DEFAULT 'TENANT',
  "countOnlyPaidOrders" BOOLEAN NOT NULL DEFAULT true,
  "countOnlyCompletedOrders" BOOLEAN NOT NULL DEFAULT true,
  "excludeCanceledOrders" BOOLEAN NOT NULL DEFAULT true,
  "revenueMode" TEXT NOT NULL DEFAULT 'GROSS',
  "currency" TEXT NOT NULL DEFAULT 'EUR',
  "timezone" TEXT NOT NULL DEFAULT 'Europe/Berlin',
  "notes" TEXT,
  "isActive" BOOLEAN NOT NULL DEFAULT true,
  "updatedBy" TEXT,
  "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updatedAt" TIMESTAMP(3) NOT NULL,
  CONSTRAINT "TenantBillingSettings_pkey" PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "BillingUsagePeriod" (
  "id" TEXT NOT NULL,
  "tenantId" TEXT NOT NULL,
  "chainId" TEXT,
  "periodStart" TIMESTAMP(3) NOT NULL,
  "periodEnd" TIMESTAMP(3) NOT NULL,
  "status" "BillingUsagePeriodStatus" NOT NULL DEFAULT 'OPEN',
  "ordersTotal" INTEGER NOT NULL DEFAULT 0,
  "ordersCounted" INTEGER NOT NULL DEFAULT 0,
  "ordersCanceled" INTEGER NOT NULL DEFAULT 0,
  "revenueGrossCents" INTEGER NOT NULL DEFAULT 0,
  "revenueCountedCents" INTEGER NOT NULL DEFAULT 0,
  "snapshotAt" TIMESTAMP(3),
  "metadata" JSONB,
  "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updatedAt" TIMESTAMP(3) NOT NULL,
  CONSTRAINT "BillingUsagePeriod_pkey" PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "BillingUsageCounter" (
  "id" TEXT NOT NULL,
  "usagePeriodId" TEXT NOT NULL,
  "tenantId" TEXT NOT NULL,
  "counterKey" "BillingUsageCounterKey" NOT NULL,
  "valueInt" INTEGER NOT NULL DEFAULT 0,
  "valueDecimal" DECIMAL(16,4),
  "metadata" JSONB,
  "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updatedAt" TIMESTAMP(3) NOT NULL,
  CONSTRAINT "BillingUsageCounter_pkey" PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "CommissionRule" (
  "id" TEXT NOT NULL,
  "tenantId" TEXT NOT NULL,
  "chainId" TEXT,
  "name" TEXT NOT NULL,
  "ruleType" "CommissionRuleType" NOT NULL,
  "isActive" BOOLEAN NOT NULL DEFAULT true,
  "priority" INTEGER NOT NULL DEFAULT 100,
  "conditionsJson" JSONB,
  "commissionPercent" DECIMAL(6,3),
  "fixedFeePerOrderCents" INTEGER,
  "appliesAfterOrders" INTEGER,
  "activeFrom" TIMESTAMP(3),
  "activeUntil" TIMESTAMP(3),
  "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updatedAt" TIMESTAMP(3) NOT NULL,
  CONSTRAINT "CommissionRule_pkey" PRIMARY KEY ("id")
);

CREATE UNIQUE INDEX IF NOT EXISTS "ChainFeatureModuleSetting_chainId_featureKey_key"
ON "ChainFeatureModuleSetting" ("chainId", "featureKey");
CREATE INDEX IF NOT EXISTS "ChainFeatureModuleSetting_chainId_idx"
ON "ChainFeatureModuleSetting" ("chainId");

CREATE UNIQUE INDEX IF NOT EXISTS "TenantFeatureModuleSetting_tenantId_featureKey_key"
ON "TenantFeatureModuleSetting" ("tenantId", "featureKey");
CREATE INDEX IF NOT EXISTS "TenantFeatureModuleSetting_tenantId_idx"
ON "TenantFeatureModuleSetting" ("tenantId");
CREATE INDEX IF NOT EXISTS "TenantFeatureModuleSetting_chainId_idx"
ON "TenantFeatureModuleSetting" ("chainId");

CREATE UNIQUE INDEX IF NOT EXISTS "BillingPlanTemplate_key_key"
ON "BillingPlanTemplate" ("key");
CREATE INDEX IF NOT EXISTS "BillingPlanTemplate_isActive_planType_idx"
ON "BillingPlanTemplate" ("isActive", "planType");

CREATE UNIQUE INDEX IF NOT EXISTS "TenantBillingPlan_tenantId_key"
ON "TenantBillingPlan" ("tenantId");
CREATE INDEX IF NOT EXISTS "TenantBillingPlan_chainId_idx"
ON "TenantBillingPlan" ("chainId");
CREATE INDEX IF NOT EXISTS "TenantBillingPlan_isActive_planType_activeFrom_idx"
ON "TenantBillingPlan" ("isActive", "planType", "activeFrom");

CREATE UNIQUE INDEX IF NOT EXISTS "TenantBillingSettings_tenantId_key"
ON "TenantBillingSettings" ("tenantId");
CREATE INDEX IF NOT EXISTS "TenantBillingSettings_chainId_idx"
ON "TenantBillingSettings" ("chainId");
CREATE INDEX IF NOT EXISTS "TenantBillingSettings_isActive_idx"
ON "TenantBillingSettings" ("isActive");

CREATE UNIQUE INDEX IF NOT EXISTS "BillingUsagePeriod_tenantId_periodStart_periodEnd_key"
ON "BillingUsagePeriod" ("tenantId", "periodStart", "periodEnd");
CREATE INDEX IF NOT EXISTS "BillingUsagePeriod_tenantId_status_periodStart_idx"
ON "BillingUsagePeriod" ("tenantId", "status", "periodStart");
CREATE INDEX IF NOT EXISTS "BillingUsagePeriod_chainId_status_periodStart_idx"
ON "BillingUsagePeriod" ("chainId", "status", "periodStart");

CREATE UNIQUE INDEX IF NOT EXISTS "BillingUsageCounter_usagePeriodId_counterKey_key"
ON "BillingUsageCounter" ("usagePeriodId", "counterKey");
CREATE INDEX IF NOT EXISTS "BillingUsageCounter_tenantId_counterKey_idx"
ON "BillingUsageCounter" ("tenantId", "counterKey");

CREATE INDEX IF NOT EXISTS "CommissionRule_tenantId_isActive_priority_idx"
ON "CommissionRule" ("tenantId", "isActive", "priority");
CREATE INDEX IF NOT EXISTS "CommissionRule_chainId_isActive_priority_idx"
ON "CommissionRule" ("chainId", "isActive", "priority");

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'ChainFeatureModuleSetting_chainId_fkey'
  ) THEN
    ALTER TABLE "ChainFeatureModuleSetting"
    ADD CONSTRAINT "ChainFeatureModuleSetting_chainId_fkey"
    FOREIGN KEY ("chainId") REFERENCES "Chain"("id") ON DELETE CASCADE ON UPDATE CASCADE;
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'TenantFeatureModuleSetting_tenantId_fkey'
  ) THEN
    ALTER TABLE "TenantFeatureModuleSetting"
    ADD CONSTRAINT "TenantFeatureModuleSetting_tenantId_fkey"
    FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE CASCADE ON UPDATE CASCADE;
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'TenantFeatureModuleSetting_chainId_fkey'
  ) THEN
    ALTER TABLE "TenantFeatureModuleSetting"
    ADD CONSTRAINT "TenantFeatureModuleSetting_chainId_fkey"
    FOREIGN KEY ("chainId") REFERENCES "Chain"("id") ON DELETE SET NULL ON UPDATE CASCADE;
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'TenantBillingPlan_tenantId_fkey'
  ) THEN
    ALTER TABLE "TenantBillingPlan"
    ADD CONSTRAINT "TenantBillingPlan_tenantId_fkey"
    FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE CASCADE ON UPDATE CASCADE;
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'TenantBillingPlan_chainId_fkey'
  ) THEN
    ALTER TABLE "TenantBillingPlan"
    ADD CONSTRAINT "TenantBillingPlan_chainId_fkey"
    FOREIGN KEY ("chainId") REFERENCES "Chain"("id") ON DELETE SET NULL ON UPDATE CASCADE;
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'TenantBillingSettings_tenantId_fkey'
  ) THEN
    ALTER TABLE "TenantBillingSettings"
    ADD CONSTRAINT "TenantBillingSettings_tenantId_fkey"
    FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE CASCADE ON UPDATE CASCADE;
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'TenantBillingSettings_chainId_fkey'
  ) THEN
    ALTER TABLE "TenantBillingSettings"
    ADD CONSTRAINT "TenantBillingSettings_chainId_fkey"
    FOREIGN KEY ("chainId") REFERENCES "Chain"("id") ON DELETE SET NULL ON UPDATE CASCADE;
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'BillingUsagePeriod_tenantId_fkey'
  ) THEN
    ALTER TABLE "BillingUsagePeriod"
    ADD CONSTRAINT "BillingUsagePeriod_tenantId_fkey"
    FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE CASCADE ON UPDATE CASCADE;
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'BillingUsagePeriod_chainId_fkey'
  ) THEN
    ALTER TABLE "BillingUsagePeriod"
    ADD CONSTRAINT "BillingUsagePeriod_chainId_fkey"
    FOREIGN KEY ("chainId") REFERENCES "Chain"("id") ON DELETE SET NULL ON UPDATE CASCADE;
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'BillingUsageCounter_usagePeriodId_fkey'
  ) THEN
    ALTER TABLE "BillingUsageCounter"
    ADD CONSTRAINT "BillingUsageCounter_usagePeriodId_fkey"
    FOREIGN KEY ("usagePeriodId") REFERENCES "BillingUsagePeriod"("id") ON DELETE CASCADE ON UPDATE CASCADE;
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'BillingUsageCounter_tenantId_fkey'
  ) THEN
    ALTER TABLE "BillingUsageCounter"
    ADD CONSTRAINT "BillingUsageCounter_tenantId_fkey"
    FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE CASCADE ON UPDATE CASCADE;
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'CommissionRule_tenantId_fkey'
  ) THEN
    ALTER TABLE "CommissionRule"
    ADD CONSTRAINT "CommissionRule_tenantId_fkey"
    FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE CASCADE ON UPDATE CASCADE;
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'CommissionRule_chainId_fkey'
  ) THEN
    ALTER TABLE "CommissionRule"
    ADD CONSTRAINT "CommissionRule_chainId_fkey"
    FOREIGN KEY ("chainId") REFERENCES "Chain"("id") ON DELETE SET NULL ON UPDATE CASCADE;
  END IF;
END $$;
