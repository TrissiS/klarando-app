-- Add per-item production status tracking on orders
ALTER TABLE "OrderItem"
ADD COLUMN "productionStatus" TEXT NOT NULL DEFAULT 'OPEN',
ADD COLUMN "productionDoneAt" TIMESTAMP(3);

-- Extend order display settings for richer pickup/animation/media behavior
ALTER TABLE "OrderDisplay"
ADD COLUMN "showOrderNumber" BOOLEAN NOT NULL DEFAULT true,
ADD COLUMN "pickupShowOnlyNumber" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN "statusAnimationMode" TEXT NOT NULL DEFAULT 'NONE',
ADD COLUMN "statusAnimationDurationMs" INTEGER NOT NULL DEFAULT 2200,
ADD COLUMN "orderAgeFontSize" INTEGER NOT NULL DEFAULT 22,
ADD COLUMN "orderAgeAlertThresholdSec" INTEGER NOT NULL DEFAULT 900,
ADD COLUMN "orderAgeAlertAnimationMode" TEXT NOT NULL DEFAULT 'BLINK',
ADD COLUMN "backgroundMediaMode" TEXT NOT NULL DEFAULT 'NONE',
ADD COLUMN "backgroundMediaUrl" TEXT;

-- Chainadmin per-tenant governance and superadmin grant model
CREATE TABLE "ChainAdminTenantAccess" (
  "id" TEXT NOT NULL,
  "chainAdminUserId" TEXT NOT NULL,
  "tenantId" TEXT NOT NULL,
  "superadminGranted" BOOLEAN NOT NULL DEFAULT false,
  "canViewRevenue" BOOLEAN NOT NULL DEFAULT true,
  "canManageAppOrders" BOOLEAN NOT NULL DEFAULT true,
  "canManageDelivery" BOOLEAN NOT NULL DEFAULT true,
  "canManagePickup" BOOLEAN NOT NULL DEFAULT true,
  "canViewPurchasing" BOOLEAN NOT NULL DEFAULT true,
  "canViewStaffPlanning" BOOLEAN NOT NULL DEFAULT true,
  "canOverrideSettings" BOOLEAN NOT NULL DEFAULT false,
  "notes" TEXT,
  "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

  CONSTRAINT "ChainAdminTenantAccess_pkey" PRIMARY KEY ("id")
);

CREATE UNIQUE INDEX "ChainAdminTenantAccess_chainAdminUserId_tenantId_key"
ON "ChainAdminTenantAccess"("chainAdminUserId", "tenantId");

CREATE INDEX "ChainAdminTenantAccess_tenantId_idx"
ON "ChainAdminTenantAccess"("tenantId");

CREATE INDEX "ChainAdminTenantAccess_chainAdminUserId_superadminGranted_idx"
ON "ChainAdminTenantAccess"("chainAdminUserId", "superadminGranted");

ALTER TABLE "ChainAdminTenantAccess"
ADD CONSTRAINT "ChainAdminTenantAccess_chainAdminUserId_fkey"
FOREIGN KEY ("chainAdminUserId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "ChainAdminTenantAccess"
ADD CONSTRAINT "ChainAdminTenantAccess_tenantId_fkey"
FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE CASCADE ON UPDATE CASCADE;
