-- CreateEnum
CREATE TYPE "AppAuthProvider" AS ENUM ('EMAIL', 'GOOGLE', 'FACEBOOK', 'APPLE');

-- CreateTable
CREATE TABLE "AppCustomerAuthProvider" (
    "id" TEXT NOT NULL,
    "appCustomerId" TEXT NOT NULL,
    "provider" "AppAuthProvider" NOT NULL,
    "providerUserId" TEXT NOT NULL,
    "email" TEXT,
    "emailVerified" BOOLEAN NOT NULL DEFAULT false,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "AppCustomerAuthProvider_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "AppCustomerAuthProvider_provider_providerUserId_key" ON "AppCustomerAuthProvider"("provider", "providerUserId");

-- CreateIndex
CREATE INDEX "AppCustomerAuthProvider_appCustomerId_provider_idx" ON "AppCustomerAuthProvider"("appCustomerId", "provider");

-- AddForeignKey
ALTER TABLE "AppCustomerAuthProvider" ADD CONSTRAINT "AppCustomerAuthProvider_appCustomerId_fkey" FOREIGN KEY ("appCustomerId") REFERENCES "AppCustomerAccount"("id") ON DELETE CASCADE ON UPDATE CASCADE;
