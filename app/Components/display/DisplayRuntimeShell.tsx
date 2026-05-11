'use client'

import { type ReactNode } from 'react'
import { type DisplayRuntimeConfig, withAssetCacheVersion } from '@/lib/display-runtime'
import { VideoBackground } from './VideoBackground'

type Props = {
  runtimeConfig: DisplayRuntimeConfig | null
  children: ReactNode
}

export function DisplayRuntimeShell({ runtimeConfig, children }: Props) {
  const backgroundVideoUrl = runtimeConfig?.videoBackgroundEnabled
    ? withAssetCacheVersion(runtimeConfig.videoBackgroundUrl, runtimeConfig.cacheVersion)
    : null
  const backgroundFallbackUrl = withAssetCacheVersion(
    runtimeConfig?.fallbackBackgroundUrl ?? null,
    runtimeConfig?.cacheVersion ?? '0'
  )

  return (
    <>
      <VideoBackground
        src={backgroundVideoUrl}
        fallbackImageUrl={backgroundFallbackUrl}
        performanceMode={runtimeConfig?.performanceMode || 'AUTO'}
      />
      {children}
    </>
  )
}
