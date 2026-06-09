import { StyleSheet, Text, View } from 'react-native'
import type { ProductBadgeKey } from './types'

type MobileProductBadgeColorName =
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

type MobileProductBadgeConfig = {
  key: ProductBadgeKey
  label: string
  shortLabel: string
  iconToken: string
  colorName: MobileProductBadgeColorName
  sortOrder: number
}

type MobileBadgeTone = {
  borderColor: string
  backgroundColor: string
  textColor: string
  iconBorderColor: string
  iconBackgroundColor: string
}

const BADGE_TONES: Record<MobileProductBadgeColorName, MobileBadgeTone> = {
  green: {
    borderColor: '#86efac',
    backgroundColor: '#f0fdf4',
    textColor: '#166534',
    iconBorderColor: '#4ade80',
    iconBackgroundColor: '#dcfce7',
  },
  lime: {
    borderColor: '#bef264',
    backgroundColor: '#f7fee7',
    textColor: '#3f6212',
    iconBorderColor: '#a3e635',
    iconBackgroundColor: '#ecfccb',
  },
  teal: {
    borderColor: '#5eead4',
    backgroundColor: '#f0fdfa',
    textColor: '#115e59',
    iconBorderColor: '#2dd4bf',
    iconBackgroundColor: '#ccfbf1',
  },
  yellow: {
    borderColor: '#fcd34d',
    backgroundColor: '#fffbeb',
    textColor: '#92400e',
    iconBorderColor: '#fbbf24',
    iconBackgroundColor: '#fef3c7',
  },
  sky: {
    borderColor: '#7dd3fc',
    backgroundColor: '#f0f9ff',
    textColor: '#075985',
    iconBorderColor: '#38bdf8',
    iconBackgroundColor: '#e0f2fe',
  },
  red: {
    borderColor: '#fca5a5',
    backgroundColor: '#fef2f2',
    textColor: '#b91c1c',
    iconBorderColor: '#f87171',
    iconBackgroundColor: '#fee2e2',
  },
  darkRed: {
    borderColor: '#fda4af',
    backgroundColor: '#fff1f2',
    textColor: '#9f1239',
    iconBorderColor: '#fb7185',
    iconBackgroundColor: '#ffe4e6',
  },
  blue: {
    borderColor: '#93c5fd',
    backgroundColor: '#eff6ff',
    textColor: '#1d4ed8',
    iconBorderColor: '#60a5fa',
    iconBackgroundColor: '#dbeafe',
  },
  gold: {
    borderColor: '#fde68a',
    backgroundColor: '#fefce8',
    textColor: '#a16207',
    iconBorderColor: '#facc15',
    iconBackgroundColor: '#fef9c3',
  },
  orange: {
    borderColor: '#fdba74',
    backgroundColor: '#fff7ed',
    textColor: '#c2410c',
    iconBorderColor: '#fb923c',
    iconBackgroundColor: '#ffedd5',
  },
  indigo: {
    borderColor: '#a5b4fc',
    backgroundColor: '#eef2ff',
    textColor: '#4338ca',
    iconBorderColor: '#818cf8',
    iconBackgroundColor: '#e0e7ff',
  },
  gray: {
    borderColor: '#cbd5e1',
    backgroundColor: '#f8fafc',
    textColor: '#475569',
    iconBorderColor: '#94a3b8',
    iconBackgroundColor: '#f1f5f9',
  },
  brown: {
    borderColor: '#d6d3d1',
    backgroundColor: '#fafaf9',
    textColor: '#57534e',
    iconBorderColor: '#a8a29e',
    iconBackgroundColor: '#f5f5f4',
  },
}

export const MOBILE_PRODUCT_BADGES: Record<ProductBadgeKey, MobileProductBadgeConfig> = {
  VEGAN: { key: 'VEGAN', label: 'Vegan', shortLabel: 'Vegan', iconToken: 'V', colorName: 'green', sortOrder: 10 },
  VEGETARIAN: {
    key: 'VEGETARIAN',
    label: 'Vegetarisch',
    shortLabel: 'Veggie',
    iconToken: 'VG',
    colorName: 'lime',
    sortOrder: 20,
  },
  HALAL: { key: 'HALAL', label: 'Halal', shortLabel: 'Halal', iconToken: 'H', colorName: 'teal', sortOrder: 30 },
  GLUTEN_FREE: {
    key: 'GLUTEN_FREE',
    label: 'Glutenfrei',
    shortLabel: 'Glutenfrei',
    iconToken: 'GF',
    colorName: 'yellow',
    sortOrder: 40,
  },
  LACTOSE_FREE: {
    key: 'LACTOSE_FREE',
    label: 'Laktosefrei',
    shortLabel: 'Laktosefrei',
    iconToken: 'LF',
    colorName: 'sky',
    sortOrder: 50,
  },
  SPICY: { key: 'SPICY', label: 'Scharf', shortLabel: 'Scharf', iconToken: 'S', colorName: 'red', sortOrder: 100 },
  VERY_SPICY: {
    key: 'VERY_SPICY',
    label: 'Sehr scharf',
    shortLabel: 'Sehr scharf',
    iconToken: 'SS',
    colorName: 'darkRed',
    sortOrder: 110,
  },
  NEW: { key: 'NEW', label: 'Neu', shortLabel: 'Neu', iconToken: 'N', colorName: 'blue', sortOrder: 200 },
  POPULAR: {
    key: 'POPULAR',
    label: 'Beliebt',
    shortLabel: 'Beliebt',
    iconToken: 'B',
    colorName: 'gold',
    sortOrder: 210,
  },
  BESTSELLER: {
    key: 'BESTSELLER',
    label: 'Bestseller',
    shortLabel: 'Bestseller',
    iconToken: 'BS',
    colorName: 'orange',
    sortOrder: 220,
  },
  RECOMMENDED: {
    key: 'RECOMMENDED',
    label: 'Empfehlung',
    shortLabel: 'Empfohlen',
    iconToken: 'E',
    colorName: 'indigo',
    sortOrder: 230,
  },
  LIMITED: {
    key: 'LIMITED',
    label: 'Limitiert',
    shortLabel: 'Limitiert',
    iconToken: 'L',
    colorName: 'gray',
    sortOrder: 240,
  },
  CAFFEINE: {
    key: 'CAFFEINE',
    label: 'Koffeinhaltig',
    shortLabel: 'Koffein',
    iconToken: 'K',
    colorName: 'brown',
    sortOrder: 300,
  },
  ALCOHOL: {
    key: 'ALCOHOL',
    label: 'Alkoholhaltig',
    shortLabel: 'Alkohol',
    iconToken: 'A',
    colorName: 'orange',
    sortOrder: 310,
  },
  AGE_16: {
    key: 'AGE_16',
    label: 'Ab 16 Jahren',
    shortLabel: '16+',
    iconToken: '16+',
    colorName: 'orange',
    sortOrder: 400,
  },
  AGE_18: {
    key: 'AGE_18',
    label: 'Ab 18 Jahren',
    shortLabel: '18+',
    iconToken: '18+',
    colorName: 'darkRed',
    sortOrder: 410,
  },
  ORGANIC: { key: 'ORGANIC', label: 'Bio', shortLabel: 'Bio', iconToken: 'Bio', colorName: 'green', sortOrder: 500 },
  REGIONAL: {
    key: 'REGIONAL',
    label: 'Regional',
    shortLabel: 'Regional',
    iconToken: 'R',
    colorName: 'brown',
    sortOrder: 510,
  },
}

export function isProductBadgeKey(value: unknown): value is ProductBadgeKey {
  return typeof value === 'string' && value.trim().toUpperCase() in MOBILE_PRODUCT_BADGES
}

export function sanitizeMobileProductBadgeKeys(value: unknown): ProductBadgeKey[] {
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

  return Array.from(deduped).sort(
    (left, right) => MOBILE_PRODUCT_BADGES[left].sortOrder - MOBILE_PRODUCT_BADGES[right].sortOrder
  )
}

function MobileProductBadgeIcon({
  iconToken,
  tone,
}: {
  iconToken: string
  tone: MobileBadgeTone
}) {
  return (
    <View
      style={[
        styles.iconShell,
        {
          borderColor: tone.iconBorderColor,
          backgroundColor: tone.iconBackgroundColor,
        },
      ]}
    >
      <Text style={[styles.iconToken, { color: tone.textColor }]}>{iconToken}</Text>
    </View>
  )
}

export function ProductBadgePill({
  badgeKey,
  compact = false,
}: {
  badgeKey: ProductBadgeKey
  compact?: boolean
}) {
  const config = MOBILE_PRODUCT_BADGES[badgeKey]
  const tone = BADGE_TONES[config.colorName]
  const label = compact ? config.shortLabel : config.label

  return (
    <View
      style={[
        styles.pill,
        compact ? styles.pillCompact : null,
        {
          borderColor: tone.borderColor,
          backgroundColor: tone.backgroundColor,
        },
      ]}
    >
      <MobileProductBadgeIcon iconToken={config.iconToken} tone={tone} />
      <Text
        style={[
          styles.pillText,
          compact ? styles.pillTextCompact : null,
          {
            color: tone.textColor,
          },
        ]}
      >
        {label}
      </Text>
    </View>
  )
}

export function ProductBadgeList({
  badges,
  compact = false,
}: {
  badges: ProductBadgeKey[]
  compact?: boolean
}) {
  const normalized = sanitizeMobileProductBadgeKeys(badges)
  if (normalized.length === 0) {
    return null
  }

  return (
    <View style={[styles.list, compact ? styles.listCompact : null]}>
      {normalized.map((badgeKey) => (
        <ProductBadgePill key={badgeKey} badgeKey={badgeKey} compact={compact} />
      ))}
    </View>
  )
}

const styles = StyleSheet.create({
  list: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    gap: 6,
  },
  listCompact: {
    gap: 5,
  },
  pill: {
    flexDirection: 'row',
    alignItems: 'center',
    alignSelf: 'flex-start',
    borderWidth: 1,
    borderRadius: 999,
    paddingLeft: 4,
    paddingRight: 10,
    paddingVertical: 4,
  },
  pillCompact: {
    paddingRight: 8,
    paddingVertical: 3,
  },
  iconShell: {
    minWidth: 20,
    height: 20,
    borderRadius: 999,
    borderWidth: 1,
    alignItems: 'center',
    justifyContent: 'center',
    marginRight: 6,
    paddingHorizontal: 3,
  },
  iconToken: {
    fontSize: 9,
    fontWeight: '800',
    letterSpacing: 0.3,
  },
  pillText: {
    fontSize: 11,
    fontWeight: '700',
  },
  pillTextCompact: {
    fontSize: 10,
  },
})
