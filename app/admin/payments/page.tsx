'use client'

import { useEffect } from 'react'
import AdminLayout from '@/app/Components/admin/AdminLayout'

export default function AdminPaymentsLegacyPage() {
  useEffect(() => {
    const timeoutId = window.setTimeout(() => {
      window.location.replace('/admin/finanzen#stripe-connect')
    }, 1400)
    return () => window.clearTimeout(timeoutId)
  }, [])

  return (
    <AdminLayout
      title="Legacy: Zahlungen"
      subtitle="Stripe Connect, Gebühren und Abrechnung werden jetzt zentral unter „Abrechnung & Zahlungen“ verwaltet."
    >
      <section className="rounded-3xl border border-[var(--brand-border)] bg-white p-5 shadow-sm">
        <h3 className="text-sm font-semibold text-[var(--brand-ink)]">Weiterleitung zur Masterseite</h3>
        <p className="mt-2 text-sm text-slate-600">
          Du wirst automatisch zu <span className="font-mono">/admin/finanzen#stripe-connect</span>{' '}
          weitergeleitet.
        </p>
        <a
          href="/admin/finanzen#stripe-connect"
          className="mt-4 inline-flex rounded-xl bg-slate-900 px-4 py-2 text-sm font-semibold text-white hover:bg-slate-800"
        >
          Stripe & Abrechnung öffnen
        </a>
      </section>
    </AdminLayout>
  )
}
