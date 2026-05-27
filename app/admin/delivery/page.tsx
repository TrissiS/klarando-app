'use client'

import AdminLayout from '@/app/Components/admin/AdminLayout'
import {
  WorkspaceHeader,
  WorkspaceStats,
} from '@/app/Components/admin/WorkspaceComponents'

export default function DeliveryWorkspacePage() {
  return (
    <AdminLayout title="Delivery-Workspace" subtitle="Liefergebiet, Fahrer und Touren zentral verwalten.">
      <div className="space-y-4">
        <WorkspaceHeader
          title="Workspace: Lieferung"
          subtitle="Liefergebiet, Fahrer und Zonenregeln konsistent steuern."
        />
        <WorkspaceStats
          stats={[
            { label: 'Liefergebiet', value: 'Aktiv' },
            { label: 'Fahrerbereich', value: 'Aktiv' },
            { label: 'Touren', value: 'Verfügbar' },
            { label: 'Zonenregeln', value: 'Aktiv' },
          ]}
        />
      </div>
    </AdminLayout>
  )
}
