'use client'

import AdminLayout from '@/app/Components/admin/AdminLayout'
import {
  WorkspaceHeader,
  WorkspaceStats,
} from '@/app/Components/admin/WorkspaceComponents'

export default function BillingWorkspacePage() {
  return (
    <AdminLayout title="Billing-Workspace" subtitle="Gebühren, Provisionen und Abrechnungsstatus bündeln.">
      <div className="space-y-4">
        <WorkspaceHeader
          title="Workspace: Billing"
          subtitle="Modulpreise, Provisionen und Zahlungsstatus übergreifend steuern."
        />
        <WorkspaceStats
          stats={[
            { label: 'Gebühren', value: 'Aktiv' },
            { label: 'Provisionen', value: 'Aktiv' },
            { label: 'Zahlungen', value: 'Aktiv' },
            { label: 'Abrechnung', value: 'Übersicht' },
          ]}
        />
      </div>
    </AdminLayout>
  )
}
