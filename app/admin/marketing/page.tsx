'use client'

import { useEffect, useState } from 'react'
import SectionOverview from '@/app/Components/admin/SectionOverview'
import { getActions, getCoupons } from '@/lib/api'

export default function MarketingOverviewPage() {
  const [actionsCount, setActionsCount] = useState<number | null>(null)
  const [couponsCount, setCouponsCount] = useState<number | null>(null)

  useEffect(() => {
    let cancelled = false
    ;(async () => {
      try {
        const [actionRows, couponRows] = await Promise.all([getActions(), getCoupons()])
        if (!cancelled) {
          setActionsCount(actionRows.length)
          setCouponsCount(couponRows.length)
        }
      } catch {
        if (!cancelled) {
          setActionsCount(null)
          setCouponsCount(null)
        }
      }
    })()
    return () => {
      cancelled = true
    }
  }, [])

  return (
    <SectionOverview
      title="Marketing"
      subtitle="Aktionen, Gutscheine und Bewertungsimpulse steuern."
      metrics={[
        { label: 'Aktive Aktionen', value: actionsCount ?? '—' },
        { label: 'Gutscheine', value: couponsCount ?? '—' },
        { label: 'Bewertungen', value: 'Live' },
        { label: 'Offene Warnungen', value: 0 },
      ]}
      warnings={[]}
      quickActions={[
        { href: '/admin/actions', label: 'Aktionen bearbeiten' },
        { href: '/admin/coupons', label: 'Gutscheine öffnen' },
        { href: '/admin/orders?tab=ratings', label: 'Bewertungen ansehen' },
      ]}
    />
  )
}
