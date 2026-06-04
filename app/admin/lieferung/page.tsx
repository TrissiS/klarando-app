'use client'

import SectionOverview from '@/app/Components/admin/SectionOverview'

export default function DeliveryOverviewPage() {
  return (
    <SectionOverview
      title="Lieferung"
      subtitle="Lieferzonen, Fahrer und Touren zentral organisieren."
      metrics={[
        { label: 'Lieferbereich', value: 'Aktiv' },
        { label: 'Fahrerbereich', value: 'Aktiv' },
        { label: 'Tourenplanung', value: 'Vorbereitet' },
        { label: 'Offene Warnungen', value: 0 },
      ]}
      warnings={['Erweiterte Tourenautomatik ist vorbereitet und wird schrittweise aktiviert.']}
      quickActions={[
        { href: '/admin/settings#delivery-area', label: 'Öffnungszeiten & Lieferzeiten' },
        { href: '/admin/drivers', label: 'Fahrer verwalten' },
        { href: '/admin/tours', label: 'Touren öffnen' },
      ]}
    />
  )
}
