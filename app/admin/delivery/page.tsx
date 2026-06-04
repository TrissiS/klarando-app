'use client'

import AdminLayout from '@/app/Components/admin/AdminLayout'
import {
  WorkspaceHeader,
  WorkspaceStats,
} from '@/app/Components/admin/WorkspaceComponents'

export default function DeliveryWorkspacePage() {
  return (
    <AdminLayout title="Lieferbetrieb-Workspace" subtitle="Lieferzonen und Touren fachlich getrennt verwalten.">
      <div className="space-y-4">
        <WorkspaceHeader
          title="Workspace: Lieferung"
          subtitle="Lieferzonen definieren das Liefergebiet und die Konditionen. Touren planen danach die operative Zustellung."
        />
        <WorkspaceStats
          stats={[
            { label: 'Lieferzonen', value: 'Aktiv' },
            { label: 'Kostenregeln', value: 'Aktiv' },
            { label: 'Fahrerbereich', value: 'Aktiv' },
            { label: 'Touren', value: 'Vorbereitet' },
          ]}
        />
      </div>
    </AdminLayout>
  )
}
