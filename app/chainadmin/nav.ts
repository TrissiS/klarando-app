import type { ComponentProps } from 'react'
import BackofficeLayout from '@/app/Components/admin/BackofficeLayout'

type BackofficeNavItem = ComponentProps<typeof BackofficeLayout>['navItems'][number]

export const CHAINADMIN_NAV_ITEMS: BackofficeNavItem[] = [
  { href: '/chainadmin', label: 'Benutzer & Pakete' },
  { href: '/chainadmin/display-devices', label: 'Displays' },
  { href: '/chainadmin/app-settings', label: 'App-Einstellungen' },
  { href: '/chainadmin/closings', label: 'Abschlüsse' },
  { href: '/admin/orders', label: 'Bestellungen' },
  { href: '/admin', label: 'Zum Adminbereich' },
]
