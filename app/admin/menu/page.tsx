'use client'

import AdminLayout from '@/app/Components/admin/AdminLayout'
import { FeatureUnavailableNotice } from '@/app/Components/admin/FeatureUnavailableNotice'
import {
  WorkspaceActions,
  WorkspaceHeader,
  WorkspaceStats,
  WorkspaceTabs,
  WorkspaceWarnings,
} from '@/app/Components/admin/WorkspaceComponents'

const tabs = [
  { href: '/admin/products', label: 'Produkte' },
  { href: '/admin/categories', label: 'Kategorien' },
  { href: '/admin/ingredients', label: 'Zutaten & Allergene' },
  { href: '/admin/products?tab=modifiers', label: 'Extras / Optionen' },
  { href: '/admin/products/pricing', label: 'Preise & Kalkulation' },
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
            { label: 'Struktur', value: 'Aktiv' },
            { label: 'Import', value: 'LIMITED' },
            { label: 'Konfliktlösung', value: 'In Vorbereitung' },
            { label: 'Warnungen', value: 1 },
          ]}
        />
        <WorkspaceActions
          actions={[
            { href: '/admin/products', label: 'Produkte öffnen' },
            { href: '/admin/categories', label: 'Kategorien prüfen' },
            { label: 'Produktnummern-Konflikte', disabled: true, hint: 'Konfliktverwaltung wird als nächster Schritt angebunden.' },
            { label: 'Import-Warnungen', disabled: true, hint: 'Warnungs-Center wird vorbereitet.' },
          ]}
        />
        <WorkspaceWarnings warnings={['Produktnummern-Konflikte und Import-Warnungen sind noch in Vorbereitung.']} />
        <FeatureUnavailableNotice
          title="Hinweis zur Produktionsreife"
          message="Konfliktaufloesung fuer Produktnummern ist vorbereitet und wird als naechster stabiler Schritt angebunden."
          tone="warn"
        />
      </div>
    </AdminLayout>
  )
}
