'use client'

import { useEffect, useMemo, useState } from 'react'

type Props = {
  src: string | null
  fallbackImageUrl: string | null
  performanceMode?: 'AUTO' | 'NORMAL' | 'LOW'
}

export function VideoBackground({ src, fallbackImageUrl, performanceMode = 'AUTO' }: Props) {
  const [failed, setFailed] = useState(false)
  const [reducedMotion, setReducedMotion] = useState(false)
  const [lowEndDevice, setLowEndDevice] = useState(false)

  useEffect(() => {
    if (typeof window === 'undefined') {
      return
    }

    const media = window.matchMedia('(prefers-reduced-motion: reduce)')
    const apply = () => setReducedMotion(media.matches)
    apply()

    media.addEventListener('change', apply)
    return () => media.removeEventListener('change', apply)
  }, [])

  useEffect(() => {
    setFailed(false)
  }, [src])

  useEffect(() => {
    if (typeof navigator === 'undefined') {
      return
    }
    const nav = navigator as Navigator & {
      deviceMemory?: number
      hardwareConcurrency?: number
    }
    const deviceMemory = typeof nav.deviceMemory === 'number' ? nav.deviceMemory : 4
    const cores =
      typeof nav.hardwareConcurrency === 'number' ? nav.hardwareConcurrency : 4
    setLowEndDevice(deviceMemory <= 2 || cores <= 4)
  }, [])

  const forceLowMode = performanceMode === 'LOW'
  const showVideo =
    Boolean(src) &&
    !failed &&
    !reducedMotion &&
    !forceLowMode &&
    (performanceMode === 'NORMAL' || !lowEndDevice)

  const fallbackStyle = useMemo(() => {
    if (!fallbackImageUrl) {
      return undefined
    }
    return {
      backgroundImage: `url(${fallbackImageUrl})`,
      backgroundSize: 'cover',
      backgroundPosition: 'center',
    }
  }, [fallbackImageUrl])

  if (!showVideo && !fallbackImageUrl) {
    return null
  }

  return (
    <div className="pointer-events-none absolute inset-0 -z-10 overflow-hidden" style={fallbackStyle}>
      {showVideo ? (
        <video
          className="h-full w-full object-cover"
          src={src || undefined}
          autoPlay
          muted
          loop
          playsInline
          preload="metadata"
          poster={fallbackImageUrl || undefined}
          onError={() => setFailed(true)}
        />
      ) : null}
      <div className="absolute inset-0 bg-slate-950/30" />
    </div>
  )
}
