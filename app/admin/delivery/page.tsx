'use client'

import AdminLayout from '@/app/Components/admin/AdminLayout'
import {
  WorkspaceActions,
  WorkspaceHeader,
  WorkspaceStats,
  WorkspaceTabs,
  WorkspaceWarnings,
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
        <WorkspaceTabs
          tabs={[
            { href: '/admin/settings#delivery-area', label: 'Lieferzonen & Kosten' },
            { href: '/admin/drivers', label: 'Fahrer' },
            { href: '/admin/tours', label: 'Touren' },
          ]}
        />
        <WorkspaceActions
          actions={[
            { href: '/admin/settings#delivery-area', label: 'Lieferzonen & Kosten öffnen' },
            { href: '/admin/drivers', label: 'Fahrer öffnen' },
            { href: '/admin/tours', label: 'Touren öffnen' },
          ]}
        />
        <WorkspaceWarnings
          warnings={[
            'Lieferzonen und Kosten werden im Einstellungen-Bereich unter delivery-area gepflegt.',
            'Fahrer werden separat im Fahrerbereich verwaltet.',
            'Touren bleiben fachlich getrennt von Lieferzonen und Kosten.',
          ]}
        />
      </div>
    </AdminLayout>
  )
}
