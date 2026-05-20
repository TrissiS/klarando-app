'use client'

import { useEffect, useState } from 'react'
import SectionOverview from '@/app/Components/admin/SectionOverview'
import { getActions } from '@/lib/api'

export default function MarketingOverviewPage() {
  const [actionsCount, setActionsCount] = useState<number | null>(null)

  useEffect(() => {
    let cancelled = false
    ;(async () => {
      try {
        const rows = await getActions()
        if (!cancelled) setActionsCount(rows.length)
      } catch {
        if (!cancelled) setActionsCount(null)
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
        { label: 'Gutscheine', value: 'Verfügbar' },
        { label: 'Bewertungen', value: 'Live' },
        { label: 'Offene Warnungen', value: 0 },
      ]}
      warnings={[]}
      quickActions={[
        { href: '/admin/actions', label: 'Aktionen bearbeiten' },
        { href: '/admin/actions?tab=vouchers', label: 'Gutscheine öffnen' },
        { href: '/admin/orders?tab=ratings', label: 'Bewertungen ansehen' },
      ]}
    />
  )
}
