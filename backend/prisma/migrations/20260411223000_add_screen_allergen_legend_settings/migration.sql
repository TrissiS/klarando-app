-- AlterTable
ALTER TABLE "ScreenSetting"
ADD COLUMN "allergenLegendEnabled" BOOLEAN NOT NULL DEFAULT true,
ADD COLUMN "allergenLegendPosition" TEXT NOT NULL DEFAULT 'BOTTOM_RIGHT';
