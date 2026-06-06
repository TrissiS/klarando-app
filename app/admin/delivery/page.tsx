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
    <AdminLayout title="Lieferbetrieb-Workspace" subtitle="Lieferdienst, Liefergebiete und Touren fachlich getrennt verwalten.">
      <div className="space-y-4">
        <WorkspaceHeader
          title="Workspace: Lieferung"
          subtitle="Lieferdienst steuert Zeiten und Bestellannahme. Lieferzonen definieren separat Gebiet und Kosten. Touren planen danach die operative Zustellung."
        />
        <WorkspaceStats
          stats={[
            { label: 'Lieferdienst', value: 'Aktiv' },
            { label: 'Lieferzonen', value: 'Aktiv' },
            { label: 'Kostenregeln', value: 'Aktiv' },
            { label: 'Debug-Vorschau', value: 'Aktiv' },
            { label: 'Touren', value: 'Vorbereitet' },
          ]}
        />
        <WorkspaceTabs
          tabs={[
            { href: '/admin/settings#lieferdienst', label: 'Lieferdienst' },
            { href: '/admin/settings#liefergebiete-kosten', label: 'Lieferzonen & Kosten' },
            { href: '/admin/drivers', label: 'Fahrer' },
            { href: '/admin/tours', label: 'Touren' },
          ]}
        />
        <WorkspaceActions
          actions={[
            { href: '/admin/settings#lieferdienst', label: 'Lieferdienst öffnen' },
            { href: '/admin/settings#liefergebiete-kosten', label: 'Lieferzonen & Kosten öffnen' },
            { href: '/admin/drivers', label: 'Fahrer öffnen' },
            { href: '/admin/tours', label: 'Touren öffnen' },
          ]}
        />
        <WorkspaceWarnings
          warnings={[
            'Lieferdienst wird im Einstellungen-Bereich unter lieferdienst gepflegt.',
            'Lieferzonen und Kosten werden getrennt im Bereich liefergebiete-kosten gepflegt.',
            'Fahrer werden separat im Fahrerbereich verwaltet.',
            'Touren bleiben fachlich getrennt von Lieferdienst sowie Lieferzonen und Kosten.',
          ]}
        />
      </div>
    </AdminLayout>
  )
}
