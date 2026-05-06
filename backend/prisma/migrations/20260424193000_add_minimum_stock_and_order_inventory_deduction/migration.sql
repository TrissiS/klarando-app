-- Add minimum stock per ingredient
ALTER TABLE "Ingredient"
ADD COLUMN "minimumStock" DECIMAL(12,3) NOT NULL DEFAULT 0;

-- Track if inventory deduction was already applied for an order
ALTER TABLE "Order"
ADD COLUMN "inventoryDeductedAt" TIMESTAMP(3);

CREATE INDEX "Order_tenantId_inventoryDeductedAt_idx"
ON "Order"("tenantId", "inventoryDeductedAt");
