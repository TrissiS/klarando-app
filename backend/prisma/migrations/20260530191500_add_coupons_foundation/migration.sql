-- CreateEnum
CREATE TYPE "CouponDiscountType" AS ENUM ('PERCENT', 'AMOUNT', 'FREE_DELIVERY');

-- CreateEnum
CREATE TYPE "CouponOrderType" AS ENUM ('ALL', 'DELIVERY', 'PICKUP');

-- CreateTable
CREATE TABLE "Coupon" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "discountType" "CouponDiscountType" NOT NULL,
    "discountValueCents" INTEGER,
    "discountPercent" DECIMAL(5,2),
    "minOrderValueCents" INTEGER,
    "maxUses" INTEGER,
    "maxUsesPerCustomer" INTEGER,
    "usedCount" INTEGER NOT NULL DEFAULT 0,
    "validFrom" TIMESTAMP(3),
    "validUntil" TIMESTAMP(3),
    "appliesToOrderType" "CouponOrderType" NOT NULL DEFAULT 'ALL',
    "newCustomersOnly" BOOLEAN NOT NULL DEFAULT false,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Coupon_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Coupon_tenantId_code_key" ON "Coupon"("tenantId", "code");

-- CreateIndex
CREATE INDEX "Coupon_tenantId_isActive_idx" ON "Coupon"("tenantId", "isActive");

-- CreateIndex
CREATE INDEX "Coupon_tenantId_validFrom_validUntil_idx" ON "Coupon"("tenantId", "validFrom", "validUntil");

-- AddForeignKey
ALTER TABLE "Coupon" ADD CONSTRAINT "Coupon_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE CASCADE ON UPDATE CASCADE;