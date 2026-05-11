#!/usr/bin/env node
/* eslint-disable no-console */
const { PrismaClient } = require('@prisma/client')

const prisma = new PrismaClient()

const TEMPLATE_TYPES = [
  { type: 'DONER_KEBAP', key: 'doner-kebap', name: 'Doener / Kebap' },
  { type: 'PIZZERIA', key: 'pizzeria', name: 'Pizzeria' },
  { type: 'BURGER_SMASHBURGER', key: 'burger-smashburger', name: 'Burger / Smashburger' },
  { type: 'GRILL_IMBISS', key: 'grill-imbiss', name: 'Grill / Imbiss' },
  { type: 'ASIAN', key: 'asiatisch', name: 'Asiatisch' },
  { type: 'CAFE_BAKERY', key: 'cafe-baeckerei', name: 'Cafe / Baeckerei' },
  { type: 'BEVERAGE_DELIVERY', key: 'getraenkelieferdienst', name: 'Getraenkelieferdienst' },
  { type: 'KIOSK_SPATI', key: 'kiosk-spaeti', name: 'Kiosk / Spaeti' },
  { type: 'RESTAURANT_GENERAL', key: 'restaurant-allgemein', name: 'Restaurant allgemein' },
  { type: 'STEAKHOUSE_GRILLHOUSE', key: 'steakhouse-grillhaus', name: 'Steakhouse / Grillhaus' },
  { type: 'SUSHI', key: 'sushi', name: 'Sushi' },
  { type: 'VEGAN_HEALTHY', key: 'vegan-healthy-food', name: 'Vegan / Healthy Food' },
  { type: 'FOODTRUCK', key: 'foodtruck', name: 'Foodtruck' },
  { type: 'ICECREAM_DESSERT', key: 'eisdiele-dessert', name: 'Eisdiele / Dessert' },
  { type: 'BAR_LOUNGE', key: 'bar-lounge', name: 'Bar / Lounge' },
]

const MVP_DATA = {
  'doner-kebap': {
    categories: [
      { name: 'Doener Klassiker', sortOrder: 1 },
      { name: 'Beilagen', sortOrder: 2 },
    ],
    ingredients: [
      { name: 'Doenerbrot', category: 'FOOD', unit: 'Stueck', purchasePrice: '0.50', allergens: ['A'] },
      { name: 'Kalbfleisch', category: 'FOOD', unit: 'kg', purchasePrice: '11.50', allergens: [] },
      { name: 'Salatmix', category: 'FOOD', unit: 'kg', purchasePrice: '3.20', allergens: [] },
      { name: 'Joghurt-Sauce', category: 'FOOD', unit: 'kg', purchasePrice: '4.10', allergens: ['G'] },
    ],
    products: [
      {
        productNumber: 'D-100',
        name: 'Doener Kalb',
        category: 'Doener Klassiker',
        price: '8.90',
        ingredients: [
          { name: 'Doenerbrot', quantity: '1.000' },
          { name: 'Kalbfleisch', quantity: '0.180' },
          { name: 'Salatmix', quantity: '0.070' },
          { name: 'Joghurt-Sauce', quantity: '0.040' },
        ],
      },
    ],
  },
  pizzeria: {
    categories: [
      { name: 'Pizza', sortOrder: 1 },
      { name: 'Pasta', sortOrder: 2 },
    ],
    ingredients: [
      { name: 'Pizzateig', category: 'FOOD', unit: 'Stueck', purchasePrice: '0.85', allergens: ['A'] },
      { name: 'Tomatensauce', category: 'FOOD', unit: 'kg', purchasePrice: '2.40', allergens: [] },
      { name: 'Mozzarella', category: 'FOOD', unit: 'kg', purchasePrice: '5.60', allergens: ['G'] },
      { name: 'Salami', category: 'FOOD', unit: 'kg', purchasePrice: '8.40', allergens: [] },
    ],
    products: [
      {
        productNumber: 'P-100',
        name: 'Pizza Salami',
        category: 'Pizza',
        price: '10.50',
        ingredients: [
          { name: 'Pizzateig', quantity: '1.000' },
          { name: 'Tomatensauce', quantity: '0.120' },
          { name: 'Mozzarella', quantity: '0.130' },
          { name: 'Salami', quantity: '0.090' },
        ],
      },
    ],
  },
  'burger-smashburger': {
    categories: [
      { name: 'Burger', sortOrder: 1 },
      { name: 'Sides', sortOrder: 2 },
    ],
    ingredients: [
      { name: 'Brioche Bun', category: 'FOOD', unit: 'Stueck', purchasePrice: '0.60', allergens: ['A'] },
      { name: 'Rindfleisch Patty', category: 'FOOD', unit: 'kg', purchasePrice: '10.80', allergens: [] },
      { name: 'Cheddar', category: 'FOOD', unit: 'kg', purchasePrice: '6.30', allergens: ['G'] },
      { name: 'Essiggurke', category: 'FOOD', unit: 'kg', purchasePrice: '3.00', allergens: [] },
    ],
    products: [
      {
        productNumber: 'B-100',
        name: 'Smashburger Classic',
        category: 'Burger',
        price: '11.90',
        ingredients: [
          { name: 'Brioche Bun', quantity: '1.000' },
          { name: 'Rindfleisch Patty', quantity: '0.180' },
          { name: 'Cheddar', quantity: '0.040' },
          { name: 'Essiggurke', quantity: '0.020' },
        ],
      },
    ],
  },
  'grill-imbiss': {
    categories: [
      { name: 'Grill', sortOrder: 1 },
      { name: 'Snacks', sortOrder: 2 },
    ],
    ingredients: [
      { name: 'Bratwurst', category: 'FOOD', unit: 'Stueck', purchasePrice: '1.10', allergens: [] },
      { name: 'Pommes roh', category: 'FOOD', unit: 'kg', purchasePrice: '1.90', allergens: [] },
      { name: 'Currysauce', category: 'FOOD', unit: 'kg', purchasePrice: '3.50', allergens: [] },
      { name: 'Pommesschale', category: 'PACKAGING', unit: 'Stueck', purchasePrice: '0.08', allergens: [] },
    ],
    products: [
      {
        productNumber: 'I-100',
        name: 'Currywurst mit Pommes',
        category: 'Grill',
        price: '9.20',
        ingredients: [
          { name: 'Bratwurst', quantity: '1.000' },
          { name: 'Pommes roh', quantity: '0.220' },
          { name: 'Currysauce', quantity: '0.050' },
          { name: 'Pommesschale', quantity: '1.000' },
        ],
      },
    ],
  },
}

function isProduction() {
  return (process.env.NODE_ENV || '').toLowerCase() === 'production'
}

function assertSafetyGuards() {
  if (isProduction() && process.env.ALLOW_PRODUCTION_TEMPLATE_SEED !== 'true') {
    throw new Error(
      'Produktionsschutz aktiv. Fuer Prod-Seeding setze ALLOW_PRODUCTION_TEMPLATE_SEED=true explizit.'
    )
  }

  if (process.env.ALLOW_PRODUCTION_DB_DESTRUCTIVE_ACTIONS === 'true') {
    throw new Error(
      'Unsichere ENV erkannt (ALLOW_PRODUCTION_DB_DESTRUCTIVE_ACTIONS=true). Abbruch.'
    )
  }
}

async function upsertTemplateBase(entry, sortOrder) {
  return prisma.businessTemplate.upsert({
    where: { key: entry.key },
    update: {
      name: entry.name,
      type: entry.type,
      sortOrder,
      isActive: true,
    },
    create: {
      key: entry.key,
      type: entry.type,
      name: entry.name,
      description: `${entry.name} Basisvorlage`,
      isActive: true,
      sortOrder,
    },
  })
}

async function upsertTemplateMvpData(template) {
  const mvp = MVP_DATA[template.key]
  if (!mvp) {
    return
  }

  const categoryByName = new Map()
  for (const category of mvp.categories) {
    const row = await prisma.businessTemplateCategory.upsert({
      where: {
        templateId_name: {
          templateId: template.id,
          name: category.name,
        },
      },
      update: {
        sortOrder: category.sortOrder,
      },
      create: {
        templateId: template.id,
        name: category.name,
        sortOrder: category.sortOrder,
      },
    })
    categoryByName.set(category.name, row.id)
  }

  const ingredientByName = new Map()
  for (const ingredient of mvp.ingredients) {
    const row = await prisma.businessTemplateIngredient.upsert({
      where: {
        templateId_name: {
          templateId: template.id,
          name: ingredient.name,
        },
      },
      update: {
        category: ingredient.category,
        unit: ingredient.unit,
        purchasePrice: ingredient.purchasePrice,
        allergens: ingredient.allergens,
      },
      create: {
        templateId: template.id,
        name: ingredient.name,
        category: ingredient.category,
        unit: ingredient.unit,
        purchasePrice: ingredient.purchasePrice,
        allergens: ingredient.allergens,
      },
    })
    ingredientByName.set(ingredient.name, row.id)
  }

  for (const product of mvp.products) {
    const productRow = await prisma.businessTemplateProduct.upsert({
      where: {
        templateId_productNumber: {
          templateId: template.id,
          productNumber: product.productNumber,
        },
      },
      update: {
        name: product.name,
        categoryId: categoryByName.get(product.category) || null,
        price: product.price,
        vatRate: '7.00',
        available: true,
      },
      create: {
        templateId: template.id,
        categoryId: categoryByName.get(product.category) || null,
        productNumber: product.productNumber,
        name: product.name,
        price: product.price,
        vatRate: '7.00',
        available: true,
      },
    })

    for (const item of product.ingredients) {
      const ingredientId = ingredientByName.get(item.name)
      if (!ingredientId) {
        continue
      }

      await prisma.businessTemplateProductIngredient.upsert({
        where: {
          templateProductId_templateIngredientId: {
            templateProductId: productRow.id,
            templateIngredientId: ingredientId,
          },
        },
        update: {
          quantity: item.quantity,
        },
        create: {
          templateProductId: productRow.id,
          templateIngredientId: ingredientId,
          quantity: item.quantity,
        },
      })
    }
  }
}

async function run() {
  assertSafetyGuards()

  let index = 1
  for (const templateEntry of TEMPLATE_TYPES) {
    const template = await upsertTemplateBase(templateEntry, index)
    await upsertTemplateMvpData(template)
    index += 1
  }

  const count = await prisma.businessTemplate.count()
  console.log(`Business templates erfolgreich geprueft/angelegt: ${count}`)
}

run()
  .catch((error) => {
    console.error('TEMPLATE SEED FEHLER:', error instanceof Error ? error.message : error)
    process.exitCode = 1
  })
  .finally(async () => {
    await prisma.$disconnect()
  })
