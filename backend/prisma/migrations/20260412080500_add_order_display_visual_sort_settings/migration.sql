-- Add visual and sorting settings for order displays
ALTER TABLE "OrderDisplay"
ADD COLUMN "sortMode" TEXT NOT NULL DEFAULT 'PRIORITY_OLDEST',
ADD COLUMN "doneAutoHideSec" INTEGER NOT NULL DEFAULT 0,
ADD COLUMN "displayBackgroundColor" TEXT NOT NULL DEFAULT '#020617',
ADD COLUMN "orderCardBackgroundColor" TEXT NOT NULL DEFAULT '#0f172a',
ADD COLUMN "statusColorPendingPayment" TEXT NOT NULL DEFAULT '#ef4444',
ADD COLUMN "statusColorOpen" TEXT NOT NULL DEFAULT '#f97316',
ADD COLUMN "statusColorPreparing" TEXT NOT NULL DEFAULT '#3b82f6',
ADD COLUMN "statusColorDone" TEXT NOT NULL DEFAULT '#16a34a';
