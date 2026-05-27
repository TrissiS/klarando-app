DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_enum
    WHERE enumlabel = 'TABLES_READ'
      AND enumtypid = '"PermissionKey"'::regtype
  ) THEN
    ALTER TYPE "PermissionKey" ADD VALUE 'TABLES_READ';
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_enum
    WHERE enumlabel = 'TABLES_MANAGE'
      AND enumtypid = '"PermissionKey"'::regtype
  ) THEN
    ALTER TYPE "PermissionKey" ADD VALUE 'TABLES_MANAGE';
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_enum
    WHERE enumlabel = 'TABLE_ORDERS_READ'
      AND enumtypid = '"PermissionKey"'::regtype
  ) THEN
    ALTER TYPE "PermissionKey" ADD VALUE 'TABLE_ORDERS_READ';
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_enum
    WHERE enumlabel = 'TABLE_ORDERS_MANAGE'
      AND enumtypid = '"PermissionKey"'::regtype
  ) THEN
    ALTER TYPE "PermissionKey" ADD VALUE 'TABLE_ORDERS_MANAGE';
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_enum
    WHERE enumlabel = 'SERVICE_CALLS_READ'
      AND enumtypid = '"PermissionKey"'::regtype
  ) THEN
    ALTER TYPE "PermissionKey" ADD VALUE 'SERVICE_CALLS_READ';
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_enum
    WHERE enumlabel = 'SERVICE_CALLS_MANAGE'
      AND enumtypid = '"PermissionKey"'::regtype
  ) THEN
    ALTER TYPE "PermissionKey" ADD VALUE 'SERVICE_CALLS_MANAGE';
  END IF;
END $$;
