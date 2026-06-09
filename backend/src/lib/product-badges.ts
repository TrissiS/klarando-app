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

const PRODUCT_BADGE_SORT_ORDER: Record<ProductBadgeKey, number> = {
  VEGAN: 10,
  VEGETARIAN: 20,
  HALAL: 30,
  GLUTEN_FREE: 40,
  LACTOSE_FREE: 50,
  SPICY: 100,
  VERY_SPICY: 110,
  NEW: 200,
  POPULAR: 210,
  BESTSELLER: 220,
  RECOMMENDED: 230,
  LIMITED: 240,
  CAFFEINE: 300,
  ALCOHOL: 310,
  AGE_16: 400,
  AGE_18: 410,
  ORGANIC: 500,
  REGIONAL: 510,
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
  return typeof value === 'string' && value.trim().toUpperCase() in PRODUCT_BADGE_SORT_ORDER
}

export function sortProductBadgeKeys(badges: ProductBadgeKey[]) {
  return [...badges].sort(
    (left, right) => PRODUCT_BADGE_SORT_ORDER[left] - PRODUCT_BADGE_SORT_ORDER[right]
  )
}

export function sanitizeProductBadgeKeys(value: unknown): ProductBadgeKey[] {
  if (!Array.isArray(value)) {
    return []
  }

  const output = new Set<ProductBadgeKey>()
  for (const entry of value) {
    if (!isProductBadgeKey(entry)) {
      continue
    }
    output.add(entry.trim().toUpperCase() as ProductBadgeKey)
  }

  return sortProductBadgeKeys(Array.from(output))
}

export function normalizeProductBadges(product: LegacyBadgeInput): ProductBadgeKey[] {
  const next = new Set<ProductBadgeKey>()

  for (const badge of sanitizeProductBadgeKeys(product.badges ?? product.labels ?? [])) {
    next.add(badge)
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
