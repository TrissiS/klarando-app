-- CreateEnum
CREATE TYPE "RestaurantTableStatus" AS ENUM ('FREE', 'OCCUPIED', 'WAITING_SERVICE', 'WAITING_PAYMENT');

-- CreateEnum
CREATE TYPE "TableSessionStatus" AS ENUM ('OPEN', 'ORDERING', 'SERVED', 'PAYMENT_REQUESTED', 'CLOSED');

-- CreateEnum
CREATE TYPE "ServiceCallType" AS ENUM ('WAITER', 'PAYMENT', 'HELP', 'CUTLERY', 'CUSTOM');

-- CreateEnum
CREATE TYPE "ServiceCallStatus" AS ENUM ('OPEN', 'ACKNOWLEDGED', 'DONE');

-- AlterEnum
ALTER TYPE "FeatureModuleKey" ADD VALUE 'TABLE_ORDERING';

-- DropForeignKey
ALTER TABLE "DisplayDevice" DROP CONSTRAINT "DisplayDevice_screenId_fkey";

-- DropForeignKey
ALTER TABLE "DisplayPairingSession" DROP CONSTRAINT "DisplayPairingSession_deviceId_fkey";

-- DropForeignKey
ALTER TABLE "DisplayPairingSession" DROP CONSTRAINT "DisplayPairingSession_screenId_fkey";

-- AlterTable
ALTER TABLE "BillingProfile" ADD COLUMN     "approvedBy" TEXT,
ADD COLUMN     "bankName" TEXT,
ADD COLUMN     "bic" TEXT,
ADD COLUMN     "cancelledAt" TIMESTAMP(3),
ADD COLUMN     "contactPerson" TEXT,
ADD COLUMN     "createdBy" TEXT,
ADD COLUMN     "iban" TEXT,
ADD COLUMN     "invoiceLogoUrl" TEXT,
ADD COLUMN     "lastChargebackStatus" TEXT,
ADD COLUMN     "lastDebitAt" TIMESTAMP(3),
ADD COLUMN     "managingDirector" TEXT,
ADD COLUMN     "paidAt" TIMESTAMP(3),
ADD COLUMN     "paymentMethod" TEXT,
ADD COLUMN     "paymentProviderStatus" TEXT,
ADD COLUMN     "paymentStatus" TEXT,
ADD COLUMN     "paymentTermsDays" INTEGER,
ADD COLUMN     "phone" TEXT,
ADD COLUMN     "plannedDebitAt" TIMESTAMP(3),
ADD COLUMN     "sentAt" TIMESTAMP(3),
ADD COLUMN     "sepaActive" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "sepaCreditorId" TEXT,
ADD COLUMN     "sepaMandateReference" TEXT,
ADD COLUMN     "standardPaymentTargetDays" INTEGER DEFAULT 14,
ADD COLUMN     "stripeCustomerId" TEXT,
ADD COLUMN     "taxNumber" TEXT,
ADD COLUMN     "updatedBy" TEXT,
ADD COLUMN     "website" TEXT;

-- AlterTable
ALTER TABLE "DisplayPlaylist" ALTER COLUMN "updatedAt" DROP DEFAULT;

-- AlterTable
ALTER TABLE "DisplayPlaylistItem" ALTER COLUMN "durationSeconds" SET DEFAULT 12,
ALTER COLUMN "updatedAt" DROP DEFAULT;

-- AlterTable
ALTER TABLE "DisplayScreen" ALTER COLUMN "updatedAt" DROP DEFAULT;

-- AlterTable
ALTER TABLE "Order" ADD COLUMN     "tableSessionId" TEXT;

-- AlterTable
ALTER TABLE "OrderDisplay" ALTER COLUMN "statusColorOpen" SET DEFAULT '#ff6b35';

-- AlterTable
ALTER TABLE "PlatformBillingSettings" ALTER COLUMN "updatedAt" DROP DEFAULT;

-- AlterTable
ALTER TABLE "ScreenSetting" ALTER COLUMN "offerWindowBackgroundColor" SET DEFAULT '#ff6b35';

-- CreateTable
CREATE TABLE "RestaurantArea" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "branchId" TEXT,
    "name" TEXT NOT NULL,
    "sortOrder" INTEGER NOT NULL DEFAULT 0,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "RestaurantArea_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RestaurantTable" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "branchId" TEXT,
    "areaId" TEXT,
    "tableNumber" TEXT NOT NULL,
    "name" TEXT,
    "seats" INTEGER NOT NULL DEFAULT 2,
    "qrCodeToken" TEXT NOT NULL,
    "active" BOOLEAN NOT NULL DEFAULT true,
    "status" "RestaurantTableStatus" NOT NULL DEFAULT 'FREE',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "RestaurantTable_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TableSession" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "branchId" TEXT,
    "tableId" TEXT NOT NULL,
    "status" "TableSessionStatus" NOT NULL DEFAULT 'OPEN',
    "openedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "closedAt" TIMESTAMP(3),
    "lastActivityAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "guestCount" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TableSession_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ServiceCall" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "branchId" TEXT,
    "tableId" TEXT NOT NULL,
    "sessionId" TEXT,
    "type" "ServiceCallType" NOT NULL,
    "status" "ServiceCallStatus" NOT NULL DEFAULT 'OPEN',
    "message" TEXT,
    "resolvedAt" TIMESTAMP(3),
    "acknowledgedAt" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ServiceCall_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "RestaurantArea_tenantId_branchId_sortOrder_idx" ON "RestaurantArea"("tenantId", "branchId", "sortOrder");

-- CreateIndex
CREATE UNIQUE INDEX "RestaurantTable_qrCodeToken_key" ON "RestaurantTable"("qrCodeToken");

-- CreateIndex
CREATE INDEX "RestaurantTable_tenantId_branchId_status_active_idx" ON "RestaurantTable"("tenantId", "branchId", "status", "active");

-- CreateIndex
CREATE UNIQUE INDEX "RestaurantTable_tenantId_branchId_tableNumber_key" ON "RestaurantTable"("tenantId", "branchId", "tableNumber");

-- CreateIndex
CREATE INDEX "TableSession_tenantId_branchId_status_openedAt_idx" ON "TableSession"("tenantId", "branchId", "status", "openedAt");

-- CreateIndex
CREATE INDEX "TableSession_tableId_status_openedAt_idx" ON "TableSession"("tableId", "status", "openedAt");

-- CreateIndex
CREATE INDEX "ServiceCall_tenantId_branchId_status_createdAt_idx" ON "ServiceCall"("tenantId", "branchId", "status", "createdAt");

-- CreateIndex
CREATE INDEX "ServiceCall_tableId_status_createdAt_idx" ON "ServiceCall"("tableId", "status", "createdAt");

-- CreateIndex
CREATE INDEX "Order_tableSessionId_createdAt_idx" ON "Order"("tableSessionId", "createdAt");

-- AddForeignKey
ALTER TABLE "Order" ADD CONSTRAINT "Order_tableId_fkey" FOREIGN KEY ("tableId") REFERENCES "RestaurantTable"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Order" ADD CONSTRAINT "Order_tableSessionId_fkey" FOREIGN KEY ("tableSessionId") REFERENCES "TableSession"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DisplayPairingSession" ADD CONSTRAINT "DisplayPairingSession_screenId_fkey" FOREIGN KEY ("screenId") REFERENCES "DisplayScreen"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DisplayDevice" ADD CONSTRAINT "DisplayDevice_screenId_fkey" FOREIGN KEY ("screenId") REFERENCES "DisplayScreen"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RestaurantArea" ADD CONSTRAINT "RestaurantArea_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RestaurantTable" ADD CONSTRAINT "RestaurantTable_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RestaurantTable" ADD CONSTRAINT "RestaurantTable_areaId_fkey" FOREIGN KEY ("areaId") REFERENCES "RestaurantArea"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TableSession" ADD CONSTRAINT "TableSession_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TableSession" ADD CONSTRAINT "TableSession_tableId_fkey" FOREIGN KEY ("tableId") REFERENCES "RestaurantTable"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ServiceCall" ADD CONSTRAINT "ServiceCall_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ServiceCall" ADD CONSTRAINT "ServiceCall_tableId_fkey" FOREIGN KEY ("tableId") REFERENCES "RestaurantTable"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ServiceCall" ADD CONSTRAINT "ServiceCall_sessionId_fkey" FOREIGN KEY ("sessionId") REFERENCES "TableSession"("id") ON DELETE SET NULL ON UPDATE CASCADE;
