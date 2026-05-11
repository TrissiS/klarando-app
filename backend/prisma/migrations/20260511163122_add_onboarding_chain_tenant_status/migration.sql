-- CreateEnum
CREATE TYPE "ChainType" AS ENUM ('INDEPENDENT', 'CHAIN', 'FRANCHISE');

-- CreateEnum
CREATE TYPE "EntityStatus" AS ENUM ('ACTIVE', 'PAUSED', 'ARCHIVED', 'LOCKED');

-- AlterTable
ALTER TABLE "Chain" ADD COLUMN     "contactEmail" TEXT,
ADD COLUMN     "contactName" TEXT,
ADD COLUMN     "contactPhone" TEXT,
ADD COLUMN     "status" "EntityStatus" NOT NULL DEFAULT 'ACTIVE',
ADD COLUMN     "type" "ChainType" NOT NULL DEFAULT 'INDEPENDENT';

-- AlterTable
ALTER TABLE "Tenant" ADD COLUMN     "addressLine" TEXT,
ADD COLUMN     "status" "EntityStatus" NOT NULL DEFAULT 'ACTIVE';
