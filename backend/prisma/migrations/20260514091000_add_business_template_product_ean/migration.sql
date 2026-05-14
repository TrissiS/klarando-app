-- Add optional EAN to business template products
ALTER TABLE "BusinessTemplateProduct"
ADD COLUMN IF NOT EXISTS "ean" TEXT;

