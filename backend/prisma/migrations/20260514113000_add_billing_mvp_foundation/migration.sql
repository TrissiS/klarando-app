-- CreateEnum
CREATE TYPE "InvoiceStatus" AS ENUM ('DRAFT', 'ISSUED', 'SENT', 'PAID', 'FAILED', 'CANCELLED', 'CORRECTED');

-- CreateEnum
CREATE TYPE "InvoiceRecipientType" AS ENUM ('TENANT', 'CHAIN');

-- CreateEnum
CREATE TYPE "SepaMandateStatus" AS ENUM ('PENDING', 'ACTIVE', 'REVOKED', 'EXPIRED');

-- CreateEnum
CREATE TYPE "PaymentCollectionStatus" AS ENUM ('PENDING', 'READY', 'SENT', 'PAID', 'FAILED', 'CANCELLED');

-- CreateEnum
CREATE TYPE "MailboxMessageType" AS ENUM ('INVOICE_ISSUED', 'PAYMENT_STATUS', 'GENERAL');

-- CreateTable
CREATE TABLE "BillingProfile" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT,
    "chainId" TEXT,
    "companyName" TEXT NOT NULL,
    "contactEmail" TEXT,
    "vatId" TEXT,
    "street" TEXT,
    "zipCode" TEXT,
    "city" TEXT,
    "countryCode" TEXT NOT NULL DEFAULT 'DE',
    "invoiceEmail" TEXT,
    "billingCycleDay" INTEGER NOT NULL DEFAULT 1,
    "sepaPreNotificationDays" INTEGER NOT NULL DEFAULT 5,
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "BillingProfile_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "InvoiceSequence" (
    "id" TEXT NOT NULL,
    "scopeKey" TEXT NOT NULL,
    "prefix" TEXT NOT NULL DEFAULT 'KLR',
    "lastNumber" INTEGER NOT NULL DEFAULT 0,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "InvoiceSequence_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BillingRun" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT,
    "chainId" TEXT,
    "periodStart" TIMESTAMP(3) NOT NULL,
    "periodEnd" TIMESTAMP(3) NOT NULL,
    "status" "InvoiceStatus" NOT NULL DEFAULT 'DRAFT',
    "finalizedAt" TIMESTAMP(3),
    "finalizedByUserId" TEXT,
    "warningCount" INTEGER NOT NULL DEFAULT 0,
    "warningsJson" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "BillingRun_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Invoice" (
    "id" TEXT NOT NULL,
    "invoiceNumber" TEXT NOT NULL,
    "tenantId" TEXT,
    "chainId" TEXT,
    "billingProfileId" TEXT,
    "billingRunId" TEXT,
    "recipientType" "InvoiceRecipientType" NOT NULL,
    "status" "InvoiceStatus" NOT NULL DEFAULT 'DRAFT',
    "currency" TEXT NOT NULL DEFAULT 'EUR',
    "periodStart" TIMESTAMP(3) NOT NULL,
    "periodEnd" TIMESTAMP(3) NOT NULL,
    "issuedAt" TIMESTAMP(3),
    "sentAt" TIMESTAMP(3),
    "paidAt" TIMESTAMP(3),
    "failedAt" TIMESTAMP(3),
    "cancelledAt" TIMESTAMP(3),
    "correctedAt" TIMESTAMP(3),
    "dueAt" TIMESTAMP(3),
    "subTotalCents" INTEGER NOT NULL DEFAULT 0,
    "taxTotalCents" INTEGER NOT NULL DEFAULT 0,
    "totalGrossCents" INTEGER NOT NULL DEFAULT 0,
    "openAmountCents" INTEGER NOT NULL DEFAULT 0,
    "correctionOfInvoiceId" TEXT,
    "pdfStoragePath" TEXT,
    "notes" TEXT,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Invoice_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "InvoiceItem" (
    "id" TEXT NOT NULL,
    "invoiceId" TEXT NOT NULL,
    "lineNo" INTEGER NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT,
    "quantity" DECIMAL(12,3) NOT NULL DEFAULT 1,
    "unitPriceCents" INTEGER NOT NULL DEFAULT 0,
    "taxRatePercent" DECIMAL(5,2) NOT NULL DEFAULT 19,
    "netAmountCents" INTEGER NOT NULL DEFAULT 0,
    "taxAmountCents" INTEGER NOT NULL DEFAULT 0,
    "grossAmountCents" INTEGER NOT NULL DEFAULT 0,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "InvoiceItem_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SepaMandate" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT,
    "chainId" TEXT,
    "billingProfileId" TEXT,
    "mandateReference" TEXT NOT NULL,
    "accountHolderName" TEXT NOT NULL,
    "ibanLast4" TEXT NOT NULL,
    "bic" TEXT,
    "signedAt" TIMESTAMP(3),
    "validFrom" TIMESTAMP(3),
    "revokedAt" TIMESTAMP(3),
    "status" "SepaMandateStatus" NOT NULL DEFAULT 'PENDING',
    "preNotificationEmail" TEXT,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "SepaMandate_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PaymentCollection" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT,
    "chainId" TEXT,
    "invoiceId" TEXT,
    "sepaMandateId" TEXT,
    "status" "PaymentCollectionStatus" NOT NULL DEFAULT 'PENDING',
    "amountCents" INTEGER NOT NULL,
    "currency" TEXT NOT NULL DEFAULT 'EUR',
    "dueAt" TIMESTAMP(3),
    "collectedAt" TIMESTAMP(3),
    "failedAt" TIMESTAMP(3),
    "failureReason" TEXT,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PaymentCollection_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "KlarandoMailboxMessage" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT,
    "chainId" TEXT,
    "invoiceId" TEXT,
    "messageType" "MailboxMessageType" NOT NULL DEFAULT 'GENERAL',
    "title" TEXT NOT NULL,
    "body" TEXT NOT NULL,
    "status" "InvoiceStatus",
    "readAt" TIMESTAMP(3),
    "actionUrl" TEXT,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "KlarandoMailboxMessage_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "BillingProfile_tenantId_key" ON "BillingProfile"("tenantId");

-- CreateIndex
CREATE UNIQUE INDEX "BillingProfile_chainId_key" ON "BillingProfile"("chainId");

-- CreateIndex
CREATE INDEX "BillingProfile_tenantId_idx" ON "BillingProfile"("tenantId");

-- CreateIndex
CREATE INDEX "BillingProfile_chainId_idx" ON "BillingProfile"("chainId");

-- CreateIndex
CREATE UNIQUE INDEX "InvoiceSequence_scopeKey_key" ON "InvoiceSequence"("scopeKey");

-- CreateIndex
CREATE INDEX "BillingRun_tenantId_periodStart_periodEnd_idx" ON "BillingRun"("tenantId", "periodStart", "periodEnd");

-- CreateIndex
CREATE INDEX "BillingRun_chainId_periodStart_periodEnd_idx" ON "BillingRun"("chainId", "periodStart", "periodEnd");

-- CreateIndex
CREATE INDEX "BillingRun_status_createdAt_idx" ON "BillingRun"("status", "createdAt");

-- CreateIndex
CREATE UNIQUE INDEX "Invoice_invoiceNumber_key" ON "Invoice"("invoiceNumber");

-- CreateIndex
CREATE INDEX "Invoice_tenantId_createdAt_idx" ON "Invoice"("tenantId", "createdAt");

-- CreateIndex
CREATE INDEX "Invoice_chainId_createdAt_idx" ON "Invoice"("chainId", "createdAt");

-- CreateIndex
CREATE INDEX "Invoice_status_createdAt_idx" ON "Invoice"("status", "createdAt");

-- CreateIndex
CREATE UNIQUE INDEX "InvoiceItem_invoiceId_lineNo_key" ON "InvoiceItem"("invoiceId", "lineNo");

-- CreateIndex
CREATE INDEX "InvoiceItem_invoiceId_idx" ON "InvoiceItem"("invoiceId");

-- CreateIndex
CREATE UNIQUE INDEX "SepaMandate_mandateReference_key" ON "SepaMandate"("mandateReference");

-- CreateIndex
CREATE INDEX "SepaMandate_tenantId_status_idx" ON "SepaMandate"("tenantId", "status");

-- CreateIndex
CREATE INDEX "SepaMandate_chainId_status_idx" ON "SepaMandate"("chainId", "status");

-- CreateIndex
CREATE INDEX "PaymentCollection_tenantId_status_dueAt_idx" ON "PaymentCollection"("tenantId", "status", "dueAt");

-- CreateIndex
CREATE INDEX "PaymentCollection_chainId_status_dueAt_idx" ON "PaymentCollection"("chainId", "status", "dueAt");

-- CreateIndex
CREATE INDEX "KlarandoMailboxMessage_tenantId_createdAt_idx" ON "KlarandoMailboxMessage"("tenantId", "createdAt");

-- CreateIndex
CREATE INDEX "KlarandoMailboxMessage_chainId_createdAt_idx" ON "KlarandoMailboxMessage"("chainId", "createdAt");

-- CreateIndex
CREATE INDEX "KlarandoMailboxMessage_invoiceId_idx" ON "KlarandoMailboxMessage"("invoiceId");

-- AddForeignKey
ALTER TABLE "BillingProfile" ADD CONSTRAINT "BillingProfile_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BillingProfile" ADD CONSTRAINT "BillingProfile_chainId_fkey" FOREIGN KEY ("chainId") REFERENCES "Chain"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BillingRun" ADD CONSTRAINT "BillingRun_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BillingRun" ADD CONSTRAINT "BillingRun_chainId_fkey" FOREIGN KEY ("chainId") REFERENCES "Chain"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BillingRun" ADD CONSTRAINT "BillingRun_finalizedByUserId_fkey" FOREIGN KEY ("finalizedByUserId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Invoice" ADD CONSTRAINT "Invoice_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Invoice" ADD CONSTRAINT "Invoice_chainId_fkey" FOREIGN KEY ("chainId") REFERENCES "Chain"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Invoice" ADD CONSTRAINT "Invoice_billingProfileId_fkey" FOREIGN KEY ("billingProfileId") REFERENCES "BillingProfile"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Invoice" ADD CONSTRAINT "Invoice_billingRunId_fkey" FOREIGN KEY ("billingRunId") REFERENCES "BillingRun"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Invoice" ADD CONSTRAINT "Invoice_correctionOfInvoiceId_fkey" FOREIGN KEY ("correctionOfInvoiceId") REFERENCES "Invoice"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "InvoiceItem" ADD CONSTRAINT "InvoiceItem_invoiceId_fkey" FOREIGN KEY ("invoiceId") REFERENCES "Invoice"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SepaMandate" ADD CONSTRAINT "SepaMandate_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SepaMandate" ADD CONSTRAINT "SepaMandate_chainId_fkey" FOREIGN KEY ("chainId") REFERENCES "Chain"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SepaMandate" ADD CONSTRAINT "SepaMandate_billingProfileId_fkey" FOREIGN KEY ("billingProfileId") REFERENCES "BillingProfile"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PaymentCollection" ADD CONSTRAINT "PaymentCollection_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PaymentCollection" ADD CONSTRAINT "PaymentCollection_chainId_fkey" FOREIGN KEY ("chainId") REFERENCES "Chain"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PaymentCollection" ADD CONSTRAINT "PaymentCollection_invoiceId_fkey" FOREIGN KEY ("invoiceId") REFERENCES "Invoice"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PaymentCollection" ADD CONSTRAINT "PaymentCollection_sepaMandateId_fkey" FOREIGN KEY ("sepaMandateId") REFERENCES "SepaMandate"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "KlarandoMailboxMessage" ADD CONSTRAINT "KlarandoMailboxMessage_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "KlarandoMailboxMessage" ADD CONSTRAINT "KlarandoMailboxMessage_chainId_fkey" FOREIGN KEY ("chainId") REFERENCES "Chain"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "KlarandoMailboxMessage" ADD CONSTRAINT "KlarandoMailboxMessage_invoiceId_fkey" FOREIGN KEY ("invoiceId") REFERENCES "Invoice"("id") ON DELETE SET NULL ON UPDATE CASCADE;
