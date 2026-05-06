DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1
    FROM pg_type
    WHERE typname = 'IngredientCategory'
  ) THEN
    CREATE TYPE "IngredientCategory" AS ENUM ('FOOD', 'PACKAGING');
  END IF;
END $$;

ALTER TABLE "Ingredient"
ADD COLUMN IF NOT EXISTS "category" "IngredientCategory" NOT NULL DEFAULT 'FOOD';
