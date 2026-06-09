import ProductBadgeIcon from '@/app/Components/products/ProductBadgeIcon'
import {
  PRODUCT_BADGES,
  PRODUCT_BADGE_STYLE_TOKENS,
  type ProductBadgeKey,
} from '@/lib/product-badges'

type ProductBadgeProps = {
  badgeKey: ProductBadgeKey
  compact?: boolean
  className?: string
}

export default function ProductBadge({
  badgeKey,
  compact = false,
  className = '',
}: ProductBadgeProps) {
  const badge = PRODUCT_BADGES[badgeKey]
  const style = PRODUCT_BADGE_STYLE_TOKENS[badge.colorName]

  return (
    <span
      className={`inline-flex items-center gap-1.5 rounded-full border px-2.5 py-1 text-xs font-medium leading-none ${style.pillClassName} ${style.accentRingClassName || ''} ${className}`}
      title={badge.description || badge.label}
    >
      <ProductBadgeIcon badgeKey={badgeKey} className={style.iconClassName} />
      <span>{compact ? badge.shortLabel : badge.label}</span>
    </span>
  )
}
