import type { AccessPermission } from './api'

export type AccessPackage = {
  id: string
  name: string
  description: string
  permissions: AccessPermission[]
}

export const ACCESS_PACKAGES: AccessPackage[] = [
  {
    id: 'products',
    name: 'Produktverwaltung',
    description: 'Produkte, Kategorien, Zutaten, Aktionen, Kalkulation',
    permissions: ['PRODUCTS_READ', 'PRODUCTS_WRITE'],
  },
  {
    id: 'orders',
    name: 'Bestellungen & Kasse',
    description: 'Bestellungen, Küche, POS, Bestellterminals, Displays',
    permissions: ['ORDERS_READ', 'ORDERS_WRITE'],
  },
  {
    id: 'inventory',
    name: 'Lager & Einkauf',
    description: 'Wareneingang, Inventur, Ausbuchung, Lieferanten',
    permissions: ['INVENTORY_READ', 'INVENTORY_WRITE'],
  },
  {
    id: 'staff',
    name: 'Benutzer & Team',
    description: 'Benutzerverwaltung, Mitarbeiter, Schichtplanung',
    permissions: ['USERS_READ', 'USERS_WRITE'],
  },
  {
    id: 'settings',
    name: 'App & Systemeinstellungen',
    description: 'App-Einstellungen, Bildschirmoptionen, Freigaben',
    permissions: ['SETTINGS_READ', 'SETTINGS_WRITE'],
  },
  {
    id: 'tenant-management',
    name: 'Ketten & Filialen',
    description: 'Ketten-, Filial- und Zuordnungsverwaltung',
    permissions: ['TENANTS_READ', 'TENANTS_WRITE'],
  },
  {
    id: 'audit',
    name: 'Audit & Compliance',
    description: 'Protokolle, Nachvollziehbarkeit und Prüfübersicht',
    permissions: ['AUDIT_READ'],
  },
]

export const ACCESS_PERMISSION_LABELS: Record<AccessPermission, string> = {
  TENANTS_READ: 'Ketten und Filialen lesen',
  TENANTS_WRITE: 'Ketten und Filialen bearbeiten',
  USERS_READ: 'Benutzer lesen',
  USERS_WRITE: 'Benutzer bearbeiten',
  PRODUCTS_READ: 'Produkte und Kategorien lesen',
  PRODUCTS_WRITE: 'Produkte und Kategorien bearbeiten',
  INVENTORY_READ: 'Lager und Einkauf lesen',
  INVENTORY_WRITE: 'Lager und Einkauf bearbeiten',
  ORDERS_READ: 'Bestellungen lesen',
  ORDERS_WRITE: 'Bestellungen bearbeiten',
  SETTINGS_READ: 'Einstellungen lesen',
  SETTINGS_WRITE: 'Einstellungen bearbeiten',
  AUDIT_READ: 'Audit-Protokolle lesen',
}

export function formatAccessPermission(permission: AccessPermission) {
  return ACCESS_PERMISSION_LABELS[permission] || permission
}

export function permissionsFromPackageIds(packageIds: string[]) {
  const selected = new Set<string>(packageIds)
  const permissions = new Set<AccessPermission>()

  for (const entry of ACCESS_PACKAGES) {
    if (!selected.has(entry.id)) {
      continue
    }

    for (const permission of entry.permissions) {
      permissions.add(permission)
    }
  }

  return Array.from(permissions).sort() as AccessPermission[]
}

export function packageIdsFromPermissions(permissions: AccessPermission[]) {
  const granted = new Set<string>(permissions)
  const packageIds: string[] = []

  for (const entry of ACCESS_PACKAGES) {
    const enabled = entry.permissions.every((permission) => granted.has(permission))
    if (enabled) {
      packageIds.push(entry.id)
    }
  }

  return packageIds
}
