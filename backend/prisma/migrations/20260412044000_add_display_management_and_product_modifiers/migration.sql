-- AlterTable
ALTER TABLE "OrderDisplay"
ADD COLUMN "showOrderAge" BOOLEAN NOT NULL DEFAULT true,
ADD COLUMN "showTerminalInfo" BOOLEAN NOT NULL DEFAULT true,
ADD COLUMN "showPaymentInfo" BOOLEAN NOT NULL DEFAULT true,
ADD COLUMN "showTotal" BOOLEAN NOT NULL DEFAULT true,
ADD COLUMN "showItems" BOOLEAN NOT NULL DEFAULT true,
ADD COLUMN "showStatusBadge" BOOLEAN NOT NULL DEFAULT true,
ADD COLUMN "showPickupNumber" BOOLEAN NOT NULL DEFAULT true,
ADD COLUMN "pickupShowOpen" BOOLEAN NOT NULL DEFAULT true,
ADD COLUMN "pickupShowPreparing" BOOLEAN NOT NULL DEFAULT true,
ADD COLUMN "pickupShowDone" BOOLEAN NOT NULL DEFAULT true;

-- AlterTable
ALTER TABLE "OrderItem"
ADD COLUMN "unitBasePrice" DECIMAL(10,2),
ADD COLUMN "unitModifierDelta" DECIMAL(10,2),
ADD COLUMN "modifierSnapshot" JSONB;

-- CreateTable
CREATE TABLE "ProductModifier" (
  "id" TEXT NOT NULL,
  "tenantId" TEXT NOT NULL,
  "productId" TEXT NOT NULL,
  "ingredientId" TEXT,
  "name" TEXT NOT NULL,
  "priceDelta" DECIMAL(10,2) NOT NULL,
  "isDefaultSelected" BOOLEAN NOT NULL DEFAULT false,
  "isActive" BOOLEAN NOT NULL DEFAULT true,
  "sortOrder" INTEGER NOT NULL DEFAULT 0,
  "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT "ProductModifier_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "ProductModifier_tenantId_productId_isActive_sortOrder_idx"
ON "ProductModifier"("tenantId", "productId", "isActive", "sortOrder");

-- AddForeignKey
ALTER TABLE "ProductModifier"
ADD CONSTRAINT "ProductModifier_tenantId_fkey"
FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id")
ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProductModifier"
ADD CONSTRAINT "ProductModifier_productId_fkey"
FOREIGN KEY ("productId") REFERENCES "Product"("id")
ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProductModifier"
ADD CONSTRAINT "ProductModifier_ingredientId_fkey"
FOREIGN KEY ("ingredientId") REFERENCES "Ingredient"("id")
ON DELETE SET NULL ON UPDATE CASCADE;
