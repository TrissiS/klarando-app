'use client'

import { useEffect, useMemo, useState } from 'react'
import AdminLayout from '@/app/Components/admin/AdminLayout'

export default function AdminAppSettingsPage() {
  const [section, setSection] = useState('')

  useEffect(() => {
    if (typeof window === 'undefined') {
      return
    }

    const params = new URLSearchParams(window.location.search)
    const nextSection = params.get('section') || ''
    setSection(nextSection)

    const target = nextSection === 'delivery-area'
      ? '/admin/settings#delivery-area'
      : '/admin/settings#business-settings'

    const timeoutId = window.setTimeout(() => {
      window.location.replace(target)
    }, 150)

    return () => window.clearTimeout(timeoutId)
  }, [])

  const targetHref = useMemo(
    () => (section === 'delivery-area' ? '/admin/settings#delivery-area' : '/admin/settings#business-settings'),
    [section]
  )

  return (
    <AdminLayout
      title="Legacy · App-Einstellungen"
      subtitle="Diese Route ist nur noch ein Legacy-Einstieg und verweist auf die zentrale Einstellungsseite."
    >
      <section className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-[var(--brand-border)]">
        <div className="rounded-2xl border border-amber-200 bg-amber-50 px-4 py-4 text-sm text-amber-900">
          <p className="font-semibold">
            Diese Seite ist nur noch ein Legacy-Einstieg.
          </p>
          <p className="mt-2">
            Die kanonische Quelle für Filialdaten, App-Konfiguration, Öffnungszeiten,
            Lieferzeiten, Feiertage, Mindestbestellwert und Liefergebühr liegt jetzt unter{' '}
            <a href={targetHref} className="font-semibold underline">
              /admin/settings
            </a>.
          </p>
          <p className="mt-2">
            Du wirst automatisch dorthin weitergeleitet. Falls das nicht klappt, nutze den Link oben.
          </p>
        </div>
      </section>
    </AdminLayout>
  )
}
