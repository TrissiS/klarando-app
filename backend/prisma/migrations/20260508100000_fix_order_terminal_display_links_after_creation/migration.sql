-- Ensure OrderTerminal exists before adding display routing fields.
ALTER TABLE "OrderTerminal"
ADD COLUMN IF NOT EXISTS "cashDisplayId" TEXT,
ADD COLUMN IF NOT EXISTS "kitchenDisplayId" TEXT,
ADD COLUMN IF NOT EXISTS "pickupDisplayId" TEXT;

CREATE INDEX IF NOT EXISTS "OrderTerminal_cashDisplayId_idx" ON "OrderTerminal"("cashDisplayId");
CREATE INDEX IF NOT EXISTS "OrderTerminal_kitchenDisplayId_idx" ON "OrderTerminal"("kitchenDisplayId");
CREATE INDEX IF NOT EXISTS "OrderTerminal_pickupDisplayId_idx" ON "OrderTerminal"("pickupDisplayId");

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1
    FROM pg_constraint
    WHERE conname = 'OrderTerminal_cashDisplayId_fkey'
  ) THEN
    ALTER TABLE "OrderTerminal"
    ADD CONSTRAINT "OrderTerminal_cashDisplayId_fkey"
    FOREIGN KEY ("cashDisplayId") REFERENCES "OrderDisplay"("id") ON DELETE SET NULL ON UPDATE CASCADE;
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1
    FROM pg_constraint
    WHERE conname = 'OrderTerminal_kitchenDisplayId_fkey'
  ) THEN
    ALTER TABLE "OrderTerminal"
    ADD CONSTRAINT "OrderTerminal_kitchenDisplayId_fkey"
    FOREIGN KEY ("kitchenDisplayId") REFERENCES "OrderDisplay"("id") ON DELETE SET NULL ON UPDATE CASCADE;
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1
    FROM pg_constraint
    WHERE conname = 'OrderTerminal_pickupDisplayId_fkey'
  ) THEN
    ALTER TABLE "OrderTerminal"
    ADD CONSTRAINT "OrderTerminal_pickupDisplayId_fkey"
    FOREIGN KEY ("pickupDisplayId") REFERENCES "OrderDisplay"("id") ON DELETE SET NULL ON UPDATE CASCADE;
  END IF;
END $$;
