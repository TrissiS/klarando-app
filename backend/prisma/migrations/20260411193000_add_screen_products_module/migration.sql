-- CreateTable
CREATE TABLE "ScreenSetting" (
  "id" TEXT NOT NULL,
  "tenantId" TEXT NOT NULL,
  "title" TEXT NOT NULL DEFAULT 'Klarando Menu',
  "subtitle" TEXT,
  "backgroundMode" TEXT NOT NULL DEFAULT 'COLOR',
  "backgroundValue" TEXT,
  "backgroundMediaUrl" TEXT,
  "overlayAnimation" TEXT NOT NULL DEFAULT 'NONE',
  "cardStyle" TEXT NOT NULL DEFAULT 'SOFT',
  "accentColor" TEXT NOT NULL DEFAULT '#ea580c',
  "textColor" TEXT NOT NULL DEFAULT '#ffffff',
  "showAllergens" BOOLEAN NOT NULL DEFAULT true,
  "showPrices" BOOLEAN NOT NULL DEFAULT true,
  "showUnavailable" BOOLEAN NOT NULL DEFAULT false,
  "offerWindowEnabled" BOOLEAN NOT NULL DEFAULT false,
  "offerWindowTitle" TEXT,
  "offerWindowText" TEXT,
  "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updatedAt" TIMESTAMP(3) NOT NULL,

  CONSTRAINT "ScreenSetting_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ScreenProductSetting" (
  "id" TEXT NOT NULL,
  "tenantId" TEXT NOT NULL,
  "productId" TEXT NOT NULL,
  "displayCategory" TEXT,
  "sortOrder" INTEGER NOT NULL DEFAULT 0,
  "showOnScreen" BOOLEAN NOT NULL DEFAULT true,
  "isFeatured" BOOLEAN NOT NULL DEFAULT false,
  "badgeText" TEXT,
  "highlightColor" TEXT,
  "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updatedAt" TIMESTAMP(3) NOT NULL,

  CONSTRAINT "ScreenProductSetting_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "ScreenSetting_tenantId_key" ON "ScreenSetting"("tenantId");

-- CreateIndex
CREATE UNIQUE INDEX "ScreenProductSetting_productId_key" ON "ScreenProductSetting"("productId");

-- CreateIndex
CREATE INDEX "ScreenProductSetting_tenantId_showOnScreen_sortOrder_idx" ON "ScreenProductSetting"("tenantId", "showOnScreen", "sortOrder");

-- CreateIndex
CREATE INDEX "ScreenProductSetting_tenantId_displayCategory_idx" ON "ScreenProductSetting"("tenantId", "displayCategory");

-- AddForeignKey
ALTER TABLE "ScreenSetting"
ADD CONSTRAINT "ScreenSetting_tenantId_fkey"
FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id")
ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ScreenProductSetting"
ADD CONSTRAINT "ScreenProductSetting_tenantId_fkey"
FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id")
ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ScreenProductSetting"
ADD CONSTRAINT "ScreenProductSetting_productId_fkey"
FOREIGN KEY ("productId") REFERENCES "Product"("id")
ON DELETE CASCADE ON UPDATE CASCADE;
