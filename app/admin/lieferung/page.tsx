'use client'

import SectionOverview from '@/app/Components/admin/SectionOverview'

export default function DeliveryOverviewPage() {
  return (
    <SectionOverview
      title="Lieferzonen"
      subtitle="Liefergebiet, Lieferkosten, Mindestbestellwert und Ausschlüsse getrennt vom Lieferdienst und von der Tourenplanung verwalten."
      metrics={[
        { label: 'Lieferdienst', value: 'Separat' },
        { label: 'Liefergebiet', value: 'Aktiv' },
        { label: 'Kosten & Mindestwert', value: 'Aktiv' },
        { label: 'Debug-Vorschau', value: 'Separat' },
        { label: 'Tourenplanung', value: 'Vorbereitet' },
      ]}
      warnings={[
        'Lieferzonen steuern nur Gebiet, PLZ, Radius, Polygon, Ausschlüsse, Lieferkosten und Mindestbestellwert.',
        'Lieferzeiten, Mindestvorlauf, Vorbestellung und Kundensicht-Debug liegen bewusst im Bereich Lieferdienst.',
        'Feiertage, Urlaub, Sonderöffnungszeiten und Sonderlieferzeiten werden separat im Bereich Feiertage & Ausnahmen gepflegt.',
        'Tourenplanung ist davon getrennt und bündelt später nur offene Lieferbestellungen zu Fahrer-Routen.',
      ]}
      quickActions={[
        { href: '/admin/settings#liefergebiete-kosten', label: 'Lieferzonen & Kosten öffnen' },
        { href: '/admin/settings#lieferdienst', label: 'Lieferdienst öffnen' },
        { href: '/admin/settings#feiertage-ausnahmen', label: 'Ausnahmen öffnen' },
        { href: '/admin/drivers', label: 'Fahrer verwalten' },
        { href: '/admin/tours', label: 'Touren öffnen' },
      ]}
    />
  )
}
