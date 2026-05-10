DO $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM pg_type
    WHERE typname = 'UserRole'
      AND typnamespace = 'public'::regnamespace
  ) THEN
    IF NOT EXISTS (
      SELECT 1
      FROM pg_enum e
      JOIN pg_type t ON t.oid = e.enumtypid
      WHERE t.typname = 'UserRole'
        AND t.typnamespace = 'public'::regnamespace
        AND e.enumlabel = 'DRIVER'
    ) THEN
      ALTER TYPE "UserRole" ADD VALUE 'DRIVER';
    END IF;
  END IF;
END
$$;
