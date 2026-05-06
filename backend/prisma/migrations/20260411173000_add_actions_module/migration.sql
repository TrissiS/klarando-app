-- CreateEnum
CREATE TYPE "ActionKind" AS ENUM ('DAILY', 'WEEKLY', 'ONE_TIME');

-- CreateEnum
CREATE TYPE "ActionValueType" AS ENUM ('PERCENT', 'FIXED_PRICE');

-- CreateTable
CREATE TABLE "Action" (
  "id" TEXT NOT NULL,
  "tenantId" TEXT NOT NULL,
  "name" TEXT NOT NULL,
  "description" TEXT,
  "kind" "ActionKind" NOT NULL,
  "valueType" "ActionValueType" NOT NULL,
  "value" DECIMAL(10,2) NOT NULL,
  "isActive" BOOLEAN NOT NULL DEFAULT true,
  "startAt" TIMESTAMP(3),
  "endAt" TIMESTAMP(3),
  "weeklyDays" TEXT,
  "dailyStartTime" TEXT,
  "dailyEndTime" TEXT,
  "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updatedAt" TIMESTAMP(3) NOT NULL,

  CONSTRAINT "Action_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ActionProduct" (
  "id" TEXT NOT NULL,
  "actionId" TEXT NOT NULL,
  "productId" TEXT NOT NULL,
  "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

  CONSTRAINT "ActionProduct_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "Action_tenantId_isActive_kind_idx" ON "Action"("tenantId", "isActive", "kind");

-- CreateIndex
CREATE INDEX "Action_tenantId_createdAt_idx" ON "Action"("tenantId", "createdAt");

-- CreateIndex
CREATE UNIQUE INDEX "ActionProduct_actionId_productId_key" ON "ActionProduct"("actionId", "productId");

-- CreateIndex
CREATE INDEX "ActionProduct_productId_idx" ON "ActionProduct"("productId");

-- AddForeignKey
ALTER TABLE "Action"
ADD CONSTRAINT "Action_tenantId_fkey"
FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id")
ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ActionProduct"
ADD CONSTRAINT "ActionProduct_actionId_fkey"
FOREIGN KEY ("actionId") REFERENCES "Action"("id")
ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ActionProduct"
ADD CONSTRAINT "ActionProduct_productId_fkey"
FOREIGN KEY ("productId") REFERENCES "Product"("id")
ON DELETE CASCADE ON UPDATE CASCADE;
