import type { AccessPermission, BusinessSettings } from '@/lib/api'

export type AdminModuleKey =
  | 'dashboard'
  | 'products'
  | 'inventory'
  | 'orders'
  | 'displays'
  | 'actions'
  | 'staff'
  | 'drivers'
  | 'app-settings'
  | 'settings'

type ModuleRule = {
  allPermissions?: AccessPermission[]
  anyPermissions?: AccessPermission[]
  featureEnabled?: (settings: BusinessSettings | null) => boolean
}

type ModuleContext = {
  permissions: Set<string> | null
  businessSettings?: BusinessSettings | null
}

const MODULE_RULES: Record<AdminModuleKey, ModuleRule> = {
  dashboard: {},
  products: {
    allPermissions: ['PRODUCTS_READ'],
  },
  inventory: {
    allPermissions: ['INVENTORY_READ'],
  },
  orders: {
    allPermissions: ['ORDERS_READ'],
  },
  displays: {
    allPermissions: ['ORDERS_READ'],
  },
  actions: {
    allPermissions: ['PRODUCTS_READ'],
  },
  staff: {
    allPermissions: ['USERS_READ'],
  },
  drivers: {
    allPermissions: ['SETTINGS_READ'],
    featureEnabled: (settings) => settings?.driver.enabled !== false,
  },
  'app-settings': {
    allPermissions: ['SETTINGS_READ'],
  },
  settings: {
    allPermissions: ['SETTINGS_READ'],
  },
}

export function isModuleEnabled(
  moduleKey: AdminModuleKey,
  context: ModuleContext
) {
  const rule = MODULE_RULES[moduleKey]
  if (!rule) {
    return false
  }

  const { permissions } = context
  if (permissions !== null) {
    if (rule.allPermissions && rule.allPermissions.some((permission) => !permissions.has(permission))) {
      return false
    }
    if (
      rule.anyPermissions &&
      rule.anyPermissions.length > 0 &&
      !rule.anyPermissions.some((permission) => permissions.has(permission))
    ) {
      return false
    }
  }

  if (rule.featureEnabled && !rule.featureEnabled(context.businessSettings ?? null)) {
    return false
  }

  return true
}
