-- AlterTable
ALTER TABLE "OrderDisplay"
ADD COLUMN "autoScaleLayout" BOOLEAN NOT NULL DEFAULT true;

-- AlterTable
ALTER TABLE "OrderTerminal"
ADD COLUMN "customerAccentColor" TEXT NOT NULL DEFAULT '#ea580c',
ADD COLUMN "customerBgFromColor" TEXT NOT NULL DEFAULT '#ffedd5',
ADD COLUMN "customerBgToColor" TEXT NOT NULL DEFAULT '#f8fafc',
ADD COLUMN "customerCardColor" TEXT NOT NULL DEFAULT '#ffffff',
ADD COLUMN "autoScaleLayout" BOOLEAN NOT NULL DEFAULT true;
