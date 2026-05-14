'use client'

import { useEffect, useMemo, useState } from 'react'
import { getActivePromotions, type PlatformPromotion, type PromotionPlacementKey, type PromotionTargetAudience } from '@/lib/api'

type PromotionSliderProps = {
  placement?: PromotionPlacementKey
  audience?: PromotionTargetAudience
}

export default function PromotionSlider({
  placement = 'MAIN_APP',
  audience = 'ALL',
}: PromotionSliderProps) {
  const [items, setItems] = useState<PlatformPromotion[]>([])
  const [currentIndex, setCurrentIndex] = useState(0)

  useEffect(() => {
    let alive = true
    void getActivePromotions(placement, audience)
      .then((rows) => {
        if (alive) setItems(rows)
      })
      .catch(() => {
        if (alive) setItems([])
      })
    return () => {
      alive = false
    }
  }, [placement, audience])

  const activeItem = useMemo(() => items[currentIndex] || null, [items, currentIndex])
  const rotationSeconds = Math.min(30, Math.max(5, activeItem?.rotationSeconds || 10))

  useEffect(() => {
    if (items.length <= 1) return
    const timer = window.setInterval(() => {
      setCurrentIndex((value) => (value + 1) % items.length)
    }, rotationSeconds * 1000)
    return () => window.clearInterval(timer)
  }, [items.length, rotationSeconds])

  if (!activeItem) {
    return (
      <section className="rounded-3xl border border-[var(--brand-border)] bg-white p-4 text-sm text-rose-900/70">
        Aktuell keine Aktionen verfügbar.
      </section>
    )
  }

  const href = activeItem.linkUrl || '#'
  const external = href.startsWith('http://') || href.startsWith('https://')

  return (
    <section className="overflow-hidden rounded-3xl border border-[var(--brand-border)] bg-white">
      {activeItem.imageUrl ? (
        <img src={activeItem.imageUrl} alt={activeItem.title} className="h-40 w-full object-cover sm:h-52" />
      ) : null}
      <div className="p-4">
        <p className="text-xs font-semibold uppercase tracking-wide text-[var(--brand-strong)]">Klarando News & Aktionen</p>
        <h2 className="mt-1 text-xl font-semibold text-[var(--brand-ink)]">{activeItem.title}</h2>
        {activeItem.description ? <p className="mt-2 text-sm text-rose-900/75">{activeItem.description}</p> : null}
        {activeItem.buttonText && activeItem.linkUrl ? (
          <a
            href={href}
            className="mt-4 inline-flex rounded-xl bg-[var(--brand-strong)] px-4 py-2 text-sm font-semibold text-white"
            target={external ? '_blank' : undefined}
            rel={external ? 'noreferrer noopener' : undefined}
          >
            {activeItem.buttonText}
          </a>
        ) : null}
      </div>
    </section>
  )
}
