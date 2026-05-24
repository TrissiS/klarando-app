'use client'

import AdminLayout from '@/app/Components/admin/AdminLayout'
import {
  WorkspaceActions,
  WorkspaceHeader,
  WorkspaceStats,
  WorkspaceWarnings,
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
            { label: 'Polygon', value: 'READY' },
            { label: 'Fahrerbereich', value: 'Aktiv' },
            { label: 'Touren', value: 'LIMITED' },
            { label: 'Geo-Testpunkt', value: 'In Vorbereitung' },
          ]}
        />
        <WorkspaceActions
          actions={[
            { href: '/admin/app-settings?section=delivery-area', label: 'Liefergebiet Polygon' },
            { href: '/admin/app-settings?section=delivery-area', label: 'Lieferzonen' },
            { href: '/admin/drivers', label: 'Fahrer' },
            { href: '/admin/app-settings?section=delivery-priority', label: 'Touren' },
            { label: 'Testpunkt innen/außen', disabled: true, hint: 'Geo-Testpunkt folgt mit dedizierter Prüf-API.' },
          ]}
        />
        <WorkspaceWarnings warnings={['Der Testpunkt innen/außen ist vorbereitet, aber noch nicht live angeschlossen.']} />
      </div>
    </AdminLayout>
  )
}
