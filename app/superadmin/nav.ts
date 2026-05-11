import type { ComponentProps } from 'react'
import BackofficeLayout from '@/app/Components/admin/BackofficeLayout'

type BackofficeNavItem = ComponentProps<typeof BackofficeLayout>['navItems'][number]

export const SUPERADMIN_NAV_ITEMS: BackofficeNavItem[] = [
  { href: '/superadmin', label: 'Übersicht' },
  { href: '/superadmin/business-data', label: 'Unternehmen & Filialen' },
  { href: '/superadmin/onboarding', label: 'Neues Unternehmen anlegen' },
  { href: '/superadmin/business-templates', label: 'Vorlagen / Betriebsarten' },
  { href: '/superadmin/template-editor', label: 'Template-Editor' },
  { href: '/superadmin/security', label: 'Benutzer & Rechte' },
  { href: '/superadmin/orders', label: 'Bestellungen' },
  { href: '/superadmin/display-devices', label: 'Displays / Terminals' },
  { href: '/superadmin/app-settings', label: 'Einstellungen' },
  { href: '/superadmin/module-billing', label: 'Systemstatus' },
]
