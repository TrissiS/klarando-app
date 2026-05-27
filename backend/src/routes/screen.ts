import { ActionKind, ActionValueType, PermissionKey } from '@prisma/client'
import { Router } from 'express'
import { prisma } from '../lib/prisma'
import { writeAuditLog } from '../lib/audit'
import { requirePermission } from '../middleware/auth'
import { decodeStoredProductModifierName } from '../lib/product-modifiers'

const router = Router()

const BACKGROUND_MODES = new Set(['COLOR', 'IMAGE', 'VIDEO'])
const OVERLAY_ANIMATIONS = new Set(['NONE', 'FLOAT', 'SLIDE', 'SPARKLE'])
const CARD_STYLES = new Set(['SOFT', 'SHARP', 'GLASS', 'BOLD', 'OUTLINE', 'MINIMAL', 'LIST'])
const PRODUCT_SORT_MODES = new Set([
  'CUSTOM',
  'CATEGORY_THEN_CUSTOM',
  'CATEGORY_THEN_NAME',
  'NAME_ASC',
  'PRICE_ASC',
  'PRICE_DESC',
])
const PRICE_DISPLAY_MODES = new Set([
  'EUR_SUFFIX',
  'EUR_PREFIX',
  'CURRENCY_SYMBOL',
  'NO_DECIMALS',
  'COMMA_DECIMAL',
])
const ALLERGEN_LEGEND_POSITIONS = new Set([
  'TOP_LEFT',
  'TOP_RIGHT',
  'BOTTOM_LEFT',
  'BOTTOM_RIGHT',
  'BOTTOM_CENTER',
])
const ORIENTATIONS = new Set(['LANDSCAPE', 'PORTRAIT'])
const OFFER_WINDOW_POSITIONS = new Set(['RIGHT', 'LEFT', 'TOP', 'BOTTOM'])
const OFFER_WINDOW_SIZES = new Set(['S', 'M', 'L'])
const TICKER_POSITIONS = new Set(['TOP', 'BOTTOM'])
const TICKER_DATA_SOURCES = new Set(['CUSTOM', 'NEWS_API', 'WEATHER_API', 'TRAFFIC_API'])

type ProductWithRelations = {
  id: string
  tenantId: string
  productNumber: string | null
  name: string
  price: unknown
  beverageContainerType: 'NONE' | 'EINWEG' | 'MEHRWEG'
  deposit: { toString(): string } | string | number
  available: boolean
  category: {
    id: string
    tenantId: string
    name: string
    imageUrl: string | null
    sortOrder: number
    createdAt: Date
  } | null
  screenSetting: {
    displayCategory: string | null
    sortOrder: number
    showOnScreen: boolean
    isFeatured: boolean
    badgeText: string | null
    highlightColor: string | null
    updatedAt: Date
  } | null
  ingredients: Array<{
    displayNameOverride: string | null
    showInMenuBoard: boolean
    ingredient: {
      name: string
      allergens: string | null
      category: string
    }
  }>
  modifiers: Array<{
    id: string
    name: string
    priceDelta: unknown
    isDefaultSelected: boolean
    isActive: boolean
    sortOrder: number
  }>
}

function normalizeText(input?: string | null) {
  if (!input) {
    return null
  }

  const trimmed = input.trim()
  return trimmed.length > 0 ? trimmed : null
}

function normalizeHexColor(input?: string | null) {
  const normalized = normalizeText(input)
  if (!normalized) {
    return null
  }

  if (!/^#[0-9A-Fa-f]{6}$/.test(normalized)) {
    return null
  }

  return normalized.toLowerCase()
}

function clampInt(value: number, min: number, max: number) {
  if (!Number.isFinite(value)) {
    return min
  }
  return Math.min(max, Math.max(min, Math.trunc(value)))
}

function normalizeIdList(input?: string[] | string | null) {
  if (input === undefined || input === null) {
    return [] as string[]
  }

  const rawItems = Array.isArray(input) ? input : input.split(',')
  return Array.from(
    new Set(
      rawItems
        .map((entry) => entry.trim())
        .filter((entry) => entry.length > 0)
    )
  )
}

function serializeIdList(ids: string[]) {
  return ids.length > 0 ? ids.join(',') : null
}

function parseStoredIdList(value?: string | null) {
  return normalizeIdList(value || null)
}

function normalizeStringListInput(input?: string[] | string | null) {
  if (input === undefined) {
    return undefined
  }
  if (input === null) {
    return null
  }

  const rawItems = Array.isArray(input) ? input : input.split(/[\n,]+/g)
  const values = Array.from(
    new Set(
      rawItems
        .map((entry) => entry.trim())
        .filter((entry) => entry.length > 0)
    )
  )
  return values
}

function parseJsonStringList(value: unknown) {
  if (!Array.isArray(value)) {
    return [] as string[]
  }

  return value
    .map((entry) => (typeof entry === 'string' ? entry.trim() : ''))
    .filter((entry) => entry.length > 0)
}

function parseWeeklyDays(raw: string | null): number[] {
  if (!raw) {
    return []
  }
  return raw
    .split(',')
    .map((entry) => Number(entry))
    .filter((entry) => Number.isInteger(entry) && entry >= 1 && entry <= 7)
}

function parseTime(raw: string | null) {
  if (!raw || !/^\d{2}:\d{2}$/.test(raw)) {
    return null
  }
  const [hourText, minuteText] = raw.split(':')
  const hour = Number(hourText)
  const minute = Number(minuteText)
  if (hour < 0 || hour > 23 || minute < 0 || minute > 59) {
    return null
  }
  return `${hourText}:${minuteText}`
}

function currentTimeHHMM(date = new Date()) {
  const hour = String(date.getHours()).padStart(2, '0')
  const minute = String(date.getMinutes()).padStart(2, '0')
  return `${hour}:${minute}`
}

function isActionCurrentlyActiveForFeed(action: {
  isActive: boolean
  kind: ActionKind
  startAt: Date | null
  endAt: Date | null
  weeklyDays: string | null
  dailyStartTime: string | null
  dailyEndTime: string | null
}, now = new Date()) {
  if (!action.isActive) {
    return false
  }

  if (action.startAt && now < action.startAt) {
    return false
  }
  if (action.endAt && now > action.endAt) {
    return false
  }

  const startTime = parseTime(action.dailyStartTime)
  const endTime = parseTime(action.dailyEndTime)
  if (startTime && endTime) {
    const nowHHMM = currentTimeHHMM(now)
    if (nowHHMM < startTime || nowHHMM > endTime) {
      return false
    }
  }

  if (action.kind === ActionKind.WEEKLY) {
    const weekday = now.getDay() === 0 ? 7 : now.getDay()
    const allowedDays = parseWeeklyDays(action.weeklyDays)
    if (allowedDays.length === 0 || !allowedDays.includes(weekday)) {
      return false
    }
  }

  return true
}

function isMissingActionColumnsError(error: unknown) {
  if (!(error instanceof Error)) {
    return false
  }

  return (
    error.message.includes('Action.imageUrl') ||
    error.message.includes('"imageUrl"') ||
    error.message.includes('Action.displayAsMenu') ||
    error.message.includes('"displayAsMenu"') ||
    error.message.includes('Action.hidePriceOnScreen') ||
    error.message.includes('"hidePriceOnScreen"')
  )
}

async function ensureActionColumns() {
  await prisma.$executeRawUnsafe(`
    ALTER TABLE "Action"
    ADD COLUMN IF NOT EXISTS "imageUrl" TEXT;
  `)

  await prisma.$executeRawUnsafe(`
    ALTER TABLE "Action"
    ADD COLUMN IF NOT EXISTS "displayAsMenu" BOOLEAN NOT NULL DEFAULT false;
  `)

  await prisma.$executeRawUnsafe(`
    ALTER TABLE "Action"
    ADD COLUMN IF NOT EXISTS "hidePriceOnScreen" BOOLEAN NOT NULL DEFAULT false;
  `)
}

function mapScreenDeviceOutput(device: {
  id: string
  tenantId: string
  name: string
  deviceCode: string
  location: string | null
  isActive: boolean
  orientation: string
  resolutionWidth: number
  resolutionHeight: number
  refreshIntervalSec: number
  showPricesOverride: boolean | null
  showAllergensOverride: boolean | null
  showUnavailableOverride: boolean | null
  showProductNumberOverride: boolean | null
  offerWindowEnabledOverride: boolean | null
  offerWindowPositionOverride: string | null
  offerWindowSizeOverride: string | null
  offerMediaUrlsOverride: unknown
  offerMediaRotateSecOverride: number | null
  cardStyleOverride: string | null
  columnCountOverride: number | null
  selectedCategoryIds: string | null
  selectedProductIds: string | null
  backgroundMediaUrlOverride: string | null
  accentColorOverride: string | null
  textColorOverride: string | null
  notes: string | null
  lastSeenAt: Date | null
  createdAt: Date
  updatedAt: Date
}) {
  return {
    ...device,
    selectedCategoryIds: parseStoredIdList(device.selectedCategoryIds),
    selectedProductIds: parseStoredIdList(device.selectedProductIds),
    offerMediaUrlsOverride: parseJsonStringList(device.offerMediaUrlsOverride),
  }
}

function parseAllergenCodes(raw: string | null) {
  if (!raw) {
    return [] as string[]
  }

  return Array.from(
    new Set(
      raw
        .split(',')
        .map((entry) => entry.trim().toUpperCase())
        .filter(Boolean)
    )
  ).sort()
}

function isPackagingCategory(value: unknown) {
  return typeof value === 'string' && value.trim().toUpperCase() === 'PACKAGING'
}

function collectAllergens(product: ProductWithRelations) {
  const codes = new Set<string>()

  for (const item of product.ingredients) {
    if (item.showInMenuBoard === false) {
      continue
    }
    if (isPackagingCategory(item.ingredient.category)) {
      continue
    }
    parseAllergenCodes(item.ingredient.allergens).forEach((code) => codes.add(code))
  }

  return Array.from(codes).sort()
}

function collectIngredients(product: ProductWithRelations) {
  return product.ingredients
    .filter((item) => item.showInMenuBoard !== false)
    .filter((item) => !isPackagingCategory(item.ingredient.category))
    .map((item) => ({
      name: (item.displayNameOverride || '').trim() || item.ingredient.name,
      allergens: parseAllergenCodes(item.ingredient.allergens),
    }))
}

function collectSizeOptions(product: ProductWithRelations) {
  const basePrice = Number(product.price)
  const safeBasePrice = Number.isFinite(basePrice) ? basePrice : 0

  return product.modifiers
    .filter((modifier) => modifier.isActive)
    .map((modifier) => {
      const parsed = decodeStoredProductModifierName(modifier.name)
      const parsedDelta = Number(modifier.priceDelta)
      const safeDelta = Number.isFinite(parsedDelta) ? parsedDelta : 0
      return {
        id: modifier.id,
        name: parsed.displayName,
        kind: parsed.kind,
        sortOrder: modifier.sortOrder,
        priceDelta: safeDelta,
        totalPrice: Math.max(0, safeBasePrice + safeDelta),
        isDefaultSelected: modifier.isDefaultSelected,
      }
    })
    .filter((entry) => entry.kind === 'SIZE')
    .sort((left, right) => {
      if (left.sortOrder !== right.sortOrder) {
        return left.sortOrder - right.sortOrder
      }
      return left.name.localeCompare(right.name, 'de-DE')
    })
    .map(({ id, name, priceDelta, totalPrice, isDefaultSelected }) => ({
      id,
      name,
      priceDelta,
      totalPrice,
      isDefaultSelected,
    }))
}

function mapScreenProduct(product: ProductWithRelations) {
  const setting = product.screenSetting

  return {
    id: product.id,
    tenantId: product.tenantId,
    productNumber: product.productNumber,
    name: product.name,
    price: product.price,
    beverageContainerType: product.beverageContainerType,
    deposit: product.deposit.toString(),
    available: product.available,
    category: product.category,
    allergens: collectAllergens(product),
    ingredients: collectIngredients(product),
    sizeOptions: collectSizeOptions(product),
    screen: {
      displayCategory: setting?.displayCategory ?? product.category?.name ?? null,
      sortOrder: setting?.sortOrder ?? product.category?.sortOrder ?? 0,
      showOnScreen: setting?.showOnScreen ?? product.available,
      isFeatured: setting?.isFeatured ?? false,
      badgeText: setting?.badgeText ?? null,
      highlightColor: setting?.highlightColor ?? null,
      updatedAt: setting?.updatedAt ?? null,
    },
  }
}

function sortScreenProducts(
  left: ReturnType<typeof mapScreenProduct>,
  right: ReturnType<typeof mapScreenProduct>,
  mode = 'CUSTOM'
) {
  if (left.screen.showOnScreen !== right.screen.showOnScreen) {
    return left.screen.showOnScreen ? -1 : 1
  }

  const leftCategory = (left.screen.displayCategory ?? left.category?.name ?? '').toLowerCase()
  const rightCategory = (right.screen.displayCategory ?? right.category?.name ?? '').toLowerCase()
  const leftPrice = Number(left.price)
  const rightPrice = Number(right.price)

  if (mode === 'CATEGORY_THEN_CUSTOM') {
    if (leftCategory !== rightCategory) {
      return leftCategory.localeCompare(rightCategory, 'de-DE')
    }
    if (left.screen.sortOrder !== right.screen.sortOrder) {
      return left.screen.sortOrder - right.screen.sortOrder
    }
    return left.name.localeCompare(right.name, 'de-DE')
  }

  if (mode === 'CATEGORY_THEN_NAME') {
    if (leftCategory !== rightCategory) {
      return leftCategory.localeCompare(rightCategory, 'de-DE')
    }
    return left.name.localeCompare(right.name, 'de-DE')
  }

  if (mode === 'NAME_ASC') {
    return left.name.localeCompare(right.name, 'de-DE')
  }

  if (mode === 'PRICE_ASC') {
    if (leftPrice !== rightPrice) {
      return leftPrice - rightPrice
    }
    return left.name.localeCompare(right.name, 'de-DE')
  }

  if (mode === 'PRICE_DESC') {
    if (leftPrice !== rightPrice) {
      return rightPrice - leftPrice
    }
    return left.name.localeCompare(right.name, 'de-DE')
  }

  if (left.screen.sortOrder !== right.screen.sortOrder) {
    return left.screen.sortOrder - right.screen.sortOrder
  }

  return left.name.localeCompare(right.name, 'de-DE')
}

function generateDeviceCode() {
  const alphabet = 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789'
  let output = 'KS-'

  for (let index = 0; index < 8; index += 1) {
    output += alphabet[Math.floor(Math.random() * alphabet.length)]
  }

  return output
}

async function createUniqueDeviceCode() {
  for (let attempt = 0; attempt < 10; attempt += 1) {
    const code = generateDeviceCode()
    const existing = await prisma.screenDevice.findUnique({
      where: { deviceCode: code },
      select: { id: true },
    })

    if (!existing) {
      return code
    }
  }

  return `${generateDeviceCode()}${Date.now().toString().slice(-2)}`
}

router.get('/config', requirePermission(PermissionKey.SETTINGS_READ), async (req, res) => {
  try {
    const tenantId = req.query.tenantId as string

    if (!tenantId) {
      return res.status(400).json({ error: 'tenantId fehlt' })
    }

    const config = await prisma.screenSetting.upsert({
      where: { tenantId },
      update: {},
      create: { tenantId },
    })

    return res.json(config)
  } catch (error) {
    console.error('GET SCREEN CONFIG ERROR:', error)
    return res.status(500).json({ error: 'Bildschirm-Konfiguration konnte nicht geladen werden' })
  }
})

router.put('/config', requirePermission(PermissionKey.SETTINGS_WRITE), async (req, res) => {
  try {
    const {
      tenantId,
      title,
      subtitle,
      fontFamily,
      defaultOrientation,
      defaultResolutionWidth,
      defaultResolutionHeight,
      productFontSize,
      ingredientFontSize,
      categoryFontSize,
      priceFontSize,
      backgroundMode,
      backgroundValue,
      backgroundMediaUrl,
      overlayAnimation,
      cardStyle,
      cardPadding,
      cardBackgroundOpacity,
      cardBorderOpacity,
      productSortMode,
      defaultColumnCount,
      showCategoryHeaders,
      showCategoryOnCard,
      categoryUppercase,
      accentColor,
      textColor,
      productNameColor,
      ingredientTextColor,
      categoryTextColor,
      priceTextColor,
      showAllergens,
      allergenLegendEnabled,
      allergenLegendPosition,
      showPrices,
      pricePinnedLeft,
      priceDisplayMode,
      showUnavailable,
      showProductNumber,
      logoUrl,
      logoSize,
      offerWindowEnabled,
      offerWindowTitle,
      offerWindowText,
      offerWindowPosition,
      offerWindowSize,
      offerWindowWidthPx,
      offerWindowHeightPx,
      offerWindowXPercent,
      offerWindowYPercent,
      offerWindowReserveSpace,
      offerWindowBackgroundColor,
      offerWindowTextColor,
      offerWindowOpacity,
      offerMediaUrls,
      offerMediaRotateSec,
      tickerEnabled,
      tickerPosition,
      tickerShowClock,
      tickerDataSource,
      tickerCustomText,
      tickerApiUrl,
      tickerRefreshSec,
      tickerClockFontSize,
      tickerFontSize,
      tickerInsetPx,
      tickerOffsetPx,
      tickerBackgroundColor,
      tickerTextColor,
    } = req.body as {
      tenantId?: string
      title?: string
      subtitle?: string | null
      fontFamily?: string | null
      defaultOrientation?: string
      defaultResolutionWidth?: number
      defaultResolutionHeight?: number
      productFontSize?: number
      ingredientFontSize?: number
      categoryFontSize?: number
      priceFontSize?: number
      backgroundMode?: string
      backgroundValue?: string | null
      backgroundMediaUrl?: string | null
      overlayAnimation?: string
      cardStyle?: string
      cardPadding?: number
      cardBackgroundOpacity?: number
      cardBorderOpacity?: number
      productSortMode?: string
      defaultColumnCount?: number
      showCategoryHeaders?: boolean
      showCategoryOnCard?: boolean
      categoryUppercase?: boolean
      accentColor?: string | null
      textColor?: string | null
      productNameColor?: string | null
      ingredientTextColor?: string | null
      categoryTextColor?: string | null
      priceTextColor?: string | null
      showAllergens?: boolean
      allergenLegendEnabled?: boolean
      allergenLegendPosition?: string
      showPrices?: boolean
      pricePinnedLeft?: boolean
      priceDisplayMode?: string
      showUnavailable?: boolean
      showProductNumber?: boolean
      logoUrl?: string | null
      logoSize?: number
      offerWindowEnabled?: boolean
      offerWindowTitle?: string | null
      offerWindowText?: string | null
      offerWindowPosition?: string
      offerWindowSize?: string
      offerWindowWidthPx?: number
      offerWindowHeightPx?: number
      offerWindowXPercent?: number
      offerWindowYPercent?: number
      offerWindowReserveSpace?: boolean
      offerWindowBackgroundColor?: string | null
      offerWindowTextColor?: string | null
      offerWindowOpacity?: number
      offerMediaUrls?: string[] | string | null
      offerMediaRotateSec?: number
      tickerEnabled?: boolean
      tickerPosition?: string
      tickerShowClock?: boolean
      tickerDataSource?: string
      tickerCustomText?: string | null
      tickerApiUrl?: string | null
      tickerRefreshSec?: number
      tickerClockFontSize?: number
      tickerFontSize?: number
      tickerInsetPx?: number
      tickerOffsetPx?: number
      tickerBackgroundColor?: string | null
      tickerTextColor?: string | null
    }

    if (!tenantId) {
      return res.status(400).json({ error: 'tenantId fehlt' })
    }

    if (title !== undefined && !normalizeText(title)) {
      return res.status(400).json({ error: 'Titel darf nicht leer sein' })
    }

    if (backgroundMode !== undefined && !BACKGROUND_MODES.has(backgroundMode)) {
      return res.status(400).json({ error: 'ungueltiger backgroundMode' })
    }

    if (overlayAnimation !== undefined && !OVERLAY_ANIMATIONS.has(overlayAnimation)) {
      return res.status(400).json({ error: 'ungueltige overlayAnimation' })
    }

    if (defaultOrientation !== undefined && !ORIENTATIONS.has(defaultOrientation)) {
      return res.status(400).json({ error: 'defaultOrientation muss LANDSCAPE oder PORTRAIT sein' })
    }

    if (
      defaultResolutionWidth !== undefined &&
      (!Number.isInteger(Number(defaultResolutionWidth)) ||
        Number(defaultResolutionWidth) < 320 ||
        Number(defaultResolutionWidth) > 10000)
    ) {
      return res.status(400).json({ error: 'defaultResolutionWidth ungueltig (320-10000)' })
    }

    if (
      defaultResolutionHeight !== undefined &&
      (!Number.isInteger(Number(defaultResolutionHeight)) ||
        Number(defaultResolutionHeight) < 240 ||
        Number(defaultResolutionHeight) > 10000)
    ) {
      return res.status(400).json({ error: 'defaultResolutionHeight ungueltig (240-10000)' })
    }

    if (cardStyle !== undefined && !CARD_STYLES.has(cardStyle)) {
      return res.status(400).json({ error: 'ungueltiger cardStyle' })
    }

    if (productSortMode !== undefined && !PRODUCT_SORT_MODES.has(productSortMode)) {
      return res.status(400).json({ error: 'ungueltiger productSortMode' })
    }

    if (priceDisplayMode !== undefined && !PRICE_DISPLAY_MODES.has(priceDisplayMode)) {
      return res.status(400).json({ error: 'ungueltiger priceDisplayMode' })
    }

    if (pricePinnedLeft !== undefined && typeof pricePinnedLeft !== 'boolean') {
      return res.status(400).json({ error: 'pricePinnedLeft muss true oder false sein' })
    }

    if (offerWindowPosition !== undefined && !OFFER_WINDOW_POSITIONS.has(offerWindowPosition)) {
      return res.status(400).json({ error: 'ungueltige offerWindowPosition' })
    }

    if (offerWindowSize !== undefined && !OFFER_WINDOW_SIZES.has(offerWindowSize)) {
      return res.status(400).json({ error: 'ungueltige offerWindowSize' })
    }

    if (
      offerWindowXPercent !== undefined &&
      (!Number.isFinite(Number(offerWindowXPercent)) ||
        Number(offerWindowXPercent) < 0 ||
        Number(offerWindowXPercent) > 100)
    ) {
      return res.status(400).json({ error: 'offerWindowXPercent ungueltig (0-100)' })
    }

    if (
      offerWindowYPercent !== undefined &&
      (!Number.isFinite(Number(offerWindowYPercent)) ||
        Number(offerWindowYPercent) < 0 ||
        Number(offerWindowYPercent) > 100)
    ) {
      return res.status(400).json({ error: 'offerWindowYPercent ungueltig (0-100)' })
    }

    if (
      allergenLegendPosition !== undefined &&
      !ALLERGEN_LEGEND_POSITIONS.has(allergenLegendPosition)
    ) {
      return res.status(400).json({ error: 'ungueltige allergenLegendPosition' })
    }

    if (
      allergenLegendEnabled !== undefined &&
      typeof allergenLegendEnabled !== 'boolean'
    ) {
      return res.status(400).json({ error: 'allergenLegendEnabled muss true oder false sein' })
    }

    if (
      showCategoryHeaders !== undefined &&
      typeof showCategoryHeaders !== 'boolean'
    ) {
      return res.status(400).json({ error: 'showCategoryHeaders muss true oder false sein' })
    }

    if (
      showCategoryOnCard !== undefined &&
      typeof showCategoryOnCard !== 'boolean'
    ) {
      return res.status(400).json({ error: 'showCategoryOnCard muss true oder false sein' })
    }

    if (
      categoryUppercase !== undefined &&
      typeof categoryUppercase !== 'boolean'
    ) {
      return res.status(400).json({ error: 'categoryUppercase muss true oder false sein' })
    }

    if (
      showProductNumber !== undefined &&
      typeof showProductNumber !== 'boolean'
    ) {
      return res.status(400).json({ error: 'showProductNumber muss true oder false sein' })
    }

    if (accentColor !== undefined && accentColor !== null && !normalizeHexColor(accentColor)) {
      return res.status(400).json({ error: 'accentColor muss im Format #RRGGBB sein' })
    }

    if (textColor !== undefined && textColor !== null && !normalizeHexColor(textColor)) {
      return res.status(400).json({ error: 'textColor muss im Format #RRGGBB sein' })
    }

    if (
      productNameColor !== undefined &&
      productNameColor !== null &&
      !normalizeHexColor(productNameColor)
    ) {
      return res.status(400).json({ error: 'productNameColor muss im Format #RRGGBB sein' })
    }

    if (
      ingredientTextColor !== undefined &&
      ingredientTextColor !== null &&
      !normalizeHexColor(ingredientTextColor)
    ) {
      return res.status(400).json({ error: 'ingredientTextColor muss im Format #RRGGBB sein' })
    }

    if (
      categoryTextColor !== undefined &&
      categoryTextColor !== null &&
      !normalizeHexColor(categoryTextColor)
    ) {
      return res.status(400).json({ error: 'categoryTextColor muss im Format #RRGGBB sein' })
    }

    if (
      priceTextColor !== undefined &&
      priceTextColor !== null &&
      !normalizeHexColor(priceTextColor)
    ) {
      return res.status(400).json({ error: 'priceTextColor muss im Format #RRGGBB sein' })
    }

    if (
      offerWindowReserveSpace !== undefined &&
      typeof offerWindowReserveSpace !== 'boolean'
    ) {
      return res.status(400).json({ error: 'offerWindowReserveSpace muss true oder false sein' })
    }

    if (
      offerWindowOpacity !== undefined &&
      (!Number.isFinite(Number(offerWindowOpacity)) ||
        Number(offerWindowOpacity) < 0 ||
        Number(offerWindowOpacity) > 100)
    ) {
      return res.status(400).json({ error: 'offerWindowOpacity ungueltig (0-100)' })
    }

    if (
      offerWindowBackgroundColor !== undefined &&
      offerWindowBackgroundColor !== null &&
      !normalizeHexColor(offerWindowBackgroundColor)
    ) {
      return res.status(400).json({ error: 'offerWindowBackgroundColor muss im Format #RRGGBB sein' })
    }

    if (
      offerWindowTextColor !== undefined &&
      offerWindowTextColor !== null &&
      !normalizeHexColor(offerWindowTextColor)
    ) {
      return res.status(400).json({ error: 'offerWindowTextColor muss im Format #RRGGBB sein' })
    }

    if (tickerEnabled !== undefined && typeof tickerEnabled !== 'boolean') {
      return res.status(400).json({ error: 'tickerEnabled muss true oder false sein' })
    }

    if (tickerShowClock !== undefined && typeof tickerShowClock !== 'boolean') {
      return res.status(400).json({ error: 'tickerShowClock muss true oder false sein' })
    }

    if (tickerPosition !== undefined && !TICKER_POSITIONS.has(tickerPosition)) {
      return res.status(400).json({ error: 'ungueltige tickerPosition' })
    }

    if (tickerDataSource !== undefined && !TICKER_DATA_SOURCES.has(tickerDataSource)) {
      return res.status(400).json({ error: 'ungueltige tickerDataSource' })
    }

    if (
      tickerRefreshSec !== undefined &&
      (!Number.isFinite(Number(tickerRefreshSec)) ||
        Number(tickerRefreshSec) < 10 ||
        Number(tickerRefreshSec) > 3600)
    ) {
      return res.status(400).json({ error: 'tickerRefreshSec ungueltig (10-3600)' })
    }

    if (
      tickerClockFontSize !== undefined &&
      (!Number.isFinite(Number(tickerClockFontSize)) ||
        Number(tickerClockFontSize) < 10 ||
        Number(tickerClockFontSize) > 48)
    ) {
      return res.status(400).json({ error: 'tickerClockFontSize ungueltig (10-48)' })
    }

    if (
      tickerFontSize !== undefined &&
      (!Number.isFinite(Number(tickerFontSize)) ||
        Number(tickerFontSize) < 10 ||
        Number(tickerFontSize) > 42)
    ) {
      return res.status(400).json({ error: 'tickerFontSize ungueltig (10-42)' })
    }

    if (
      tickerInsetPx !== undefined &&
      (!Number.isFinite(Number(tickerInsetPx)) ||
        Number(tickerInsetPx) < 0 ||
        Number(tickerInsetPx) > 420)
    ) {
      return res.status(400).json({ error: 'tickerInsetPx ungueltig (0-420)' })
    }

    if (
      tickerOffsetPx !== undefined &&
      (!Number.isFinite(Number(tickerOffsetPx)) ||
        Number(tickerOffsetPx) < 0 ||
        Number(tickerOffsetPx) > 260)
    ) {
      return res.status(400).json({ error: 'tickerOffsetPx ungueltig (0-260)' })
    }

    if (
      tickerBackgroundColor !== undefined &&
      tickerBackgroundColor !== null &&
      !normalizeHexColor(tickerBackgroundColor)
    ) {
      return res.status(400).json({ error: 'tickerBackgroundColor muss im Format #RRGGBB sein' })
    }

    if (
      tickerTextColor !== undefined &&
      tickerTextColor !== null &&
      !normalizeHexColor(tickerTextColor)
    ) {
      return res.status(400).json({ error: 'tickerTextColor muss im Format #RRGGBB sein' })
    }

    const normalizedTickerApiUrlForValidation =
      tickerApiUrl === undefined ? undefined : normalizeText(tickerApiUrl)
    if (normalizedTickerApiUrlForValidation) {
      try {
        const parsed = new URL(normalizedTickerApiUrlForValidation)
        if (parsed.protocol !== 'http:' && parsed.protocol !== 'https:') {
          return res.status(400).json({ error: 'tickerApiUrl muss mit http:// oder https:// starten' })
        }
      } catch {
        return res.status(400).json({ error: 'tickerApiUrl ist keine gueltige URL' })
      }
    }

    const parsedProductFontSize =
      productFontSize === undefined ? undefined : clampInt(Number(productFontSize), 16, 96)
    const parsedIngredientFontSize =
      ingredientFontSize === undefined ? undefined : clampInt(Number(ingredientFontSize), 10, 48)
    const parsedCategoryFontSize =
      categoryFontSize === undefined ? undefined : clampInt(Number(categoryFontSize), 10, 48)
    const parsedPriceFontSize =
      priceFontSize === undefined ? undefined : clampInt(Number(priceFontSize), 14, 72)
    const parsedCardPadding =
      cardPadding === undefined ? undefined : clampInt(Number(cardPadding), 8, 48)
    const parsedCardBackgroundOpacity =
      cardBackgroundOpacity === undefined
        ? undefined
        : clampInt(Number(cardBackgroundOpacity), 0, 100)
    const parsedCardBorderOpacity =
      cardBorderOpacity === undefined ? undefined : clampInt(Number(cardBorderOpacity), 0, 100)
    const parsedDefaultColumnCount =
      defaultColumnCount === undefined ? undefined : clampInt(Number(defaultColumnCount), 1, 6)
    const parsedLogoSize =
      logoSize === undefined ? undefined : clampInt(Number(logoSize), 32, 220)
    const parsedOfferMediaRotateSec =
      offerMediaRotateSec === undefined ? undefined : clampInt(Number(offerMediaRotateSec), 3, 120)
    const parsedOfferWindowWidthPx =
      offerWindowWidthPx === undefined ? undefined : clampInt(Number(offerWindowWidthPx), 180, 1400)
    const parsedOfferWindowHeightPx =
      offerWindowHeightPx === undefined
        ? undefined
        : clampInt(Number(offerWindowHeightPx), 120, 1200)
    const parsedOfferWindowOpacity =
      offerWindowOpacity === undefined
        ? undefined
        : clampInt(Number(offerWindowOpacity), 0, 100)
    const parsedDefaultResolutionWidth =
      defaultResolutionWidth === undefined
        ? undefined
        : clampInt(Number(defaultResolutionWidth), 320, 10000)
    const parsedDefaultResolutionHeight =
      defaultResolutionHeight === undefined
        ? undefined
        : clampInt(Number(defaultResolutionHeight), 240, 10000)
    const parsedOfferWindowXPercent =
      offerWindowXPercent === undefined
        ? undefined
        : clampInt(Number(offerWindowXPercent), 0, 100)
    const parsedOfferWindowYPercent =
      offerWindowYPercent === undefined
        ? undefined
        : clampInt(Number(offerWindowYPercent), 0, 100)
    const parsedTickerRefreshSec =
      tickerRefreshSec === undefined ? undefined : clampInt(Number(tickerRefreshSec), 10, 3600)
    const parsedTickerClockFontSize =
      tickerClockFontSize === undefined ? undefined : clampInt(Number(tickerClockFontSize), 10, 48)
    const parsedTickerFontSize =
      tickerFontSize === undefined ? undefined : clampInt(Number(tickerFontSize), 10, 42)
    const parsedTickerInsetPx =
      tickerInsetPx === undefined ? undefined : clampInt(Number(tickerInsetPx), 0, 420)
    const parsedTickerOffsetPx =
      tickerOffsetPx === undefined ? undefined : clampInt(Number(tickerOffsetPx), 0, 260)
    const normalizedOfferMediaUrls =
      offerMediaUrls === undefined ? undefined : normalizeStringListInput(offerMediaUrls)
    const normalizedFontFamily =
      fontFamily === undefined ? undefined : normalizeText(fontFamily) ?? 'Poppins, sans-serif'
    const normalizedTickerCustomText =
      tickerCustomText === undefined ? undefined : normalizeText(tickerCustomText)
    const normalizedTickerApiUrl =
      tickerApiUrl === undefined ? undefined : normalizeText(tickerApiUrl)

    const config = await prisma.screenSetting.upsert({
      where: { tenantId },
      update: {
        title: title === undefined ? undefined : normalizeText(title) ?? undefined,
        subtitle: subtitle === undefined ? undefined : normalizeText(subtitle),
        fontFamily: normalizedFontFamily,
        defaultOrientation,
        defaultResolutionWidth: parsedDefaultResolutionWidth,
        defaultResolutionHeight: parsedDefaultResolutionHeight,
        productFontSize: parsedProductFontSize,
        ingredientFontSize: parsedIngredientFontSize,
        categoryFontSize: parsedCategoryFontSize,
        priceFontSize: parsedPriceFontSize,
        backgroundMode,
        backgroundValue:
          backgroundValue === undefined ? undefined : normalizeText(backgroundValue),
        backgroundMediaUrl:
          backgroundMediaUrl === undefined ? undefined : normalizeText(backgroundMediaUrl),
        overlayAnimation,
        cardStyle,
        cardPadding: parsedCardPadding,
        cardBackgroundOpacity: parsedCardBackgroundOpacity,
        cardBorderOpacity: parsedCardBorderOpacity,
        productSortMode,
        defaultColumnCount: parsedDefaultColumnCount,
        showCategoryHeaders,
        showCategoryOnCard,
        categoryUppercase,
        accentColor:
          accentColor === undefined
            ? undefined
            : normalizeHexColor(accentColor) ?? '#ea580c',
        textColor:
          textColor === undefined
            ? undefined
            : normalizeHexColor(textColor) ?? '#ffffff',
        productNameColor:
          productNameColor === undefined
            ? undefined
            : normalizeHexColor(productNameColor) ?? '#ffffff',
        ingredientTextColor:
          ingredientTextColor === undefined
            ? undefined
            : normalizeHexColor(ingredientTextColor) ?? '#e2e8f0',
        categoryTextColor:
          categoryTextColor === undefined
            ? undefined
            : normalizeHexColor(categoryTextColor) ?? '#cbd5e1',
        priceTextColor:
          priceTextColor === undefined
            ? undefined
            : normalizeHexColor(priceTextColor) ?? '#ffffff',
        showAllergens,
        allergenLegendEnabled,
        allergenLegendPosition,
        showPrices,
        pricePinnedLeft,
        priceDisplayMode,
        showUnavailable,
        showProductNumber,
        logoUrl: logoUrl === undefined ? undefined : normalizeText(logoUrl),
        logoSize: parsedLogoSize,
        offerWindowEnabled,
        offerWindowTitle:
          offerWindowTitle === undefined ? undefined : normalizeText(offerWindowTitle),
        offerWindowText:
          offerWindowText === undefined ? undefined : normalizeText(offerWindowText),
        offerWindowPosition,
        offerWindowSize,
        offerWindowWidthPx: parsedOfferWindowWidthPx,
        offerWindowHeightPx: parsedOfferWindowHeightPx,
        offerWindowXPercent: parsedOfferWindowXPercent,
        offerWindowYPercent: parsedOfferWindowYPercent,
        offerWindowReserveSpace,
        offerWindowBackgroundColor:
          offerWindowBackgroundColor === undefined
            ? undefined
            : normalizeHexColor(offerWindowBackgroundColor) ?? '#f97316',
        offerWindowTextColor:
          offerWindowTextColor === undefined
            ? undefined
            : normalizeHexColor(offerWindowTextColor) ?? '#ffffff',
        offerWindowOpacity: parsedOfferWindowOpacity,
        offerMediaUrls:
          normalizedOfferMediaUrls === undefined ? undefined : normalizedOfferMediaUrls ?? [],
        offerMediaRotateSec: parsedOfferMediaRotateSec,
        tickerEnabled,
        tickerPosition,
        tickerShowClock,
        tickerDataSource,
        tickerCustomText: normalizedTickerCustomText,
        tickerApiUrl: normalizedTickerApiUrl,
        tickerRefreshSec: parsedTickerRefreshSec,
        tickerClockFontSize: parsedTickerClockFontSize,
        tickerFontSize: parsedTickerFontSize,
        tickerInsetPx: parsedTickerInsetPx,
        tickerOffsetPx: parsedTickerOffsetPx,
        tickerBackgroundColor:
          tickerBackgroundColor === undefined
            ? undefined
            : normalizeHexColor(tickerBackgroundColor) ?? '#111827',
        tickerTextColor:
          tickerTextColor === undefined ? undefined : normalizeHexColor(tickerTextColor) ?? '#ffffff',
      },
      create: {
        tenantId,
        title: normalizeText(title) ?? 'Klarando Menu',
        subtitle: normalizeText(subtitle),
        fontFamily: normalizeText(fontFamily) ?? 'Poppins, sans-serif',
        defaultOrientation:
          defaultOrientation && ORIENTATIONS.has(defaultOrientation)
            ? defaultOrientation
            : 'LANDSCAPE',
        defaultResolutionWidth: parsedDefaultResolutionWidth ?? 1920,
        defaultResolutionHeight: parsedDefaultResolutionHeight ?? 1080,
        productFontSize: parsedProductFontSize ?? 34,
        ingredientFontSize: parsedIngredientFontSize ?? 12,
        categoryFontSize: parsedCategoryFontSize ?? 12,
        priceFontSize: parsedPriceFontSize ?? 30,
        backgroundMode:
          backgroundMode && BACKGROUND_MODES.has(backgroundMode) ? backgroundMode : 'COLOR',
        backgroundValue: normalizeText(backgroundValue),
        backgroundMediaUrl: normalizeText(backgroundMediaUrl),
        overlayAnimation:
          overlayAnimation && OVERLAY_ANIMATIONS.has(overlayAnimation)
            ? overlayAnimation
            : 'NONE',
        cardStyle: cardStyle && CARD_STYLES.has(cardStyle) ? cardStyle : 'SOFT',
        cardPadding: parsedCardPadding ?? 16,
        cardBackgroundOpacity: parsedCardBackgroundOpacity ?? 35,
        cardBorderOpacity: parsedCardBorderOpacity ?? 20,
        productSortMode:
          productSortMode && PRODUCT_SORT_MODES.has(productSortMode)
            ? productSortMode
            : 'CUSTOM',
        defaultColumnCount: parsedDefaultColumnCount ?? 4,
        showCategoryHeaders: showCategoryHeaders ?? false,
        showCategoryOnCard: showCategoryOnCard ?? true,
        categoryUppercase: categoryUppercase ?? true,
        accentColor: normalizeHexColor(accentColor) ?? '#ea580c',
        textColor: normalizeHexColor(textColor) ?? '#ffffff',
        productNameColor: normalizeHexColor(productNameColor) ?? '#ffffff',
        ingredientTextColor: normalizeHexColor(ingredientTextColor) ?? '#e2e8f0',
        categoryTextColor: normalizeHexColor(categoryTextColor) ?? '#cbd5e1',
        priceTextColor: normalizeHexColor(priceTextColor) ?? '#ffffff',
        showAllergens: showAllergens ?? true,
        allergenLegendEnabled: allergenLegendEnabled ?? true,
        allergenLegendPosition:
          allergenLegendPosition && ALLERGEN_LEGEND_POSITIONS.has(allergenLegendPosition)
            ? allergenLegendPosition
            : 'BOTTOM_RIGHT',
        showPrices: showPrices ?? true,
        pricePinnedLeft: pricePinnedLeft ?? false,
        priceDisplayMode:
          priceDisplayMode && PRICE_DISPLAY_MODES.has(priceDisplayMode)
            ? priceDisplayMode
            : 'EUR_SUFFIX',
        showUnavailable: showUnavailable ?? false,
        showProductNumber: showProductNumber ?? false,
        logoUrl: normalizeText(logoUrl),
        logoSize: parsedLogoSize ?? 72,
        offerWindowEnabled: offerWindowEnabled ?? false,
        offerWindowTitle: normalizeText(offerWindowTitle),
        offerWindowText: normalizeText(offerWindowText),
        offerWindowPosition:
          offerWindowPosition && OFFER_WINDOW_POSITIONS.has(offerWindowPosition)
            ? offerWindowPosition
            : 'RIGHT',
        offerWindowSize:
          offerWindowSize && OFFER_WINDOW_SIZES.has(offerWindowSize) ? offerWindowSize : 'M',
        offerWindowWidthPx: parsedOfferWindowWidthPx ?? 380,
        offerWindowHeightPx: parsedOfferWindowHeightPx ?? 280,
        offerWindowXPercent: parsedOfferWindowXPercent ?? 84,
        offerWindowYPercent: parsedOfferWindowYPercent ?? 14,
        offerWindowReserveSpace: offerWindowReserveSpace ?? true,
        offerWindowBackgroundColor: normalizeHexColor(offerWindowBackgroundColor) ?? '#f97316',
        offerWindowTextColor: normalizeHexColor(offerWindowTextColor) ?? '#ffffff',
        offerWindowOpacity: parsedOfferWindowOpacity ?? 28,
        offerMediaUrls: normalizedOfferMediaUrls ?? [],
        offerMediaRotateSec: parsedOfferMediaRotateSec ?? 12,
        tickerEnabled: tickerEnabled ?? false,
        tickerPosition:
          tickerPosition && TICKER_POSITIONS.has(tickerPosition) ? tickerPosition : 'BOTTOM',
        tickerShowClock: tickerShowClock ?? true,
        tickerDataSource:
          tickerDataSource && TICKER_DATA_SOURCES.has(tickerDataSource)
            ? tickerDataSource
            : 'CUSTOM',
        tickerCustomText: normalizeText(tickerCustomText),
        tickerApiUrl: normalizeText(tickerApiUrl),
        tickerRefreshSec: parsedTickerRefreshSec ?? 180,
        tickerClockFontSize: parsedTickerClockFontSize ?? 12,
        tickerFontSize: parsedTickerFontSize ?? 14,
        tickerInsetPx: parsedTickerInsetPx ?? 0,
        tickerOffsetPx: parsedTickerOffsetPx ?? 0,
        tickerBackgroundColor: normalizeHexColor(tickerBackgroundColor) ?? '#111827',
        tickerTextColor: normalizeHexColor(tickerTextColor) ?? '#ffffff',
      },
    })

    await writeAuditLog({
      req,
      module: 'screen',
      action: 'screen_config_updated',
      targetType: 'screen_setting',
      targetId: config.id,
      tenantId,
      metadata: {
        backgroundMode: config.backgroundMode,
        overlayAnimation: config.overlayAnimation,
      },
    })

    return res.json(config)
  } catch (error) {
    console.error('UPDATE SCREEN CONFIG ERROR:', error)
    return res.status(500).json({ error: 'Bildschirm-Konfiguration konnte nicht gespeichert werden' })
  }
})

router.get('/products', requirePermission(PermissionKey.PRODUCTS_READ), async (req, res) => {
  try {
    const tenantId = req.query.tenantId as string
    const categoryId = req.query.categoryId as string | undefined
    const showOnScreenFilter = req.query.showOnScreen as string | undefined

    if (!tenantId) {
      return res.status(400).json({ error: 'tenantId fehlt' })
    }

    const products = await prisma.product.findMany({
      where: {
        tenantId,
        ...(categoryId ? { categoryId } : {}),
      },
      include: {
        category: true,
        screenSetting: true,
        modifiers: {
          where: {
            isActive: true,
          },
          select: {
            id: true,
            name: true,
            priceDelta: true,
            isDefaultSelected: true,
            isActive: true,
            sortOrder: true,
          },
          orderBy: [{ sortOrder: 'asc' }, { createdAt: 'asc' }],
        },
        ingredients: {
          select: {
            displayNameOverride: true,
            showInMenuBoard: true,
            ingredient: {
              select: {
                name: true,
                allergens: true,
                category: true,
              },
            },
          },
          orderBy: [{ createdAt: 'asc' }],
        },
      },
      orderBy: [{ createdAt: 'desc' }],
    })

    const mapped = products.map(mapScreenProduct).sort(sortScreenProducts)

    if (showOnScreenFilter === 'true') {
      return res.json(mapped.filter((entry) => entry.screen.showOnScreen))
    }

    if (showOnScreenFilter === 'false') {
      return res.json(mapped.filter((entry) => !entry.screen.showOnScreen))
    }

    return res.json(mapped)
  } catch (error) {
    console.error('GET SCREEN PRODUCTS ERROR:', error)
    return res.status(500).json({ error: 'Bildschirm-Produkte konnten nicht geladen werden' })
  }
})

router.put('/products/:productId', requirePermission(PermissionKey.PRODUCTS_WRITE), async (req, res) => {
  try {
    const productId = Array.isArray(req.params.productId) ? req.params.productId[0] : req.params.productId
    const {
      tenantId,
      displayCategory,
      sortOrder,
      showOnScreen,
      isFeatured,
      badgeText,
      highlightColor,
    } = req.body as {
      tenantId?: string
      displayCategory?: string | null
      sortOrder?: number
      showOnScreen?: boolean
      isFeatured?: boolean
      badgeText?: string | null
      highlightColor?: string | null
    }

    if (!productId || !tenantId) {
      return res.status(400).json({ error: 'productId und tenantId sind erforderlich' })
    }

    const product = await prisma.product.findUnique({
      where: { id: productId },
      select: { id: true, tenantId: true, name: true },
    })

    if (!product || product.tenantId !== tenantId) {
      return res.status(404).json({ error: 'Produkt nicht gefunden' })
    }

    const parsedSortOrder =
      sortOrder === undefined ? undefined : Number.parseInt(String(sortOrder), 10)
    if (
      parsedSortOrder !== undefined &&
      (!Number.isInteger(parsedSortOrder) || parsedSortOrder < 0 || parsedSortOrder > 9999)
    ) {
      return res.status(400).json({ error: 'sortOrder muss zwischen 0 und 9999 liegen' })
    }

    if (showOnScreen !== undefined && typeof showOnScreen !== 'boolean') {
      return res.status(400).json({ error: 'showOnScreen muss true oder false sein' })
    }

    if (isFeatured !== undefined && typeof isFeatured !== 'boolean') {
      return res.status(400).json({ error: 'isFeatured muss true oder false sein' })
    }

    if (highlightColor !== undefined && highlightColor !== null && !normalizeHexColor(highlightColor)) {
      return res.status(400).json({ error: 'highlightColor muss im Format #RRGGBB sein' })
    }

    const updated = await prisma.screenProductSetting.upsert({
      where: { productId },
      update: {
        displayCategory:
          displayCategory === undefined ? undefined : normalizeText(displayCategory),
        sortOrder: parsedSortOrder,
        showOnScreen,
        isFeatured,
        badgeText: badgeText === undefined ? undefined : normalizeText(badgeText),
        highlightColor:
          highlightColor === undefined
            ? undefined
            : normalizeHexColor(highlightColor),
      },
      create: {
        tenantId,
        productId,
        displayCategory: normalizeText(displayCategory),
        sortOrder: parsedSortOrder ?? 0,
        showOnScreen: showOnScreen ?? true,
        isFeatured: isFeatured ?? false,
        badgeText: normalizeText(badgeText),
        highlightColor: normalizeHexColor(highlightColor),
      },
    })

    const hydrated = await prisma.product.findUniqueOrThrow({
      where: { id: updated.productId },
      include: {
        category: true,
        screenSetting: true,
        modifiers: {
          where: {
            isActive: true,
          },
          select: {
            id: true,
            name: true,
            priceDelta: true,
            isDefaultSelected: true,
            isActive: true,
            sortOrder: true,
          },
          orderBy: [{ sortOrder: 'asc' }, { createdAt: 'asc' }],
        },
        ingredients: {
          select: {
            displayNameOverride: true,
            showInMenuBoard: true,
            ingredient: {
              select: {
                name: true,
                allergens: true,
                category: true,
              },
            },
          },
          orderBy: [{ createdAt: 'asc' }],
        },
      },
    })

    await writeAuditLog({
      req,
      module: 'screen',
      action: 'screen_product_updated',
      targetType: 'product',
      targetId: updated.productId,
      tenantId,
      metadata: {
        productName: product.name,
        showOnScreen: updated.showOnScreen,
        sortOrder: updated.sortOrder,
      },
    })

    return res.json(mapScreenProduct(hydrated))
  } catch (error) {
    console.error('UPDATE SCREEN PRODUCT ERROR:', error)
    return res.status(500).json({ error: 'Bildschirm-Produkt konnte nicht gespeichert werden' })
  }
})

router.get('/devices', requirePermission(PermissionKey.SETTINGS_READ), async (req, res) => {
  try {
    const tenantId = req.query.tenantId as string

    if (!tenantId) {
      return res.status(400).json({ error: 'tenantId fehlt' })
    }

    const devices = await prisma.screenDevice.findMany({
      where: { tenantId },
      orderBy: [{ name: 'asc' }],
    })

    return res.json(devices.map(mapScreenDeviceOutput))
  } catch (error) {
    console.error('GET SCREEN DEVICES ERROR:', error)
    return res.status(500).json({ error: 'Bildschirme konnten nicht geladen werden' })
  }
})

router.post('/devices', requirePermission(PermissionKey.SETTINGS_WRITE), async (req, res) => {
  try {
    const {
      tenantId,
      name,
      deviceCode,
      location,
      orientation,
      resolutionWidth,
      resolutionHeight,
      refreshIntervalSec,
      isActive,
      showPricesOverride,
      showAllergensOverride,
      showUnavailableOverride,
      showProductNumberOverride,
      offerWindowEnabledOverride,
      offerWindowPositionOverride,
      offerWindowSizeOverride,
      offerMediaUrlsOverride,
      offerMediaRotateSecOverride,
      cardStyleOverride,
      columnCountOverride,
      selectedCategoryIds,
      selectedProductIds,
      backgroundMediaUrlOverride,
      accentColorOverride,
      textColorOverride,
      notes,
    } = req.body as {
      tenantId?: string
      name?: string
      deviceCode?: string
      location?: string | null
      orientation?: string
      resolutionWidth?: number
      resolutionHeight?: number
      refreshIntervalSec?: number
      isActive?: boolean
      showPricesOverride?: boolean | null
      showAllergensOverride?: boolean | null
      showUnavailableOverride?: boolean | null
      showProductNumberOverride?: boolean | null
      offerWindowEnabledOverride?: boolean | null
      offerWindowPositionOverride?: string | null
      offerWindowSizeOverride?: string | null
      offerMediaUrlsOverride?: string[] | string | null
      offerMediaRotateSecOverride?: number | null
      cardStyleOverride?: string | null
      columnCountOverride?: number | null
      selectedCategoryIds?: string[] | string | null
      selectedProductIds?: string[] | string | null
      backgroundMediaUrlOverride?: string | null
      accentColorOverride?: string | null
      textColorOverride?: string | null
      notes?: string | null
    }

    if (!tenantId || !normalizeText(name)) {
      return res.status(400).json({ error: 'tenantId und name sind erforderlich' })
    }

    const globalDefaults = await prisma.screenSetting.upsert({
      where: { tenantId },
      update: {},
      create: { tenantId },
    })

    const normalizedOrientation = orientation ?? globalDefaults.defaultOrientation ?? 'LANDSCAPE'
    if (!ORIENTATIONS.has(normalizedOrientation)) {
      return res.status(400).json({ error: 'orientation muss LANDSCAPE oder PORTRAIT sein' })
    }

    const width =
      resolutionWidth === undefined
        ? Number(globalDefaults.defaultResolutionWidth || 1920)
        : Number(resolutionWidth)
    const height =
      resolutionHeight === undefined
        ? Number(globalDefaults.defaultResolutionHeight || 1080)
        : Number(resolutionHeight)
    const refresh = refreshIntervalSec === undefined ? 30 : Number(refreshIntervalSec)

    if (!Number.isInteger(width) || width < 320 || width > 10000) {
      return res.status(400).json({ error: 'resolutionWidth ungueltig (320-10000)' })
    }

    if (!Number.isInteger(height) || height < 240 || height > 10000) {
      return res.status(400).json({ error: 'resolutionHeight ungueltig (240-10000)' })
    }

    if (!Number.isInteger(refresh) || refresh < 5 || refresh > 3600) {
      return res.status(400).json({ error: 'refreshIntervalSec ungueltig (5-3600)' })
    }

    if (
      columnCountOverride !== undefined &&
      columnCountOverride !== null &&
      (!Number.isInteger(Number(columnCountOverride)) ||
        Number(columnCountOverride) < 1 ||
        Number(columnCountOverride) > 6)
    ) {
      return res.status(400).json({ error: 'columnCountOverride ungueltig (1-6)' })
    }

    if (
      accentColorOverride !== undefined &&
      accentColorOverride !== null &&
      !normalizeHexColor(accentColorOverride)
    ) {
      return res.status(400).json({ error: 'accentColorOverride muss #RRGGBB sein' })
    }

    if (
      textColorOverride !== undefined &&
      textColorOverride !== null &&
      !normalizeHexColor(textColorOverride)
    ) {
      return res.status(400).json({ error: 'textColorOverride muss #RRGGBB sein' })
    }

    if (
      offerWindowPositionOverride !== undefined &&
      offerWindowPositionOverride !== null &&
      !OFFER_WINDOW_POSITIONS.has(offerWindowPositionOverride)
    ) {
      return res.status(400).json({ error: 'offerWindowPositionOverride ungueltig' })
    }

    if (
      offerWindowSizeOverride !== undefined &&
      offerWindowSizeOverride !== null &&
      !OFFER_WINDOW_SIZES.has(offerWindowSizeOverride)
    ) {
      return res.status(400).json({ error: 'offerWindowSizeOverride ungueltig' })
    }

    if (
      cardStyleOverride !== undefined &&
      cardStyleOverride !== null &&
      !CARD_STYLES.has(cardStyleOverride)
    ) {
      return res.status(400).json({ error: 'cardStyleOverride ungueltig' })
    }

    const normalizedCode = normalizeText(deviceCode) ?? (await createUniqueDeviceCode())
    const normalizedCategoryIds =
      selectedCategoryIds === undefined ? undefined : normalizeIdList(selectedCategoryIds)
    const normalizedProductIds =
      selectedProductIds === undefined ? undefined : normalizeIdList(selectedProductIds)
    const normalizedOfferMediaUrlsOverride =
      offerMediaUrlsOverride === undefined
        ? undefined
        : normalizeStringListInput(offerMediaUrlsOverride)

    if (normalizedCategoryIds && normalizedCategoryIds.length > 0) {
      const categoryCount = await prisma.category.count({
        where: {
          tenantId,
          id: { in: normalizedCategoryIds },
        },
      })
      if (categoryCount !== normalizedCategoryIds.length) {
        return res.status(400).json({ error: 'Mindestens eine Kategorie-Zuordnung ist ungueltig' })
      }
    }

    if (normalizedProductIds && normalizedProductIds.length > 0) {
      const productCount = await prisma.product.count({
        where: {
          tenantId,
          id: { in: normalizedProductIds },
        },
      })
      if (productCount !== normalizedProductIds.length) {
        return res.status(400).json({ error: 'Mindestens eine Produkt-Zuordnung ist ungueltig' })
      }
    }

    const parsedColumnCountOverride =
      columnCountOverride === undefined
        ? undefined
        : columnCountOverride === null
        ? null
        : clampInt(Number(columnCountOverride), 1, 6)
    const parsedOfferMediaRotateSecOverride =
      offerMediaRotateSecOverride === undefined
        ? undefined
        : offerMediaRotateSecOverride === null
        ? null
        : clampInt(Number(offerMediaRotateSecOverride), 3, 120)

    const device = await prisma.screenDevice.create({
      data: {
        tenantId,
        name: normalizeText(name) ?? 'Bildschirm',
        deviceCode: normalizedCode.toUpperCase(),
        location: normalizeText(location),
        orientation: normalizedOrientation,
        resolutionWidth: width,
        resolutionHeight: height,
        refreshIntervalSec: refresh,
        isActive: isActive ?? true,
        showPricesOverride: showPricesOverride ?? null,
        showAllergensOverride: showAllergensOverride ?? null,
        showUnavailableOverride: showUnavailableOverride ?? null,
        showProductNumberOverride: showProductNumberOverride ?? null,
        offerWindowEnabledOverride: offerWindowEnabledOverride ?? null,
        offerWindowPositionOverride: offerWindowPositionOverride ?? null,
        offerWindowSizeOverride: offerWindowSizeOverride ?? null,
        offerMediaUrlsOverride: normalizedOfferMediaUrlsOverride ?? [],
        offerMediaRotateSecOverride: parsedOfferMediaRotateSecOverride ?? null,
        cardStyleOverride: cardStyleOverride ?? null,
        columnCountOverride: parsedColumnCountOverride ?? null,
        selectedCategoryIds: serializeIdList(normalizedCategoryIds || []),
        selectedProductIds: serializeIdList(normalizedProductIds || []),
        backgroundMediaUrlOverride: normalizeText(backgroundMediaUrlOverride),
        accentColorOverride: normalizeHexColor(accentColorOverride),
        textColorOverride: normalizeHexColor(textColorOverride),
        notes: normalizeText(notes),
      },
    })

    await writeAuditLog({
      req,
      module: 'screen',
      action: 'screen_device_created',
      targetType: 'screen_device',
      targetId: device.id,
      tenantId,
      metadata: {
        name: device.name,
        deviceCode: device.deviceCode,
      },
    })

    return res.status(201).json(mapScreenDeviceOutput(device))
  } catch (error) {
    console.error('CREATE SCREEN DEVICE ERROR:', error)
    return res.status(500).json({ error: 'Bildschirm konnte nicht erstellt werden' })
  }
})

router.patch('/devices/:id', requirePermission(PermissionKey.SETTINGS_WRITE), async (req, res) => {
  try {
    const id = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id
    const {
      tenantId,
      name,
      location,
      orientation,
      resolutionWidth,
      resolutionHeight,
      refreshIntervalSec,
      isActive,
      showPricesOverride,
      showAllergensOverride,
      showUnavailableOverride,
      showProductNumberOverride,
      offerWindowEnabledOverride,
      offerWindowPositionOverride,
      offerWindowSizeOverride,
      offerMediaUrlsOverride,
      offerMediaRotateSecOverride,
      cardStyleOverride,
      columnCountOverride,
      selectedCategoryIds,
      selectedProductIds,
      backgroundMediaUrlOverride,
      accentColorOverride,
      textColorOverride,
      notes,
    } = req.body as {
      tenantId?: string
      name?: string
      location?: string | null
      orientation?: string
      resolutionWidth?: number
      resolutionHeight?: number
      refreshIntervalSec?: number
      isActive?: boolean
      showPricesOverride?: boolean | null
      showAllergensOverride?: boolean | null
      showUnavailableOverride?: boolean | null
      showProductNumberOverride?: boolean | null
      offerWindowEnabledOverride?: boolean | null
      offerWindowPositionOverride?: string | null
      offerWindowSizeOverride?: string | null
      offerMediaUrlsOverride?: string[] | string | null
      offerMediaRotateSecOverride?: number | null
      cardStyleOverride?: string | null
      columnCountOverride?: number | null
      selectedCategoryIds?: string[] | string | null
      selectedProductIds?: string[] | string | null
      backgroundMediaUrlOverride?: string | null
      accentColorOverride?: string | null
      textColorOverride?: string | null
      notes?: string | null
    }

    if (!id || !tenantId) {
      return res.status(400).json({ error: 'id und tenantId sind erforderlich' })
    }

    const existing = await prisma.screenDevice.findUnique({
      where: { id },
      select: { id: true, tenantId: true, name: true },
    })

    if (!existing || existing.tenantId !== tenantId) {
      return res.status(404).json({ error: 'Bildschirm nicht gefunden' })
    }

    if (orientation !== undefined && !ORIENTATIONS.has(orientation)) {
      return res.status(400).json({ error: 'orientation muss LANDSCAPE oder PORTRAIT sein' })
    }

    if (
      resolutionWidth !== undefined &&
      (!Number.isInteger(Number(resolutionWidth)) || Number(resolutionWidth) < 320 || Number(resolutionWidth) > 10000)
    ) {
      return res.status(400).json({ error: 'resolutionWidth ungueltig (320-10000)' })
    }

    if (
      resolutionHeight !== undefined &&
      (!Number.isInteger(Number(resolutionHeight)) || Number(resolutionHeight) < 240 || Number(resolutionHeight) > 10000)
    ) {
      return res.status(400).json({ error: 'resolutionHeight ungueltig (240-10000)' })
    }

    if (
      refreshIntervalSec !== undefined &&
      (!Number.isInteger(Number(refreshIntervalSec)) || Number(refreshIntervalSec) < 5 || Number(refreshIntervalSec) > 3600)
    ) {
      return res.status(400).json({ error: 'refreshIntervalSec ungueltig (5-3600)' })
    }

    if (
      columnCountOverride !== undefined &&
      columnCountOverride !== null &&
      (!Number.isInteger(Number(columnCountOverride)) ||
        Number(columnCountOverride) < 1 ||
        Number(columnCountOverride) > 6)
    ) {
      return res.status(400).json({ error: 'columnCountOverride ungueltig (1-6)' })
    }

    if (
      accentColorOverride !== undefined &&
      accentColorOverride !== null &&
      !normalizeHexColor(accentColorOverride)
    ) {
      return res.status(400).json({ error: 'accentColorOverride muss #RRGGBB sein' })
    }

    if (
      textColorOverride !== undefined &&
      textColorOverride !== null &&
      !normalizeHexColor(textColorOverride)
    ) {
      return res.status(400).json({ error: 'textColorOverride muss #RRGGBB sein' })
    }

    if (
      offerWindowPositionOverride !== undefined &&
      offerWindowPositionOverride !== null &&
      !OFFER_WINDOW_POSITIONS.has(offerWindowPositionOverride)
    ) {
      return res.status(400).json({ error: 'offerWindowPositionOverride ungueltig' })
    }

    if (
      offerWindowSizeOverride !== undefined &&
      offerWindowSizeOverride !== null &&
      !OFFER_WINDOW_SIZES.has(offerWindowSizeOverride)
    ) {
      return res.status(400).json({ error: 'offerWindowSizeOverride ungueltig' })
    }

    if (
      cardStyleOverride !== undefined &&
      cardStyleOverride !== null &&
      !CARD_STYLES.has(cardStyleOverride)
    ) {
      return res.status(400).json({ error: 'cardStyleOverride ungueltig' })
    }

    const parsedColumnCountOverride =
      columnCountOverride === undefined
        ? undefined
        : columnCountOverride === null
        ? null
        : clampInt(Number(columnCountOverride), 1, 6)
    const parsedOfferMediaRotateSecOverride =
      offerMediaRotateSecOverride === undefined
        ? undefined
        : offerMediaRotateSecOverride === null
        ? null
        : clampInt(Number(offerMediaRotateSecOverride), 3, 120)
    const normalizedCategoryIds =
      selectedCategoryIds === undefined ? undefined : normalizeIdList(selectedCategoryIds)
    const normalizedProductIds =
      selectedProductIds === undefined ? undefined : normalizeIdList(selectedProductIds)
    const normalizedOfferMediaUrlsOverride =
      offerMediaUrlsOverride === undefined
        ? undefined
        : normalizeStringListInput(offerMediaUrlsOverride)

    if (normalizedCategoryIds && normalizedCategoryIds.length > 0) {
      const categoryCount = await prisma.category.count({
        where: {
          tenantId,
          id: { in: normalizedCategoryIds },
        },
      })
      if (categoryCount !== normalizedCategoryIds.length) {
        return res.status(400).json({ error: 'Mindestens eine Kategorie-Zuordnung ist ungueltig' })
      }
    }

    if (normalizedProductIds && normalizedProductIds.length > 0) {
      const productCount = await prisma.product.count({
        where: {
          tenantId,
          id: { in: normalizedProductIds },
        },
      })
      if (productCount !== normalizedProductIds.length) {
        return res.status(400).json({ error: 'Mindestens eine Produkt-Zuordnung ist ungueltig' })
      }
    }

    const updated = await prisma.screenDevice.update({
      where: { id },
      data: {
        name: name === undefined ? undefined : normalizeText(name) ?? undefined,
        location: location === undefined ? undefined : normalizeText(location),
        orientation,
        resolutionWidth:
          resolutionWidth === undefined ? undefined : Number(resolutionWidth),
        resolutionHeight:
          resolutionHeight === undefined ? undefined : Number(resolutionHeight),
        refreshIntervalSec:
          refreshIntervalSec === undefined ? undefined : Number(refreshIntervalSec),
        isActive,
        showPricesOverride:
          showPricesOverride === undefined ? undefined : showPricesOverride,
        showAllergensOverride:
          showAllergensOverride === undefined ? undefined : showAllergensOverride,
        showUnavailableOverride:
          showUnavailableOverride === undefined ? undefined : showUnavailableOverride,
        showProductNumberOverride:
          showProductNumberOverride === undefined ? undefined : showProductNumberOverride,
        offerWindowEnabledOverride:
          offerWindowEnabledOverride === undefined
            ? undefined
            : offerWindowEnabledOverride,
        offerWindowPositionOverride:
          offerWindowPositionOverride === undefined ? undefined : offerWindowPositionOverride,
        offerWindowSizeOverride:
          offerWindowSizeOverride === undefined ? undefined : offerWindowSizeOverride,
        offerMediaUrlsOverride:
          offerMediaUrlsOverride === undefined
            ? undefined
            : normalizedOfferMediaUrlsOverride ?? [],
        offerMediaRotateSecOverride: parsedOfferMediaRotateSecOverride,
        cardStyleOverride:
          cardStyleOverride === undefined ? undefined : cardStyleOverride,
        columnCountOverride: parsedColumnCountOverride,
        selectedCategoryIds:
          selectedCategoryIds === undefined
            ? undefined
            : serializeIdList(normalizedCategoryIds || []),
        selectedProductIds:
          selectedProductIds === undefined
            ? undefined
            : serializeIdList(normalizedProductIds || []),
        backgroundMediaUrlOverride:
          backgroundMediaUrlOverride === undefined
            ? undefined
            : normalizeText(backgroundMediaUrlOverride),
        accentColorOverride:
          accentColorOverride === undefined
            ? undefined
            : normalizeHexColor(accentColorOverride),
        textColorOverride:
          textColorOverride === undefined
            ? undefined
            : normalizeHexColor(textColorOverride),
        notes: notes === undefined ? undefined : normalizeText(notes),
      },
    })

    await writeAuditLog({
      req,
      module: 'screen',
      action: 'screen_device_updated',
      targetType: 'screen_device',
      targetId: updated.id,
      tenantId,
      metadata: {
        name: updated.name,
        isActive: updated.isActive,
      },
    })

    return res.json(mapScreenDeviceOutput(updated))
  } catch (error) {
    console.error('UPDATE SCREEN DEVICE ERROR:', error)
    return res.status(500).json({ error: 'Bildschirm konnte nicht aktualisiert werden' })
  }
})

router.delete('/devices/:id', requirePermission(PermissionKey.SETTINGS_WRITE), async (req, res) => {
  try {
    const id = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id
    const tenantId = req.query.tenantId as string

    if (!id || !tenantId) {
      return res.status(400).json({ error: 'id und tenantId sind erforderlich' })
    }

    const existing = await prisma.screenDevice.findUnique({
      where: { id },
      select: { id: true, tenantId: true, name: true },
    })

    if (!existing || existing.tenantId !== tenantId) {
      return res.status(404).json({ error: 'Bildschirm nicht gefunden' })
    }

    await prisma.screenDevice.delete({
      where: { id },
    })

    await writeAuditLog({
      req,
      module: 'screen',
      action: 'screen_device_deleted',
      targetType: 'screen_device',
      targetId: existing.id,
      tenantId,
      metadata: {
        name: existing.name,
      },
    })

    return res.json({ ok: true })
  } catch (error) {
    console.error('DELETE SCREEN DEVICE ERROR:', error)
    return res.status(500).json({ error: 'Bildschirm konnte nicht geloescht werden' })
  }
})

router.get('/public/devices/:deviceCode/feed', async (req, res) => {
  try {
    res.setHeader('Cache-Control', 'no-store, no-cache, must-revalidate, proxy-revalidate')
    res.setHeader('Pragma', 'no-cache')
    res.setHeader('Expires', '0')
    const deviceCode = Array.isArray(req.params.deviceCode) ? req.params.deviceCode[0] : req.params.deviceCode
    if (!deviceCode) {
      return res.status(400).json({ error: 'deviceCode fehlt' })
    }

    const device = await prisma.screenDevice.findUnique({
      where: { deviceCode: deviceCode.toUpperCase() },
    })

    if (!device) {
      return res.status(404).json({ error: 'Bildschirm-Code nicht gefunden' })
    }

    if (!device.isActive) {
      return res.status(403).json({ error: 'Bildschirm ist deaktiviert' })
    }

    const baseConfig = await prisma.screenSetting.upsert({
      where: { tenantId: device.tenantId },
      update: {},
      create: { tenantId: device.tenantId },
    })

    const productsRaw = await prisma.product.findMany({
      where: {
        tenantId: device.tenantId,
      },
      include: {
        category: true,
        screenSetting: true,
        modifiers: {
          where: {
            isActive: true,
          },
          select: {
            id: true,
            name: true,
            priceDelta: true,
            isDefaultSelected: true,
            isActive: true,
            sortOrder: true,
          },
          orderBy: [{ sortOrder: 'asc' }, { createdAt: 'asc' }],
        },
        ingredients: {
          select: {
            displayNameOverride: true,
            showInMenuBoard: true,
            ingredient: {
              select: {
                name: true,
                allergens: true,
                category: true,
              },
            },
          },
          orderBy: [{ createdAt: 'asc' }],
        },
      },
      orderBy: [{ createdAt: 'desc' }],
    })

    const loadActiveActions = () =>
      prisma.action.findMany({
        where: {
          tenantId: device.tenantId,
          isActive: true,
        },
        include: {
          products: {
            include: {
              product: {
                select: {
                  id: true,
                  name: true,
                  productNumber: true,
                  price: true,
                  available: true,
                  imageUrl: true,
                },
              },
            },
            orderBy: [{ createdAt: 'asc' }],
          },
        },
        orderBy: [{ createdAt: 'desc' }],
        take: 24,
      })

    let actionsRaw
    try {
      actionsRaw = await loadActiveActions()
    } catch (loadError) {
      if (!isMissingActionColumnsError(loadError)) {
        throw loadError
      }
      await ensureActionColumns()
      actionsRaw = await loadActiveActions()
    }

    const now = new Date()
    const activeActions = actionsRaw
      .filter((action) => isActionCurrentlyActiveForFeed(action, now))
      .map((action) => {
        const numericValue = Number(action.value)
        const safeValue = Number.isFinite(numericValue) ? numericValue : 0
        const products = action.products.map((entry) => ({
          productId: entry.productId,
          name: entry.product.name,
          productNumber: entry.product.productNumber,
          available: entry.product.available,
          price: Number(entry.product.price).toFixed(2),
          imageUrl: entry.product.imageUrl,
        }))
        const priceLabel = action.hidePriceOnScreen
          ? null
          : action.valueType === ActionValueType.FIXED_PRICE
            ? `${safeValue.toFixed(2)} EUR`
            : `-${safeValue.toFixed(2)} %`

        return {
          id: action.id,
          name: action.name,
          description: action.description,
          imageUrl: action.imageUrl,
          displayAsMenu: action.displayAsMenu,
          hidePriceOnScreen: action.hidePriceOnScreen,
          valueType: action.valueType,
          value: safeValue.toFixed(2),
          priceLabel,
          productCount: products.length,
          products,
        }
      })

    const baseOfferMediaUrls = parseJsonStringList(baseConfig.offerMediaUrls)
    const deviceOfferMediaUrls = parseJsonStringList(device.offerMediaUrlsOverride)

    const effectiveConfig = {
      ...baseConfig,
      showPrices:
        device.showPricesOverride === null
          ? baseConfig.showPrices
          : device.showPricesOverride,
      showAllergens:
        device.showAllergensOverride === null
          ? baseConfig.showAllergens
          : device.showAllergensOverride,
      showUnavailable:
        device.showUnavailableOverride === null
          ? baseConfig.showUnavailable
          : device.showUnavailableOverride,
      showProductNumber:
        device.showProductNumberOverride === null
          ? baseConfig.showProductNumber
          : device.showProductNumberOverride,
      offerWindowEnabled:
        device.offerWindowEnabledOverride === null
          ? baseConfig.offerWindowEnabled
          : device.offerWindowEnabledOverride,
      offerWindowPosition:
        device.offerWindowPositionOverride === null
          ? baseConfig.offerWindowPosition
          : device.offerWindowPositionOverride,
      offerWindowSize:
        device.offerWindowSizeOverride === null
          ? baseConfig.offerWindowSize
          : device.offerWindowSizeOverride,
      offerMediaUrls:
        device.offerMediaUrlsOverride === null ? baseOfferMediaUrls : deviceOfferMediaUrls,
      offerMediaRotateSec:
        device.offerMediaRotateSecOverride === null
          ? baseConfig.offerMediaRotateSec
          : device.offerMediaRotateSecOverride,
      cardStyle:
        device.cardStyleOverride === null ? baseConfig.cardStyle : device.cardStyleOverride,
      defaultColumnCount:
        device.columnCountOverride === null
          ? baseConfig.defaultColumnCount
          : device.columnCountOverride,
      backgroundMediaUrl:
        device.backgroundMediaUrlOverride ?? baseConfig.backgroundMediaUrl,
      accentColor: device.accentColorOverride ?? baseConfig.accentColor,
      textColor: device.textColorOverride ?? baseConfig.textColor,
    }
    const selectedCategoryIds = parseStoredIdList(device.selectedCategoryIds)
    const selectedProductIds = parseStoredIdList(device.selectedProductIds)

    const products = productsRaw
      .map(mapScreenProduct)
      .filter((product) => product.screen.showOnScreen)
      .filter((product) => effectiveConfig.showUnavailable || product.available)
      .filter((product) => {
        if (selectedProductIds.length > 0) {
          return selectedProductIds.includes(product.id)
        }
        if (selectedCategoryIds.length > 0) {
          return product.category ? selectedCategoryIds.includes(product.category.id) : false
        }
        return true
      })
      .sort((left, right) =>
        sortScreenProducts(left, right, effectiveConfig.productSortMode)
      )

    const announcementNow = new Date()
    const pickupAnnouncementsRaw = await prisma.order.findMany({
      where: {
        tenantId: device.tenantId,
        status: 'done',
        pickupNumber: {
          not: null,
        },
        pickupAnnounceUntil: {
          gt: announcementNow,
        },
      },
      select: {
        id: true,
        pickupNumber: true,
        pickupAnnouncedAt: true,
        pickupAnnounceUntil: true,
        terminal: {
          select: {
            id: true,
            name: true,
            terminalCode: true,
            location: true,
          },
        },
        pickupDisplay: {
          select: {
            id: true,
            name: true,
            displayCode: true,
          },
        },
      },
      orderBy: [{ pickupAnnouncedAt: 'desc' }, { createdAt: 'desc' }],
      take: 6,
    })

    const pickupAnnouncements = pickupAnnouncementsRaw
      .filter((entry) => entry.pickupNumber !== null)
      .map((entry) => ({
        orderId: entry.id,
        pickupNumber: entry.pickupNumber as number,
        announcedAt: entry.pickupAnnouncedAt,
        announceUntil: entry.pickupAnnounceUntil,
        terminal: entry.terminal,
        pickupDisplay: entry.pickupDisplay,
      }))

    await prisma.screenDevice.update({
      where: { id: device.id },
      data: { lastSeenAt: new Date() },
    })

    return res.json({
      status: device.isActive ? 'online' : 'inactive',
      serverTime: new Date().toISOString(),
      device: {
        id: device.id,
        name: device.name,
        location: device.location,
        deviceCode: device.deviceCode,
        orientation: device.orientation,
        resolutionWidth: device.resolutionWidth,
        resolutionHeight: device.resolutionHeight,
        refreshIntervalSec: device.refreshIntervalSec,
        selectedCategoryIds,
        selectedProductIds,
      },
      config: effectiveConfig,
      products,
      activeActions,
      pickupAnnouncements,
      generatedAt: new Date().toISOString(),
    })
  } catch (error) {
    console.error('GET PUBLIC SCREEN FEED ERROR:', error)
    return res.status(500).json({ error: 'Bildschirm-Feed konnte nicht geladen werden' })
  }
})

export default router
