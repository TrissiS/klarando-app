/* eslint-disable no-console */
const { PrismaClient } = require('@prisma/client')

function assertSeedExecutionAllowed() {
  const nodeEnv = String(process.env.NODE_ENV || '').trim().toLowerCase()
  if (nodeEnv === 'production') {
    console.error(
      '[SEED BLOCKIERT] seed-test-tenants darf in NODE_ENV=production nicht ausgefuehrt werden.'
    )
    process.exit(1)
  }
}

assertSeedExecutionAllowed()

const prisma = new PrismaClient()

const WEEK_DAYS = [
  'MONDAY',
  'TUESDAY',
  'WEDNESDAY',
  'THURSDAY',
  'FRIDAY',
  'SATURDAY',
  'SUNDAY',
]

function defaultHours() {
  return WEEK_DAYS.map((day) => ({
    day,
    isClosed: false,
    open: '11:00',
    close: '22:00',
  }))
}

function defaultCustomerAppNavigation() {
  return {
    bottomTabs: [
      {
        id: 'start',
        label: 'Startseite',
        route: '/startseite',
        enabled: true,
        sortOrder: 1,
        children: [],
      },
      {
        id: 'bestellen',
        label: 'Bestellen',
        route: '/bestellen',
        enabled: true,
        sortOrder: 2,
        children: [],
      },
      {
        id: 'meine-bestellungen',
        label: 'Meine Bestellungen',
        route: '/meine-bestellungen',
        enabled: true,
        sortOrder: 3,
        children: [],
      },
      {
        id: 'profil',
        label: 'Profil',
        route: '/profil',
        enabled: true,
        sortOrder: 4,
        children: [],
      },
      {
        id: 'infos',
        label: 'Infos',
        route: '/infos',
        enabled: true,
        sortOrder: 5,
        children: [
          {
            id: 'impressum',
            label: 'Impressum',
            route: '/infos/impressum',
            enabled: true,
            sortOrder: 1,
          },
          {
            id: 'datenschutz',
            label: 'Datenschutz',
            route: '/infos/datenschutz',
            enabled: true,
            sortOrder: 2,
          },
        ],
      },
    ],
  }
}

function buildBusinessSettings({ tenantName, email, street }) {
  return {
    businessName: tenantName,
    legalName: tenantName,
    operatorName: tenantName,
    street,
    zipCode: '57223',
    city: 'Kreuztal',
    country: 'Deutschland',
    phone: '02732 123456',
    email,
    website: null,
    imprintUrl: null,
    privacyPolicyUrl: null,
    termsUrl: null,
    supportEmail: email,
    accountDeletionEmail: email,
    vatId: null,
    taxNumber: null,
    revenueId: null,
    taxOffice: null,
    deliveryFeeNote: '2,50 EUR',
    minOrderValue: '12,00 EUR',
    logoUrl: '/klarando_logo.png',
    openingHours: defaultHours(),
    holidayHours: [],
    deliveryHours: defaultHours(),
    deliveryArea: {
      enabled: true,
      strategy: 'ZIP_LIST',
      zipCodes: ['57223'],
      excludedZipCodes: [],
      excludedStreets: [],
      radiusKm: null,
      polygonPath: [],
      centerLatitude: null,
      centerLongitude: null,
      centerZipCode: '57223',
      centerCity: 'Kreuztal',
      centerStreet: street,
      notes: 'Automatisch angelegte Testdaten',
    },
    pickupArea: {
      enabled: true,
      strategy: 'ZIP_LIST',
      zipCodes: ['57223'],
      excludedZipCodes: [],
      excludedStreets: [],
      radiusKm: null,
      polygonPath: [],
      centerLatitude: null,
      centerLongitude: null,
      centerZipCode: '57223',
      centerCity: 'Kreuztal',
      centerStreet: street,
      notes: null,
    },
    customerApp: {
      listingEnabled: true,
      orderingEnabled: true,
      guestRegistrationEnabled: true,
      guestCheckoutEnabled: true,
      listingDisplay: {
        showLogo: true,
        showChainName: true,
        showAddress: true,
        showAvailabilityBadges: true,
        showMinOrderValue: true,
        showDeliveryFeeNote: true,
        showDistance: true,
      },
      navigation: defaultCustomerAppNavigation(),
    },
    notes: 'Testobjekt fuer Bestellungen',
  }
}

async function resetTenantCatalog(tenantId) {
  await prisma.productModifier.deleteMany({
    where: { tenantId },
  })
  await prisma.productIngredient.deleteMany({
    where: {
      product: {
        tenantId,
      },
    },
  })
  await prisma.product.deleteMany({
    where: { tenantId },
  })
  await prisma.category.deleteMany({
    where: { tenantId },
  })
  await prisma.ingredient.deleteMany({
    where: { tenantId },
  })
}

async function upsertTenant(chainId, tenantConfig) {
  const existing = await prisma.tenant.findFirst({
    where: {
      chainId,
      OR: [{ email: tenantConfig.email }, { name: tenantConfig.name }],
    },
    select: { id: true },
  })

  if (existing) {
    return prisma.tenant.update({
      where: { id: existing.id },
      data: {
        name: tenantConfig.name,
        email: tenantConfig.email,
        businessSettings: buildBusinessSettings({
          tenantName: tenantConfig.name,
          email: tenantConfig.email,
          street: tenantConfig.street,
        }),
      },
    })
  }

  return prisma.tenant.create({
    data: {
      chainId,
      name: tenantConfig.name,
      email: tenantConfig.email,
      businessSettings: buildBusinessSettings({
        tenantName: tenantConfig.name,
        email: tenantConfig.email,
        street: tenantConfig.street,
      }),
    },
  })
}

async function seedCatalog(tenantId, catalog) {
  await resetTenantCatalog(tenantId)

  const categoryMap = new Map()
  for (const [index, categoryName] of catalog.categories.entries()) {
    const created = await prisma.category.create({
      data: {
        tenantId,
        name: categoryName,
        sortOrder: index + 1,
      },
    })
    categoryMap.set(categoryName, created.id)
  }

  const ingredientMap = new Map()
  for (const ingredient of catalog.ingredients) {
    const created = await prisma.ingredient.create({
      data: {
        tenantId,
        name: ingredient.name,
        unit: ingredient.unit,
        recipeUnit: ingredient.recipeUnit || ingredient.unit,
        gramsPerPurchaseUnit: ingredient.gramsPerPurchaseUnit || null,
        purchasePrice: ingredient.purchasePrice,
        deposit: ingredient.deposit || 0,
        allergens: ingredient.allergens || null,
        supplier: ingredient.supplier || null,
        articleNumber: ingredient.articleNumber || null,
      },
    })
    ingredientMap.set(ingredient.name, created.id)
  }

  for (const product of catalog.products) {
    const createdProduct = await prisma.product.create({
      data: {
        tenantId,
        categoryId: categoryMap.get(product.category) || null,
        productNumber: product.productNumber,
        name: product.name,
        imageUrl: product.imageUrl,
        price: product.price,
        vatRate: 19,
        available: true,
      },
    })

    for (const relation of product.ingredients) {
      const ingredientId = ingredientMap.get(relation.name)
      if (!ingredientId) {
        continue
      }

      await prisma.productIngredient.create({
        data: {
          productId: createdProduct.id,
          ingredientId,
          quantity: relation.quantity,
        },
      })
    }
  }
}

function doenerCatalog() {
  return {
    categories: ['Doener Klassiker', 'Tuerkische Pizza', 'Beilagen', 'Getraenke'],
    ingredients: [
      { name: 'Doenerfleisch Kalb', unit: 'kg', purchasePrice: 11.9, supplier: 'Klarando Food' },
      { name: 'Doenerfleisch Haehnchen', unit: 'kg', purchasePrice: 10.8, supplier: 'Klarando Food' },
      { name: 'Doenerbrot', unit: 'Stueck', purchasePrice: 0.42, supplier: 'Baeckerei Partner' },
      { name: 'Lahmacun Teig', unit: 'Stueck', purchasePrice: 0.58, supplier: 'Baeckerei Partner' },
      { name: 'Pommes', unit: 'kg', purchasePrice: 2.4, supplier: 'Klarando TK' },
      { name: 'Salatmix', unit: 'kg', purchasePrice: 2.3, supplier: 'Frischemarkt' },
      { name: 'Tomaten', unit: 'kg', purchasePrice: 2.9, supplier: 'Frischemarkt' },
      { name: 'Zwiebeln', unit: 'kg', purchasePrice: 1.9, supplier: 'Frischemarkt' },
      { name: 'Joghurtsosse', unit: 'kg', purchasePrice: 3.8, allergens: 'G', supplier: 'Saucenwerk' },
      { name: 'Cola 0,33l', unit: 'Stueck', purchasePrice: 0.64, deposit: 0.25, supplier: 'Getraenkehandel' },
    ],
    products: [
      {
        productNumber: 'D1001',
        name: 'Doener Kalb',
        category: 'Doener Klassiker',
        price: 7.5,
        imageUrl:
          'https://images.unsplash.com/photo-1529006557810-274b9b2fc783?auto=format&fit=crop&w=1200&q=80',
        ingredients: [
          { name: 'Doenerbrot', quantity: 1 },
          { name: 'Doenerfleisch Kalb', quantity: 0.18 },
          { name: 'Salatmix', quantity: 0.06 },
          { name: 'Tomaten', quantity: 0.03 },
          { name: 'Joghurtsosse', quantity: 0.03 },
        ],
      },
      {
        productNumber: 'D1002',
        name: 'Doener Haehnchen',
        category: 'Doener Klassiker',
        price: 7.0,
        imageUrl:
          'https://images.unsplash.com/photo-1526318472351-c75fcf070305?auto=format&fit=crop&w=1200&q=80',
        ingredients: [
          { name: 'Doenerbrot', quantity: 1 },
          { name: 'Doenerfleisch Haehnchen', quantity: 0.18 },
          { name: 'Salatmix', quantity: 0.06 },
          { name: 'Tomaten', quantity: 0.03 },
          { name: 'Joghurtsosse', quantity: 0.03 },
        ],
      },
      {
        productNumber: 'D1003',
        name: 'Dueruem Kalb',
        category: 'Tuerkische Pizza',
        price: 8.5,
        imageUrl:
          'https://images.unsplash.com/photo-1532636875304-0c89119d9b3b?auto=format&fit=crop&w=1200&q=80',
        ingredients: [
          { name: 'Lahmacun Teig', quantity: 1 },
          { name: 'Doenerfleisch Kalb', quantity: 0.2 },
          { name: 'Salatmix', quantity: 0.06 },
          { name: 'Zwiebeln', quantity: 0.02 },
          { name: 'Joghurtsosse', quantity: 0.03 },
        ],
      },
      {
        productNumber: 'D1004',
        name: 'Lahmacun mit Salat',
        category: 'Tuerkische Pizza',
        price: 6.5,
        imageUrl:
          'https://images.unsplash.com/photo-1513104890138-7c749659a591?auto=format&fit=crop&w=1200&q=80',
        ingredients: [
          { name: 'Lahmacun Teig', quantity: 1 },
          { name: 'Salatmix', quantity: 0.07 },
          { name: 'Tomaten', quantity: 0.03 },
          { name: 'Zwiebeln', quantity: 0.02 },
          { name: 'Joghurtsosse', quantity: 0.03 },
        ],
      },
      {
        productNumber: 'D1005',
        name: 'Doener Teller Kalb',
        category: 'Doener Klassiker',
        price: 12.9,
        imageUrl:
          'https://images.unsplash.com/photo-1541518763669-27fef04b14ea?auto=format&fit=crop&w=1200&q=80',
        ingredients: [
          { name: 'Doenerfleisch Kalb', quantity: 0.24 },
          { name: 'Pommes', quantity: 0.2 },
          { name: 'Salatmix', quantity: 0.08 },
          { name: 'Joghurtsosse', quantity: 0.04 },
        ],
      },
      {
        productNumber: 'D1006',
        name: 'Pommes Klein',
        category: 'Beilagen',
        price: 3.5,
        imageUrl:
          'https://images.unsplash.com/photo-1630384060421-cb20d0e0649d?auto=format&fit=crop&w=1200&q=80',
        ingredients: [{ name: 'Pommes', quantity: 0.16 }],
      },
      {
        productNumber: 'D1007',
        name: 'Pommes Gross',
        category: 'Beilagen',
        price: 4.9,
        imageUrl:
          'https://images.unsplash.com/photo-1612874742237-6526221588e3?auto=format&fit=crop&w=1200&q=80',
        ingredients: [{ name: 'Pommes', quantity: 0.25 }],
      },
      {
        productNumber: 'D1008',
        name: 'Salatbeilage',
        category: 'Beilagen',
        price: 3.9,
        imageUrl:
          'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?auto=format&fit=crop&w=1200&q=80',
        ingredients: [
          { name: 'Salatmix', quantity: 0.12 },
          { name: 'Tomaten', quantity: 0.03 },
          { name: 'Zwiebeln', quantity: 0.02 },
        ],
      },
      {
        productNumber: 'D1009',
        name: 'Cola 0,33l',
        category: 'Getraenke',
        price: 2.7,
        imageUrl:
          'https://images.unsplash.com/photo-1629203851122-3726ecdf080e?auto=format&fit=crop&w=1200&q=80',
        ingredients: [{ name: 'Cola 0,33l', quantity: 1 }],
      },
      {
        productNumber: 'D1010',
        name: 'Menue Doener + Pommes + Cola',
        category: 'Doener Klassiker',
        price: 13.5,
        imageUrl:
          'https://images.unsplash.com/photo-1550547660-d9450f859349?auto=format&fit=crop&w=1200&q=80',
        ingredients: [
          { name: 'Doenerbrot', quantity: 1 },
          { name: 'Doenerfleisch Kalb', quantity: 0.18 },
          { name: 'Pommes', quantity: 0.16 },
          { name: 'Cola 0,33l', quantity: 1 },
          { name: 'Joghurtsosse', quantity: 0.02 },
        ],
      },
    ],
  }
}

function greekCatalog() {
  return {
    categories: ['Gyros Spezial', 'Grillteller', 'Beilagen', 'Getraenke'],
    ingredients: [
      { name: 'Gyros Fleisch', unit: 'kg', purchasePrice: 12.6, supplier: 'Mittelmeer Food' },
      { name: 'Pita Brot', unit: 'Stueck', purchasePrice: 0.5, supplier: 'Baeckerei Partner' },
      { name: 'Reis', unit: 'kg', purchasePrice: 2.1, supplier: 'Mittelmeer Food' },
      { name: 'Pommes', unit: 'kg', purchasePrice: 2.4, supplier: 'Klarando TK' },
      { name: 'Tzatziki', unit: 'kg', purchasePrice: 4.2, allergens: 'G', supplier: 'Saucenwerk' },
      { name: 'Griechischer Salatmix', unit: 'kg', purchasePrice: 2.8, supplier: 'Frischemarkt' },
      { name: 'Feta', unit: 'kg', purchasePrice: 7.9, allergens: 'G', supplier: 'Molkerei' },
      { name: 'Zwiebeln', unit: 'kg', purchasePrice: 1.8, supplier: 'Frischemarkt' },
      { name: 'Peperoni', unit: 'kg', purchasePrice: 4.4, supplier: 'Frischemarkt' },
      { name: 'Mineralwasser 0,5l', unit: 'Stueck', purchasePrice: 0.46, deposit: 0.25, supplier: 'Getraenkehandel' },
    ],
    products: [
      {
        productNumber: 'G2001',
        name: 'Gyros Pita',
        category: 'Gyros Spezial',
        price: 7.9,
        imageUrl:
          'https://images.unsplash.com/photo-1528715471579-d1bcf0ba5e83?auto=format&fit=crop&w=1200&q=80',
        ingredients: [
          { name: 'Pita Brot', quantity: 1 },
          { name: 'Gyros Fleisch', quantity: 0.18 },
          { name: 'Tzatziki', quantity: 0.03 },
          { name: 'Zwiebeln', quantity: 0.02 },
        ],
      },
      {
        productNumber: 'G2002',
        name: 'Gyros Teller',
        category: 'Grillteller',
        price: 13.9,
        imageUrl:
          'https://images.unsplash.com/photo-1530469912745-a215c6b256ea?auto=format&fit=crop&w=1200&q=80',
        ingredients: [
          { name: 'Gyros Fleisch', quantity: 0.24 },
          { name: 'Pommes', quantity: 0.2 },
          { name: 'Tzatziki', quantity: 0.04 },
          { name: 'Griechischer Salatmix', quantity: 0.08 },
        ],
      },
      {
        productNumber: 'G2003',
        name: 'Gyros Reisbox',
        category: 'Gyros Spezial',
        price: 9.5,
        imageUrl:
          'https://images.unsplash.com/photo-1512058564366-18510be2db19?auto=format&fit=crop&w=1200&q=80',
        ingredients: [
          { name: 'Gyros Fleisch', quantity: 0.18 },
          { name: 'Reis', quantity: 0.18 },
          { name: 'Tzatziki', quantity: 0.03 },
        ],
      },
      {
        productNumber: 'G2004',
        name: 'Souvlaki Teller',
        category: 'Grillteller',
        price: 14.5,
        imageUrl:
          'https://images.unsplash.com/photo-1511690743698-d9d85f2fbf38?auto=format&fit=crop&w=1200&q=80',
        ingredients: [
          { name: 'Gyros Fleisch', quantity: 0.22 },
          { name: 'Pommes', quantity: 0.18 },
          { name: 'Griechischer Salatmix', quantity: 0.08 },
          { name: 'Tzatziki', quantity: 0.03 },
        ],
      },
      {
        productNumber: 'G2005',
        name: 'Bifteki Teller',
        category: 'Grillteller',
        price: 14.9,
        imageUrl:
          'https://images.unsplash.com/photo-1558030006-450675393462?auto=format&fit=crop&w=1200&q=80',
        ingredients: [
          { name: 'Gyros Fleisch', quantity: 0.22 },
          { name: 'Reis', quantity: 0.16 },
          { name: 'Griechischer Salatmix', quantity: 0.07 },
          { name: 'Feta', quantity: 0.03 },
        ],
      },
      {
        productNumber: 'G2006',
        name: 'Griechischer Salat',
        category: 'Beilagen',
        price: 6.9,
        imageUrl:
          'https://images.unsplash.com/photo-1490645935967-10de6ba17061?auto=format&fit=crop&w=1200&q=80',
        ingredients: [
          { name: 'Griechischer Salatmix', quantity: 0.18 },
          { name: 'Feta', quantity: 0.04 },
          { name: 'Peperoni', quantity: 0.02 },
          { name: 'Zwiebeln', quantity: 0.02 },
        ],
      },
      {
        productNumber: 'G2007',
        name: 'Pommes Mediterran',
        category: 'Beilagen',
        price: 4.9,
        imageUrl:
          'https://images.unsplash.com/photo-1585238341986-0c6c397f21b0?auto=format&fit=crop&w=1200&q=80',
        ingredients: [
          { name: 'Pommes', quantity: 0.2 },
          { name: 'Feta', quantity: 0.02 },
          { name: 'Tzatziki', quantity: 0.02 },
        ],
      },
      {
        productNumber: 'G2008',
        name: 'Pita Brot mit Tzatziki',
        category: 'Beilagen',
        price: 4.5,
        imageUrl:
          'https://images.unsplash.com/photo-1519864600265-abb23847ef2c?auto=format&fit=crop&w=1200&q=80',
        ingredients: [
          { name: 'Pita Brot', quantity: 1 },
          { name: 'Tzatziki', quantity: 0.05 },
        ],
      },
      {
        productNumber: 'G2009',
        name: 'Mineralwasser 0,5l',
        category: 'Getraenke',
        price: 2.5,
        imageUrl:
          'https://images.unsplash.com/photo-1536935338788-846bb9981813?auto=format&fit=crop&w=1200&q=80',
        ingredients: [{ name: 'Mineralwasser 0,5l', quantity: 1 }],
      },
      {
        productNumber: 'G2010',
        name: 'Gyros Family Box',
        category: 'Gyros Spezial',
        price: 18.9,
        imageUrl:
          'https://images.unsplash.com/photo-1544025162-d76694265947?auto=format&fit=crop&w=1200&q=80',
        ingredients: [
          { name: 'Gyros Fleisch', quantity: 0.3 },
          { name: 'Pommes', quantity: 0.24 },
          { name: 'Griechischer Salatmix', quantity: 0.1 },
          { name: 'Tzatziki', quantity: 0.05 },
        ],
      },
    ],
  }
}

async function main() {
  const chain = await prisma.chain.upsert({
    where: { code: 'TEST57223' },
    update: { name: 'Klarando Testkette Kreuztal' },
    create: {
      code: 'TEST57223',
      name: 'Klarando Testkette Kreuztal',
    },
  })

  const doenerTenant = await upsertTenant(chain.id, {
    name: 'Doenerbude Kreuztal',
    email: 'doener57223@klarando.local',
    street: 'Marburger Strasse 12',
  })
  await seedCatalog(doenerTenant.id, doenerCatalog())

  const greekTenant = await upsertTenant(chain.id, {
    name: 'Taverna Hellas Kreuztal',
    email: 'grieche57223@klarando.local',
    street: 'Bahnhofstrasse 21',
  })
  await seedCatalog(greekTenant.id, greekCatalog())

  console.log('Testdaten erfolgreich erstellt:')
  console.log(`- Kette: ${chain.name} (${chain.id})`)
  console.log(`- Filiale 1: ${doenerTenant.name} (${doenerTenant.id})`)
  console.log(`- Filiale 2: ${greekTenant.name} (${greekTenant.id})`)
  console.log('- Je Filiale: 4 Kategorien, 10 Zutaten, 10 Produkte, Liefergebiet 57223')
}

main()
  .catch((error) => {
    console.error('SEED TEST TENANTS ERROR:', error)
    process.exitCode = 1
  })
  .finally(async () => {
    await prisma.$disconnect()
  })
