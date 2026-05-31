ALTER TABLE "Order"
ADD COLUMN "publicOrderCode" TEXT;

CREATE UNIQUE INDEX "Order_publicOrderCode_key" ON "Order"("publicOrderCode");
