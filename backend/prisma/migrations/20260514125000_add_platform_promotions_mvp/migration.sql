-- CreateEnum
CREATE TYPE "PromotionPlacementKey" AS ENUM ('MAIN_APP', 'PUBLIC_HOMEPAGE', 'ADMIN_DASHBOARD', 'CUSTOMER_APP', 'MERCHANT_APP', 'DRIVER_APP');

-- CreateEnum
CREATE TYPE "PromotionTargetAudience" AS ENUM ('ALL', 'CUSTOMER', 'ADMIN', 'DRIVER', 'CHAINADMIN', 'SUPERADMIN');

-- CreateTable
CREATE TABLE "PlatformPromotion" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT,
    "imageUrl" TEXT,
    "buttonText" TEXT,
    "linkUrl" TEXT,
    "productLink" TEXT,
    "merchantLink" TEXT,
    "priority" INTEGER NOT NULL DEFAULT 100,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "rotationSeconds" INTEGER NOT NULL DEFAULT 10,
    "startsAt" TIMESTAMP(3),
    "endsAt" TIMESTAMP(3),
    "createdByUserId" TEXT,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PlatformPromotion_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PromotionPlacement" (
    "id" TEXT NOT NULL,
    "promotionId" TEXT NOT NULL,
    "placement" "PromotionPlacementKey" NOT NULL,
    "isEnabled" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PromotionPlacement_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PromotionTargeting" (
    "id" TEXT NOT NULL,
    "promotionId" TEXT NOT NULL,
    "audience" "PromotionTargetAudience" NOT NULL,
    "tenantId" TEXT,
    "chainId" TEXT,
    "isEnabled" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PromotionTargeting_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PromotionClickLog" (
    "id" TEXT NOT NULL,
    "promotionId" TEXT NOT NULL,
    "placement" "PromotionPlacementKey" NOT NULL,
    "audience" "PromotionTargetAudience",
    "tenantId" TEXT,
    "chainId" TEXT,
    "sessionId" TEXT,
    "clickedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "metadata" JSONB,

    CONSTRAINT "PromotionClickLog_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "PlatformPromotion_isActive_priority_startsAt_endsAt_idx" ON "PlatformPromotion"("isActive", "priority", "startsAt", "endsAt");

-- CreateIndex
CREATE UNIQUE INDEX "PromotionPlacement_promotionId_placement_key" ON "PromotionPlacement"("promotionId", "placement");

-- CreateIndex
CREATE INDEX "PromotionPlacement_placement_isEnabled_idx" ON "PromotionPlacement"("placement", "isEnabled");

-- CreateIndex
CREATE INDEX "PromotionTargeting_audience_isEnabled_idx" ON "PromotionTargeting"("audience", "isEnabled");

-- CreateIndex
CREATE INDEX "PromotionTargeting_tenantId_chainId_idx" ON "PromotionTargeting"("tenantId", "chainId");

-- CreateIndex
CREATE INDEX "PromotionClickLog_promotionId_clickedAt_idx" ON "PromotionClickLog"("promotionId", "clickedAt");

-- CreateIndex
CREATE INDEX "PromotionClickLog_placement_clickedAt_idx" ON "PromotionClickLog"("placement", "clickedAt");

-- AddForeignKey
ALTER TABLE "PlatformPromotion" ADD CONSTRAINT "PlatformPromotion_createdByUserId_fkey" FOREIGN KEY ("createdByUserId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PromotionPlacement" ADD CONSTRAINT "PromotionPlacement_promotionId_fkey" FOREIGN KEY ("promotionId") REFERENCES "PlatformPromotion"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PromotionTargeting" ADD CONSTRAINT "PromotionTargeting_promotionId_fkey" FOREIGN KEY ("promotionId") REFERENCES "PlatformPromotion"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PromotionTargeting" ADD CONSTRAINT "PromotionTargeting_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PromotionTargeting" ADD CONSTRAINT "PromotionTargeting_chainId_fkey" FOREIGN KEY ("chainId") REFERENCES "Chain"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PromotionClickLog" ADD CONSTRAINT "PromotionClickLog_promotionId_fkey" FOREIGN KEY ("promotionId") REFERENCES "PlatformPromotion"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PromotionClickLog" ADD CONSTRAINT "PromotionClickLog_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PromotionClickLog" ADD CONSTRAINT "PromotionClickLog_chainId_fkey" FOREIGN KEY ("chainId") REFERENCES "Chain"("id") ON DELETE SET NULL ON UPDATE CASCADE;
