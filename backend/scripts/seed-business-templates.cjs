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
      { name: 'Doener Teller & Box', sortOrder: 2 },
      { name: 'Beilagen', sortOrder: 3 },
    ],
    ingredients: [
      { name: 'Fladenbrot', category: 'FOOD', unit: 'Stueck', purchasePrice: '0.55', allergens: ['A'] },
      { name: 'Yufkateig', category: 'FOOD', unit: 'Stueck', purchasePrice: '0.60', allergens: ['A'] },
      { name: 'Kalbfleisch', category: 'FOOD', unit: 'kg', purchasePrice: '11.50', allergens: [] },
      { name: 'Haehnchenfleisch', category: 'FOOD', unit: 'kg', purchasePrice: '10.90', allergens: [] },
      { name: 'Lahmacunbrot', category: 'FOOD', unit: 'Stueck', purchasePrice: '0.85', allergens: ['A'] },
      { name: 'Eisbergsalat', category: 'FOOD', unit: 'kg', purchasePrice: '2.20', allergens: [] },
      { name: 'Tomate', category: 'FOOD', unit: 'kg', purchasePrice: '2.80', allergens: [] },
      { name: 'Zwiebel', category: 'FOOD', unit: 'kg', purchasePrice: '1.90', allergens: [] },
      { name: 'Knoblauchsauce', category: 'FOOD', unit: 'kg', purchasePrice: '4.40', allergens: ['C', 'G'] },
      { name: 'Scharfe Sauce', category: 'FOOD', unit: 'kg', purchasePrice: '3.90', allergens: [] },
      { name: 'Schafskaese', category: 'FOOD', unit: 'kg', purchasePrice: '6.20', allergens: ['G'] },
      { name: 'Pommes', category: 'FOOD', unit: 'kg', purchasePrice: '1.90', allergens: [] },
    ],
    products: [
      {
        productNumber: 'D-100',
        name: 'Doener Kebab',
        category: 'Doener Klassiker',
        price: '8.90',
        ingredients: [
          { name: 'Fladenbrot', quantity: '1.000' },
          { name: 'Kalbfleisch', quantity: '0.180' },
          { name: 'Eisbergsalat', quantity: '0.050' },
          { name: 'Tomate', quantity: '0.030' },
          { name: 'Zwiebel', quantity: '0.020' },
          { name: 'Knoblauchsauce', quantity: '0.040' },
        ],
      },
      {
        productNumber: 'D-110',
        name: 'Dueruem Doener',
        category: 'Doener Klassiker',
        price: '9.90',
        ingredients: [
          { name: 'Yufkateig', quantity: '1.000' },
          { name: 'Haehnchenfleisch', quantity: '0.180' },
          { name: 'Eisbergsalat', quantity: '0.050' },
          { name: 'Tomate', quantity: '0.030' },
          { name: 'Zwiebel', quantity: '0.020' },
          { name: 'Knoblauchsauce', quantity: '0.040' },
        ],
      },
      {
        productNumber: 'D-120',
        name: 'Lahmacun',
        category: 'Doener Klassiker',
        price: '8.50',
        ingredients: [
          { name: 'Lahmacunbrot', quantity: '1.000' },
          { name: 'Kalbfleisch', quantity: '0.130' },
          { name: 'Eisbergsalat', quantity: '0.040' },
          { name: 'Tomate', quantity: '0.025' },
          { name: 'Zwiebel', quantity: '0.018' },
          { name: 'Scharfe Sauce', quantity: '0.030' },
        ],
      },
      {
        productNumber: 'D-130',
        name: 'Doenerteller',
        category: 'Doener Teller & Box',
        price: '12.90',
        ingredients: [
          { name: 'Kalbfleisch', quantity: '0.220' },
          { name: 'Pommes', quantity: '0.220' },
          { name: 'Eisbergsalat', quantity: '0.060' },
          { name: 'Tomate', quantity: '0.035' },
          { name: 'Knoblauchsauce', quantity: '0.040' },
        ],
      },
      {
        productNumber: 'D-140',
        name: 'Pommes',
        category: 'Beilagen',
        price: '3.80',
        ingredients: [{ name: 'Pommes', quantity: '0.220' }],
      },
    ],
  },
  pizzeria: {
    categories: [
      { name: 'Pizza Klassiker', sortOrder: 1 },
      { name: 'Pizza Spezial', sortOrder: 2 },
    ],
    ingredients: [
      { name: 'Pizzateig', category: 'FOOD', unit: 'Stueck', purchasePrice: '0.85', allergens: ['A'] },
      { name: 'Tomatensauce', category: 'FOOD', unit: 'kg', purchasePrice: '2.40', allergens: [] },
      { name: 'Kaese', category: 'FOOD', unit: 'kg', purchasePrice: '5.60', allergens: ['G'] },
      { name: 'Salami', category: 'FOOD', unit: 'kg', purchasePrice: '8.40', allergens: [] },
      { name: 'Thunfisch', category: 'FOOD', unit: 'kg', purchasePrice: '9.10', allergens: ['D'] },
      { name: 'Champignons', category: 'FOOD', unit: 'kg', purchasePrice: '4.20', allergens: [] },
    ],
    products: [
      {
        productNumber: 'P-100',
        name: 'Pizza Margherita',
        category: 'Pizza Klassiker',
        price: '8.90',
        ingredients: [
          { name: 'Pizzateig', quantity: '1.000' },
          { name: 'Tomatensauce', quantity: '0.120' },
          { name: 'Kaese', quantity: '0.130' },
        ],
      },
      {
        productNumber: 'P-110',
        name: 'Pizza Salami',
        category: 'Pizza Klassiker',
        price: '10.50',
        ingredients: [
          { name: 'Pizzateig', quantity: '1.000' },
          { name: 'Tomatensauce', quantity: '0.120' },
          { name: 'Kaese', quantity: '0.130' },
          { name: 'Salami', quantity: '0.090' },
        ],
      },
      {
        productNumber: 'P-120',
        name: 'Pizza Tonno',
        category: 'Pizza Spezial',
        price: '11.20',
        ingredients: [
          { name: 'Pizzateig', quantity: '1.000' },
          { name: 'Tomatensauce', quantity: '0.120' },
          { name: 'Kaese', quantity: '0.130' },
          { name: 'Thunfisch', quantity: '0.095' },
        ],
      },
      {
        productNumber: 'P-130',
        name: 'Pizza Funghi',
        category: 'Pizza Spezial',
        price: '10.20',
        ingredients: [
          { name: 'Pizzateig', quantity: '1.000' },
          { name: 'Tomatensauce', quantity: '0.120' },
          { name: 'Kaese', quantity: '0.130' },
          { name: 'Champignons', quantity: '0.080' },
        ],
      },
    ],
  },
  'burger-smashburger': {
    categories: [
      { name: 'Burger', sortOrder: 1 },
      { name: 'Beilagen', sortOrder: 2 },
    ],
    ingredients: [
      { name: 'Burger Bun', category: 'FOOD', unit: 'Stueck', purchasePrice: '0.62', allergens: ['A'] },
      { name: 'Rindfleisch Patty', category: 'FOOD', unit: 'kg', purchasePrice: '10.80', allergens: [] },
      { name: 'Chicken Patty', category: 'FOOD', unit: 'kg', purchasePrice: '9.70', allergens: [] },
      { name: 'Kaese', category: 'FOOD', unit: 'kg', purchasePrice: '6.30', allergens: ['G'] },
      { name: 'Essiggurke', category: 'FOOD', unit: 'kg', purchasePrice: '3.00', allergens: [] },
      { name: 'Tomate', category: 'FOOD', unit: 'kg', purchasePrice: '2.80', allergens: [] },
      { name: 'Burgersauce', category: 'FOOD', unit: 'kg', purchasePrice: '4.30', allergens: ['C', 'J'] },
      { name: 'Pommes', category: 'FOOD', unit: 'kg', purchasePrice: '1.90', allergens: [] },
    ],
    products: [
      {
        productNumber: 'B-100',
        name: 'Cheeseburger',
        category: 'Burger',
        price: '10.90',
        ingredients: [
          { name: 'Burger Bun', quantity: '1.000' },
          { name: 'Rindfleisch Patty', quantity: '0.180' },
          { name: 'Kaese', quantity: '0.040' },
          { name: 'Essiggurke', quantity: '0.020' },
          { name: 'Burgersauce', quantity: '0.030' },
        ],
      },
      {
        productNumber: 'B-110',
        name: 'Hamburger',
        category: 'Burger',
        price: '9.90',
        ingredients: [
          { name: 'Burger Bun', quantity: '1.000' },
          { name: 'Rindfleisch Patty', quantity: '0.180' },
          { name: 'Tomate', quantity: '0.020' },
          { name: 'Essiggurke', quantity: '0.020' },
          { name: 'Burgersauce', quantity: '0.030' },
        ],
      },
      {
        productNumber: 'B-120',
        name: 'Chickenburger',
        category: 'Burger',
        price: '10.40',
        ingredients: [
          { name: 'Burger Bun', quantity: '1.000' },
          { name: 'Chicken Patty', quantity: '0.180' },
          { name: 'Tomate', quantity: '0.020' },
          { name: 'Essiggurke', quantity: '0.020' },
          { name: 'Burgersauce', quantity: '0.030' },
        ],
      },
      {
        productNumber: 'B-130',
        name: 'Pommes',
        category: 'Beilagen',
        price: '3.90',
        ingredients: [{ name: 'Pommes', quantity: '0.220' }],
      },
    ],
  },
  'grill-imbiss': {
    categories: [
      { name: 'Imbiss Klassiker', sortOrder: 1 },
      { name: 'Beilagen', sortOrder: 2 },
    ],
    ingredients: [
      { name: 'Bratwurst', category: 'FOOD', unit: 'Stueck', purchasePrice: '1.10', allergens: [] },
      { name: 'Currywurst', category: 'FOOD', unit: 'Stueck', purchasePrice: '1.25', allergens: [] },
      { name: 'Schnitzel', category: 'FOOD', unit: 'Stueck', purchasePrice: '2.40', allergens: ['A'] },
      { name: 'Pommes', category: 'FOOD', unit: 'kg', purchasePrice: '1.90', allergens: [] },
      { name: 'Currysauce', category: 'FOOD', unit: 'kg', purchasePrice: '3.50', allergens: [] },
      { name: 'Panade', category: 'FOOD', unit: 'kg', purchasePrice: '2.10', allergens: ['A'] },
    ],
    products: [
      {
        productNumber: 'I-100',
        name: 'Currywurst',
        category: 'Imbiss Klassiker',
        price: '5.90',
        ingredients: [
          { name: 'Currywurst', quantity: '1.000' },
          { name: 'Currysauce', quantity: '0.050' },
        ],
      },
      {
        productNumber: 'I-110',
        name: 'Pommes',
        category: 'Beilagen',
        price: '3.50',
        ingredients: [{ name: 'Pommes', quantity: '0.220' }],
      },
      {
        productNumber: 'I-120',
        name: 'Schnitzel',
        category: 'Imbiss Klassiker',
        price: '9.90',
        ingredients: [
          { name: 'Schnitzel', quantity: '1.000' },
          { name: 'Panade', quantity: '0.040' },
        ],
      },
      {
        productNumber: 'I-130',
        name: 'Bratwurst',
        category: 'Imbiss Klassiker',
        price: '4.90',
        ingredients: [{ name: 'Bratwurst', quantity: '1.000' }],
      },
      {
        productNumber: 'I-140',
        name: 'Currywurst mit Pommes',
        category: 'Imbiss Klassiker',
        price: '9.20',
        ingredients: [
          { name: 'Currywurst', quantity: '1.000' },
          { name: 'Pommes', quantity: '0.220' },
          { name: 'Currysauce', quantity: '0.050' },
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
