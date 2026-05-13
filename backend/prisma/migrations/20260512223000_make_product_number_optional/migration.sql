-- Artikelnummern optional machen (Templates + Produkte)
ALTER TABLE "BusinessTemplateProduct"
  ALTER COLUMN "productNumber" DROP NOT NULL;

ALTER TABLE "Product"
  ALTER COLUMN "productNumber" DROP NOT NULL;

-- Leere Strings auf NULL normalisieren
UPDATE "BusinessTemplateProduct"
SET "productNumber" = NULL
WHERE trim(coalesce("productNumber", '')) = '';

UPDATE "Product"
SET "productNumber" = NULL
WHERE trim(coalesce("productNumber", '')) = '';

-- Alte Eindeutigkeit entfernen (war templateId + productNumber)
DROP INDEX IF EXISTS "BusinessTemplateProduct_templateId_productNumber_key";

-- Neue Template-Eindeutigkeit über inhaltliche Identität
CREATE UNIQUE INDEX IF NOT EXISTS "BusinessTemplateProduct_templateId_name_categoryId_key"
  ON "BusinessTemplateProduct"("templateId", "name", "categoryId");

-- Artikelnummern pro Filiale eindeutig, aber nur wenn gesetzt
CREATE UNIQUE INDEX IF NOT EXISTS "Product_tenantId_productNumber_key"
  ON "Product"("tenantId", "productNumber");
