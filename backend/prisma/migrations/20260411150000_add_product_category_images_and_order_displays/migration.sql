-- AlterTable
ALTER TABLE "Category"
ADD COLUMN "imageUrl" TEXT;

-- AlterTable
ALTER TABLE "Product"
ADD COLUMN "imageUrl" TEXT;

-- CreateTable
CREATE TABLE "OrderDisplay" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "displayCode" TEXT NOT NULL,
    "location" TEXT,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "refreshIntervalSec" INTEGER NOT NULL DEFAULT 10,
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "OrderDisplay_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "OrderDisplay_displayCode_key" ON "OrderDisplay"("displayCode");

-- CreateIndex
CREATE INDEX "OrderDisplay_tenantId_isActive_name_idx" ON "OrderDisplay"("tenantId", "isActive", "name");

-- AddForeignKey
ALTER TABLE "OrderDisplay" ADD CONSTRAINT "OrderDisplay_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE CASCADE ON UPDATE CASCADE;
