-- Display signage foundation rebuild
CREATE TYPE "DisplayDeviceStatus" AS ENUM ('ONLINE', 'OFFLINE', 'REVOKED');
CREATE TYPE "DisplayOrientation" AS ENUM ('LANDSCAPE', 'PORTRAIT');
CREATE TYPE "DisplayResolutionPreset" AS ENUM ('HD', 'FULL_HD', 'FOUR_K', 'CUSTOM');
CREATE TYPE "DisplayLayoutType" AS ENUM ('MENU_BOARD', 'SLIDESHOW', 'PROMO_SPLIT', 'ORDER_STATUS');
CREATE TYPE "DisplayPlaylistItemType" AS ENUM ('PRODUCT_GRID', 'CATEGORY_MENU', 'IMAGE', 'VIDEO', 'PROMOTION', 'URL', 'CUSTOM_TEXT');

ALTER TABLE "DisplayPairingSession"
  ALTER COLUMN "platform" SET NOT NULL,
  ALTER COLUMN "deviceName" SET NOT NULL;

ALTER TABLE "DisplayPairingSession"
  DROP CONSTRAINT IF EXISTS "DisplayPairingSession_screenId_fkey";

ALTER TABLE "DisplayDevice"
  ADD COLUMN "lastIp" TEXT,
  ALTER COLUMN "platform" SET NOT NULL;

ALTER TABLE "DisplayDevice"
  ALTER COLUMN "status" DROP DEFAULT;

ALTER TABLE "DisplayDevice"
  ALTER COLUMN "status" TYPE "DisplayDeviceStatus" USING (
    CASE
      WHEN "status" = 'REVOKED' THEN 'REVOKED'::"DisplayDeviceStatus"
      WHEN "status" = 'ONLINE' THEN 'ONLINE'::"DisplayDeviceStatus"
      ELSE 'OFFLINE'::"DisplayDeviceStatus"
    END
  );

ALTER TABLE "DisplayDevice"
  ALTER COLUMN "status" SET DEFAULT 'OFFLINE';

DO $$
BEGIN
  IF EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'DisplayDevice' AND column_name = 'displayScreenId') THEN
    ALTER TABLE "DisplayDevice" DROP COLUMN "displayScreenId";
  END IF;
END $$;

DO $$
BEGIN
  IF EXISTS (SELECT 1 FROM pg_type WHERE typname = 'DisplayScreenOrientation') THEN
    ALTER TYPE "DisplayScreenOrientation" RENAME TO "DisplayOrientation";
  END IF;
END $$;

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
  "updatedAt" TIMESTAMP(3) NOT NULL,
  CONSTRAINT "DisplayScreen_pkey" PRIMARY KEY ("id")
);

ALTER TABLE "DisplayScreen"
  ADD COLUMN IF NOT EXISTS "customWidth" INTEGER,
  ADD COLUMN IF NOT EXISTS "customHeight" INTEGER,
  ADD COLUMN IF NOT EXISTS "settingsJson" JSONB;

CREATE TABLE IF NOT EXISTS "DisplayPlaylist" (
  "id" TEXT NOT NULL,
  "tenantId" TEXT NOT NULL,
  "screenId" TEXT NOT NULL,
  "name" TEXT NOT NULL,
  "isActive" BOOLEAN NOT NULL DEFAULT true,
  "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updatedAt" TIMESTAMP(3) NOT NULL,
  CONSTRAINT "DisplayPlaylist_pkey" PRIMARY KEY ("id")
);

ALTER TABLE "DisplayPlaylist"
  ADD COLUMN IF NOT EXISTS "settingsJson" JSONB;

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
  "updatedAt" TIMESTAMP(3) NOT NULL,
  CONSTRAINT "DisplayPlaylistItem_pkey" PRIMARY KEY ("id")
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

CREATE INDEX IF NOT EXISTS "DisplayScreen_tenantId_isActive_idx" ON "DisplayScreen"("tenantId", "isActive");
CREATE INDEX IF NOT EXISTS "DisplayScreen_tenantId_name_idx" ON "DisplayScreen"("tenantId", "name");
CREATE INDEX IF NOT EXISTS "DisplayPlaylist_tenantId_isActive_idx" ON "DisplayPlaylist"("tenantId", "isActive");
CREATE INDEX IF NOT EXISTS "DisplayPlaylist_screenId_isActive_idx" ON "DisplayPlaylist"("screenId", "isActive");
CREATE INDEX IF NOT EXISTS "DisplayPlaylistItem_playlistId_sortOrder_idx" ON "DisplayPlaylistItem"("playlistId", "sortOrder");
CREATE INDEX IF NOT EXISTS "DisplayHeartbeatLog_deviceId_createdAt_idx" ON "DisplayHeartbeatLog"("deviceId", "createdAt");
CREATE INDEX IF NOT EXISTS "DisplayHeartbeatLog_tenantId_createdAt_idx" ON "DisplayHeartbeatLog"("tenantId", "createdAt");

ALTER TABLE "DisplayScreen" ADD CONSTRAINT "DisplayScreen_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "DisplayPlaylist" ADD CONSTRAINT "DisplayPlaylist_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "DisplayPlaylist" ADD CONSTRAINT "DisplayPlaylist_screenId_fkey" FOREIGN KEY ("screenId") REFERENCES "DisplayScreen"("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "DisplayPlaylistItem" ADD CONSTRAINT "DisplayPlaylistItem_playlistId_fkey" FOREIGN KEY ("playlistId") REFERENCES "DisplayPlaylist"("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "DisplayHeartbeatLog" ADD CONSTRAINT "DisplayHeartbeatLog_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "DisplayHeartbeatLog" ADD CONSTRAINT "DisplayHeartbeatLog_deviceId_fkey" FOREIGN KEY ("deviceId") REFERENCES "DisplayDevice"("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "DisplayDevice" ADD CONSTRAINT "DisplayDevice_screenId_fkey" FOREIGN KEY ("screenId") REFERENCES "DisplayScreen"("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "DisplayPairingSession" ADD CONSTRAINT "DisplayPairingSession_screenId_fkey" FOREIGN KEY ("screenId") REFERENCES "DisplayScreen"("id") ON DELETE SET NULL ON UPDATE CASCADE;
