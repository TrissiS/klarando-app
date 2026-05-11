'use client'

import BackofficeLayout from '@/app/Components/admin/BackofficeLayout'
import BusinessTemplateManager from '@/app/Components/admin/BusinessTemplateManager'
import { CHAINADMIN_NAV_ITEMS } from '@/app/chainadmin/nav'

export default function ChainadminBusinessTemplatesPage() {
  return (
    <BackofficeLayout
      brand="Kettenadmin"
      title="Business-Vorlagen"
      subtitle="Vorlagen fuer Filialen der eigenen Kette importieren"
      navItems={CHAINADMIN_NAV_ITEMS}
    >
      <BusinessTemplateManager roleHint="chainadmin" />
    </BackofficeLayout>
  )
}
