import ProductBadge from '@/app/Components/products/ProductBadge'
import {
  normalizeProductBadges,
  type ProductBadgeKey,
} from '@/lib/product-badges'

type ProductBadgeListProps = {
  badges?: ProductBadgeKey[] | unknown
  maxVisible?: number
  compact?: boolean
  className?: string
}

export default function ProductBadgeList({
  badges,
  maxVisible,
  compact = false,
  className = '',
}: ProductBadgeListProps) {
  const normalized = normalizeProductBadges({ badges })
  if (normalized.length === 0) {
    return null
  }

  const visible = typeof maxVisible === 'number' && maxVisible > 0
    ? normalized.slice(0, maxVisible)
    : normalized
  const hiddenCount = normalized.length - visible.length

  return (
    <div className={`flex flex-wrap gap-1.5 ${className}`}>
      {visible.map((badgeKey) => (
        <ProductBadge key={badgeKey} badgeKey={badgeKey} compact={compact} />
      ))}
      {hiddenCount > 0 ? (
        <span className="inline-flex items-center rounded-full border border-slate-200 bg-slate-50 px-2.5 py-1 text-xs font-medium text-slate-700">
          +{hiddenCount} weitere
        </span>
      ) : null}
    </div>
  )
}
