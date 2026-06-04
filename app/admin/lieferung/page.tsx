'use client'

import SectionOverview from '@/app/Components/admin/SectionOverview'

export default function DeliveryOverviewPage() {
  return (
    <SectionOverview
      title="Lieferzonen"
      subtitle="Liefergebiet, Lieferkosten, Mindestbestellwert und Ausschlüsse getrennt von der Tourenplanung verwalten."
      metrics={[
        { label: 'Liefergebiet', value: 'Aktiv' },
        { label: 'Kosten & Mindestwert', value: 'Aktiv' },
        { label: 'Fahrerbereich', value: 'Aktiv' },
        { label: 'Tourenplanung', value: 'Vorbereitet' },
      ]}
      warnings={[
        'Lieferzonen steuern nur Gebiet, PLZ, Radius, Polygon, Ausschlüsse, Lieferkosten und Mindestbestellwert.',
        'Tourenplanung ist davon getrennt und bündelt später nur offene Lieferbestellungen zu Fahrer-Routen.',
      ]}
      quickActions={[
        { href: '/admin/settings#delivery-area', label: 'Lieferzonen & Kosten öffnen' },
        { href: '/admin/drivers', label: 'Fahrer verwalten' },
        { href: '/admin/tours', label: 'Touren öffnen' },
      ]}
    />
  )
}
