-- Display signage foundation rebuild (resilient / idempotent)

-- 1) Enums first (duplicate-safe)
DO $$ BEGIN
  CREATE TYPE "DisplayPairingStatus" AS ENUM ('PENDING', 'CLAIMED', 'EXPIRED');
EXCEPTION WHEN duplicate_object THEN NULL;
END $$;

DO $$ BEGIN
  CREATE TYPE "DisplayDeviceStatus" AS ENUM ('ONLINE', 'OFFLINE', 'REVOKED');
EXCEPTION WHEN duplicate_object THEN NULL;
END $$;

DO $$ BEGIN
  CREATE TYPE "DisplayOrientation" AS ENUM ('LANDSCAPE', 'PORTRAIT');
EXCEPTION WHEN duplicate_object THEN NULL;
END $$;

DO $$ BEGIN
  CREATE TYPE "DisplayResolutionPreset" AS ENUM ('HD', 'FULL_HD', 'FOUR_K', 'CUSTOM');
EXCEPTION WHEN duplicate_object THEN NULL;
END $$;

DO $$ BEGIN
  CREATE TYPE "DisplayLayoutType" AS ENUM ('MENU_BOARD', 'SLIDESHOW', 'PROMO_SPLIT', 'ORDER_STATUS');
EXCEPTION WHEN duplicate_object THEN NULL;
END $$;

DO $$ BEGIN
  CREATE TYPE "DisplayPlaylistItemType" AS ENUM ('PRODUCT_GRID', 'CATEGORY_MENU', 'IMAGE', 'VIDEO', 'PROMOTION', 'URL', 'CUSTOM_TEXT');
EXCEPTION WHEN duplicate_object THEN NULL;
END $$;

-- 2) Base tables
CREATE TABLE IF NOT EXISTS "DisplayScreen" (
  "id" TEXT NOT NULL,
  "tenantId" TEXT NOT NULL,
  "name" TEXT NOT NULL,
  "orientation" "DisplayOrientation" NOT NULL DEFAULT 'LANDSCAPE',
  "resolutionPreset" "DisplayResolutionPreset" NOT NULL DEFAULT 'FULL_HD',
  "backgroundColor" TEXT NOT NULL DEFAULT '#111827',
  "accentColor" TEXT NOT NULL DEFAULT '#ff6b35',
  "layoutType" "DisplayLayoutType" NOT NULL DEFAULT 'MENU_BOARD',
  "isActive" BOOLEAN NOT NULL DEFAULT true,
  "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT "DisplayScreen_pkey" PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "DisplayPlaylist" (
  "id" TEXT NOT NULL,
  "tenantId" TEXT NOT NULL,
  "screenId" TEXT NOT NULL,
  "name" TEXT NOT NULL,
  "isActive" BOOLEAN NOT NULL DEFAULT true,
  "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT "DisplayPlaylist_pkey" PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "DisplayPlaylistItem" (
  "id" TEXT NOT NULL,
  "playlistId" TEXT NOT NULL,
  "type" "DisplayPlaylistItemType" NOT NULL,
  "sortOrder" INTEGER NOT NULL DEFAULT 0,
  "durationSeconds" INTEGER NOT NULL DEFAULT 10,
  "config" JSONB NOT NULL,
  "activeFrom" TIMESTAMP(3),
  "activeUntil" TIMESTAMP(3),
  "weekdays" JSONB,
  "timeStart" TEXT,
  "timeEnd" TEXT,
  "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT "DisplayPlaylistItem_pkey" PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "DisplayDevice" (
  "id" TEXT NOT NULL,
  "tenantId" TEXT NOT NULL,
  "screenId" TEXT,
  "pairingSessionId" TEXT,
  "name" TEXT NOT NULL,
  "deviceTokenHash" TEXT NOT NULL,
  "platform" TEXT NOT NULL DEFAULT 'unknown',
  "appVersion" TEXT,
  "status" "DisplayDeviceStatus" NOT NULL DEFAULT 'OFFLINE',
  "lastSeenAt" TIMESTAMP(3),
  "lastIp" TEXT,
  "revokedAt" TIMESTAMP(3),
  "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT "DisplayDevice_pkey" PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "DisplayPairingSession" (
  "id" TEXT NOT NULL,
  "pairingTokenHash" TEXT NOT NULL,
  "pairingCode" TEXT NOT NULL,
  "status" "DisplayPairingStatus" NOT NULL DEFAULT 'PENDING',
  "expiresAt" TIMESTAMP(3) NOT NULL,
  "claimedAt" TIMESTAMP(3),
  "claimedByUserId" TEXT,
  "tenantId" TEXT,
  "screenId" TEXT,
  "displayName" TEXT,
  "platform" TEXT NOT NULL DEFAULT 'unknown',
  "appVersion" TEXT,
  "deviceName" TEXT NOT NULL DEFAULT 'Unbekanntes Display',
  "deviceId" TEXT,
  "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT "DisplayPairingSession_pkey" PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "DisplayHeartbeatLog" (
  "id" TEXT NOT NULL,
  "tenantId" TEXT NOT NULL,
  "deviceId" TEXT NOT NULL,
  "status" TEXT NOT NULL,
  "appVersion" TEXT,
  "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT "DisplayHeartbeatLog_pkey" PRIMARY KEY ("id")
);

-- 3) Ensure additive columns for existing tables
ALTER TABLE "DisplayScreen"
  ADD COLUMN IF NOT EXISTS "customWidth" INTEGER,
  ADD COLUMN IF NOT EXISTS "customHeight" INTEGER,
  ADD COLUMN IF NOT EXISTS "settingsJson" JSONB;

ALTER TABLE "DisplayPlaylist"
  ADD COLUMN IF NOT EXISTS "settingsJson" JSONB;

ALTER TABLE "DisplayPairingSession"
  ADD COLUMN IF NOT EXISTS "displayName" TEXT,
  ADD COLUMN IF NOT EXISTS "deviceId" TEXT,
  ADD COLUMN IF NOT EXISTS "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE "DisplayDevice"
  ADD COLUMN IF NOT EXISTS "lastIp" TEXT;

DO $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM information_schema.columns
    WHERE table_schema = 'public' AND table_name = 'DisplayDevice' AND column_name = 'platform'
  ) THEN
    UPDATE "DisplayDevice" SET "platform" = COALESCE(NULLIF(TRIM("platform"), ''), 'unknown');
    ALTER TABLE "DisplayDevice" ALTER COLUMN "platform" SET NOT NULL;
  END IF;
END $$;

DO $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM information_schema.columns
    WHERE table_schema = 'public' AND table_name = 'DisplayPairingSession' AND column_name = 'platform'
  ) THEN
    UPDATE "DisplayPairingSession" SET "platform" = COALESCE(NULLIF(TRIM("platform"), ''), 'unknown');
    ALTER TABLE "DisplayPairingSession" ALTER COLUMN "platform" SET NOT NULL;
  END IF;
END $$;

DO $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM information_schema.columns
    WHERE table_schema = 'public' AND table_name = 'DisplayPairingSession' AND column_name = 'deviceName'
  ) THEN
    UPDATE "DisplayPairingSession" SET "deviceName" = COALESCE(NULLIF(TRIM("deviceName"), ''), 'Unbekanntes Display');
    ALTER TABLE "DisplayPairingSession" ALTER COLUMN "deviceName" SET NOT NULL;
  END IF;
END $$;

DO $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM information_schema.columns
    WHERE table_schema = 'public' AND table_name = 'DisplayDevice' AND column_name = 'status'
  ) THEN
    IF EXISTS (
      SELECT 1
      FROM information_schema.columns
      WHERE table_schema = 'public'
        AND table_name = 'DisplayDevice'
        AND column_name = 'status'
        AND udt_name <> 'DisplayDeviceStatus'
    ) THEN
      ALTER TABLE "DisplayDevice"
        ALTER COLUMN "status" DROP DEFAULT;
      ALTER TABLE "DisplayDevice"
        ALTER COLUMN "status" TYPE "DisplayDeviceStatus" USING (
          CASE
            WHEN "status"::text = 'REVOKED' THEN 'REVOKED'::"DisplayDeviceStatus"
            WHEN "status"::text = 'ONLINE' THEN 'ONLINE'::"DisplayDeviceStatus"
            ELSE 'OFFLINE'::"DisplayDeviceStatus"
          END
        );
    END IF;

    ALTER TABLE "DisplayDevice"
      ALTER COLUMN "status" SET DEFAULT 'OFFLINE';
  END IF;
END $$;

DO $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM information_schema.columns
    WHERE table_schema = 'public' AND table_name = 'DisplayDevice' AND column_name = 'displayScreenId'
  ) THEN
    ALTER TABLE "DisplayDevice" DROP COLUMN "displayScreenId";
  END IF;
END $$;

DO $$
BEGIN
  IF EXISTS (SELECT 1 FROM pg_type WHERE typname = 'DisplayScreenOrientation')
     AND NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'DisplayOrientation') THEN
    ALTER TYPE "DisplayScreenOrientation" RENAME TO "DisplayOrientation";
  END IF;
EXCEPTION WHEN duplicate_object THEN NULL;
END $$;

-- 4) Indexes
CREATE INDEX IF NOT EXISTS "DisplayScreen_tenantId_isActive_idx" ON "DisplayScreen"("tenantId", "isActive");
CREATE INDEX IF NOT EXISTS "DisplayScreen_tenantId_name_idx" ON "DisplayScreen"("tenantId", "name");
CREATE INDEX IF NOT EXISTS "DisplayPlaylist_tenantId_isActive_idx" ON "DisplayPlaylist"("tenantId", "isActive");
CREATE INDEX IF NOT EXISTS "DisplayPlaylist_screenId_isActive_idx" ON "DisplayPlaylist"("screenId", "isActive");
CREATE INDEX IF NOT EXISTS "DisplayPlaylistItem_playlistId_sortOrder_idx" ON "DisplayPlaylistItem"("playlistId", "sortOrder");
CREATE INDEX IF NOT EXISTS "DisplayHeartbeatLog_deviceId_createdAt_idx" ON "DisplayHeartbeatLog"("deviceId", "createdAt");
CREATE INDEX IF NOT EXISTS "DisplayHeartbeatLog_tenantId_createdAt_idx" ON "DisplayHeartbeatLog"("tenantId", "createdAt");
CREATE INDEX IF NOT EXISTS "DisplayPairingSession_status_expiresAt_idx" ON "DisplayPairingSession"("status", "expiresAt");
CREATE INDEX IF NOT EXISTS "DisplayPairingSession_pairingCode_idx" ON "DisplayPairingSession"("pairingCode");

-- 5) Foreign keys / constraints (table + constraint existence checks)
DO $$ BEGIN
  IF EXISTS (
       SELECT 1 FROM information_schema.tables
       WHERE table_schema = 'public' AND table_name = 'DisplayScreen'
     )
     AND EXISTS (
       SELECT 1 FROM information_schema.tables
       WHERE table_schema = 'public' AND table_name = 'Tenant'
     )
     AND NOT EXISTS (
       SELECT 1
       FROM pg_constraint c
       JOIN pg_class t ON t.oid = c.conrelid
       JOIN pg_namespace n ON n.oid = t.relnamespace
       WHERE n.nspname = 'public'
         AND t.relname = 'DisplayScreen'
         AND c.conname = 'DisplayScreen_tenantId_fkey'
     ) THEN
    ALTER TABLE "DisplayScreen" ADD CONSTRAINT "DisplayScreen_tenantId_fkey"
      FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE CASCADE ON UPDATE CASCADE;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (
       SELECT 1 FROM information_schema.tables
       WHERE table_schema = 'public' AND table_name = 'DisplayPlaylist'
     )
     AND EXISTS (
       SELECT 1 FROM information_schema.tables
       WHERE table_schema = 'public' AND table_name = 'Tenant'
     )
     AND NOT EXISTS (
       SELECT 1
       FROM pg_constraint c
       JOIN pg_class t ON t.oid = c.conrelid
       JOIN pg_namespace n ON n.oid = t.relnamespace
       WHERE n.nspname = 'public'
         AND t.relname = 'DisplayPlaylist'
         AND c.conname = 'DisplayPlaylist_tenantId_fkey'
     ) THEN
    ALTER TABLE "DisplayPlaylist" ADD CONSTRAINT "DisplayPlaylist_tenantId_fkey"
      FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE CASCADE ON UPDATE CASCADE;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (
       SELECT 1 FROM information_schema.tables
       WHERE table_schema = 'public' AND table_name = 'DisplayPlaylist'
     )
     AND EXISTS (
       SELECT 1 FROM information_schema.tables
       WHERE table_schema = 'public' AND table_name = 'DisplayScreen'
     )
     AND NOT EXISTS (
       SELECT 1
       FROM pg_constraint c
       JOIN pg_class t ON t.oid = c.conrelid
       JOIN pg_namespace n ON n.oid = t.relnamespace
       WHERE n.nspname = 'public'
         AND t.relname = 'DisplayPlaylist'
         AND c.conname = 'DisplayPlaylist_screenId_fkey'
     ) THEN
    ALTER TABLE "DisplayPlaylist" ADD CONSTRAINT "DisplayPlaylist_screenId_fkey"
      FOREIGN KEY ("screenId") REFERENCES "DisplayScreen"("id") ON DELETE CASCADE ON UPDATE CASCADE;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (
       SELECT 1 FROM information_schema.tables
       WHERE table_schema = 'public' AND table_name = 'DisplayPlaylistItem'
     )
     AND EXISTS (
       SELECT 1 FROM information_schema.tables
       WHERE table_schema = 'public' AND table_name = 'DisplayPlaylist'
     )
     AND NOT EXISTS (
       SELECT 1
       FROM pg_constraint c
       JOIN pg_class t ON t.oid = c.conrelid
       JOIN pg_namespace n ON n.oid = t.relnamespace
       WHERE n.nspname = 'public'
         AND t.relname = 'DisplayPlaylistItem'
         AND c.conname = 'DisplayPlaylistItem_playlistId_fkey'
     ) THEN
    ALTER TABLE "DisplayPlaylistItem" ADD CONSTRAINT "DisplayPlaylistItem_playlistId_fkey"
      FOREIGN KEY ("playlistId") REFERENCES "DisplayPlaylist"("id") ON DELETE CASCADE ON UPDATE CASCADE;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (
       SELECT 1 FROM information_schema.tables
       WHERE table_schema = 'public' AND table_name = 'DisplayHeartbeatLog'
     )
     AND EXISTS (
       SELECT 1 FROM information_schema.tables
       WHERE table_schema = 'public' AND table_name = 'Tenant'
     )
     AND NOT EXISTS (
       SELECT 1
       FROM pg_constraint c
       JOIN pg_class t ON t.oid = c.conrelid
       JOIN pg_namespace n ON n.oid = t.relnamespace
       WHERE n.nspname = 'public'
         AND t.relname = 'DisplayHeartbeatLog'
         AND c.conname = 'DisplayHeartbeatLog_tenantId_fkey'
     ) THEN
    ALTER TABLE "DisplayHeartbeatLog" ADD CONSTRAINT "DisplayHeartbeatLog_tenantId_fkey"
      FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE CASCADE ON UPDATE CASCADE;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (
       SELECT 1 FROM information_schema.tables
       WHERE table_schema = 'public' AND table_name = 'DisplayHeartbeatLog'
     )
     AND EXISTS (
       SELECT 1 FROM information_schema.tables
       WHERE table_schema = 'public' AND table_name = 'DisplayDevice'
     )
     AND NOT EXISTS (
       SELECT 1
       FROM pg_constraint c
       JOIN pg_class t ON t.oid = c.conrelid
       JOIN pg_namespace n ON n.oid = t.relnamespace
       WHERE n.nspname = 'public'
         AND t.relname = 'DisplayHeartbeatLog'
         AND c.conname = 'DisplayHeartbeatLog_deviceId_fkey'
     ) THEN
    ALTER TABLE "DisplayHeartbeatLog" ADD CONSTRAINT "DisplayHeartbeatLog_deviceId_fkey"
      FOREIGN KEY ("deviceId") REFERENCES "DisplayDevice"("id") ON DELETE CASCADE ON UPDATE CASCADE;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (
       SELECT 1 FROM information_schema.tables
       WHERE table_schema = 'public' AND table_name = 'DisplayDevice'
     )
     AND EXISTS (
       SELECT 1 FROM information_schema.tables
       WHERE table_schema = 'public' AND table_name = 'DisplayScreen'
     )
     AND NOT EXISTS (
       SELECT 1
       FROM pg_constraint c
       JOIN pg_class t ON t.oid = c.conrelid
       JOIN pg_namespace n ON n.oid = t.relnamespace
       WHERE n.nspname = 'public'
         AND t.relname = 'DisplayDevice'
         AND c.conname = 'DisplayDevice_screenId_fkey'
     ) THEN
    ALTER TABLE "DisplayDevice" ADD CONSTRAINT "DisplayDevice_screenId_fkey"
      FOREIGN KEY ("screenId") REFERENCES "DisplayScreen"("id") ON DELETE SET NULL ON UPDATE CASCADE;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (
       SELECT 1 FROM information_schema.tables
       WHERE table_schema = 'public' AND table_name = 'DisplayDevice'
     )
     AND EXISTS (
       SELECT 1 FROM information_schema.tables
       WHERE table_schema = 'public' AND table_name = 'Tenant'
     )
     AND NOT EXISTS (
       SELECT 1
       FROM pg_constraint c
       JOIN pg_class t ON t.oid = c.conrelid
       JOIN pg_namespace n ON n.oid = t.relnamespace
       WHERE n.nspname = 'public'
         AND t.relname = 'DisplayDevice'
         AND c.conname = 'DisplayDevice_tenantId_fkey'
     ) THEN
    ALTER TABLE "DisplayDevice" ADD CONSTRAINT "DisplayDevice_tenantId_fkey"
      FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE CASCADE ON UPDATE CASCADE;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (
       SELECT 1 FROM information_schema.tables
       WHERE table_schema = 'public' AND table_name = 'DisplayPairingSession'
     )
     AND EXISTS (
       SELECT 1 FROM information_schema.tables
       WHERE table_schema = 'public' AND table_name = 'DisplayScreen'
     )
     AND NOT EXISTS (
       SELECT 1
       FROM pg_constraint c
       JOIN pg_class t ON t.oid = c.conrelid
       JOIN pg_namespace n ON n.oid = t.relnamespace
       WHERE n.nspname = 'public'
         AND t.relname = 'DisplayPairingSession'
         AND c.conname = 'DisplayPairingSession_screenId_fkey'
     ) THEN
    ALTER TABLE "DisplayPairingSession" ADD CONSTRAINT "DisplayPairingSession_screenId_fkey"
      FOREIGN KEY ("screenId") REFERENCES "DisplayScreen"("id") ON DELETE SET NULL ON UPDATE CASCADE;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (
       SELECT 1 FROM information_schema.tables
       WHERE table_schema = 'public' AND table_name = 'DisplayPairingSession'
     )
     AND EXISTS (
       SELECT 1 FROM information_schema.tables
       WHERE table_schema = 'public' AND table_name = 'DisplayDevice'
     )
     AND NOT EXISTS (
       SELECT 1
       FROM pg_constraint c
       JOIN pg_class t ON t.oid = c.conrelid
       JOIN pg_namespace n ON n.oid = t.relnamespace
       WHERE n.nspname = 'public'
         AND t.relname = 'DisplayPairingSession'
         AND c.conname = 'DisplayPairingSession_deviceId_fkey'
     ) THEN
    ALTER TABLE "DisplayPairingSession" ADD CONSTRAINT "DisplayPairingSession_deviceId_fkey"
      FOREIGN KEY ("deviceId") REFERENCES "DisplayDevice"("id") ON DELETE SET NULL ON UPDATE CASCADE;
  END IF;
END $$;
