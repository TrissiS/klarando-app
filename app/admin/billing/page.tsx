'use client'

import { useEffect } from 'react'
import AdminLayout from '@/app/Components/admin/AdminLayout'

export default function BillingWorkspacePage() {
  useEffect(() => {
    const timeoutId = window.setTimeout(() => {
      window.location.replace('/admin/finanzen')
    }, 1400)
    return () => window.clearTimeout(timeoutId)
  }, [])

  return (
    <AdminLayout
      title="Legacy: Finanzen"
      subtitle="Diese frühere Workspace-Seite wurde in die zentrale Seite „Abrechnung & Zahlungen“ überführt."
    >
      <section className="rounded-3xl border border-[var(--brand-border)] bg-white p-5 shadow-sm">
        <h3 className="text-sm font-semibold text-[var(--brand-ink)]">Weiterleitung zur Masterseite</h3>
        <p className="mt-2 text-sm text-slate-600">
          Du wirst automatisch zu <span className="font-mono">/admin/finanzen</span> weitergeleitet.
        </p>
        <a
          href="/admin/finanzen"
          className="mt-4 inline-flex rounded-xl bg-slate-900 px-4 py-2 text-sm font-semibold text-white hover:bg-slate-800"
        >
          Abrechnung & Zahlungen öffnen
        </a>
      </section>
    </AdminLayout>
  )
}
