-- Privacy center foundation
CREATE TYPE "CustomerPrivacyRequestType" AS ENUM ('EXPORT', 'DELETE', 'RECTIFICATION');
CREATE TYPE "CustomerPrivacyRequestStatus" AS ENUM ('PENDING', 'APPROVED', 'COMPLETED', 'REJECTED');
CREATE TYPE "CustomerConsentType" AS ENUM ('LOCATION_USAGE', 'DELIVERY_UPDATES', 'FAVORITE_OFFERS', 'MARKETING');
CREATE TYPE "PrivacyAuditActionType" AS ENUM ('CUSTOMER_VIEWED', 'DATA_EXPORT_CREATED', 'DELETE_REQUEST_CREATED', 'CUSTOMER_DISABLED', 'CUSTOMER_ANONYMIZED', 'CUSTOMER_HARD_DELETED', 'CONSENT_CHANGED', 'PUSH_TOKEN_DELETED');

CREATE TABLE "CustomerPrivacyRequest" (
  "id" TEXT NOT NULL,
  "customerId" TEXT NOT NULL,
  "type" "CustomerPrivacyRequestType" NOT NULL,
  "status" "CustomerPrivacyRequestStatus" NOT NULL DEFAULT 'PENDING',
  "requestedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "processedAt" TIMESTAMP(3),
  "processedByUserId" TEXT,
  "reason" TEXT,
  "metadata" JSONB,
  CONSTRAINT "CustomerPrivacyRequest_pkey" PRIMARY KEY ("id")
);

CREATE TABLE "CustomerConsent" (
  "id" TEXT NOT NULL,
  "customerId" TEXT NOT NULL,
  "consentType" "CustomerConsentType" NOT NULL,
  "granted" BOOLEAN NOT NULL DEFAULT false,
  "grantedAt" TIMESTAMP(3),
  "revokedAt" TIMESTAMP(3),
  "source" TEXT,
  "version" TEXT,
  "metadata" JSONB,
  "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updatedAt" TIMESTAMP(3) NOT NULL,
  CONSTRAINT "CustomerConsent_pkey" PRIMARY KEY ("id")
);

CREATE TABLE "PrivacyAuditLog" (
  "id" TEXT NOT NULL,
  "actorUserId" TEXT,
  "actorRole" TEXT,
  "customerId" TEXT NOT NULL,
  "actionType" "PrivacyAuditActionType" NOT NULL,
  "reason" TEXT,
  "oldStatus" TEXT,
  "newStatus" TEXT,
  "metadata" JSONB,
  "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT "PrivacyAuditLog_pkey" PRIMARY KEY ("id")
);

CREATE UNIQUE INDEX "CustomerConsent_customerId_consentType_key" ON "CustomerConsent"("customerId", "consentType");
CREATE INDEX "CustomerPrivacyRequest_customerId_requestedAt_idx" ON "CustomerPrivacyRequest"("customerId", "requestedAt");
CREATE INDEX "CustomerPrivacyRequest_status_requestedAt_idx" ON "CustomerPrivacyRequest"("status", "requestedAt");
CREATE INDEX "CustomerConsent_consentType_granted_idx" ON "CustomerConsent"("consentType", "granted");
CREATE INDEX "PrivacyAuditLog_customerId_createdAt_idx" ON "PrivacyAuditLog"("customerId", "createdAt");
CREATE INDEX "PrivacyAuditLog_actionType_createdAt_idx" ON "PrivacyAuditLog"("actionType", "createdAt");

ALTER TABLE "CustomerPrivacyRequest" ADD CONSTRAINT "CustomerPrivacyRequest_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "AppCustomerAccount"("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "CustomerPrivacyRequest" ADD CONSTRAINT "CustomerPrivacyRequest_processedByUserId_fkey" FOREIGN KEY ("processedByUserId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "CustomerConsent" ADD CONSTRAINT "CustomerConsent_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "AppCustomerAccount"("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "PrivacyAuditLog" ADD CONSTRAINT "PrivacyAuditLog_actorUserId_fkey" FOREIGN KEY ("actorUserId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "PrivacyAuditLog" ADD CONSTRAINT "PrivacyAuditLog_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "AppCustomerAccount"("id") ON DELETE CASCADE ON UPDATE CASCADE;
