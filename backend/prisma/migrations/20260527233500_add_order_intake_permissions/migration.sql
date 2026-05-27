DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1
    FROM pg_enum
    WHERE enumlabel = 'ORDER_INTAKE_READ'
      AND enumtypid = (
        SELECT oid FROM pg_type WHERE typname = 'PermissionKey'
      )
  ) THEN
    ALTER TYPE "PermissionKey" ADD VALUE 'ORDER_INTAKE_READ';
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1
    FROM pg_enum
    WHERE enumlabel = 'ORDER_INTAKE_MANAGE'
      AND enumtypid = (
        SELECT oid FROM pg_type WHERE typname = 'PermissionKey'
      )
  ) THEN
    ALTER TYPE "PermissionKey" ADD VALUE 'ORDER_INTAKE_MANAGE';
  END IF;
END $$;
