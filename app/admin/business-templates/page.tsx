'use client'

import AdminLayout from '@/app/Components/admin/AdminLayout'
import BusinessTemplateManager from '@/app/Components/admin/BusinessTemplateManager'

export default function AdminBusinessTemplatesPage() {
  return (
    <AdminLayout
      title="Business-Vorlagen"
      subtitle="Vorlagen fuer Kategorien, Produkte und Zutaten in diese Filiale importieren"
    >
      <BusinessTemplateManager roleHint="admin" />
    </AdminLayout>
  )
}
