import path from 'path'
import dotenv from 'dotenv'
import { prisma } from '../src/lib/prisma'

dotenv.config({ path: path.resolve(__dirname, '../.env') })
dotenv.config({ path: path.resolve(__dirname, '../../.env.local') })

const BASE_INGREDIENTS = [
  {
    name: 'Drehspiessfleisch',
    category: 'FOOD' as const,
    unit: 'kg',
    recipeUnit: 'g',
    gramsPerPurchaseUnit: 1000,
    purchasePrice: 16.5,
    allergens: null,
  },
  {
    name: 'Fladenbrot',
    category: 'FOOD' as const,
    unit: 'Stueck',
    recipeUnit: 'Stueck',
    gramsPerPurchaseUnit: null,
    purchasePrice: 0.75,
    allergens: 'A',
  },
  {
    name: 'Salatmix',
    category: 'FOOD' as const,
    unit: 'kg',
    recipeUnit: 'g',
    gramsPerPurchaseUnit: 1000,
    purchasePrice: 4.2,
    allergens: null,
  },
  {
    name: 'Sauce Haus',
    category: 'FOOD' as const,
    unit: 'kg',
    recipeUnit: 'g',
    gramsPerPurchaseUnit: 1000,
    purchasePrice: 6.8,
    allergens: 'C,G,J',
  },
  {
    name: 'Pappschale klein',
    category: 'PACKAGING' as const,
    unit: 'Stueck',
    recipeUnit: 'Stueck',
    gramsPerPurchaseUnit: null,
    purchasePrice: 0.08,
    allergens: null,
  },
]

async function run() {
  const [tenants, ingredientCounts] = await Promise.all([
    prisma.tenant.findMany({
      select: {
        id: true,
        name: true,
        _count: {
          select: {
            products: true,
          },
        },
      },
      orderBy: [{ name: 'asc' }],
    }),
    prisma.ingredient.groupBy({
      by: ['tenantId'],
      _count: { _all: true },
    }),
  ])

  const ingredientCountByTenant = new Map(
    ingredientCounts.map((entry) => [entry.tenantId, entry._count._all])
  )

  let updated = 0
  for (const tenant of tenants) {
    const productCount = tenant._count.products
    const ingredientCount = ingredientCountByTenant.get(tenant.id) || 0

    if (productCount === 0 || ingredientCount > 0) {
      continue
    }

    for (const ingredient of BASE_INGREDIENTS) {
      await prisma.ingredient.create({
        data: {
          tenantId: tenant.id,
          name: ingredient.name,
          category: ingredient.category,
          unit: ingredient.unit,
          recipeUnit: ingredient.recipeUnit,
          gramsPerPurchaseUnit: ingredient.gramsPerPurchaseUnit,
          purchasePrice: ingredient.purchasePrice,
          deposit: 0,
          allergens: ingredient.allergens,
          supplier: 'Klarando Standard',
          articleNumber: `STD-${ingredient.name.toUpperCase().replace(/[^A-Z0-9]+/g, '-')}`,
        },
      })
    }

    updated += 1
    console.log(`Basis-Zutaten angelegt fuer: ${tenant.name} (${tenant.id})`)
  }

  console.log('')
  console.log(`Fertig. Filialen aktualisiert: ${updated}`)
}

run()
  .catch((error) => {
    console.error('Basis-Zutaten-Provision fehlgeschlagen:', error)
    process.exitCode = 1
  })
  .finally(async () => {
    await prisma.$disconnect()
  })
