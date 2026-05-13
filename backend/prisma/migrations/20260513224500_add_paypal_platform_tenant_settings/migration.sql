-- CreateEnum
CREATE TYPE "PaypalOnboardingStatus" AS ENUM ('NOT_STARTED', 'PENDING', 'VERIFIED', 'RESTRICTED', 'DISABLED');

-- CreateEnum
CREATE TYPE "PaypalEnvironment" AS ENUM ('SANDBOX', 'LIVE');

-- AlterTable
ALTER TABLE "TenantPaymentConfig"
ADD COLUMN "paypalMerchantId" TEXT,
ADD COLUMN "paypalEmail" TEXT,
ADD COLUMN "paypalOnboardingStatus" "PaypalOnboardingStatus" NOT NULL DEFAULT 'NOT_STARTED',
ADD COLUMN "paypalEnvironment" "PaypalEnvironment" NOT NULL DEFAULT 'SANDBOX',
ADD COLUMN "paypalPaymentsEnabled" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN "klarandoPlatformFeePercent" DECIMAL(6,3),
ADD COLUMN "klarandoPlatformFeeFixed" INTEGER;
