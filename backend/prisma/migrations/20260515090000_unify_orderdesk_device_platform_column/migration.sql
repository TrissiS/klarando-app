-- Unify OrderDeskDeviceBinding platform column naming.
-- Goal: keep only "devicePlatform" and safely migrate legacy "deviceplatform" data.

DO $$
BEGIN
  IF EXISTS (
      SELECT 1
      FROM information_schema.tables
      WHERE table_schema = 'public'
        AND table_name = 'OrderDeskDeviceBinding'
  ) THEN
    ALTER TABLE "OrderDeskDeviceBinding"
      ADD COLUMN IF NOT EXISTS "devicePlatform" TEXT;

    IF EXISTS (
        SELECT 1
        FROM information_schema.columns
        WHERE table_schema = 'public'
          AND table_name = 'OrderDeskDeviceBinding'
          AND column_name = 'deviceplatform'
    ) THEN
      UPDATE "OrderDeskDeviceBinding"
      SET "devicePlatform" = COALESCE(
        NULLIF(TRIM("devicePlatform"), ''),
        "deviceplatform"
      )
      WHERE "deviceplatform" IS NOT NULL;
    END IF;

    UPDATE "OrderDeskDeviceBinding"
    SET "devicePlatform" = ''
    WHERE "devicePlatform" IS NULL;

    ALTER TABLE "OrderDeskDeviceBinding"
      ALTER COLUMN "devicePlatform" SET NOT NULL;

    IF EXISTS (
        SELECT 1
        FROM information_schema.columns
        WHERE table_schema = 'public'
          AND table_name = 'OrderDeskDeviceBinding'
          AND column_name = 'deviceplatform'
    ) THEN
      ALTER TABLE "OrderDeskDeviceBinding"
        DROP COLUMN "deviceplatform";
    END IF;
  END IF;
END $$;
