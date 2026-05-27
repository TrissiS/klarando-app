'use client'

import AdminLayout from '@/app/Components/admin/AdminLayout'
import {
  WorkspaceHeader,
  WorkspaceStats,
  WorkspaceTabs,
} from '@/app/Components/admin/WorkspaceComponents'

const tabs = [
  { href: '/admin/products?tab=products', label: 'Produkte' },
  { href: '/admin/products?tab=categories', label: 'Kategorien' },
  { href: '/admin/products?tab=ingredients', label: 'Zutaten & Allergene' },
  { href: '/admin/products?tab=modifiers', label: 'Extras / Optionen' },
  { href: '/admin/products?tab=pricing', label: 'Preise & Kalkulation' },
  { href: '/superadmin/menu-import', label: 'Menü-Import' },
]

export default function MenuWorkspacePage() {
  return (
    <AdminLayout title="Speisekarten-Workspace" subtitle="Alle Menüaufgaben gebündelt in einem Bereich.">
      <div className="space-y-4">
        <WorkspaceHeader
          title="Workspace: Speisekarte"
          subtitle="Produkte, Kategorien, Zutaten, Preise und Import zentral steuern."
        />
        <WorkspaceTabs tabs={tabs} />
        <WorkspaceStats
          stats={[
            { label: 'Produkte', value: 'Verfügbar' },
            { label: 'Kategorien', value: 'Verfügbar' },
            { label: 'Preise', value: 'Verfügbar' },
            { label: 'Menüpflege', value: 'Aktiv' },
          ]}
        />
      </div>
    </AdminLayout>
  )
}
