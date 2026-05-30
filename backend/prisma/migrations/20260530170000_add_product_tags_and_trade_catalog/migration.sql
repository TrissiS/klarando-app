-- CreateEnum
DO $$ BEGIN
  CREATE TYPE "ProductAgeRestriction" AS ENUM ('NONE', 'AGE_16', 'AGE_18');
EXCEPTION
  WHEN duplicate_object THEN null;
END $$;

-- AlterTable Product
ALTER TABLE "Product"
  ADD COLUMN IF NOT EXISTS "isBeverage" BOOLEAN NOT NULL DEFAULT false,
  ADD COLUMN IF NOT EXISTS "contentVolumeLiters" DECIMAL(10, 3),
  ADD COLUMN IF NOT EXISTS "ageRestriction" "ProductAgeRestriction" NOT NULL DEFAULT 'NONE',
  ADD COLUMN IF NOT EXISTS "isVegetarian" BOOLEAN NOT NULL DEFAULT false,
  ADD COLUMN IF NOT EXISTS "isVegan" BOOLEAN NOT NULL DEFAULT false,
  ADD COLUMN IF NOT EXISTS "isSpicy" BOOLEAN NOT NULL DEFAULT false,
  ADD COLUMN IF NOT EXISTS "isVerySpicy" BOOLEAN NOT NULL DEFAULT false,
  ADD COLUMN IF NOT EXISTS "isNew" BOOLEAN NOT NULL DEFAULT false,
  ADD COLUMN IF NOT EXISTS "isPopular" BOOLEAN NOT NULL DEFAULT false;

-- CreateTable
CREATE TABLE IF NOT EXISTS "TradeCatalogItem" (
  "id" TEXT NOT NULL,
  "name" TEXT NOT NULL,
  "brand" TEXT,
  "category" TEXT,
  "ean" TEXT,
  "articleNumber" TEXT,
  "imageUrl" TEXT,
  "contentVolumeLiters" DECIMAL(10, 3),
  "beverageContainerType" "BeverageContainerType" NOT NULL DEFAULT 'NONE',
  "deposit" DECIMAL(10, 2) NOT NULL DEFAULT 0,
  "ageRestriction" "ProductAgeRestriction" NOT NULL DEFAULT 'NONE',
  "isActive" BOOLEAN NOT NULL DEFAULT true,
  "metadata" JSONB,
  "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updatedAt" TIMESTAMP(3) NOT NULL,
  CONSTRAINT "TradeCatalogItem_pkey" PRIMARY KEY ("id")
);

CREATE UNIQUE INDEX IF NOT EXISTS "TradeCatalogItem_ean_key" ON "TradeCatalogItem"("ean");
CREATE INDEX IF NOT EXISTS "TradeCatalogItem_isActive_category_brand_idx" ON "TradeCatalogItem"("isActive", "category", "brand");
CREATE INDEX IF NOT EXISTS "TradeCatalogItem_name_idx" ON "TradeCatalogItem"("name");
