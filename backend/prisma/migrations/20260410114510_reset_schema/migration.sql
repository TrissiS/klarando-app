/*
  Warnings:

  - You are about to drop the column `email` on the `Tenant` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "Ingredient" DROP CONSTRAINT "Ingredient_tenantId_fkey";

-- DropForeignKey
ALTER TABLE "ProductIngredient" DROP CONSTRAINT "ProductIngredient_ingredientId_fkey";

-- DropIndex
DROP INDEX "Tenant_email_key";

-- AlterTable
ALTER TABLE "Category" ALTER COLUMN "sortOrder" DROP DEFAULT;

-- AlterTable
ALTER TABLE "Order" ALTER COLUMN "status" DROP DEFAULT;

-- AlterTable
ALTER TABLE "Product" ADD COLUMN     "available" BOOLEAN NOT NULL DEFAULT true;

-- AlterTable
ALTER TABLE "Tenant" DROP COLUMN "email";
