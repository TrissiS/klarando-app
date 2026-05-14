-- CreateEnum
CREATE TYPE "DisplayPairingStatus" AS ENUM ('PENDING', 'CLAIMED', 'EXPIRED');

-- CreateTable
CREATE TABLE "DisplayPairingSession" (
    "id" TEXT NOT NULL,
    "pairingTokenHash" TEXT NOT NULL,
    "pairingCode" TEXT NOT NULL,
    "status" "DisplayPairingStatus" NOT NULL DEFAULT 'PENDING',
    "expiresAt" TIMESTAMP(3) NOT NULL,
    "claimedAt" TIMESTAMP(3),
    "claimedByUserId" TEXT,
    "tenantId" TEXT,
    "screenId" TEXT,
    "displayName" TEXT,
    "platform" TEXT,
    "appVersion" TEXT,
    "deviceName" TEXT,
    "deviceId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "DisplayPairingSession_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DisplayDevice" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "screenId" TEXT,
    "pairingSessionId" TEXT,
    "name" TEXT NOT NULL,
    "deviceTokenHash" TEXT NOT NULL,
    "platform" TEXT,
    "status" TEXT NOT NULL DEFAULT 'ACTIVE',
    "lastSeenAt" TIMESTAMP(3),
    "appVersion" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "revokedAt" TIMESTAMP(3),

    CONSTRAINT "DisplayDevice_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "DisplayPairingSession_pairingTokenHash_key" ON "DisplayPairingSession"("pairingTokenHash");

-- CreateIndex
CREATE INDEX "DisplayPairingSession_status_expiresAt_idx" ON "DisplayPairingSession"("status", "expiresAt");

-- CreateIndex
CREATE INDEX "DisplayPairingSession_pairingCode_idx" ON "DisplayPairingSession"("pairingCode");

-- CreateIndex
CREATE UNIQUE INDEX "DisplayDevice_pairingSessionId_key" ON "DisplayDevice"("pairingSessionId");

-- CreateIndex
CREATE UNIQUE INDEX "DisplayDevice_deviceTokenHash_key" ON "DisplayDevice"("deviceTokenHash");

-- CreateIndex
CREATE INDEX "DisplayDevice_tenantId_status_idx" ON "DisplayDevice"("tenantId", "status");

-- CreateIndex
CREATE INDEX "DisplayDevice_screenId_idx" ON "DisplayDevice"("screenId");

-- CreateIndex
CREATE INDEX "DisplayDevice_lastSeenAt_idx" ON "DisplayDevice"("lastSeenAt");

-- AddForeignKey
ALTER TABLE "DisplayPairingSession" ADD CONSTRAINT "DisplayPairingSession_claimedByUserId_fkey" FOREIGN KEY ("claimedByUserId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DisplayPairingSession" ADD CONSTRAINT "DisplayPairingSession_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DisplayPairingSession" ADD CONSTRAINT "DisplayPairingSession_screenId_fkey" FOREIGN KEY ("screenId") REFERENCES "ScreenDevice"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DisplayPairingSession" ADD CONSTRAINT "DisplayPairingSession_deviceId_fkey" FOREIGN KEY ("deviceId") REFERENCES "DisplayDevice"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DisplayDevice" ADD CONSTRAINT "DisplayDevice_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DisplayDevice" ADD CONSTRAINT "DisplayDevice_screenId_fkey" FOREIGN KEY ("screenId") REFERENCES "ScreenDevice"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DisplayDevice" ADD CONSTRAINT "DisplayDevice_pairingSessionId_fkey" FOREIGN KEY ("pairingSessionId") REFERENCES "DisplayPairingSession"("id") ON DELETE SET NULL ON UPDATE CASCADE;
