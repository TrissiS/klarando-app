'use client'

import Link from 'next/link'
import AdminLayout from '@/app/Components/admin/AdminLayout'
import { ComingSoonAction } from '@/app/Components/admin/FeatureUnavailableNotice'

export default function DeliveryWorkspacePage() {
  return (
    <AdminLayout title="Delivery-Workspace" subtitle="Liefergebiet, Fahrer und Touren zentral verwalten.">
      <div className="space-y-4">
        <div className="rounded-2xl border border-slate-200 bg-white p-4 shadow-sm">
          <p className="text-sm font-semibold text-slate-900">Lieferbetrieb</p>
          <div className="mt-3 flex flex-wrap gap-2">
            <Link href="/admin/app-settings?section=delivery-area" className="rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2 text-sm font-semibold text-rose-900 hover:bg-rose-50">
              Liefergebiet Polygon
            </Link>
            <Link href="/admin/app-settings?section=delivery-area" className="rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2 text-sm font-semibold text-rose-900 hover:bg-rose-50">
              Lieferzonen
            </Link>
            <Link href="/admin/drivers" className="rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2 text-sm font-semibold text-rose-900 hover:bg-rose-50">
              Fahrer
            </Link>
            <Link href="/admin/app-settings?section=delivery-priority" className="rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2 text-sm font-semibold text-rose-900 hover:bg-rose-50">
              Touren
            </Link>
            <ComingSoonAction label="Testpunkt innen/außen" />
          </div>
        </div>
      </div>
    </AdminLayout>
  )
}
