'use client'

import Link from 'next/link'
import AdminLayout from '@/app/Components/admin/AdminLayout'
import { ComingSoonAction } from '@/app/Components/admin/FeatureUnavailableNotice'

export default function BillingWorkspacePage() {
  return (
    <AdminLayout title="Billing-Workspace" subtitle="Gebühren, Provisionen und Abrechnungsstatus bündeln.">
      <div className="space-y-4">
        <div className="rounded-2xl border border-slate-200 bg-white p-4 shadow-sm">
          <p className="text-sm font-semibold text-slate-900">Abrechnungsbereiche</p>
          <div className="mt-3 flex flex-wrap gap-2">
            <Link href="/superadmin/module-billing" className="rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2 text-sm font-semibold text-rose-900 hover:bg-rose-50">
              Modulfreigaben & Modulpreise
            </Link>
            <Link href="/admin/finanzen" className="rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2 text-sm font-semibold text-rose-900 hover:bg-rose-50">
              Gebühren & Provisionen
            </Link>
            <Link href="/admin/payments" className="rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2 text-sm font-semibold text-rose-900 hover:bg-rose-50">
              Zahlungsstatus
            </Link>
            <ComingSoonAction label="Monatsabrechnung (Workspace Flow)" />
            <ComingSoonAction label="Offene Beträge Fokusliste" />
          </div>
        </div>
      </div>
    </AdminLayout>
  )
}
