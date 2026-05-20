'use client'

import Link from 'next/link'
import AdminLayout from '@/app/Components/admin/AdminLayout'
import { ApiMissingNotice, ComingSoonAction } from '@/app/Components/admin/FeatureUnavailableNotice'

const tabs = [
  { href: '/admin/display-devices', label: 'Displays' },
  { href: '/admin/terminals', label: 'OrderDesk' },
  { href: '/admin/drivers', label: 'Fahrergeräte' },
  { href: '/admin/screen-studio', label: 'Design-Zuweisung' },
]

export default function DevicesWorkspacePage() {
  return (
    <AdminLayout title="Geräte-Workspace" subtitle="Kopplung, Status und Verwaltung für alle Gerätetypen.">
      <div className="space-y-4">
        <div className="rounded-2xl border border-slate-200 bg-white p-4 shadow-sm">
          <p className="text-sm font-semibold text-slate-900">Gerätebereiche</p>
          <div className="mt-3 flex flex-wrap gap-2">
            {tabs.map((tab) => (
              <Link key={tab.href} href={tab.href} className="rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2 text-sm font-semibold text-rose-900 hover:bg-rose-50">
                {tab.label}
              </Link>
            ))}
            <ComingSoonAction label="TV-Sticks Detaildiagnose" />
            <ComingSoonAction label="Neu koppeln (Bulk)" />
            <ComingSoonAction label="Gerät löschen/sperren (Bulk)" />
          </div>
        </div>
        <ApiMissingNotice apiName="einheitliche TV-Stick Diagnose API" />
      </div>
    </AdminLayout>
  )
}
