'use client'

export type AdminSearchDomain =
  | 'menu'
  | 'products'
  | 'devices'
  | 'users'
  | 'orders'
  | 'tenants'
  | 'branches'
  | 'settings'
  | 'billing'

export type AdminSearchEntry = {
  href: string
  label: string
  domain: AdminSearchDomain
  keywords: string[]
}

export const ADMIN_SEARCH_PREPARED_DOMAINS: AdminSearchDomain[] = [
  'products',
  'devices',
  'users',
  'orders',
  'tenants',
  'branches',
]

export const ADMIN_SEARCH_STATIC_ENTRIES: AdminSearchEntry[] = [
  {
    href: '/admin/products',
    label: 'Produkte',
    domain: 'products',
    keywords: ['produkt', 'produkte', 'speisekarte'],
  },
  {
    href: '/admin/screen-studio',
    label: 'Geräte / Screen-Studio',
    domain: 'devices',
    keywords: ['geraete', 'display', 'orderdesk', 'tv-stick'],
  },
  {
    href: '/admin/orders',
    label: 'Bestellungen',
    domain: 'orders',
    keywords: ['bestellung', 'orders', 'kueche'],
  },
  {
    href: '/admin/staff',
    label: 'Benutzer',
    domain: 'users',
    keywords: ['benutzer', 'rechte', 'users', 'team'],
  },
  {
    href: '/admin/settings',
    label: 'Einstellungen',
    domain: 'settings',
    keywords: ['einstellungen', 'config', 'verwaltung'],
  },
  {
    href: '/admin/finanzen',
    label: 'Abrechnung & Zahlungen',
    domain: 'billing',
    keywords: ['abrechnung', 'billing', 'finanzen'],
  },
]
