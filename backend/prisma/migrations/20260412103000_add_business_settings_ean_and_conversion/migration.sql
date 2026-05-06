-- Add business settings, EAN fields and ingredient conversion support
ALTER TABLE "Tenant"
ADD COLUMN "businessSettings" JSONB;

ALTER TABLE "Product"
ADD COLUMN "ean" TEXT,
ADD COLUMN "unitEans" JSONB;

ALTER TABLE "Ingredient"
ADD COLUMN "recipeUnit" TEXT,
ADD COLUMN "gramsPerPurchaseUnit" DECIMAL(10, 3),
ADD COLUMN "ean" TEXT,
ADD COLUMN "unitEans" JSONB;

UPDATE "Ingredient"
SET "recipeUnit" = "unit"
WHERE "recipeUnit" IS NULL;
