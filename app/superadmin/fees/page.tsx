'use client'

import { useEffect } from 'react'
import BackofficeLayout from '@/app/Components/admin/BackofficeLayout'
import ImplementationNotice from '@/app/Components/admin/ImplementationNotice'
import { SUPERADMIN_NAV_ITEMS } from '@/app/superadmin/nav'

export default function SuperadminFeesLegacyPage() {
  useEffect(() => {
    const timeoutId = window.setTimeout(() => {
      window.location.replace('/superadmin/billing#provisionen')
    }, 1400)
    return () => window.clearTimeout(timeoutId)
  }, [])

  return (
    <BackofficeLayout
      brand="Superadmin"
      title="Legacy: Gebühren & Provisionen"
      subtitle="Dieser frühere Einstieg wurde in die zentrale Masterseite „Abrechnung & Zahlungen“ überführt."
      navItems={SUPERADMIN_NAV_ITEMS}
    >
      <div className="space-y-4">
        <ImplementationNotice
          title="Legacy-Seite"
          tone="warn"
          message="Gebühren, Provisionen, Rechnungsentwürfe und Rechnungen werden nicht mehr auf einer zweiten aktiven Superadmin-Seite gepflegt."
        />
        <section className="rounded-3xl border border-[var(--brand-border)] bg-white p-5 shadow-sm">
          <h3 className="text-sm font-semibold text-[var(--brand-ink)]">Weiterleitung zur Masterseite</h3>
          <p className="mt-2 text-sm text-slate-600">
            Du wirst automatisch zu <span className="font-mono">/superadmin/billing#provisionen</span> weitergeleitet.
          </p>
          <div className="mt-4 flex flex-wrap gap-2">
            <a
              href="/superadmin/billing#provisionen"
              className="rounded-xl bg-slate-900 px-4 py-2 text-sm font-semibold text-white hover:bg-slate-800"
            >
              Abrechnung & Zahlungen öffnen
            </a>
            <a
              href="/superadmin/billing#rechnungen"
              className="rounded-xl border border-slate-300 px-4 py-2 text-sm font-medium text-slate-700 hover:bg-slate-50"
            >
              Zu Rechnungen
            </a>
          </div>
        </section>
      </div>
    </BackofficeLayout>
  )
}
