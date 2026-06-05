ALTER TABLE "TenantPaymentConfig"
  ADD COLUMN IF NOT EXISTS "stripeOnboarded" BOOLEAN NOT NULL DEFAULT false,
  ADD COLUMN IF NOT EXISTS "stripeRequirementsDue" JSONB,
  ADD COLUMN IF NOT EXISTS "stripeLastStatusSyncAt" TIMESTAMP(3);
