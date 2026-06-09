export type ProductBadgeKey =
  | 'VEGAN'
  | 'VEGETARIAN'
  | 'HALAL'
  | 'GLUTEN_FREE'
  | 'LACTOSE_FREE'
  | 'SPICY'
  | 'VERY_SPICY'
  | 'NEW'
  | 'POPULAR'
  | 'BESTSELLER'
  | 'RECOMMENDED'
  | 'LIMITED'
  | 'CAFFEINE'
  | 'ALCOHOL'
  | 'AGE_16'
  | 'AGE_18'
  | 'ORGANIC'
  | 'REGIONAL'

export type ProductBadgeCategory =
  | 'diet'
  | 'spice'
  | 'marketing'
  | 'ingredient'
  | 'age'
  | 'origin'

export type ProductBadgeIconKey =
  | 'leaf'
  | 'sprout'
  | 'shield-check'
  | 'grain-off'
  | 'milk-off'
  | 'chili'
  | 'flame'
  | 'sparkle'
  | 'star'
  | 'chef-hat'
  | 'clock'
  | 'coffee'
  | 'glass'
  | 'age-16'
  | 'age-18'
  | 'badge-organic'
  | 'pin'

export type ProductBadgeColorName =
  | 'green'
  | 'lime'
  | 'teal'
  | 'yellow'
  | 'sky'
  | 'red'
  | 'darkRed'
  | 'blue'
  | 'gold'
  | 'orange'
  | 'indigo'
  | 'gray'
  | 'brown'

export interface ProductBadgeConfig {
  key: ProductBadgeKey
  label: string
  shortLabel: string
  category: ProductBadgeCategory
  iconKey: ProductBadgeIconKey
  fallbackIcon: string
  colorName: ProductBadgeColorName
  sortOrder: number
  description?: string
}

export interface ProductBadgeStyleToken {
  pillClassName: string
  iconClassName: string
  accentRingClassName?: string
}

export const PRODUCT_BADGES: Record<ProductBadgeKey, ProductBadgeConfig> = {
  VEGAN: {
    key: 'VEGAN',
    label: 'Vegan',
    shortLabel: 'Vegan',
    category: 'diet',
    iconKey: 'leaf',
    fallbackIcon: 'V',
    colorName: 'green',
    sortOrder: 10,
  },
  VEGETARIAN: {
    key: 'VEGETARIAN',
    label: 'Vegetarisch',
    shortLabel: 'Veggie',
    category: 'diet',
    iconKey: 'sprout',
    fallbackIcon: 'VG',
    colorName: 'lime',
    sortOrder: 20,
  },
  HALAL: {
    key: 'HALAL',
    label: 'Halal',
    shortLabel: 'Halal',
    category: 'diet',
    iconKey: 'shield-check',
    fallbackIcon: 'H',
    colorName: 'teal',
    sortOrder: 30,
  },
  GLUTEN_FREE: {
    key: 'GLUTEN_FREE',
    label: 'Glutenfrei',
    shortLabel: 'Glutenfrei',
    category: 'diet',
    iconKey: 'grain-off',
    fallbackIcon: 'GF',
    colorName: 'yellow',
    sortOrder: 40,
  },
  LACTOSE_FREE: {
    key: 'LACTOSE_FREE',
    label: 'Laktosefrei',
    shortLabel: 'Laktosefrei',
    category: 'diet',
    iconKey: 'milk-off',
    fallbackIcon: 'LF',
    colorName: 'sky',
    sortOrder: 50,
  },
  SPICY: {
    key: 'SPICY',
    label: 'Scharf',
    shortLabel: 'Scharf',
    category: 'spice',
    iconKey: 'chili',
    fallbackIcon: 'S',
    colorName: 'red',
    sortOrder: 100,
  },
  VERY_SPICY: {
    key: 'VERY_SPICY',
    label: 'Sehr scharf',
    shortLabel: 'Sehr scharf',
    category: 'spice',
    iconKey: 'flame',
    fallbackIcon: 'SS',
    colorName: 'darkRed',
    sortOrder: 110,
  },
  NEW: {
    key: 'NEW',
    label: 'Neu',
    shortLabel: 'Neu',
    category: 'marketing',
    iconKey: 'sparkle',
    fallbackIcon: 'N',
    colorName: 'blue',
    sortOrder: 200,
  },
  POPULAR: {
    key: 'POPULAR',
    label: 'Beliebt',
    shortLabel: 'Beliebt',
    category: 'marketing',
    iconKey: 'star',
    fallbackIcon: 'B',
    colorName: 'gold',
    sortOrder: 210,
  },
  BESTSELLER: {
    key: 'BESTSELLER',
    label: 'Bestseller',
    shortLabel: 'Bestseller',
    category: 'marketing',
    iconKey: 'flame',
    fallbackIcon: 'BS',
    colorName: 'orange',
    sortOrder: 220,
  },
  RECOMMENDED: {
    key: 'RECOMMENDED',
    label: 'Empfehlung',
    shortLabel: 'Empfohlen',
    category: 'marketing',
    iconKey: 'chef-hat',
    fallbackIcon: 'E',
    colorName: 'indigo',
    sortOrder: 230,
  },
  LIMITED: {
    key: 'LIMITED',
    label: 'Limitiert',
    shortLabel: 'Limitiert',
    category: 'marketing',
    iconKey: 'clock',
    fallbackIcon: 'L',
    colorName: 'gray',
    sortOrder: 240,
  },
  CAFFEINE: {
    key: 'CAFFEINE',
    label: 'Koffeinhaltig',
    shortLabel: 'Koffein',
    category: 'ingredient',
    iconKey: 'coffee',
    fallbackIcon: 'K',
    colorName: 'brown',
    sortOrder: 300,
  },
  ALCOHOL: {
    key: 'ALCOHOL',
    label: 'Alkoholhaltig',
    shortLabel: 'Alkohol',
    category: 'ingredient',
    iconKey: 'glass',
    fallbackIcon: 'A',
    colorName: 'orange',
    sortOrder: 310,
  },
  AGE_16: {
    key: 'AGE_16',
    label: 'Ab 16 Jahren',
    shortLabel: '16+',
    category: 'age',
    iconKey: 'age-16',
    fallbackIcon: '16+',
    colorName: 'orange',
    sortOrder: 400,
  },
  AGE_18: {
    key: 'AGE_18',
    label: 'Ab 18 Jahren',
    shortLabel: '18+',
    category: 'age',
    iconKey: 'age-18',
    fallbackIcon: '18+',
    colorName: 'darkRed',
    sortOrder: 410,
  },
  ORGANIC: {
    key: 'ORGANIC',
    label: 'Bio',
    shortLabel: 'Bio',
    category: 'origin',
    iconKey: 'badge-organic',
    fallbackIcon: 'Bio',
    colorName: 'green',
    sortOrder: 500,
  },
  REGIONAL: {
    key: 'REGIONAL',
    label: 'Regional',
    shortLabel: 'Regional',
    category: 'origin',
    iconKey: 'pin',
    fallbackIcon: 'R',
    colorName: 'brown',
    sortOrder: 510,
  },
}

export const PRODUCT_BADGE_ORDER = Object.values(PRODUCT_BADGES)
  .sort((left, right) => left.sortOrder - right.sortOrder)
  .map((entry) => entry.key)

export const PRODUCT_BADGE_GROUPS: Array<{
  category: ProductBadgeCategory
  label: string
  badges: ProductBadgeKey[]
}> = [
  {
    category: 'diet',
    label: 'Ernährung',
    badges: ['VEGAN', 'VEGETARIAN', 'HALAL', 'GLUTEN_FREE', 'LACTOSE_FREE'],
  },
  {
    category: 'spice',
    label: 'Schärfe',
    badges: ['SPICY', 'VERY_SPICY'],
  },
  {
    category: 'marketing',
    label: 'Marketing',
    badges: ['NEW', 'POPULAR', 'BESTSELLER', 'RECOMMENDED', 'LIMITED'],
  },
  {
    category: 'ingredient',
    label: 'Inhaltsstoffe',
    badges: ['CAFFEINE', 'ALCOHOL'],
  },
  {
    category: 'age',
    label: 'Jugendschutz',
    badges: ['AGE_16', 'AGE_18'],
  },
  {
    category: 'origin',
    label: 'Herkunft / Nachhaltigkeit',
    badges: ['ORGANIC', 'REGIONAL'],
  },
]

export const PRODUCT_BADGE_STYLE_TOKENS: Record<ProductBadgeColorName, ProductBadgeStyleToken> = {
  green: {
    pillClassName: 'border-emerald-200 bg-emerald-50 text-emerald-800',
    iconClassName: 'text-emerald-700',
  },
  lime: {
    pillClassName: 'border-lime-200 bg-lime-50 text-lime-800',
    iconClassName: 'text-lime-700',
  },
  teal: {
    pillClassName: 'border-teal-200 bg-teal-50 text-teal-800',
    iconClassName: 'text-teal-700',
  },
  yellow: {
    pillClassName: 'border-amber-200 bg-amber-50 text-amber-900',
    iconClassName: 'text-amber-700',
  },
  sky: {
    pillClassName: 'border-sky-200 bg-sky-50 text-sky-800',
    iconClassName: 'text-sky-700',
  },
  red: {
    pillClassName: 'border-red-200 bg-red-50 text-red-800',
    iconClassName: 'text-red-700',
  },
  darkRed: {
    pillClassName: 'border-rose-300 bg-rose-100 text-rose-900',
    iconClassName: 'text-rose-800',
    accentRingClassName: 'ring-1 ring-rose-200/80',
  },
  blue: {
    pillClassName: 'border-blue-200 bg-blue-50 text-blue-800',
    iconClassName: 'text-blue-700',
  },
  gold: {
    pillClassName: 'border-yellow-200 bg-yellow-50 text-yellow-800',
    iconClassName: 'text-yellow-700',
  },
  orange: {
    pillClassName: 'border-orange-200 bg-orange-50 text-orange-800',
    iconClassName: 'text-orange-700',
  },
  indigo: {
    pillClassName: 'border-indigo-200 bg-indigo-50 text-indigo-800',
    iconClassName: 'text-indigo-700',
  },
  gray: {
    pillClassName: 'border-slate-200 bg-slate-50 text-slate-700',
    iconClassName: 'text-slate-600',
  },
  brown: {
    pillClassName: 'border-stone-200 bg-stone-50 text-stone-800',
    iconClassName: 'text-stone-700',
  },
}

type LegacyBadgeInput = {
  badges?: unknown
  labels?: unknown
  ageRestriction?: unknown
  isVegetarian?: unknown
  isVegan?: unknown
  isSpicy?: unknown
  isVerySpicy?: unknown
  isNew?: unknown
  isPopular?: unknown
}

export function isProductBadgeKey(value: unknown): value is ProductBadgeKey {
  return typeof value === 'string' && value.trim().toUpperCase() in PRODUCT_BADGES
}

export function sanitizeProductBadgeKeys(value: unknown): ProductBadgeKey[] {
  if (!Array.isArray(value)) {
    return []
  }

  const deduped = new Set<ProductBadgeKey>()
  for (const entry of value) {
    if (!isProductBadgeKey(entry)) {
      continue
    }
    deduped.add(entry.trim().toUpperCase() as ProductBadgeKey)
  }

  return sortProductBadgeKeys(Array.from(deduped))
}

export function sortProductBadgeKeys(badges: ProductBadgeKey[]) {
  return [...badges].sort(
    (left, right) => PRODUCT_BADGES[left].sortOrder - PRODUCT_BADGES[right].sortOrder
  )
}

export function normalizeProductBadges(product: LegacyBadgeInput): ProductBadgeKey[] {
  const next = new Set<ProductBadgeKey>()

  for (const key of sanitizeProductBadgeKeys(product.badges ?? product.labels ?? [])) {
    next.add(key)
  }

  if (product.isVegan === true) next.add('VEGAN')
  if (product.isVegetarian === true) next.add('VEGETARIAN')
  if (product.isSpicy === true) next.add('SPICY')
  if (product.isVerySpicy === true) next.add('VERY_SPICY')
  if (product.isNew === true) next.add('NEW')
  if (product.isPopular === true) next.add('POPULAR')

  if (product.ageRestriction === 'AGE_16') next.add('AGE_16')
  if (product.ageRestriction === 'AGE_18') next.add('AGE_18')

  if (next.has('AGE_18')) {
    next.delete('AGE_16')
  }

  return sortProductBadgeKeys(Array.from(next))
}

export function getAgeRestrictionFromBadges(
  badges: ProductBadgeKey[]
): 'NONE' | 'AGE_16' | 'AGE_18' {
  if (badges.includes('AGE_18')) {
    return 'AGE_18'
  }
  if (badges.includes('AGE_16')) {
    return 'AGE_16'
  }
  return 'NONE'
}

export function getLegacyProductBadgeFlags(badges: ProductBadgeKey[]) {
  return {
    ageRestriction: getAgeRestrictionFromBadges(badges),
    isVegetarian: badges.includes('VEGETARIAN'),
    isVegan: badges.includes('VEGAN'),
    isSpicy: badges.includes('SPICY'),
    isVerySpicy: badges.includes('VERY_SPICY'),
    isNew: badges.includes('NEW'),
    isPopular: badges.includes('POPULAR'),
  }
}

export function toggleProductBadgeSelection(
  currentBadges: ProductBadgeKey[],
  badgeKey: ProductBadgeKey,
  checked: boolean
) {
  const next = new Set<ProductBadgeKey>(currentBadges)

  if (checked) {
    next.add(badgeKey)
    if (badgeKey === 'AGE_16') {
      next.delete('AGE_18')
    }
    if (badgeKey === 'AGE_18') {
      next.delete('AGE_16')
    }
  } else {
    next.delete(badgeKey)
  }

  return sortProductBadgeKeys(Array.from(next))
}

export function requiresAgeCheck(product: LegacyBadgeInput) {
  return getRequiredAge(product) !== null
}

export function getRequiredAge(product: LegacyBadgeInput): 16 | 18 | null {
  const badges = normalizeProductBadges(product)
  if (badges.includes('AGE_18')) {
    return 18
  }
  if (badges.includes('AGE_16')) {
    return 16
  }
  return null
}
