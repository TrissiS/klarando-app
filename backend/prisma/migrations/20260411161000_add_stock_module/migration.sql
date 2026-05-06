-- CreateEnum
CREATE TYPE "StockMovementType" AS ENUM ('GOODS_RECEIPT', 'WRITE_OFF', 'INVENTORY_COUNT');

-- CreateTable
CREATE TABLE "StockMovement" (
  "id" TEXT NOT NULL,
  "tenantId" TEXT NOT NULL,
  "ingredientId" TEXT NOT NULL,
  "type" "StockMovementType" NOT NULL,
  "quantityDelta" DECIMAL(12,3) NOT NULL,
  "resultingQuantity" DECIMAL(12,3) NOT NULL,
  "countedQuantity" DECIMAL(12,3),
  "unitCost" DECIMAL(10,2),
  "reference" TEXT,
  "note" TEXT,
  "createdByUserId" TEXT,
  "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

  CONSTRAINT "StockMovement_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "StockMovement_tenantId_ingredientId_createdAt_idx"
ON "StockMovement"("tenantId", "ingredientId", "createdAt");

-- CreateIndex
CREATE INDEX "StockMovement_tenantId_createdAt_idx"
ON "StockMovement"("tenantId", "createdAt");

-- AddForeignKey
ALTER TABLE "StockMovement"
ADD CONSTRAINT "StockMovement_tenantId_fkey"
FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id")
ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StockMovement"
ADD CONSTRAINT "StockMovement_ingredientId_fkey"
FOREIGN KEY ("ingredientId") REFERENCES "Ingredient"("id")
ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StockMovement"
ADD CONSTRAINT "StockMovement_createdByUserId_fkey"
FOREIGN KEY ("createdByUserId") REFERENCES "User"("id")
ON DELETE SET NULL ON UPDATE CASCADE;
