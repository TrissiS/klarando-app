'use client'

import BackofficeLayout from '@/app/Components/admin/BackofficeLayout'
import BusinessTemplateManager from '@/app/Components/admin/BusinessTemplateManager'
import { SUPERADMIN_NAV_ITEMS } from '@/app/superadmin/nav'

export default function SuperadminBusinessTemplatesPage() {
  return (
    <BackofficeLayout
      brand="Superadmin"
      title="Business-Vorlagen"
      subtitle="Betriebsarten, Kategorien, Produkte und Zutaten als Vorlagen importieren"
      navItems={SUPERADMIN_NAV_ITEMS}
    >
      <BusinessTemplateManager roleHint="superadmin" />
    </BackofficeLayout>
  )
}
