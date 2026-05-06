import { PermissionKey, UserRole } from '@prisma/client'

export const ALL_PERMISSIONS: PermissionKey[] = Object.values(PermissionKey)

export const DEFAULT_ROLE_PERMISSIONS: Record<UserRole, PermissionKey[]> = {
  [UserRole.SUPERADMIN]: ALL_PERMISSIONS,
  [UserRole.CHAINADMIN]: [
    PermissionKey.TENANTS_READ,
    PermissionKey.TENANTS_WRITE,
    PermissionKey.USERS_READ,
    PermissionKey.USERS_WRITE,
    PermissionKey.PRODUCTS_READ,
    PermissionKey.PRODUCTS_WRITE,
    PermissionKey.INVENTORY_READ,
    PermissionKey.INVENTORY_WRITE,
    PermissionKey.ORDERS_READ,
    PermissionKey.ORDERS_WRITE,
    PermissionKey.SETTINGS_READ,
    PermissionKey.SETTINGS_WRITE,
    PermissionKey.AUDIT_READ,
  ],
  [UserRole.ADMIN]: [
    PermissionKey.TENANTS_READ,
    PermissionKey.USERS_READ,
    PermissionKey.USERS_WRITE,
    PermissionKey.PRODUCTS_READ,
    PermissionKey.PRODUCTS_WRITE,
    PermissionKey.INVENTORY_READ,
    PermissionKey.INVENTORY_WRITE,
    PermissionKey.ORDERS_READ,
    PermissionKey.ORDERS_WRITE,
    PermissionKey.SETTINGS_READ,
    PermissionKey.SETTINGS_WRITE,
  ],
  [UserRole.STAFF]: [
    PermissionKey.PRODUCTS_READ,
    PermissionKey.INVENTORY_READ,
    PermissionKey.ORDERS_READ,
    PermissionKey.ORDERS_WRITE,
  ],
  [UserRole.DRIVER]: [
    PermissionKey.ORDERS_READ,
    PermissionKey.ORDERS_WRITE,
  ],
}

export function getDefaultPermissions(role: UserRole): PermissionKey[] {
  return DEFAULT_ROLE_PERMISSIONS[role] ?? []
}

export function isAuthEnforced() {
  return process.env.AUTH_ENFORCE === 'true'
}
