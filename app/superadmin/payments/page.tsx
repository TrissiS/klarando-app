'use client'

import { useEffect } from 'react'
import BackofficeLayout from '@/app/Components/admin/BackofficeLayout'
import { SUPERADMIN_NAV_ITEMS } from '@/app/superadmin/nav'

export default function SuperadminPaymentsLegacyPage() {
  useEffect(() => {
    const timeoutId = window.setTimeout(() => {
      window.location.replace('/superadmin/billing#stripe-connect')
    }, 1400)
    return () => window.clearTimeout(timeoutId)
  }, [])

  return (
    <BackofficeLayout
      brand="superadmin"
      title="Legacy: Zahlungsstatus"
      subtitle="Stripe Connect, Tariflogik und Abrechnung wurden auf die zentrale Seite „Abrechnung & Zahlungen“ zusammengeführt."
      navItems={SUPERADMIN_NAV_ITEMS}
    >
      <section className="rounded-3xl border border-[var(--brand-border)] bg-white p-5 shadow-sm">
        <h3 className="text-sm font-semibold text-[var(--brand-ink)]">Weiterleitung zur Masterseite</h3>
        <p className="mt-2 text-sm text-slate-600">
          Du wirst automatisch zu <span className="font-mono">/superadmin/billing#stripe-connect</span>{' '}
          weitergeleitet.
        </p>
        <a
          href="/superadmin/billing#stripe-connect"
          className="mt-4 inline-flex rounded-xl bg-slate-900 px-4 py-2 text-sm font-semibold text-white hover:bg-slate-800"
        >
          Abrechnung & Zahlungen öffnen
        </a>
      </section>
    </BackofficeLayout>
  )
}
