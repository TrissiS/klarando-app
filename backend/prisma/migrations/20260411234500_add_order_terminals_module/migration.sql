-- CreateTable
CREATE TABLE "OrderTerminal" (
  "id" TEXT NOT NULL,
  "tenantId" TEXT NOT NULL,
  "name" TEXT NOT NULL,
  "terminalCode" TEXT NOT NULL,
  "location" TEXT,
  "isActive" BOOLEAN NOT NULL DEFAULT true,
  "allowCashPayment" BOOLEAN NOT NULL DEFAULT true,
  "allowCardPayment" BOOLEAN NOT NULL DEFAULT true,
  "autoForwardToKitchen" BOOLEAN NOT NULL DEFAULT true,
  "notes" TEXT,
  "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updatedAt" TIMESTAMP(3) NOT NULL,

  CONSTRAINT "OrderTerminal_pkey" PRIMARY KEY ("id")
);

-- AlterTable
ALTER TABLE "Order"
ADD COLUMN "terminalId" TEXT,
ADD COLUMN "sourceChannel" TEXT NOT NULL DEFAULT 'POS',
ADD COLUMN "paymentStatus" TEXT NOT NULL DEFAULT 'UNPAID',
ADD COLUMN "paymentMethod" TEXT,
ADD COLUMN "paidAt" TIMESTAMP(3),
ADD COLUMN "forwardedToKitchenAt" TIMESTAMP(3);

-- CreateIndex
CREATE UNIQUE INDEX "OrderTerminal_terminalCode_key" ON "OrderTerminal"("terminalCode");

-- CreateIndex
CREATE INDEX "OrderTerminal_tenantId_isActive_name_idx" ON "OrderTerminal"("tenantId", "isActive", "name");

-- CreateIndex
CREATE INDEX "Order_tenantId_status_createdAt_idx" ON "Order"("tenantId", "status", "createdAt");

-- CreateIndex
CREATE INDEX "Order_tenantId_sourceChannel_createdAt_idx" ON "Order"("tenantId", "sourceChannel", "createdAt");

-- CreateIndex
CREATE INDEX "Order_terminalId_createdAt_idx" ON "Order"("terminalId", "createdAt");

-- AddForeignKey
ALTER TABLE "OrderTerminal"
ADD CONSTRAINT "OrderTerminal_tenantId_fkey"
FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id")
ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Order"
ADD CONSTRAINT "Order_terminalId_fkey"
FOREIGN KEY ("terminalId") REFERENCES "OrderTerminal"("id")
ON DELETE SET NULL ON UPDATE CASCADE;
