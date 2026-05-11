import { Prisma } from '@prisma/client'
import { prisma } from './prisma'

type ImportBusinessTemplateInput = {
  templateId: string
  tenantId: string
}

type ImportBusinessTemplateResult = {
  templateId: string
  tenantId: string
  createdCategories: number
  createdIngredients: number
  createdProducts: number
  createdProductIngredients: number
}

function normalizeKey(value: string) {
  return value.trim().toLowerCase()
}

function toAllergenCodeString(allergens: string[]) {
  if (allergens.length === 0) {
    return null
  }

  return allergens.join(',')
}

export async function importBusinessTemplateToTenant(
  input: ImportBusinessTemplateInput
): Promise<ImportBusinessTemplateResult> {
  const template = await prisma.businessTemplate.findUnique({
    where: { id: input.templateId },
    include: {
      categories: {
        orderBy: [{ sortOrder: 'asc' }, { name: 'asc' }],
      },
      ingredients: {
        orderBy: [{ name: 'asc' }],
      },
      products: {
        include: {
          ingredientLinks: true,
        },
        orderBy: [{ name: 'asc' }],
      },
    },
  })

  if (!template || !template.isActive) {
    throw new Error('Vorlage nicht gefunden oder deaktiviert')
  }

  return prisma.$transaction(async (tx) => {
    const existingCategories = await tx.category.findMany({
      where: { tenantId: input.tenantId },
      select: { id: true, name: true },
    })
    const existingIngredients = await tx.ingredient.findMany({
      where: { tenantId: input.tenantId },
      select: { id: true, name: true },
    })
    const existingProducts = await tx.product.findMany({
      where: { tenantId: input.tenantId },
      select: { id: true, name: true, productNumber: true, categoryId: true },
    })

    const categoryByName = new Map(existingCategories.map((item) => [normalizeKey(item.name), item.id]))
    const ingredientByName = new Map(existingIngredients.map((item) => [normalizeKey(item.name), item.id]))
    const productByNumber = new Map(
      existingProducts.map((item) => [normalizeKey(item.productNumber), item.id])
    )
    const productByName = new Map(existingProducts.map((item) => [normalizeKey(item.name), item.id]))

    const templateCategoryToTenantCategory = new Map<string, string>()
    const templateIngredientToTenantIngredient = new Map<string, string>()
    const templateProductToTenantProduct = new Map<string, string>()

    let createdCategories = 0
    let createdIngredients = 0
    let createdProducts = 0
    let createdProductIngredients = 0

    for (const templateCategory of template.categories) {
      const normalizedName = normalizeKey(templateCategory.name)
      let tenantCategoryId = categoryByName.get(normalizedName)

      if (!tenantCategoryId) {
        const createdCategory = await tx.category.create({
          data: {
            tenantId: input.tenantId,
            name: templateCategory.name,
            sortOrder: templateCategory.sortOrder,
          },
          select: { id: true },
        })
        tenantCategoryId = createdCategory.id
        categoryByName.set(normalizedName, tenantCategoryId)
        createdCategories += 1
      }

      templateCategoryToTenantCategory.set(templateCategory.id, tenantCategoryId)
    }

    for (const templateIngredient of template.ingredients) {
      const normalizedName = normalizeKey(templateIngredient.name)
      let tenantIngredientId = ingredientByName.get(normalizedName)

      if (!tenantIngredientId) {
        const createdIngredient = await tx.ingredient.create({
          data: {
            tenantId: input.tenantId,
            name: templateIngredient.name,
            category: templateIngredient.category,
            unit: templateIngredient.unit,
            recipeUnit: templateIngredient.recipeUnit,
            gramsPerPurchaseUnit: templateIngredient.gramsPerPurchaseUnit,
            purchasePrice: templateIngredient.purchasePrice,
            minimumStock: templateIngredient.minimumStock,
            consumptionFactorPercent: 0,
            deposit: new Prisma.Decimal('0'),
            allergens: toAllergenCodeString(templateIngredient.allergens),
            supplier: templateIngredient.supplier,
            articleNumber: templateIngredient.articleNumber,
          },
          select: { id: true },
        })
        tenantIngredientId = createdIngredient.id
        ingredientByName.set(normalizedName, tenantIngredientId)
        createdIngredients += 1
      }

      templateIngredientToTenantIngredient.set(templateIngredient.id, tenantIngredientId)
    }

    for (const templateProduct of template.products) {
      const normalizedProductNumber = normalizeKey(templateProduct.productNumber)
      const normalizedProductName = normalizeKey(templateProduct.name)
      let tenantProductId =
        productByNumber.get(normalizedProductNumber) || productByName.get(normalizedProductName)

      if (!tenantProductId) {
        const createdProduct = await tx.product.create({
          data: {
            tenantId: input.tenantId,
            categoryId: templateProduct.categoryId
              ? templateCategoryToTenantCategory.get(templateProduct.categoryId) || null
              : null,
            productNumber: templateProduct.productNumber,
            name: templateProduct.name,
            imageUrl: templateProduct.imageUrl,
            price: templateProduct.price,
            vatRate: templateProduct.vatRate,
            available: templateProduct.available,
          },
          select: { id: true },
        })
        tenantProductId = createdProduct.id
        createdProducts += 1
      }

      productByNumber.set(normalizedProductNumber, tenantProductId)
      productByName.set(normalizedProductName, tenantProductId)
      templateProductToTenantProduct.set(templateProduct.id, tenantProductId)
    }

    const tenantProductIds = Array.from(templateProductToTenantProduct.values())
    const tenantIngredientIds = Array.from(templateIngredientToTenantIngredient.values())
    const existingLinks = await tx.productIngredient.findMany({
      where: {
        productId: { in: tenantProductIds.length > 0 ? tenantProductIds : ['__never__'] },
        ingredientId: { in: tenantIngredientIds.length > 0 ? tenantIngredientIds : ['__never__'] },
      },
      select: {
        productId: true,
        ingredientId: true,
      },
    })

    const existingLinkSet = new Set(existingLinks.map((link) => `${link.productId}::${link.ingredientId}`))

    for (const templateProduct of template.products) {
      const tenantProductId = templateProductToTenantProduct.get(templateProduct.id)
      if (!tenantProductId) {
        continue
      }

      for (const templateLink of templateProduct.ingredientLinks) {
        const tenantIngredientId = templateIngredientToTenantIngredient.get(
          templateLink.templateIngredientId
        )
        if (!tenantIngredientId) {
          continue
        }

        const dedupeKey = `${tenantProductId}::${tenantIngredientId}`
        if (existingLinkSet.has(dedupeKey)) {
          continue
        }

        await tx.productIngredient.create({
          data: {
            productId: tenantProductId,
            ingredientId: tenantIngredientId,
            quantity: templateLink.quantity,
          },
        })
        existingLinkSet.add(dedupeKey)
        createdProductIngredients += 1
      }
    }

    return {
      templateId: template.id,
      tenantId: input.tenantId,
      createdCategories,
      createdIngredients,
      createdProducts,
      createdProductIngredients,
    }
  })
}
