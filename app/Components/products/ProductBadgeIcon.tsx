import type { SVGProps } from 'react'
import {
  PRODUCT_BADGES,
  type ProductBadgeConfig,
  type ProductBadgeIconKey,
  type ProductBadgeKey,
} from '@/lib/product-badges'

type IconComponent = (props: SVGProps<SVGSVGElement>) => JSX.Element

function BaseIcon(props: SVGProps<SVGSVGElement>) {
  return (
    <svg
      viewBox="0 0 20 20"
      fill="none"
      stroke="currentColor"
      strokeWidth={1.8}
      strokeLinecap="round"
      strokeLinejoin="round"
      aria-hidden="true"
      {...props}
    />
  )
}

const iconComponents: Record<ProductBadgeIconKey, IconComponent> = {
  leaf: (props) => (
    <BaseIcon {...props}>
      <path d="M15.5 4.5c-4.5 0-8 2.9-9.3 7.6" />
      <path d="M15.5 4.5c.2 5.4-2.4 9.2-7.6 10.8-1.6.5-3.1-.8-2.8-2.5C5.8 8.2 9.8 4.5 15.5 4.5Z" />
    </BaseIcon>
  ),
  sprout: (props) => (
    <BaseIcon {...props}>
      <path d="M10 15.5V9.5" />
      <path d="M10 11.5C7.3 11.5 5 9.3 5 6.5c2.7 0 5 2.2 5 5Z" />
      <path d="M10 11.5c0-2.8 2.3-5 5-5 0 2.8-2.3 5-5 5Z" />
      <path d="M7.5 15.5h5" />
    </BaseIcon>
  ),
  'shield-check': (props) => (
    <BaseIcon {...props}>
      <path d="M10 3.5 15 5v4.2c0 3.1-2 5.8-5 7.3-3-1.5-5-4.2-5-7.3V5l5-1.5Z" />
      <path d="m7.8 10 1.5 1.5L12.5 8.5" />
    </BaseIcon>
  ),
  'grain-off': (props) => (
    <BaseIcon {...props}>
      <path d="M6 4.5c2.4 2.3 2.7 5.5.7 7.8" />
      <path d="M9.5 3.5c2.7 2.4 3 5.9.9 8.4" />
      <path d="M13 4.5c2.4 2.3 2.7 5.5.7 7.8" />
      <path d="M4 16 16 4" />
    </BaseIcon>
  ),
  'milk-off': (props) => (
    <BaseIcon {...props}>
      <path d="M7 4.5h4l1 3v7H6V7.5l1-3Z" />
      <path d="M4.5 15.5h9" />
      <path d="M4 4l12 12" />
    </BaseIcon>
  ),
  chili: (props) => (
    <BaseIcon {...props}>
      <path d="M12 5c1.4-.2 2.7.6 3.4 1.8" />
      <path d="M8 7c3.7-.5 6.4 2.2 5.9 5.8-.4 2.5-2.4 4.1-4.9 4.2-2.6.1-4.8-1.7-5.1-4.2C3.5 10.2 5.1 7.4 8 7Z" />
      <path d="M10.5 5.5c.1-1.1.8-2 1.8-2.5" />
    </BaseIcon>
  ),
  flame: (props) => (
    <BaseIcon {...props}>
      <path d="M11.2 3.8c1 1.7.7 3.3-.2 4.7-.5-1.1-1.4-1.9-2.6-2.4.1 1.5-.7 2.3-1.8 3.4-1 1-1.7 2-1.7 3.6 0 2.3 1.8 4.1 4.1 4.1 3 0 5-2.1 5-5 0-2.7-1.3-4.9-2.8-8.4Z" />
    </BaseIcon>
  ),
  sparkle: (props) => (
    <BaseIcon {...props}>
      <path d="m10 3.5 1.1 3.1L14.2 7.7l-3.1 1.1L10 12l-1.1-3.2-3.1-1.1 3.1-1.1L10 3.5Z" />
      <path d="m15 12.5.5 1.4 1.5.5-1.5.5-.5 1.5-.5-1.5-1.5-.5 1.5-.5.5-1.4Z" />
      <path d="m5.5 11 .5 1.2 1.2.5-1.2.4-.5 1.3-.4-1.3-1.3-.4 1.3-.5.4-1.2Z" />
    </BaseIcon>
  ),
  star: (props) => (
    <BaseIcon {...props}>
      <path d="m10 3.5 1.9 3.9 4.3.6-3.1 3 0.8 4.3-3.9-2.1-3.9 2.1.8-4.3-3.1-3 4.3-.6L10 3.5Z" />
    </BaseIcon>
  ),
  'chef-hat': (props) => (
    <BaseIcon {...props}>
      <path d="M6 8.5A2.5 2.5 0 0 1 8.5 6c.4-1.4 1.6-2.3 3-2.3 1.8 0 3.2 1.5 3.2 3.3 1 .3 1.8 1.2 1.8 2.4 0 1.4-1.1 2.6-2.5 2.6h-8C4.9 12 4 11 4 9.8c0-1 .8-1.9 2-2.3Z" />
      <path d="M6.5 12v3.5h7V12" />
    </BaseIcon>
  ),
  clock: (props) => (
    <BaseIcon {...props}>
      <circle cx="10" cy="10" r="6.5" />
      <path d="M10 6.8v3.5l2.4 1.4" />
    </BaseIcon>
  ),
  coffee: (props) => (
    <BaseIcon {...props}>
      <path d="M5.5 7.5h6.5v3a3 3 0 0 1-3 3h-.5a3 3 0 0 1-3-3v-3Z" />
      <path d="M12 8h1.2a1.8 1.8 0 1 1 0 3.5H12" />
      <path d="M4.5 15h9" />
    </BaseIcon>
  ),
  glass: (props) => (
    <BaseIcon {...props}>
      <path d="M6 4.5h8l-1.2 4.2a3 3 0 0 1-2.9 2.2h-.8a3 3 0 0 1-2.9-2.2L6 4.5Z" />
      <path d="M10 11v4.5" />
      <path d="M7.5 15.5h5" />
    </BaseIcon>
  ),
  'age-16': (props) => (
    <BaseIcon {...props}>
      <rect x="3.5" y="3.5" width="13" height="13" rx="3" />
      <path d="M7.1 12.7V8.1l-1.1.7" />
      <path d="M10.1 10.8a1.8 1.8 0 1 1 3.6 0v.1a1.8 1.8 0 1 1-3.6 0v-.1Z" />
    </BaseIcon>
  ),
  'age-18': (props) => (
    <BaseIcon {...props}>
      <rect x="3.5" y="3.5" width="13" height="13" rx="3" />
      <path d="M6.8 12.7V8.1l-1 .7" />
      <path d="M10.3 12.7V8.1l-1 .7" />
      <path d="M13 10.9a1.4 1.4 0 1 1 2.8 0 1.4 1.4 0 1 1-2.8 0Z" />
    </BaseIcon>
  ),
  'badge-organic': (props) => (
    <BaseIcon {...props}>
      <path d="M10 3.8 12 5l2.3-.3.8 2.2 1.8 1.4-.8 2.2.2 2.3-2 1.1-1.2 2-2.3-.3-2 1.2-1.2-2-2.3-.8.3-2.3-1.2-2 1.8-1.4.8-2.2 2.3.3L10 3.8Z" />
      <path d="M8 11c2.6 0 4.6-1.7 5.1-4.3-2.6 0-4.6 1.8-5.1 4.3Z" />
      <path d="M7.8 11.3c-.7.3-1.4.9-2 1.8" />
    </BaseIcon>
  ),
  pin: (props) => (
    <BaseIcon {...props}>
      <path d="M10 16.2s4-3.6 4-7.1a4 4 0 1 0-8 0c0 3.5 4 7.1 4 7.1Z" />
      <circle cx="10" cy="9.1" r="1.6" />
    </BaseIcon>
  ),
}

export function getProductBadgeIcon(iconKey: ProductBadgeIconKey) {
  return iconComponents[iconKey] ?? null
}

type ProductBadgeIconProps = {
  badgeKey: ProductBadgeKey
  className?: string
}

export default function ProductBadgeIcon({ badgeKey, className }: ProductBadgeIconProps) {
  const badge = PRODUCT_BADGES[badgeKey]
  const Icon = getProductBadgeIcon(badge.iconKey)

  if (!Icon) {
    return (
      <span
        aria-hidden="true"
        className={`inline-flex h-4 min-w-4 items-center justify-center text-[10px] font-semibold ${className || ''}`}
      >
        {badge.fallbackIcon}
      </span>
    )
  }

  return <Icon className={className ? `h-4 w-4 ${className}` : 'h-4 w-4'} />
}

export function getProductBadgeConfig(badgeKey: ProductBadgeKey): ProductBadgeConfig {
  return PRODUCT_BADGES[badgeKey]
}
