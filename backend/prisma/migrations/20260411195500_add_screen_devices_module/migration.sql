-- CreateTable
CREATE TABLE "ScreenDevice" (
  "id" TEXT NOT NULL,
  "tenantId" TEXT NOT NULL,
  "name" TEXT NOT NULL,
  "deviceCode" TEXT NOT NULL,
  "location" TEXT,
  "isActive" BOOLEAN NOT NULL DEFAULT true,
  "orientation" TEXT NOT NULL DEFAULT 'LANDSCAPE',
  "resolutionWidth" INTEGER NOT NULL DEFAULT 1920,
  "resolutionHeight" INTEGER NOT NULL DEFAULT 1080,
  "refreshIntervalSec" INTEGER NOT NULL DEFAULT 30,
  "showPricesOverride" BOOLEAN,
  "showAllergensOverride" BOOLEAN,
  "showUnavailableOverride" BOOLEAN,
  "offerWindowEnabledOverride" BOOLEAN,
  "backgroundMediaUrlOverride" TEXT,
  "accentColorOverride" TEXT,
  "textColorOverride" TEXT,
  "notes" TEXT,
  "lastSeenAt" TIMESTAMP(3),
  "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updatedAt" TIMESTAMP(3) NOT NULL,

  CONSTRAINT "ScreenDevice_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "ScreenDevice_deviceCode_key" ON "ScreenDevice"("deviceCode");

-- CreateIndex
CREATE INDEX "ScreenDevice_tenantId_isActive_idx" ON "ScreenDevice"("tenantId", "isActive");

-- CreateIndex
CREATE INDEX "ScreenDevice_tenantId_name_idx" ON "ScreenDevice"("tenantId", "name");

-- AddForeignKey
ALTER TABLE "ScreenDevice"
ADD CONSTRAINT "ScreenDevice_tenantId_fkey"
FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id")
ON DELETE CASCADE ON UPDATE CASCADE;
