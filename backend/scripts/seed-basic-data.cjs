const { PrismaClient } = require('@prisma/client')

function assertSeedExecutionAllowed() {
  const nodeEnv = String(process.env.NODE_ENV || '').trim().toLowerCase()
  if (nodeEnv === 'production') {
    console.error(
      '[SEED BLOCKIERT] seed-basic-data darf in NODE_ENV=production nicht ausgefuehrt werden.'
    )
    process.exit(1)
  }
}

assertSeedExecutionAllowed()

const prisma = new PrismaClient()

const tenantIdArg = process.argv[2]
const tenantId = tenantIdArg || '32628da6-b057-4647-b27f-280c4fc3d6e7'

const categorySeed = [
  { name: 'Doener', sortOrder: 1 },
  { name: 'Dueruem', sortOrder: 2 },
  { name: 'Tellergerichte', sortOrder: 3 },
  { name: 'Boxen', sortOrder: 4 },
  { name: 'Vegetarisch', sortOrder: 5 },
  { name: 'Beilagen', sortOrder: 6 },
  { name: 'Saucen', sortOrder: 7 },
  { name: 'Getraenke', sortOrder: 8 },
]

const supplierSeed = [
  {
    name: 'FreshFood Grosshandel',
    contactName: 'Ali Demir',
    phone: '+49 30 1234560',
    email: 'bestellung@freshfood.example',
    notes: 'Standardlieferung Mo-Mi-Fr',
  },
  {
    name: 'Fleischhandel Nord',
    contactName: 'Mustafa Kaya',
    phone: '+49 40 987654',
    email: 'verkauf@fleischhandel-nord.example',
    notes: 'Kalb + Haehnchen',
  },
  {
    name: 'DrinkDepot Berlin',
    contactName: 'Lena Hoffmann',
    phone: '+49 30 556677',
    email: 'order@drinkdepot.example',
    notes: 'Getraenke und Becher',
  },
]

const ingredientSeed = [
  {
    name: 'Doenerbrot',
    unit: 'Stueck',
    purchasePrice: 0.45,
    deposit: 0,
    allergens: 'A',
    supplier: 'FreshFood Grosshandel',
    articleNumber: 'BR-1001',
    initialStock: 220,
  },
  {
    name: 'Dueruem-Fladen',
    unit: 'Stueck',
    purchasePrice: 0.55,
    deposit: 0,
    allergens: 'A',
    supplier: 'FreshFood Grosshandel',
    articleNumber: 'BR-1002',
    initialStock: 160,
  },
  {
    name: 'Kalbfleisch-Spiess',
    unit: 'kg',
    purchasePrice: 12.8,
    deposit: 0,
    allergens: '',
    supplier: 'Fleischhandel Nord',
    articleNumber: 'FL-2001',
    initialStock: 42,
  },
  {
    name: 'Haehnchen-Spiess',
    unit: 'kg',
    purchasePrice: 10.2,
    deposit: 0,
    allergens: '',
    supplier: 'Fleischhandel Nord',
    articleNumber: 'FL-2002',
    initialStock: 36,
  },
  {
    name: 'Blattsalat Mix',
    unit: 'kg',
    purchasePrice: 2.2,
    deposit: 0,
    allergens: '',
    supplier: 'FreshFood Grosshandel',
    articleNumber: 'VG-3001',
    initialStock: 28,
  },
  {
    name: 'Tomaten',
    unit: 'kg',
    purchasePrice: 2.6,
    deposit: 0,
    allergens: '',
    supplier: 'FreshFood Grosshandel',
    articleNumber: 'VG-3002',
    initialStock: 24,
  },
  {
    name: 'Rotkohl',
    unit: 'kg',
    purchasePrice: 2.0,
    deposit: 0,
    allergens: '',
    supplier: 'FreshFood Grosshandel',
    articleNumber: 'VG-3003',
    initialStock: 22,
  },
  {
    name: 'Zwiebeln',
    unit: 'kg',
    purchasePrice: 1.5,
    deposit: 0,
    allergens: '',
    supplier: 'FreshFood Grosshandel',
    articleNumber: 'VG-3004',
    initialStock: 18,
  },
  {
    name: 'Joghurtsauce',
    unit: 'kg',
    purchasePrice: 4.7,
    deposit: 0,
    allergens: 'G',
    supplier: 'FreshFood Grosshandel',
    articleNumber: 'SC-4001',
    initialStock: 14,
  },
  {
    name: 'Scharfe Sauce',
    unit: 'kg',
    purchasePrice: 4.4,
    deposit: 0,
    allergens: 'J',
    supplier: 'FreshFood Grosshandel',
    articleNumber: 'SC-4002',
    initialStock: 14,
  },
  {
    name: 'Pommes TK',
    unit: 'kg',
    purchasePrice: 2.9,
    deposit: 0,
    allergens: '',
    supplier: 'FreshFood Grosshandel',
    articleNumber: 'SI-5001',
    initialStock: 55,
  },
  {
    name: 'Cola 0,33l',
    unit: 'Stueck',
    purchasePrice: 0.62,
    deposit: 0.25,
    allergens: '2',
    supplier: 'DrinkDepot Berlin',
    articleNumber: 'DR-6001',
    initialStock: 180,
  },
]

const productSeed = [
  {
    productNumber: 'P-1001',
    name: 'Doener Kalb',
    price: 7.5,
    vatRate: 7,
    available: true,
    category: 'Doener',
    displayCategory: 'Doener',
    sortOrder: 10,
    isFeatured: true,
    badgeText: 'Top Seller',
    highlightColor: '#f97316',
  },
  {
    productNumber: 'P-1002',
    name: 'Doener Haehnchen',
    price: 7.2,
    vatRate: 7,
    available: true,
    category: 'Doener',
    displayCategory: 'Doener',
    sortOrder: 11,
    isFeatured: false,
    badgeText: null,
    highlightColor: null,
  },
  {
    productNumber: 'P-1101',
    name: 'Dueruem Kalb',
    price: 8.2,
    vatRate: 7,
    available: true,
    category: 'Dueruem',
    displayCategory: 'Dueruem',
    sortOrder: 20,
    isFeatured: false,
    badgeText: null,
    highlightColor: null,
  },
  {
    productNumber: 'P-1102',
    name: 'Dueruem Haehnchen',
    price: 7.9,
    vatRate: 7,
    available: true,
    category: 'Dueruem',
    displayCategory: 'Dueruem',
    sortOrder: 21,
    isFeatured: false,
    badgeText: null,
    highlightColor: null,
  },
  {
    productNumber: 'P-1201',
    name: 'Doener Teller Kalb',
    price: 12.5,
    vatRate: 7,
    available: true,
    category: 'Tellergerichte',
    displayCategory: 'Teller',
    sortOrder: 30,
    isFeatured: true,
    badgeText: 'Empfehlung',
    highlightColor: '#fb923c',
  },
  {
    productNumber: 'P-1301',
    name: 'Falafel im Brot',
    price: 6.8,
    vatRate: 7,
    available: true,
    category: 'Vegetarisch',
    displayCategory: 'Veggie',
    sortOrder: 40,
    isFeatured: false,
    badgeText: null,
    highlightColor: null,
  },
  {
    productNumber: 'P-2001',
    name: 'Pommes Klein',
    price: 3.2,
    vatRate: 7,
    available: true,
    category: 'Beilagen',
    displayCategory: 'Beilagen',
    sortOrder: 50,
    isFeatured: false,
    badgeText: null,
    highlightColor: null,
  },
  {
    productNumber: 'P-3001',
    name: 'Joghurtsauce Becher',
    price: 1.2,
    vatRate: 7,
    available: true,
    category: 'Saucen',
    displayCategory: 'Saucen',
    sortOrder: 60,
    isFeatured: false,
    badgeText: null,
    highlightColor: null,
  },
  {
    productNumber: 'P-3002',
    name: 'Scharfe Sauce Becher',
    price: 1.2,
    vatRate: 7,
    available: true,
    category: 'Saucen',
    displayCategory: 'Saucen',
    sortOrder: 61,
    isFeatured: false,
    badgeText: null,
    highlightColor: null,
  },
  {
    productNumber: 'P-4001',
    name: 'Cola 0,33l',
    price: 2.8,
    vatRate: 19,
    available: true,
    category: 'Getraenke',
    displayCategory: 'Getraenke',
    sortOrder: 70,
    isFeatured: false,
    badgeText: null,
    highlightColor: null,
  },
]

const productRecipes = {
  'P-1001': [
    { ingredient: 'Doenerbrot', quantity: 1.0 },
    { ingredient: 'Kalbfleisch-Spiess', quantity: 0.18 },
    { ingredient: 'Blattsalat Mix', quantity: 0.05 },
    { ingredient: 'Tomaten', quantity: 0.04 },
    { ingredient: 'Rotkohl', quantity: 0.04 },
    { ingredient: 'Zwiebeln', quantity: 0.02 },
    { ingredient: 'Joghurtsauce', quantity: 0.03 },
  ],
  'P-1002': [
    { ingredient: 'Doenerbrot', quantity: 1.0 },
    { ingredient: 'Haehnchen-Spiess', quantity: 0.18 },
    { ingredient: 'Blattsalat Mix', quantity: 0.05 },
    { ingredient: 'Tomaten', quantity: 0.04 },
    { ingredient: 'Rotkohl', quantity: 0.04 },
    { ingredient: 'Zwiebeln', quantity: 0.02 },
    { ingredient: 'Scharfe Sauce', quantity: 0.03 },
  ],
  'P-1101': [
    { ingredient: 'Dueruem-Fladen', quantity: 1.0 },
    { ingredient: 'Kalbfleisch-Spiess', quantity: 0.19 },
    { ingredient: 'Blattsalat Mix', quantity: 0.05 },
    { ingredient: 'Tomaten', quantity: 0.04 },
    { ingredient: 'Rotkohl', quantity: 0.04 },
    { ingredient: 'Zwiebeln', quantity: 0.02 },
    { ingredient: 'Joghurtsauce', quantity: 0.03 },
  ],
  'P-1102': [
    { ingredient: 'Dueruem-Fladen', quantity: 1.0 },
    { ingredient: 'Haehnchen-Spiess', quantity: 0.19 },
    { ingredient: 'Blattsalat Mix', quantity: 0.05 },
    { ingredient: 'Tomaten', quantity: 0.04 },
    { ingredient: 'Rotkohl', quantity: 0.04 },
    { ingredient: 'Zwiebeln', quantity: 0.02 },
    { ingredient: 'Scharfe Sauce', quantity: 0.03 },
  ],
  'P-1201': [
    { ingredient: 'Kalbfleisch-Spiess', quantity: 0.22 },
    { ingredient: 'Pommes TK', quantity: 0.18 },
    { ingredient: 'Blattsalat Mix', quantity: 0.06 },
    { ingredient: 'Tomaten', quantity: 0.04 },
    { ingredient: 'Rotkohl', quantity: 0.04 },
    { ingredient: 'Joghurtsauce', quantity: 0.04 },
  ],
  'P-1301': [
    { ingredient: 'Doenerbrot', quantity: 1.0 },
    { ingredient: 'Blattsalat Mix', quantity: 0.06 },
    { ingredient: 'Tomaten', quantity: 0.05 },
    { ingredient: 'Rotkohl', quantity: 0.04 },
    { ingredient: 'Zwiebeln', quantity: 0.02 },
    { ingredient: 'Joghurtsauce', quantity: 0.03 },
  ],
  'P-2001': [{ ingredient: 'Pommes TK', quantity: 0.16 }],
  'P-3001': [{ ingredient: 'Joghurtsauce', quantity: 0.05 }],
  'P-3002': [{ ingredient: 'Scharfe Sauce', quantity: 0.05 }],
  'P-4001': [{ ingredient: 'Cola 0,33l', quantity: 1.0 }],
}

async function seed() {
  const summary = {
    tenantCreated: false,
    categoriesCreated: 0,
    suppliersCreated: 0,
    ingredientsCreated: 0,
    productsCreated: 0,
    productLinksCreated: 0,
    stockEntriesCreated: 0,
    screenDevicesCreated: 0,
  }

  const tenant = await prisma.tenant.findUnique({ where: { id: tenantId } })
  if (!tenant) {
    await prisma.tenant.create({
      data: {
        id: tenantId,
        name: 'Klarando Demo Standort',
      },
    })
    summary.tenantCreated = true
  }

  for (const supplier of supplierSeed) {
    const existing = await prisma.supplier.findUnique({
      where: {
        tenantId_name: {
          tenantId,
          name: supplier.name,
        },
      },
      select: { id: true },
    })

    if (!existing) {
      await prisma.supplier.create({
        data: {
          tenantId,
          name: supplier.name,
          contactName: supplier.contactName,
          phone: supplier.phone,
          email: supplier.email,
          notes: supplier.notes,
        },
      })
      summary.suppliersCreated += 1
    }
  }

  const categoryByName = new Map()
  const existingCategories = await prisma.category.findMany({
    where: { tenantId },
    select: { id: true, name: true },
  })
  for (const category of existingCategories) {
    categoryByName.set(category.name, category.id)
  }

  for (const category of categorySeed) {
    if (!categoryByName.has(category.name)) {
      const created = await prisma.category.create({
        data: {
          tenantId,
          name: category.name,
          sortOrder: category.sortOrder,
        },
      })
      categoryByName.set(created.name, created.id)
      summary.categoriesCreated += 1
    }
  }

  const ingredientByName = new Map()
  const existingIngredients = await prisma.ingredient.findMany({
    where: { tenantId },
    select: { id: true, name: true },
  })
  for (const ingredient of existingIngredients) {
    ingredientByName.set(ingredient.name, ingredient.id)
  }

  for (const ingredient of ingredientSeed) {
    if (!ingredientByName.has(ingredient.name)) {
      const created = await prisma.ingredient.create({
        data: {
          tenantId,
          name: ingredient.name,
          unit: ingredient.unit,
          purchasePrice: ingredient.purchasePrice,
          deposit: ingredient.deposit,
          allergens: ingredient.allergens || null,
          supplier: ingredient.supplier,
          articleNumber: ingredient.articleNumber,
        },
      })
      ingredientByName.set(created.name, created.id)
      summary.ingredientsCreated += 1
    }
  }

  const productByNumber = new Map()
  const existingProducts = await prisma.product.findMany({
    where: { tenantId },
    select: { id: true, productNumber: true },
  })
  for (const product of existingProducts) {
    productByNumber.set(product.productNumber, product.id)
  }

  for (const product of productSeed) {
    if (!productByNumber.has(product.productNumber)) {
      const created = await prisma.product.create({
        data: {
          tenantId,
          categoryId: categoryByName.get(product.category) || null,
          productNumber: product.productNumber,
          name: product.name,
          price: product.price,
          vatRate: product.vatRate,
          available: product.available,
        },
      })
      productByNumber.set(created.productNumber, created.id)
      summary.productsCreated += 1
    }

    const productId = productByNumber.get(product.productNumber)
    if (productId) {
      await prisma.screenProductSetting.upsert({
        where: { productId },
        update: {
          displayCategory: product.displayCategory,
          sortOrder: product.sortOrder,
          showOnScreen: true,
          isFeatured: product.isFeatured,
          badgeText: product.badgeText,
          highlightColor: product.highlightColor,
        },
        create: {
          tenantId,
          productId,
          displayCategory: product.displayCategory,
          sortOrder: product.sortOrder,
          showOnScreen: true,
          isFeatured: product.isFeatured,
          badgeText: product.badgeText,
          highlightColor: product.highlightColor,
        },
      })
    }
  }

  for (const [productNumber, recipe] of Object.entries(productRecipes)) {
    const productId = productByNumber.get(productNumber)
    if (!productId) {
      continue
    }

    for (const entry of recipe) {
      const ingredientId = ingredientByName.get(entry.ingredient)
      if (!ingredientId) {
        continue
      }

      const existing = await prisma.productIngredient.findFirst({
        where: {
          productId,
          ingredientId,
        },
        select: { id: true },
      })

      if (!existing) {
        await prisma.productIngredient.create({
          data: {
            productId,
            ingredientId,
            quantity: entry.quantity,
          },
        })
        summary.productLinksCreated += 1
      }
    }
  }

  const stockCount = await prisma.stockMovement.count({ where: { tenantId } })
  if (stockCount === 0) {
    for (const ingredient of ingredientSeed) {
      const ingredientId = ingredientByName.get(ingredient.name)
      if (!ingredientId) {
        continue
      }

      await prisma.stockMovement.create({
        data: {
          tenantId,
          ingredientId,
          type: 'GOODS_RECEIPT',
          quantityDelta: ingredient.initialStock,
          resultingQuantity: ingredient.initialStock,
          unitCost: ingredient.purchasePrice,
          reference: 'BASIS-IMPORT',
          note: 'Initialer Lagerbestand',
        },
      })
      summary.stockEntriesCreated += 1
    }
  }

  await prisma.screenSetting.upsert({
    where: { tenantId },
    update: {},
    create: {
      tenantId,
      title: 'Klarando Menu',
      subtitle: 'Frisch. Schnell. Transparent.',
      backgroundMode: 'COLOR',
      backgroundValue: '#0f172a',
      overlayAnimation: 'NONE',
      cardStyle: 'GLASS',
      accentColor: '#ea580c',
      textColor: '#ffffff',
      showAllergens: true,
      allergenLegendEnabled: true,
      allergenLegendPosition: 'BOTTOM_RIGHT',
      showPrices: true,
      showUnavailable: false,
      offerWindowEnabled: true,
      offerWindowTitle: 'Mittagsangebot',
      offerWindowText: 'Mo-Fr 11:00-14:00: Alle Doener -10%',
    },
  })

  const existingDeviceCount = await prisma.screenDevice.count({ where: { tenantId } })
  if (existingDeviceCount === 0) {
    const devices = [
      {
        name: 'Eingang Hauptdisplay',
        deviceCode: 'KS-DEMO-01',
        location: 'Vorne Eingang',
      },
      {
        name: 'Kassenbereich Display',
        deviceCode: 'KS-DEMO-02',
        location: 'Neben Kasse',
      },
    ]

    for (const device of devices) {
      await prisma.screenDevice.create({
        data: {
          tenantId,
          name: device.name,
          deviceCode: device.deviceCode,
          location: device.location,
          isActive: true,
          orientation: 'LANDSCAPE',
          resolutionWidth: 1920,
          resolutionHeight: 1080,
          refreshIntervalSec: 30,
          showPricesOverride: null,
          showAllergensOverride: null,
          showUnavailableOverride: null,
          offerWindowEnabledOverride: null,
          backgroundMediaUrlOverride: null,
          accentColorOverride: null,
          textColorOverride: null,
          notes: 'Automatisch angelegtes Demo-Display',
        },
      })
      summary.screenDevicesCreated += 1
    }
  }

  console.log('Basisdaten erfolgreich verarbeitet.')
  console.log(`tenantId=${tenantId}`)
  console.log(JSON.stringify(summary, null, 2))
}

seed()
  .catch((error) => {
    console.error('Seed fehlgeschlagen:', error)
    process.exitCode = 1
  })
  .finally(async () => {
    await prisma.$disconnect()
  })
