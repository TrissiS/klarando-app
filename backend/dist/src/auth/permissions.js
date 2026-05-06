"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.DEFAULT_ROLE_PERMISSIONS = exports.ALL_PERMISSIONS = void 0;
exports.getDefaultPermissions = getDefaultPermissions;
exports.isAuthEnforced = isAuthEnforced;
const client_1 = require("@prisma/client");
exports.ALL_PERMISSIONS = Object.values(client_1.PermissionKey);
exports.DEFAULT_ROLE_PERMISSIONS = {
    [client_1.UserRole.SUPERADMIN]: exports.ALL_PERMISSIONS,
    [client_1.UserRole.CHAINADMIN]: [
        client_1.PermissionKey.TENANTS_READ,
        client_1.PermissionKey.TENANTS_WRITE,
        client_1.PermissionKey.USERS_READ,
        client_1.PermissionKey.USERS_WRITE,
        client_1.PermissionKey.PRODUCTS_READ,
        client_1.PermissionKey.PRODUCTS_WRITE,
        client_1.PermissionKey.INVENTORY_READ,
        client_1.PermissionKey.INVENTORY_WRITE,
        client_1.PermissionKey.ORDERS_READ,
        client_1.PermissionKey.ORDERS_WRITE,
        client_1.PermissionKey.SETTINGS_READ,
        client_1.PermissionKey.SETTINGS_WRITE,
        client_1.PermissionKey.AUDIT_READ,
    ],
    [client_1.UserRole.ADMIN]: [
        client_1.PermissionKey.TENANTS_READ,
        client_1.PermissionKey.USERS_READ,
        client_1.PermissionKey.USERS_WRITE,
        client_1.PermissionKey.PRODUCTS_READ,
        client_1.PermissionKey.PRODUCTS_WRITE,
        client_1.PermissionKey.INVENTORY_READ,
        client_1.PermissionKey.INVENTORY_WRITE,
        client_1.PermissionKey.ORDERS_READ,
        client_1.PermissionKey.ORDERS_WRITE,
        client_1.PermissionKey.SETTINGS_READ,
        client_1.PermissionKey.SETTINGS_WRITE,
    ],
    [client_1.UserRole.STAFF]: [
        client_1.PermissionKey.PRODUCTS_READ,
        client_1.PermissionKey.INVENTORY_READ,
        client_1.PermissionKey.ORDERS_READ,
        client_1.PermissionKey.ORDERS_WRITE,
    ],
};
function getDefaultPermissions(role) {
    return exports.DEFAULT_ROLE_PERMISSIONS[role] ?? [];
}
function isAuthEnforced() {
    return process.env.AUTH_ENFORCE === 'true';
}
