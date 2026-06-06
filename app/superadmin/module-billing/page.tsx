'use client'

import { useEffect } from 'react'
import BackofficeLayout from '@/app/Components/admin/BackofficeLayout'
import ImplementationNotice from '@/app/Components/admin/ImplementationNotice'
import { SUPERADMIN_NAV_ITEMS } from '@/app/superadmin/nav'

export default function SuperadminModuleBillingLegacyPage() {
  useEffect(() => {
    const timeoutId = window.setTimeout(() => {
      window.location.replace('/superadmin/billing#tarife-module')
    }, 1400)
    return () => window.clearTimeout(timeoutId)
  }, [])

  return (
    <BackofficeLayout
      brand="Superadmin"
      title="Legacy: Modulfreigaben"
      subtitle="Tarif- und Modulthemen werden schrittweise in die Masterseite „Abrechnung & Zahlungen“ überführt."
      navItems={SUPERADMIN_NAV_ITEMS}
    >
      <div className="space-y-4">
        <ImplementationNotice
          title="Legacy-Seite"
          tone="warn"
          message="Diese Seite ist kein zweiter aktiver Billing-Bereich mehr. Tarif- und Modulkontexte werden jetzt von der zentralen Superadmin-Masterseite aus zusammengeführt."
        />
        <section className="rounded-3xl border border-[var(--brand-border)] bg-white p-5 shadow-sm">
          <h3 className="text-sm font-semibold text-[var(--brand-ink)]">Weiterleitung zur Masterseite</h3>
          <p className="mt-2 text-sm text-slate-600">
            Du wirst automatisch zu <span className="font-mono">/superadmin/billing#tarife-module</span> weitergeleitet.
          </p>
          <div className="mt-4 flex flex-wrap gap-2">
            <a
              href="/superadmin/billing#tarife-module"
              className="rounded-xl bg-slate-900 px-4 py-2 text-sm font-semibold text-white hover:bg-slate-800"
            >
              Abrechnung & Zahlungen öffnen
            </a>
            <a
              href="/superadmin/billing#nutzung"
              className="rounded-xl border border-slate-300 px-4 py-2 text-sm font-medium text-slate-700 hover:bg-slate-50"
            >
              Zu Nutzung
            </a>
          </div>
        </section>
      </div>
    </BackofficeLayout>
  )
}
