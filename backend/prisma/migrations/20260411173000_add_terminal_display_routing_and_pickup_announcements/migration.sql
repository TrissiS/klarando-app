-- CreateEnum
CREATE TYPE "OrderDisplayRole" AS ENUM ('CASH', 'KITCHEN', 'PICKUP');

-- AlterTable
ALTER TABLE "OrderDisplay"
ADD COLUMN "displayRole" "OrderDisplayRole" NOT NULL DEFAULT 'KITCHEN',
ADD COLUMN "sourceTerminalIds" TEXT,
ADD COLUMN "announceOnMenuScreens" BOOLEAN NOT NULL DEFAULT true,
ADD COLUMN "menuAnnouncementDurationSec" INTEGER NOT NULL DEFAULT 45;

-- AlterTable
ALTER TABLE "OrderTerminal"
ADD COLUMN "cashDisplayId" TEXT,
ADD COLUMN "kitchenDisplayId" TEXT,
ADD COLUMN "pickupDisplayId" TEXT;

-- AlterTable
ALTER TABLE "Order"
ADD COLUMN "cashDisplayId" TEXT,
ADD COLUMN "kitchenDisplayId" TEXT,
ADD COLUMN "pickupDisplayId" TEXT,
ADD COLUMN "pickupNumber" INTEGER,
ADD COLUMN "pickupAnnouncedAt" TIMESTAMP(3),
ADD COLUMN "pickupAnnounceUntil" TIMESTAMP(3);

-- CreateIndex
CREATE INDEX "Order_cashDisplayId_status_createdAt_idx" ON "Order"("cashDisplayId", "status", "createdAt");

-- CreateIndex
CREATE INDEX "Order_kitchenDisplayId_status_createdAt_idx" ON "Order"("kitchenDisplayId", "status", "createdAt");

-- CreateIndex
CREATE INDEX "Order_pickupDisplayId_status_createdAt_idx" ON "Order"("pickupDisplayId", "status", "createdAt");

-- CreateIndex
CREATE INDEX "Order_tenantId_pickupNumber_createdAt_idx" ON "Order"("tenantId", "pickupNumber", "createdAt");

-- CreateIndex
CREATE INDEX "Order_tenantId_pickupAnnounceUntil_idx" ON "Order"("tenantId", "pickupAnnounceUntil");

-- CreateIndex
CREATE INDEX "OrderTerminal_cashDisplayId_idx" ON "OrderTerminal"("cashDisplayId");

-- CreateIndex
CREATE INDEX "OrderTerminal_kitchenDisplayId_idx" ON "OrderTerminal"("kitchenDisplayId");

-- CreateIndex
CREATE INDEX "OrderTerminal_pickupDisplayId_idx" ON "OrderTerminal"("pickupDisplayId");

-- CreateIndex
CREATE INDEX "OrderDisplay_tenantId_displayRole_isActive_idx" ON "OrderDisplay"("tenantId", "displayRole", "isActive");

-- AddForeignKey
ALTER TABLE "OrderTerminal" ADD CONSTRAINT "OrderTerminal_cashDisplayId_fkey" FOREIGN KEY ("cashDisplayId") REFERENCES "OrderDisplay"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OrderTerminal" ADD CONSTRAINT "OrderTerminal_kitchenDisplayId_fkey" FOREIGN KEY ("kitchenDisplayId") REFERENCES "OrderDisplay"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OrderTerminal" ADD CONSTRAINT "OrderTerminal_pickupDisplayId_fkey" FOREIGN KEY ("pickupDisplayId") REFERENCES "OrderDisplay"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Order" ADD CONSTRAINT "Order_cashDisplayId_fkey" FOREIGN KEY ("cashDisplayId") REFERENCES "OrderDisplay"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Order" ADD CONSTRAINT "Order_kitchenDisplayId_fkey" FOREIGN KEY ("kitchenDisplayId") REFERENCES "OrderDisplay"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Order" ADD CONSTRAINT "Order_pickupDisplayId_fkey" FOREIGN KEY ("pickupDisplayId") REFERENCES "OrderDisplay"("id") ON DELETE SET NULL ON UPDATE CASCADE;
