"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.TenantScopeError = void 0;
exports.resolveTenantScope = resolveTenantScope;
exports.asTenantScopeError = asTenantScopeError;
const client_1 = require("@prisma/client");
const prisma_1 = require("./prisma");
class TenantScopeError extends Error {
    constructor(status, message) {
        super(message);
        this.name = 'TenantScopeError';
        this.status = status;
    }
}
exports.TenantScopeError = TenantScopeError;
function normalizeTenantId(input) {
    if (typeof input === 'string') {
        const trimmed = input.trim();
        return trimmed.length > 0 ? trimmed : null;
    }
    if (Array.isArray(input)) {
        return normalizeTenantId(input[0]);
    }
    return null;
}
async function resolveAllowedTenantIdsForUser(user) {
    if (user.role === client_1.UserRole.SUPERADMIN) {
        const tenants = await prisma_1.prisma.tenant.findMany({
            select: { id: true },
        });
        return tenants.map((entry) => entry.id);
    }
    if (user.role === client_1.UserRole.CHAINADMIN) {
        if (!user.chainId) {
            return [];
        }
        const tenants = await prisma_1.prisma.tenant.findMany({
            where: { chainId: user.chainId },
            select: { id: true },
        });
        return tenants.map((entry) => entry.id);
    }
    if ((user.role === client_1.UserRole.ADMIN || user.role === client_1.UserRole.STAFF || user.role === client_1.UserRole.DRIVER) &&
        user.tenantId) {
        return [user.tenantId];
    }
    if (user.role === client_1.UserRole.DRIVER) {
        const assignedOrders = await prisma_1.prisma.order.findMany({
            where: {
                assignedDriverId: user.id,
            },
            select: {
                tenantId: true,
            },
            distinct: ['tenantId'],
        });
        return assignedOrders
            .map((entry) => entry.tenantId)
            .filter((entry) => Boolean(entry));
    }
    return [];
}
async function resolveTenantScope(req, requestedTenantInput, options) {
    const authUser = req.authUser;
    if (!authUser) {
        throw new TenantScopeError(401, 'Nicht eingeloggt');
    }
    const requestedTenantId = normalizeTenantId(requestedTenantInput);
    const allowedTenantIds = await resolveAllowedTenantIdsForUser(authUser);
    if (requestedTenantId) {
        if (!allowedTenantIds.includes(requestedTenantId)) {
            throw new TenantScopeError(403, 'Keine Berechtigung fuer diese Filiale');
        }
        return {
            tenantId: requestedTenantId,
            allowedTenantIds,
        };
    }
    if (options?.allowMissingTenant) {
        return {
            tenantId: null,
            allowedTenantIds,
        };
    }
    throw new TenantScopeError(400, 'tenantId fehlt');
}
function asTenantScopeError(error) {
    if (error instanceof TenantScopeError) {
        return error;
    }
    return null;
}
