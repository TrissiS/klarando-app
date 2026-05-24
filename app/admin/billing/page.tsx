'use client'

import AdminLayout from '@/app/Components/admin/AdminLayout'
import {
  WorkspaceActions,
  WorkspaceHeader,
  WorkspaceStats,
  WorkspaceWarnings,
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
            { label: 'Modulpreise', value: 'LIMITED' },
            { label: 'Gebühren', value: 'Aktiv' },
            { label: 'Monatsabrechnung', value: 'In Vorbereitung' },
            { label: 'Offene Beträge', value: 'In Vorbereitung' },
          ]}
        />
        <WorkspaceActions
          actions={[
            { href: '/superadmin/module-billing', label: 'Modulfreigaben & Preise' },
            { href: '/admin/finanzen', label: 'Gebühren & Provisionen' },
            { href: '/admin/payments', label: 'Zahlungsstatus' },
            { label: 'Monatsabrechnung (Workspace Flow)', disabled: true },
            { label: 'Offene Beträge Fokusliste', disabled: true },
          ]}
        />
        <WorkspaceWarnings warnings={['Monatsabrechnung und offene Beträge werden als nächster Schritt an reale Billing-Daten gekoppelt.']} />
      </div>
    </AdminLayout>
  )
}
