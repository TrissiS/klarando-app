type BackofficeNavItem = {
  href: string
  label: string
  tooltip?: string
}

export const SUPERADMIN_NAV_ITEMS: BackofficeNavItem[] = [
  { href: '/superadmin', label: 'Übersicht' },
  { href: '/superadmin/readiness', label: 'Production Readiness' },
  { href: '/superadmin/business-data', label: 'Unternehmen & Filialen' },
  { href: '/superadmin/onboarding', label: 'Onboarding' },
  { href: '/superadmin/trade-catalog', label: 'Handelsartikel' },
  { href: '/superadmin/promotions', label: 'Aktionen & News' },
  { href: '/superadmin/menu-import', label: 'Menü-Import' },
  { href: '/superadmin/cms', label: 'Website / CMS' },
  { href: '/superadmin/security', label: 'Benutzer & Rechte' },
  { href: '/superadmin/customer-management', label: 'Kundenverwaltung' },
  { href: '/superadmin/privacy-center', label: 'Kunden & Datenschutz' },
  { href: '/superadmin/orders', label: 'Bestellungen' },
  { href: '/superadmin/devices', label: 'Geräte' },
  { href: '/superadmin/billing', label: 'Billing & Finanzen' },
  { href: '/superadmin/payments', label: 'Zahlungsstatus' },
  { href: '/superadmin/app-settings', label: 'Einstellungen' },
]
