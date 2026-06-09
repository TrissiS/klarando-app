import { prisma } from './prisma'
import {
  sanitizeProductBadgeKeys,
  type ProductBadgeKey,
} from './product-badges'

export async function ensureProductBadgesColumn() {
  await prisma.$executeRawUnsafe(`
    ALTER TABLE "Product"
    ADD COLUMN IF NOT EXISTS "badges" TEXT[] NOT NULL DEFAULT ARRAY[]::TEXT[];
  `)
}

export function isMissingProductBadgesColumnError(error: unknown) {
  return (
    error instanceof Error &&
    (error.message.includes('Product.badges') || error.message.includes('"badges"'))
  )
}

export async function readStoredProductBadges(productIds: string[]) {
  const ids = Array.from(new Set(productIds.filter(Boolean)))
  const output = new Map<string, ProductBadgeKey[]>()
  if (ids.length === 0) {
    return output
  }

  const rows = await prisma.$queryRawUnsafe<Array<{ id: string; badges: string[] | null }>>(
    `SELECT "id", "badges" FROM "Product" WHERE "id"::text = ANY($1::text[])`,
    ids
  )

  for (const row of rows) {
    output.set(row.id, sanitizeProductBadgeKeys(row.badges ?? []))
  }

  return output
}

export async function writeStoredProductBadges(productId: string, badges: ProductBadgeKey[]) {
  const normalized = sanitizeProductBadgeKeys(badges)
  await prisma.$executeRawUnsafe(
    `UPDATE "Product" SET "badges" = $2::text[] WHERE "id"::text = $1::text`,
    productId,
    normalized
  )
}
