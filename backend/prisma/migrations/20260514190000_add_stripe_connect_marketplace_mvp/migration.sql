-- Stripe Connect marketplace MVP foundation
ALTER TABLE "TenantPaymentConfig"
  ADD COLUMN IF NOT EXISTS "stripeAccountId" TEXT,
  ADD COLUMN IF NOT EXISTS "stripeChargesEnabled" BOOLEAN NOT NULL DEFAULT false,
  ADD COLUMN IF NOT EXISTS "stripePayoutsEnabled" BOOLEAN NOT NULL DEFAULT false,
  ADD COLUMN IF NOT EXISTS "stripeOnboardingCompleted" BOOLEAN NOT NULL DEFAULT false,
  ADD COLUMN IF NOT EXISTS "stripeDetailsSubmitted" BOOLEAN NOT NULL DEFAULT false,
  ADD COLUMN IF NOT EXISTS "stripeDefaultCurrency" TEXT NOT NULL DEFAULT 'eur';

CREATE UNIQUE INDEX IF NOT EXISTS "TenantPaymentConfig_stripeAccountId_key"
  ON "TenantPaymentConfig"("stripeAccountId");

ALTER TABLE "PaymentTransaction"
  ADD COLUMN IF NOT EXISTS "stripeChargeId" TEXT,
  ADD COLUMN IF NOT EXISTS "stripeTransferId" TEXT,
  ADD COLUMN IF NOT EXISTS "stripeAccountId" TEXT;

CREATE UNIQUE INDEX IF NOT EXISTS "PaymentTransaction_provider_stripeChargeId_key"
  ON "PaymentTransaction"("provider", "stripeChargeId");

CREATE UNIQUE INDEX IF NOT EXISTS "PaymentTransaction_provider_stripeTransferId_key"
  ON "PaymentTransaction"("provider", "stripeTransferId");
