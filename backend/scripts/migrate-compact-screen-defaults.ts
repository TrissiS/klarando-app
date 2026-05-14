import { prisma } from '../src/lib/prisma'

const OLD_DEFAULTS = {
  productFontSize: 34,
  ingredientFontSize: 12,
  categoryFontSize: 12,
  priceFontSize: 30,
  cardPadding: 16,
  defaultColumnCount: 4,
  logoSize: 72,
}

const NEW_DEFAULTS = {
  productFontSize: 26,
  ingredientFontSize: 11,
  categoryFontSize: 11,
  priceFontSize: 22,
  cardPadding: 10,
  defaultColumnCount: 5,
  logoSize: 56,
}

async function run() {
  const settings = await prisma.screenSetting.findMany({
    select: {
      id: true,
      tenantId: true,
      productFontSize: true,
      ingredientFontSize: true,
      categoryFontSize: true,
      priceFontSize: true,
      cardPadding: true,
      defaultColumnCount: true,
      logoSize: true,
    },
  })

  let updatedCount = 0

  for (const setting of settings) {
    const patch: Record<string, number> = {}

    if (setting.productFontSize === OLD_DEFAULTS.productFontSize) {
      patch.productFontSize = NEW_DEFAULTS.productFontSize
    }
    if (setting.ingredientFontSize === OLD_DEFAULTS.ingredientFontSize) {
      patch.ingredientFontSize = NEW_DEFAULTS.ingredientFontSize
    }
    if (setting.categoryFontSize === OLD_DEFAULTS.categoryFontSize) {
      patch.categoryFontSize = NEW_DEFAULTS.categoryFontSize
    }
    if (setting.priceFontSize === OLD_DEFAULTS.priceFontSize) {
      patch.priceFontSize = NEW_DEFAULTS.priceFontSize
    }
    if (setting.cardPadding === OLD_DEFAULTS.cardPadding) {
      patch.cardPadding = NEW_DEFAULTS.cardPadding
    }
    if (setting.defaultColumnCount === OLD_DEFAULTS.defaultColumnCount) {
      patch.defaultColumnCount = NEW_DEFAULTS.defaultColumnCount
    }
    if (setting.logoSize === OLD_DEFAULTS.logoSize) {
      patch.logoSize = NEW_DEFAULTS.logoSize
    }

    if (Object.keys(patch).length === 0) {
      continue
    }

    await prisma.screenSetting.update({
      where: { id: setting.id },
      data: patch,
    })
    updatedCount += 1
  }

  console.log(
    `[migrate-compact-screen-defaults] Updated ${updatedCount}/${settings.length} ScreenSetting rows.`
  )
}

run()
  .catch((error) => {
    console.error('[migrate-compact-screen-defaults] failed:', error)
    process.exitCode = 1
  })
  .finally(async () => {
    await prisma.$disconnect()
  })

