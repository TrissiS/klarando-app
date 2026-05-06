-- AlterTable
ALTER TABLE "ScreenSetting"
ADD COLUMN "productSortMode" TEXT NOT NULL DEFAULT 'CUSTOM',
ADD COLUMN "showCategoryHeaders" BOOLEAN NOT NULL DEFAULT false;
