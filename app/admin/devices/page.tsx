'use client'

import AdminLayout from '@/app/Components/admin/AdminLayout'
import {
  WorkspaceHeader,
  WorkspaceStats,
  WorkspaceTabs,
} from '@/app/Components/admin/WorkspaceComponents'

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
        <WorkspaceHeader
          title="Workspace: Geräte"
          subtitle="Displays, OrderDesk, Fahrergeräte und Koppellogik übersichtlich verwalten."
        />
        <WorkspaceTabs tabs={tabs} />
        <WorkspaceStats
          stats={[
            { label: 'Geräteübersicht', value: 'Aktiv' },
            { label: 'Pairing', value: 'Aktiv' },
            { label: 'Gerätestatus', value: 'Aktiv' },
            { label: 'Offline-Fokus', value: 'Aktiv' },
            { label: 'Zuweisung', value: 'Aktiv' },
          ]}
        />
      </div>
    </AdminLayout>
  )
}
