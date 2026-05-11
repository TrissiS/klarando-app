import type { ComponentProps } from 'react'
import BackofficeLayout from '@/app/Components/admin/BackofficeLayout'

type BackofficeNavItem = ComponentProps<typeof BackofficeLayout>['navItems'][number]

export const SUPERADMIN_NAV_ITEMS: BackofficeNavItem[] = [
  { href: '/superadmin', label: 'Plattformübersicht' },
  { href: '/superadmin/orders', label: 'Bestellungen' },
  { href: '/superadmin/business-templates', label: 'Business-Vorlagen' },
  { href: '/superadmin/business-data', label: 'Betriebe & Chains' },
  { href: '/superadmin/customers', label: 'Kunden' },
  { href: '/superadmin/drivers', label: 'Fahrer' },
  { href: '/superadmin/display-devices', label: 'Displays' },
  { href: '/superadmin/module-billing', label: 'Module & Pakete' },
  { href: '/superadmin/app-settings', label: 'App-Einstellungen' },
  { href: '/superadmin/misc-settings', label: 'Plattform-Branding' },
  { href: '/superadmin/security', label: 'Nutzer & Sicherheit' },
]
