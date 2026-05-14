type BackofficeNavItem = {
  href: string
  label: string
  tooltip?: string
}

export const SUPERADMIN_NAV_ITEMS: BackofficeNavItem[] = [
  { href: '/superadmin', label: 'Übersicht' },
  { href: '/superadmin/business-data', label: 'Unternehmen & Filialen' },
  { href: '/superadmin/onboarding', label: 'Neues Unternehmen' },
  { href: '/superadmin/business-templates', label: 'Vorlagen' },
  { href: '/superadmin/template-editor', label: 'Vorlagen-Editor' },
  { href: '/superadmin/promotions', label: 'Aktionen & News' },
  { href: '/superadmin/menu-import', label: 'Menü-Import' },
  { href: '/superadmin/cms', label: 'Website / CMS' },
  { href: '/superadmin/security', label: 'Benutzer & Rechte' },
  { href: '/superadmin/orders', label: 'Bestellungen' },
  { href: '/superadmin/display-devices', label: 'Geräte' },
  { href: '/superadmin/payments', label: 'Zahlungsstatus' },
  { href: '/superadmin/fees', label: 'Gebühren & Provisionen' },
  { href: '/superadmin/billing', label: 'Billing' },
  { href: '/superadmin/app-settings', label: 'Einstellungen' },
  { href: '/superadmin/module-billing', label: 'Systemstatus' },
]
