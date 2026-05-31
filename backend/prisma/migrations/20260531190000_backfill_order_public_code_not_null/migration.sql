DO $$
DECLARE
  row_record RECORD;
  candidate TEXT;
  alphabet CONSTANT TEXT := 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789';
  alphabet_length CONSTANT INT := length(alphabet);
  idx INT;
BEGIN
  FOR row_record IN SELECT id FROM "Order" WHERE "publicOrderCode" IS NULL LOOP
    LOOP
      candidate := '';
      FOR idx IN 1..6 LOOP
        candidate := candidate || substr(alphabet, floor(random() * alphabet_length + 1)::INT, 1);
      END LOOP;

      EXIT WHEN NOT EXISTS (
        SELECT 1
        FROM "Order"
        WHERE "publicOrderCode" = candidate
      );
    END LOOP;

    UPDATE "Order"
    SET "publicOrderCode" = candidate
    WHERE id = row_record.id;
  END LOOP;
END $$;

ALTER TABLE "Order"
ALTER COLUMN "publicOrderCode" SET NOT NULL;
