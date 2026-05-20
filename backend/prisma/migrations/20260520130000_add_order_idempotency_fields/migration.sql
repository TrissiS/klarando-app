-- Add offline-order idempotency identifiers to Order
ALTER TABLE "Order"
  ADD COLUMN "terminalDeviceId" TEXT,
  ADD COLUMN "clientOrderId" TEXT,
  ADD COLUMN "idempotencyKey" TEXT;

CREATE UNIQUE INDEX "Order_tenantId_clientOrderId_key" ON "Order"("tenantId", "clientOrderId");
CREATE UNIQUE INDEX "Order_tenantId_idempotencyKey_key" ON "Order"("tenantId", "idempotencyKey");
CREATE INDEX "Order_tenantId_terminalDeviceId_createdAt_idx" ON "Order"("tenantId", "terminalDeviceId", "createdAt");
