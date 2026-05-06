'use client'

import {
  DEFAULT_PLATFORM_BRANDING_SETTINGS,
  type PlatformBrandingSettings,
} from '@/lib/api'

type BrandingArea = 'sidebar' | 'header'

type Props = {
  settings: PlatformBrandingSettings | null
  area: BrandingArea
  className?: string
}

function clampInt(value: number, min: number, max: number) {
  if (!Number.isFinite(value)) {
    return min
  }
  return Math.min(max, Math.max(min, Math.round(value)))
}

export default function PlatformBranding({ settings, area, className }: Props) {
  const merged = settings || DEFAULT_PLATFORM_BRANDING_SETTINGS
  const wordmarkHeight = clampInt(
    area === 'sidebar' ? merged.sidebarWordmarkHeight : merged.headerWordmarkHeight,
    14,
    120
  )
  const wordmarkUrl = merged.wordmarkUrl || DEFAULT_PLATFORM_BRANDING_SETTINGS.wordmarkUrl

  return (
    <div className={`flex items-center ${className || ''}`}>
      <img
        src={wordmarkUrl || '/klarando_logo_wordmark.png'}
        alt="Klarando Logo"
        className="w-auto max-w-[260px] object-contain"
        style={{ height: `${wordmarkHeight}px` }}
      />
    </div>
  )
}
