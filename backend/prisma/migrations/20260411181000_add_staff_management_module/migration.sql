-- CreateEnum
CREATE TYPE "StaffShiftStatus" AS ENUM ('PLANNED', 'COMPLETED', 'CANCELED');

-- CreateTable
CREATE TABLE "StaffMember" (
  "id" TEXT NOT NULL,
  "tenantId" TEXT NOT NULL,
  "userId" TEXT,
  "name" TEXT NOT NULL,
  "position" TEXT,
  "phone" TEXT,
  "email" TEXT,
  "hourlyRate" DECIMAL(10,2),
  "weeklyTargetHours" DECIMAL(6,2),
  "isActive" BOOLEAN NOT NULL DEFAULT true,
  "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updatedAt" TIMESTAMP(3) NOT NULL,

  CONSTRAINT "StaffMember_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "StaffShift" (
  "id" TEXT NOT NULL,
  "tenantId" TEXT NOT NULL,
  "staffMemberId" TEXT NOT NULL,
  "shiftDate" DATE NOT NULL,
  "startTime" TEXT NOT NULL,
  "endTime" TEXT NOT NULL,
  "breakMinutes" INTEGER NOT NULL DEFAULT 0,
  "status" "StaffShiftStatus" NOT NULL DEFAULT 'PLANNED',
  "note" TEXT,
  "createdByUserId" TEXT,
  "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updatedAt" TIMESTAMP(3) NOT NULL,

  CONSTRAINT "StaffShift_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "StaffSetting" (
  "id" TEXT NOT NULL,
  "tenantId" TEXT NOT NULL,
  "planningDays" INTEGER NOT NULL DEFAULT 14,
  "defaultShiftStart" TEXT NOT NULL DEFAULT '10:00',
  "defaultShiftEnd" TEXT NOT NULL DEFAULT '18:00',
  "defaultBreakMinutes" INTEGER NOT NULL DEFAULT 30,
  "overtimeThresholdHours" DECIMAL(6,2),
  "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updatedAt" TIMESTAMP(3) NOT NULL,

  CONSTRAINT "StaffSetting_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "StaffMember_userId_key" ON "StaffMember"("userId");

-- CreateIndex
CREATE INDEX "StaffMember_tenantId_isActive_idx" ON "StaffMember"("tenantId", "isActive");

-- CreateIndex
CREATE INDEX "StaffMember_tenantId_name_idx" ON "StaffMember"("tenantId", "name");

-- CreateIndex
CREATE INDEX "StaffShift_tenantId_shiftDate_idx" ON "StaffShift"("tenantId", "shiftDate");

-- CreateIndex
CREATE INDEX "StaffShift_staffMemberId_shiftDate_idx" ON "StaffShift"("staffMemberId", "shiftDate");

-- CreateIndex
CREATE UNIQUE INDEX "StaffSetting_tenantId_key" ON "StaffSetting"("tenantId");

-- AddForeignKey
ALTER TABLE "StaffMember"
ADD CONSTRAINT "StaffMember_tenantId_fkey"
FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id")
ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StaffMember"
ADD CONSTRAINT "StaffMember_userId_fkey"
FOREIGN KEY ("userId") REFERENCES "User"("id")
ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StaffShift"
ADD CONSTRAINT "StaffShift_tenantId_fkey"
FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id")
ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StaffShift"
ADD CONSTRAINT "StaffShift_staffMemberId_fkey"
FOREIGN KEY ("staffMemberId") REFERENCES "StaffMember"("id")
ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StaffShift"
ADD CONSTRAINT "StaffShift_createdByUserId_fkey"
FOREIGN KEY ("createdByUserId") REFERENCES "User"("id")
ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StaffSetting"
ADD CONSTRAINT "StaffSetting_tenantId_fkey"
FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id")
ON DELETE CASCADE ON UPDATE CASCADE;
