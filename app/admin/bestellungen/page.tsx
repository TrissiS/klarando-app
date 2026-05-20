'use client'

import { useEffect, useState } from 'react'
import SectionOverview from '@/app/Components/admin/SectionOverview'
import { getOrders } from '@/lib/api'

export default function OrdersOverviewPage() {
  const [ordersCount, setOrdersCount] = useState<number | null>(null)

  useEffect(() => {
    let cancelled = false
    ;(async () => {
      try {
        const rows = await getOrders()
        if (!cancelled) setOrdersCount(rows.length)
      } catch {
        if (!cancelled) setOrdersCount(null)
      }
    })()
    return () => {
      cancelled = true
    }
  }, [])

  return (
    <SectionOverview
      title="Bestellungen"
      subtitle="Übersicht für Tagesgeschäft, Küche und Lieferung."
      metrics={[
        { label: 'Bestellungen gesamt', value: ordersCount ?? '—' },
        { label: 'Offene Warnungen', value: 0 },
        { label: 'Schnellstatus', value: 'Bereit' },
        { label: 'Letzte Prüfung', value: new Date().toLocaleDateString('de-DE') },
      ]}
      warnings={[]}
      quickActions={[
        { href: '/admin/orders', label: 'Bestellungen öffnen' },
        { href: '/admin/terminals', label: 'Küche / OrderDesk' },
        { href: '/admin/drivers', label: 'Fahrerstatus' },
      ]}
    />
  )
}
