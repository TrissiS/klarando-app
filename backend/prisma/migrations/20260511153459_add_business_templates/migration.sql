-- CreateEnum
CREATE TYPE "IngredientCategory" AS ENUM ('FOOD', 'PACKAGING');

-- CreateEnum
CREATE TYPE "BeverageContainerType" AS ENUM ('NONE', 'EINWEG', 'MEHRWEG');

-- CreateEnum
CREATE TYPE "PaymentStatus" AS ENUM ('PENDING', 'REQUIRES_ACTION', 'PROCESSING', 'SUCCEEDED', 'FAILED', 'CANCELED', 'PARTIALLY_REFUNDED', 'REFUNDED');

-- CreateEnum
CREATE TYPE "ProviderAccountStatus" AS ENUM ('PENDING', 'ACTIVE', 'RESTRICTED', 'DISABLED');

-- CreateEnum
CREATE TYPE "RefundStatus" AS ENUM ('PENDING', 'SUCCEEDED', 'FAILED', 'CANCELED');

-- CreateEnum
CREATE TYPE "DisputeStatus" AS ENUM ('OPEN', 'UNDER_REVIEW', 'WON', 'LOST', 'CLOSED');

-- CreateEnum
CREATE TYPE "BusinessTemplateType" AS ENUM ('DONER_KEBAP', 'PIZZERIA', 'BURGER_SMASHBURGER', 'GRILL_IMBISS', 'ASIAN', 'CAFE_BAKERY', 'BEVERAGE_DELIVERY', 'KIOSK_SPATI', 'RESTAURANT_GENERAL', 'STEAKHOUSE_GRILLHOUSE', 'SUSHI', 'VEGAN_HEALTHY', 'FOODTRUCK', 'ICECREAM_DESSERT', 'BAR_LOUNGE');

-- CreateEnum
CREATE TYPE "TemplateAllergenCode" AS ENUM ('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N');

-- AlterTable
ALTER TABLE "Action" ADD COLUMN     "displayAsMenu" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "hidePriceOnScreen" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "imageUrl" TEXT;

-- AlterTable
ALTER TABLE "Chain" ADD COLUMN     "payoutAccountHolder" TEXT,
ADD COLUMN     "payoutBankName" TEXT,
ADD COLUMN     "payoutBic" TEXT,
ADD COLUMN     "payoutEmail" TEXT,
ADD COLUMN     "payoutIban" TEXT,
ADD COLUMN     "payoutReference" TEXT;

-- AlterTable
ALTER TABLE "ChainAdminTenantAccess" ALTER COLUMN "updatedAt" DROP DEFAULT;

-- AlterTable
ALTER TABLE "Ingredient" ADD COLUMN     "category" "IngredientCategory" NOT NULL DEFAULT 'FOOD';

-- AlterTable
ALTER TABLE "Order" ADD COLUMN     "acceptedAt" TIMESTAMP(3),
ADD COLUMN     "appCustomerAccountId" TEXT,
ADD COLUMN     "assignedDriverId" TEXT,
ADD COLUMN     "assignedDriverName" TEXT,
ADD COLUMN     "customerAddress" TEXT,
ADD COLUMN     "customerCity" TEXT,
ADD COLUMN     "customerName" TEXT,
ADD COLUMN     "customerPhone" TEXT,
ADD COLUMN     "customerZipCode" TEXT,
ADD COLUMN     "deliveryFee" DECIMAL(10,2) NOT NULL DEFAULT 0,
ADD COLUMN     "driverAssignedAt" TIMESTAMP(3),
ADD COLUMN     "driverDepartedAt" TIMESTAMP(3),
ADD COLUMN     "estimatedMinutes" INTEGER,
ADD COLUMN     "estimatedReadyAt" TIMESTAMP(3),
ADD COLUMN     "serviceType" TEXT,
ADD COLUMN     "subtotal" DECIMAL(10,2) NOT NULL DEFAULT 0;

-- AlterTable
ALTER TABLE "Product" ADD COLUMN     "articleInfo" TEXT,
ADD COLUMN     "beverageContainerType" "BeverageContainerType" NOT NULL DEFAULT 'NONE',
ADD COLUMN     "deposit" DECIMAL(10,2) NOT NULL DEFAULT 0,
ADD COLUMN     "foodBusinessOperator" TEXT,
ADD COLUMN     "nutritionInfo" TEXT;

-- AlterTable
ALTER TABLE "ProductModifier" ALTER COLUMN "updatedAt" DROP DEFAULT;

-- AlterTable
ALTER TABLE "ScreenDevice" ADD COLUMN     "cardStyleOverride" TEXT,
ADD COLUMN     "offerMediaRotateSecOverride" INTEGER,
ADD COLUMN     "offerMediaUrlsOverride" JSONB,
ADD COLUMN     "offerWindowPositionOverride" TEXT,
ADD COLUMN     "offerWindowSizeOverride" TEXT,
ADD COLUMN     "showProductNumberOverride" BOOLEAN;

-- AlterTable
ALTER TABLE "ScreenSetting" ADD COLUMN     "categoryTextColor" TEXT NOT NULL DEFAULT '#cbd5e1',
ADD COLUMN     "defaultOrientation" TEXT NOT NULL DEFAULT 'LANDSCAPE',
ADD COLUMN     "defaultResolutionHeight" INTEGER NOT NULL DEFAULT 1080,
ADD COLUMN     "defaultResolutionWidth" INTEGER NOT NULL DEFAULT 1920,
ADD COLUMN     "ingredientTextColor" TEXT NOT NULL DEFAULT '#e2e8f0',
ADD COLUMN     "offerMediaRotateSec" INTEGER NOT NULL DEFAULT 12,
ADD COLUMN     "offerMediaUrls" JSONB,
ADD COLUMN     "offerWindowBackgroundColor" TEXT NOT NULL DEFAULT '#f97316',
ADD COLUMN     "offerWindowHeightPx" INTEGER NOT NULL DEFAULT 280,
ADD COLUMN     "offerWindowOpacity" INTEGER NOT NULL DEFAULT 28,
ADD COLUMN     "offerWindowPosition" TEXT NOT NULL DEFAULT 'RIGHT',
ADD COLUMN     "offerWindowReserveSpace" BOOLEAN NOT NULL DEFAULT true,
ADD COLUMN     "offerWindowSize" TEXT NOT NULL DEFAULT 'M',
ADD COLUMN     "offerWindowTextColor" TEXT NOT NULL DEFAULT '#ffffff',
ADD COLUMN     "offerWindowWidthPx" INTEGER NOT NULL DEFAULT 380,
ADD COLUMN     "offerWindowXPercent" INTEGER NOT NULL DEFAULT 84,
ADD COLUMN     "offerWindowYPercent" INTEGER NOT NULL DEFAULT 14,
ADD COLUMN     "pricePinnedLeft" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "priceTextColor" TEXT NOT NULL DEFAULT '#ffffff',
ADD COLUMN     "productNameColor" TEXT NOT NULL DEFAULT '#ffffff',
ADD COLUMN     "showProductNumber" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "tickerApiUrl" TEXT,
ADD COLUMN     "tickerBackgroundColor" TEXT NOT NULL DEFAULT '#111827',
ADD COLUMN     "tickerClockFontSize" INTEGER NOT NULL DEFAULT 12,
ADD COLUMN     "tickerCustomText" TEXT,
ADD COLUMN     "tickerDataSource" TEXT NOT NULL DEFAULT 'CUSTOM',
ADD COLUMN     "tickerEnabled" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "tickerFontSize" INTEGER NOT NULL DEFAULT 14,
ADD COLUMN     "tickerInsetPx" INTEGER NOT NULL DEFAULT 0,
ADD COLUMN     "tickerOffsetPx" INTEGER NOT NULL DEFAULT 0,
ADD COLUMN     "tickerPosition" TEXT NOT NULL DEFAULT 'BOTTOM',
ADD COLUMN     "tickerRefreshSec" INTEGER NOT NULL DEFAULT 180,
ADD COLUMN     "tickerShowClock" BOOLEAN NOT NULL DEFAULT true,
ADD COLUMN     "tickerTextColor" TEXT NOT NULL DEFAULT '#ffffff';

-- CreateTable
CREATE TABLE "BusinessTemplate" (
    "id" TEXT NOT NULL,
    "key" TEXT NOT NULL,
    "type" "BusinessTemplateType" NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "sortOrder" INTEGER NOT NULL DEFAULT 0,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "BusinessTemplate_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BusinessTemplateCategory" (
    "id" TEXT NOT NULL,
    "templateId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "sortOrder" INTEGER NOT NULL DEFAULT 0,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "BusinessTemplateCategory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BusinessTemplateIngredient" (
    "id" TEXT NOT NULL,
    "templateId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "category" "IngredientCategory" NOT NULL DEFAULT 'FOOD',
    "unit" TEXT NOT NULL,
    "recipeUnit" TEXT,
    "gramsPerPurchaseUnit" DECIMAL(10,3),
    "purchasePrice" DECIMAL(10,2) NOT NULL DEFAULT 0,
    "minimumStock" DECIMAL(12,3) NOT NULL DEFAULT 0,
    "allergens" "TemplateAllergenCode"[],
    "supplier" TEXT,
    "articleNumber" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "BusinessTemplateIngredient_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BusinessTemplateProduct" (
    "id" TEXT NOT NULL,
    "templateId" TEXT NOT NULL,
    "categoryId" TEXT,
    "productNumber" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "imageUrl" TEXT,
    "price" DECIMAL(10,2) NOT NULL,
    "vatRate" DECIMAL(5,2) NOT NULL DEFAULT 19.00,
    "available" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "BusinessTemplateProduct_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BusinessTemplateProductIngredient" (
    "id" TEXT NOT NULL,
    "templateProductId" TEXT NOT NULL,
    "templateIngredientId" TEXT NOT NULL,
    "quantity" DECIMAL(10,3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "BusinessTemplateProductIngredient_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CustomerProfile" (
    "id" TEXT NOT NULL,
    "chainId" TEXT,
    "tenantId" TEXT NOT NULL,
    "firstName" TEXT NOT NULL,
    "lastName" TEXT,
    "email" TEXT,
    "phone" TEXT,
    "street" TEXT,
    "zipCode" TEXT,
    "city" TEXT,
    "birthDate" DATE,
    "loyaltyCode" TEXT,
    "marketingOptIn" BOOLEAN NOT NULL DEFAULT false,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "notes" TEXT,
    "createdByUserId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CustomerProfile_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AppCustomerAccount" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "fullName" TEXT NOT NULL,
    "passwordHash" TEXT NOT NULL,
    "phone" TEXT,
    "street" TEXT,
    "zipCode" TEXT,
    "city" TEXT,
    "marketingOptIn" BOOLEAN NOT NULL DEFAULT false,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "deletionRequestedAt" TIMESTAMP(3),
    "deletionRequestNote" TEXT,
    "lastLoginAt" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "AppCustomerAccount_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TenantPaymentConfig" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "defaultProvider" "PaymentProvider" NOT NULL DEFAULT 'STRIPE',
    "commissionPercent" DECIMAL(6,3) NOT NULL DEFAULT 0,
    "fixedFeeCents" INTEGER NOT NULL DEFAULT 0,
    "paymentFeeBearer" "FeeBearer" NOT NULL DEFAULT 'TENANT',
    "allowMethodSurchargeToCustomer" BOOLEAN NOT NULL DEFAULT false,
    "methodSurchargeJson" JSONB,
    "currency" TEXT NOT NULL DEFAULT 'EUR',
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TenantPaymentConfig_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TenantProviderAccount" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "provider" "PaymentProvider" NOT NULL,
    "providerAccountId" TEXT NOT NULL,
    "status" "ProviderAccountStatus" NOT NULL DEFAULT 'PENDING',
    "onboardingCompletedAt" TIMESTAMP(3),
    "chargesEnabled" BOOLEAN NOT NULL DEFAULT false,
    "payoutsEnabled" BOOLEAN NOT NULL DEFAULT false,
    "capabilitiesJson" JSONB,
    "detailsSubmittedAt" TIMESTAMP(3),
    "disabledReason" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TenantProviderAccount_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PaymentTransaction" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "orderId" TEXT,
    "provider" "PaymentProvider" NOT NULL,
    "status" "PaymentStatus" NOT NULL DEFAULT 'PENDING',
    "providerPaymentId" TEXT,
    "providerClientSecretRef" TEXT,
    "idempotencyKey" TEXT,
    "currency" TEXT NOT NULL DEFAULT 'EUR',
    "amountCents" INTEGER NOT NULL,
    "feeAmountCents" INTEGER NOT NULL DEFAULT 0,
    "platformFeeCents" INTEGER NOT NULL DEFAULT 0,
    "providerFeeCents" INTEGER NOT NULL DEFAULT 0,
    "feeBearer" "FeeBearer" NOT NULL DEFAULT 'TENANT',
    "metadata" JSONB,
    "processedAt" TIMESTAMP(3),
    "failureCode" TEXT,
    "failureMessage" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PaymentTransaction_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PaymentWebhookEvent" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "provider" "PaymentProvider" NOT NULL,
    "providerEventId" TEXT NOT NULL,
    "eventType" TEXT NOT NULL,
    "payload" JSONB NOT NULL,
    "processed" BOOLEAN NOT NULL DEFAULT false,
    "processedAt" TIMESTAMP(3),
    "processingError" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "PaymentWebhookEvent_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PaymentRefund" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "paymentTransactionId" TEXT NOT NULL,
    "orderId" TEXT,
    "provider" "PaymentProvider" NOT NULL,
    "status" "RefundStatus" NOT NULL DEFAULT 'PENDING',
    "providerRefundId" TEXT,
    "amountCents" INTEGER NOT NULL,
    "reason" TEXT,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PaymentRefund_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PaymentDispute" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "paymentTransactionId" TEXT NOT NULL,
    "orderId" TEXT,
    "provider" "PaymentProvider" NOT NULL,
    "status" "DisputeStatus" NOT NULL DEFAULT 'OPEN',
    "providerDisputeId" TEXT,
    "amountCents" INTEGER,
    "reason" TEXT,
    "evidenceDueAt" TIMESTAMP(3),
    "resolvedAt" TIMESTAMP(3),
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PaymentDispute_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TipTransaction" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "orderId" TEXT NOT NULL,
    "customerId" TEXT NOT NULL,
    "paymentTransactionId" TEXT,
    "provider" "PaymentProvider",
    "status" "PaymentStatus" NOT NULL DEFAULT 'PENDING',
    "providerPaymentId" TEXT,
    "currency" TEXT NOT NULL DEFAULT 'EUR',
    "amountCents" INTEGER NOT NULL,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TipTransaction_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "OrderDeskPairingSession" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "displayId" TEXT NOT NULL,
    "displayCode" TEXT NOT NULL,
    "deviceAlias" TEXT,
    "createdByUserId" TEXT,
    "expiresAt" TIMESTAMP(3) NOT NULL,
    "consumedAt" TIMESTAMP(3),
    "consumedBySerial" TEXT,
    "revokedAt" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "OrderDeskPairingSession_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "OrderDeskDeviceBinding" (
    "id" TEXT NOT NULL,
    "deviceSerial" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "displayId" TEXT NOT NULL,
    "displayCode" TEXT NOT NULL,
    "deviceAlias" TEXT,
    "deviceModel" TEXT,
    "devicePlatform" TEXT,
    "appVersion" TEXT,
    "boundByUserId" TEXT,
    "boundAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "firstBoundAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "lastSeenAt" TIMESTAMP(3),
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "resetAt" TIMESTAMP(3),
    "resetByUserId" TEXT,
    "resetReason" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "OrderDeskDeviceBinding_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "BusinessTemplate_key_key" ON "BusinessTemplate"("key");

-- CreateIndex
CREATE INDEX "BusinessTemplate_type_isActive_sortOrder_idx" ON "BusinessTemplate"("type", "isActive", "sortOrder");

-- CreateIndex
CREATE INDEX "BusinessTemplateCategory_templateId_sortOrder_idx" ON "BusinessTemplateCategory"("templateId", "sortOrder");

-- CreateIndex
CREATE UNIQUE INDEX "BusinessTemplateCategory_templateId_name_key" ON "BusinessTemplateCategory"("templateId", "name");

-- CreateIndex
CREATE INDEX "BusinessTemplateIngredient_templateId_category_idx" ON "BusinessTemplateIngredient"("templateId", "category");

-- CreateIndex
CREATE UNIQUE INDEX "BusinessTemplateIngredient_templateId_name_key" ON "BusinessTemplateIngredient"("templateId", "name");

-- CreateIndex
CREATE INDEX "BusinessTemplateProduct_templateId_categoryId_idx" ON "BusinessTemplateProduct"("templateId", "categoryId");

-- CreateIndex
CREATE UNIQUE INDEX "BusinessTemplateProduct_templateId_productNumber_key" ON "BusinessTemplateProduct"("templateId", "productNumber");

-- CreateIndex
CREATE INDEX "BusinessTemplateProductIngredient_templateIngredientId_idx" ON "BusinessTemplateProductIngredient"("templateIngredientId");

-- CreateIndex
CREATE UNIQUE INDEX "BusinessTemplateProductIngredient_templateProductId_templat_key" ON "BusinessTemplateProductIngredient"("templateProductId", "templateIngredientId");

-- CreateIndex
CREATE INDEX "CustomerProfile_chainId_isActive_createdAt_idx" ON "CustomerProfile"("chainId", "isActive", "createdAt");

-- CreateIndex
CREATE INDEX "CustomerProfile_tenantId_isActive_createdAt_idx" ON "CustomerProfile"("tenantId", "isActive", "createdAt");

-- CreateIndex
CREATE INDEX "CustomerProfile_tenantId_email_idx" ON "CustomerProfile"("tenantId", "email");

-- CreateIndex
CREATE INDEX "CustomerProfile_tenantId_phone_idx" ON "CustomerProfile"("tenantId", "phone");

-- CreateIndex
CREATE UNIQUE INDEX "CustomerProfile_tenantId_loyaltyCode_key" ON "CustomerProfile"("tenantId", "loyaltyCode");

-- CreateIndex
CREATE UNIQUE INDEX "AppCustomerAccount_email_key" ON "AppCustomerAccount"("email");

-- CreateIndex
CREATE INDEX "AppCustomerAccount_isActive_createdAt_idx" ON "AppCustomerAccount"("isActive", "createdAt");

-- CreateIndex
CREATE INDEX "AppCustomerAccount_deletionRequestedAt_idx" ON "AppCustomerAccount"("deletionRequestedAt");

-- CreateIndex
CREATE UNIQUE INDEX "TenantPaymentConfig_tenantId_key" ON "TenantPaymentConfig"("tenantId");

-- CreateIndex
CREATE INDEX "TenantPaymentConfig_defaultProvider_isActive_idx" ON "TenantPaymentConfig"("defaultProvider", "isActive");

-- CreateIndex
CREATE INDEX "TenantProviderAccount_tenantId_status_idx" ON "TenantProviderAccount"("tenantId", "status");

-- CreateIndex
CREATE UNIQUE INDEX "TenantProviderAccount_provider_providerAccountId_key" ON "TenantProviderAccount"("provider", "providerAccountId");

-- CreateIndex
CREATE UNIQUE INDEX "TenantProviderAccount_tenantId_provider_key" ON "TenantProviderAccount"("tenantId", "provider");

-- CreateIndex
CREATE INDEX "PaymentTransaction_tenantId_status_createdAt_idx" ON "PaymentTransaction"("tenantId", "status", "createdAt");

-- CreateIndex
CREATE INDEX "PaymentTransaction_orderId_createdAt_idx" ON "PaymentTransaction"("orderId", "createdAt");

-- CreateIndex
CREATE INDEX "PaymentTransaction_provider_status_createdAt_idx" ON "PaymentTransaction"("provider", "status", "createdAt");

-- CreateIndex
CREATE UNIQUE INDEX "PaymentTransaction_provider_providerPaymentId_key" ON "PaymentTransaction"("provider", "providerPaymentId");

-- CreateIndex
CREATE UNIQUE INDEX "PaymentTransaction_provider_idempotencyKey_key" ON "PaymentTransaction"("provider", "idempotencyKey");

-- CreateIndex
CREATE INDEX "PaymentWebhookEvent_tenantId_createdAt_idx" ON "PaymentWebhookEvent"("tenantId", "createdAt");

-- CreateIndex
CREATE INDEX "PaymentWebhookEvent_processed_createdAt_idx" ON "PaymentWebhookEvent"("processed", "createdAt");

-- CreateIndex
CREATE UNIQUE INDEX "PaymentWebhookEvent_provider_providerEventId_key" ON "PaymentWebhookEvent"("provider", "providerEventId");

-- CreateIndex
CREATE INDEX "PaymentRefund_tenantId_status_createdAt_idx" ON "PaymentRefund"("tenantId", "status", "createdAt");

-- CreateIndex
CREATE INDEX "PaymentRefund_paymentTransactionId_createdAt_idx" ON "PaymentRefund"("paymentTransactionId", "createdAt");

-- CreateIndex
CREATE UNIQUE INDEX "PaymentRefund_provider_providerRefundId_key" ON "PaymentRefund"("provider", "providerRefundId");

-- CreateIndex
CREATE INDEX "PaymentDispute_tenantId_status_createdAt_idx" ON "PaymentDispute"("tenantId", "status", "createdAt");

-- CreateIndex
CREATE INDEX "PaymentDispute_paymentTransactionId_createdAt_idx" ON "PaymentDispute"("paymentTransactionId", "createdAt");

-- CreateIndex
CREATE UNIQUE INDEX "PaymentDispute_provider_providerDisputeId_key" ON "PaymentDispute"("provider", "providerDisputeId");

-- CreateIndex
CREATE INDEX "TipTransaction_tenantId_status_createdAt_idx" ON "TipTransaction"("tenantId", "status", "createdAt");

-- CreateIndex
CREATE INDEX "TipTransaction_orderId_createdAt_idx" ON "TipTransaction"("orderId", "createdAt");

-- CreateIndex
CREATE INDEX "TipTransaction_customerId_createdAt_idx" ON "TipTransaction"("customerId", "createdAt");

-- CreateIndex
CREATE UNIQUE INDEX "TipTransaction_provider_providerPaymentId_key" ON "TipTransaction"("provider", "providerPaymentId");

-- CreateIndex
CREATE INDEX "OrderDeskPairingSession_tenantId_createdAt_idx" ON "OrderDeskPairingSession"("tenantId", "createdAt");

-- CreateIndex
CREATE INDEX "OrderDeskPairingSession_displayId_createdAt_idx" ON "OrderDeskPairingSession"("displayId", "createdAt");

-- CreateIndex
CREATE INDEX "OrderDeskPairingSession_expiresAt_idx" ON "OrderDeskPairingSession"("expiresAt");

-- CreateIndex
CREATE INDEX "OrderDeskPairingSession_consumedAt_idx" ON "OrderDeskPairingSession"("consumedAt");

-- CreateIndex
CREATE INDEX "OrderDeskPairingSession_revokedAt_idx" ON "OrderDeskPairingSession"("revokedAt");

-- CreateIndex
CREATE UNIQUE INDEX "OrderDeskDeviceBinding_deviceSerial_key" ON "OrderDeskDeviceBinding"("deviceSerial");

-- CreateIndex
CREATE INDEX "OrderDeskDeviceBinding_tenantId_isActive_boundAt_idx" ON "OrderDeskDeviceBinding"("tenantId", "isActive", "boundAt");

-- CreateIndex
CREATE INDEX "OrderDeskDeviceBinding_displayId_isActive_boundAt_idx" ON "OrderDeskDeviceBinding"("displayId", "isActive", "boundAt");

-- CreateIndex
CREATE INDEX "OrderDeskDeviceBinding_lastSeenAt_idx" ON "OrderDeskDeviceBinding"("lastSeenAt");

-- CreateIndex
CREATE INDEX "OrderDeskDeviceBinding_resetAt_idx" ON "OrderDeskDeviceBinding"("resetAt");

-- CreateIndex
CREATE INDEX "Order_appCustomerAccountId_createdAt_idx" ON "Order"("appCustomerAccountId", "createdAt");

-- CreateIndex
CREATE INDEX "Order_assignedDriverId_status_createdAt_idx" ON "Order"("assignedDriverId", "status", "createdAt");

-- CreateIndex
CREATE INDEX "Order_acceptedAt_estimatedReadyAt_idx" ON "Order"("acceptedAt", "estimatedReadyAt");

-- AddForeignKey
ALTER TABLE "BusinessTemplateCategory" ADD CONSTRAINT "BusinessTemplateCategory_templateId_fkey" FOREIGN KEY ("templateId") REFERENCES "BusinessTemplate"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BusinessTemplateIngredient" ADD CONSTRAINT "BusinessTemplateIngredient_templateId_fkey" FOREIGN KEY ("templateId") REFERENCES "BusinessTemplate"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BusinessTemplateProduct" ADD CONSTRAINT "BusinessTemplateProduct_templateId_fkey" FOREIGN KEY ("templateId") REFERENCES "BusinessTemplate"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BusinessTemplateProduct" ADD CONSTRAINT "BusinessTemplateProduct_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "BusinessTemplateCategory"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BusinessTemplateProductIngredient" ADD CONSTRAINT "BusinessTemplateProductIngredient_templateProductId_fkey" FOREIGN KEY ("templateProductId") REFERENCES "BusinessTemplateProduct"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BusinessTemplateProductIngredient" ADD CONSTRAINT "BusinessTemplateProductIngredient_templateIngredientId_fkey" FOREIGN KEY ("templateIngredientId") REFERENCES "BusinessTemplateIngredient"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CustomerProfile" ADD CONSTRAINT "CustomerProfile_chainId_fkey" FOREIGN KEY ("chainId") REFERENCES "Chain"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CustomerProfile" ADD CONSTRAINT "CustomerProfile_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProductIngredient" ADD CONSTRAINT "ProductIngredient_ingredientId_fkey" FOREIGN KEY ("ingredientId") REFERENCES "Ingredient"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Order" ADD CONSTRAINT "Order_appCustomerAccountId_fkey" FOREIGN KEY ("appCustomerAccountId") REFERENCES "AppCustomerAccount"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Order" ADD CONSTRAINT "Order_assignedDriverId_fkey" FOREIGN KEY ("assignedDriverId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TenantPaymentConfig" ADD CONSTRAINT "TenantPaymentConfig_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TenantProviderAccount" ADD CONSTRAINT "TenantProviderAccount_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PaymentTransaction" ADD CONSTRAINT "PaymentTransaction_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PaymentTransaction" ADD CONSTRAINT "PaymentTransaction_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES "Order"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PaymentWebhookEvent" ADD CONSTRAINT "PaymentWebhookEvent_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PaymentRefund" ADD CONSTRAINT "PaymentRefund_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PaymentRefund" ADD CONSTRAINT "PaymentRefund_paymentTransactionId_fkey" FOREIGN KEY ("paymentTransactionId") REFERENCES "PaymentTransaction"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PaymentRefund" ADD CONSTRAINT "PaymentRefund_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES "Order"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PaymentDispute" ADD CONSTRAINT "PaymentDispute_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PaymentDispute" ADD CONSTRAINT "PaymentDispute_paymentTransactionId_fkey" FOREIGN KEY ("paymentTransactionId") REFERENCES "PaymentTransaction"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PaymentDispute" ADD CONSTRAINT "PaymentDispute_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES "Order"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TipTransaction" ADD CONSTRAINT "TipTransaction_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TipTransaction" ADD CONSTRAINT "TipTransaction_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES "Order"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TipTransaction" ADD CONSTRAINT "TipTransaction_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "AppCustomerAccount"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TipTransaction" ADD CONSTRAINT "TipTransaction_paymentTransactionId_fkey" FOREIGN KEY ("paymentTransactionId") REFERENCES "PaymentTransaction"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OrderDeskPairingSession" ADD CONSTRAINT "OrderDeskPairingSession_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OrderDeskPairingSession" ADD CONSTRAINT "OrderDeskPairingSession_displayId_fkey" FOREIGN KEY ("displayId") REFERENCES "OrderDisplay"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OrderDeskPairingSession" ADD CONSTRAINT "OrderDeskPairingSession_createdByUserId_fkey" FOREIGN KEY ("createdByUserId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OrderDeskDeviceBinding" ADD CONSTRAINT "OrderDeskDeviceBinding_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OrderDeskDeviceBinding" ADD CONSTRAINT "OrderDeskDeviceBinding_displayId_fkey" FOREIGN KEY ("displayId") REFERENCES "OrderDisplay"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OrderDeskDeviceBinding" ADD CONSTRAINT "OrderDeskDeviceBinding_boundByUserId_fkey" FOREIGN KEY ("boundByUserId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OrderDeskDeviceBinding" ADD CONSTRAINT "OrderDeskDeviceBinding_resetByUserId_fkey" FOREIGN KEY ("resetByUserId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;
