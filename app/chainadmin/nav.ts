type BackofficeNavItem = {
  href: string
  label: string
  tooltip?: string
}

export const CHAINADMIN_NAV_ITEMS: BackofficeNavItem[] = [
  { href: '/chainadmin', label: 'Übersicht' },
  { href: '/chainadmin/app-settings', label: 'Unternehmen & Filialen' },
  { href: '/chainadmin/business-templates', label: 'Vorlagen' },
  { href: '/chainadmin/display-devices', label: 'System' },
  { href: '/chainadmin/closings', label: 'Abschlüsse' },
  { href: '/admin/orders', label: 'Bestellungen' },
  { href: '/admin', label: 'Zum Adminbereich' },
]
