-- Ensure BillingProfile.legalForm exists
ALTER TABLE "BillingProfile"
ADD COLUMN IF NOT EXISTS "legalForm" TEXT;

-- Ensure Order.tableId exists for table-ordering linkage
ALTER TABLE "Order"
ADD COLUMN IF NOT EXISTS "tableId" TEXT;

-- Ensure index for Order.tableId exists
CREATE INDEX IF NOT EXISTS "Order_tableId_createdAt_idx"
ON "Order"("tableId", "createdAt");

-- Ensure foreign key Order.tableId -> RestaurantTable.id exists
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1
    FROM pg_constraint
    WHERE conname = 'Order_tableId_fkey'
  ) THEN
    ALTER TABLE "Order"
    ADD CONSTRAINT "Order_tableId_fkey"
    FOREIGN KEY ("tableId") REFERENCES "RestaurantTable"("id")
    ON DELETE SET NULL ON UPDATE CASCADE;
  END IF;
END $$;

-- Ensure PlatformBillingSettings table exists
CREATE TABLE IF NOT EXISTS "PlatformBillingSettings" (
  "id" TEXT NOT NULL,
  "scopeKey" TEXT NOT NULL DEFAULT 'global',
  "companyName" TEXT,
  "legalForm" TEXT,
  "street" TEXT,
  "zipCode" TEXT,
  "city" TEXT,
  "countryCode" TEXT NOT NULL DEFAULT 'DE',
  "vatId" TEXT,
  "taxNumber" TEXT,
  "managingDirector" TEXT,
  "invoiceEmail" TEXT,
  "phone" TEXT,
  "website" TEXT,
  "bankName" TEXT,
  "iban" TEXT,
  "bic" TEXT,
  "sepaCreditorId" TEXT,
  "invoiceLogoUrl" TEXT,
  "standardPaymentTargetDays" INTEGER DEFAULT 14,
  "invoicePrimaryColor" TEXT,
  "invoiceAccentColor" TEXT,
  "invoiceFooter" TEXT,
  "invoicePaymentInfo" TEXT,
  "invoiceTaxNotice" TEXT,
  "invoiceEinvoiceNotice" TEXT,
  "invoiceReminderNotice" TEXT,
  "einvoiceFormatHint" TEXT,
  "paymentProviderStatus" TEXT,
  "plannedDebitAt" TIMESTAMP(3),
  "lastDebitAt" TIMESTAMP(3),
  "lastChargebackStatus" TEXT,
  "approvedBy" TEXT,
  "sentAt" TIMESTAMP(3),
  "paidAt" TIMESTAMP(3),
  "cancelledAt" TIMESTAMP(3),
  "createdBy" TEXT,
  "updatedBy" TEXT,
  "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT "PlatformBillingSettings_pkey" PRIMARY KEY ("id")
);

CREATE UNIQUE INDEX IF NOT EXISTS "PlatformBillingSettings_scopeKey_key"
ON "PlatformBillingSettings"("scopeKey");
