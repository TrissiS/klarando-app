'use client'

import AdminLayout from '@/app/Components/admin/AdminLayout'
import { ApiMissingNotice } from '@/app/Components/admin/FeatureUnavailableNotice'
import {
  WorkspaceActions,
  WorkspaceHeader,
  WorkspaceStats,
  WorkspaceTabs,
  WorkspaceWarnings,
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
            { label: 'Pairing', value: 'LIMITED' },
            { label: 'Bulk-Aktionen', value: 'In Vorbereitung' },
            { label: 'Offline-Fokus', value: 'Aktiv' },
          ]}
        />
        <WorkspaceActions
          actions={[
            { href: '/admin/display-devices', label: 'Displays öffnen' },
            { href: '/admin/screen-studio', label: 'Design-Zuweisung' },
            { label: 'TV-Sticks Detaildiagnose', disabled: true, hint: 'API für TV-Stick Diagnosedaten fehlt noch.' },
            { label: 'Neu koppeln (Bulk)', disabled: true },
            { label: 'Gerät löschen/sperren (Bulk)', disabled: true },
          ]}
        />
        <WorkspaceWarnings warnings={['Bulk-Aktionen sind absichtlich deaktiviert, bis die einheitliche Geräte-API angebunden ist.']} />
        <ApiMissingNotice apiName="einheitliche TV-Stick Diagnose API" />
      </div>
    </AdminLayout>
  )
}
