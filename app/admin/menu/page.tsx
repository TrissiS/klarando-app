'use client'

import Link from 'next/link'
import AdminLayout from '@/app/Components/admin/AdminLayout'
import { FeatureUnavailableNotice, ComingSoonAction } from '@/app/Components/admin/FeatureUnavailableNotice'

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
        <div className="rounded-2xl border border-slate-200 bg-white p-4 shadow-sm">
          <p className="text-sm font-semibold text-slate-900">Arbeitsbereiche</p>
          <div className="mt-3 flex flex-wrap gap-2">
            {tabs.map((tab) => (
              <Link key={tab.href} href={tab.href} className="rounded-xl border border-[var(--brand-border)] bg-white px-3 py-2 text-sm font-semibold text-rose-900 hover:bg-rose-50">
                {tab.label}
              </Link>
            ))}
            <ComingSoonAction label="Produktnummern-Konflikte" />
            <ComingSoonAction label="Import-Warnungen" />
          </div>
        </div>
        <FeatureUnavailableNotice
          title="Hinweis zur Produktionsreife"
          message="Konfliktaufloesung fuer Produktnummern ist vorbereitet und wird als naechster stabiler Schritt angebunden."
          tone="warn"
        />
      </div>
    </AdminLayout>
  )
}
