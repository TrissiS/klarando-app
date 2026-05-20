'use client'

import { useEffect, useState } from 'react'
import SectionOverview from '@/app/Components/admin/SectionOverview'
import { getAdminFinanceOverview, getStoredAccessToken, getStoredTenantId } from '@/lib/api'

export default function FinanceOverviewPage() {
  const [monthlyGross, setMonthlyGross] = useState<string>('—')

  useEffect(() => {
    let cancelled = false
    ;(async () => {
      try {
        const token = getStoredAccessToken()
        const tenantId = getStoredTenantId()
        if (!token || !tenantId) return
        const overview = await getAdminFinanceOverview(token, tenantId)
        if (cancelled) return
        setMonthlyGross(`${(overview.summary.grossAmountCents / 100).toFixed(2).replace('.', ',')} €`)
      } catch {
        if (!cancelled) setMonthlyGross('—')
      }
    })()
    return () => {
      cancelled = true
    }
  }, [])

  return (
    <SectionOverview
      title="Finanzen"
      subtitle="Gebühren, Abrechnung und Tagesabschlüsse auf einen Blick."
      metrics={[
        { label: 'Umsatz laufender Monat', value: monthlyGross },
        { label: 'Abrechnung', value: 'Aktiv' },
        { label: 'Tagesabschlüsse', value: 'Verfügbar' },
        { label: 'Offene Warnungen', value: 0 },
      ]}
      warnings={[]}
      quickActions={[
        { href: '/admin/finanzen', label: 'Gebühren & Provisionen' },
        { href: '/admin/payments', label: 'Abrechnung öffnen' },
        { href: '/admin/closings/daily', label: 'Tagesabschluss' },
      ]}
    />
  )
}
