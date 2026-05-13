"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const client_1 = require("@prisma/client");
const prisma_1 = require("../lib/prisma");
const auth_1 = require("../middleware/auth");
const audit_1 = require("../lib/audit");
const database_provisioning_1 = require("../lib/database-provisioning");
const router = (0, express_1.Router)();
function normalizeAssignType(rawValue) {
    if (typeof rawValue !== 'string') {
        return 'UNASSIGNED';
    }
    const normalized = rawValue.trim().toUpperCase();
    if (normalized === 'CHAIN' || normalized === 'TENANT' || normalized === 'UNASSIGNED') {
        return normalized;
    }
    return 'UNASSIGNED';
}
function normalizeDatabaseName(rawValue) {
    if (typeof rawValue !== 'string') {
        return null;
    }
    const value = rawValue.trim().toLowerCase();
    if (!value) {
        return null;
    }
    if (!/^[a-z_][a-z0-9_]{0,62}$/.test(value)) {
        return null;
    }
    return value;
}
function enforceDatabaseManagementActorRole(role) {
    if (!role) {
        return null;
    }
    if (role === client_1.UserRole.ADMIN || role === client_1.UserRole.STAFF) {
        return 'Diese Rolle darf keine Datenbanken verwalten';
    }
    return null;
}
function formatTimestamp(value) {
    if (value instanceof Date) {
        return value.toISOString();
    }
    return value;
}
router.get('/overview', (0, auth_1.requirePermission)(client_1.PermissionKey.TENANTS_READ), async (req, res) => {
    try {
        const actor = req.authUser;
        const roleError = enforceDatabaseManagementActorRole(actor?.role);
        if (roleError) {
            return res.status(403).json({ error: roleError });
        }
        const chainScopeId = actor?.role === client_1.UserRole.CHAINADMIN ? actor.chainId : null;
        const [chains, tenants, registryOverview] = await Promise.all([
            prisma_1.prisma.chain.findMany({
                where: chainScopeId ? { id: chainScopeId } : undefined,
                select: {
                    id: true,
                    name: true,
                    code: true,
                },
                orderBy: {
                    name: 'asc',
                },
            }),
            prisma_1.prisma.tenant.findMany({
                where: chainScopeId ? { chainId: chainScopeId } : undefined,
                select: {
                    id: true,
                    name: true,
                    chainId: true,
                    chain: {
                        select: {
                            id: true,
                            name: true,
                            code: true,
                        },
                    },
                },
                orderBy: {
                    name: 'asc',
                },
            }),
            (0, database_provisioning_1.getDatabaseRegistryOverview)(),
        ]);
        const chainAssignmentById = new Map(registryOverview.chainAssignments.map((entry) => [entry.chainId, entry]));
        const tenantAssignmentById = new Map(registryOverview.tenantAssignments.map((entry) => [entry.tenantId, entry]));
        return res.json({
            chains: chains.map((chain) => {
                const assignment = chainAssignmentById.get(chain.id) || null;
                return {
                    id: chain.id,
                    name: chain.name,
                    code: chain.code,
                    database: assignment
                        ? {
                            databaseName: assignment.databaseName,
                            databaseUrl: assignment.databaseUrl,
                            updatedAt: assignment.updatedAt,
                        }
                        : null,
                };
            }),
            tenants: tenants.map((tenant) => {
                const assignment = tenantAssignmentById.get(tenant.id) || null;
                return {
                    id: tenant.id,
                    name: tenant.name,
                    chainId: tenant.chainId,
                    chainName: tenant.chain?.name || null,
                    chainCode: tenant.chain?.code || null,
                    database: assignment
                        ? {
                            databaseName: assignment.databaseName,
                            databaseUrl: assignment.databaseUrl,
                            updatedAt: assignment.updatedAt,
                        }
                        : null,
                };
            }),
            unassigned: actor?.role === client_1.UserRole.CHAINADMIN
                ? []
                : registryOverview.unassignedDatabases.map((entry) => ({
                    id: entry.id,
                    databaseName: entry.databaseName,
                    databaseUrl: entry.databaseUrl,
                    label: entry.label,
                    createdAt: entry.createdAt,
                    updatedAt: entry.updatedAt,
                })),
        });
    }
    catch (error) {
        console.error('GET DATABASE MANAGEMENT OVERVIEW ERROR:', error);
        return res.status(500).json({ error: 'Datenbank-Uebersicht konnte nicht geladen werden' });
    }
});
router.get('/admin-overview', (0, auth_1.requirePermission)(client_1.PermissionKey.TENANTS_READ), async (req, res) => {
    try {
        const actor = req.authUser;
        const roleError = enforceDatabaseManagementActorRole(actor?.role);
        if (roleError) {
            return res.status(403).json({ error: roleError });
        }
        const chainScopeId = actor?.role === client_1.UserRole.CHAINADMIN ? actor.chainId : null;
        const [chains, tenants, users, registryOverview] = await Promise.all([
            prisma_1.prisma.chain.findMany({
                where: chainScopeId ? { id: chainScopeId } : undefined,
                select: {
                    id: true,
                    name: true,
                    code: true,
                },
                orderBy: { name: 'asc' },
            }),
            prisma_1.prisma.tenant.findMany({
                where: chainScopeId ? { chainId: chainScopeId } : undefined,
                select: {
                    id: true,
                    name: true,
                    chainId: true,
                    chain: {
                        select: {
                            id: true,
                            name: true,
                            code: true,
                        },
                    },
                },
                orderBy: { name: 'asc' },
            }),
            prisma_1.prisma.user.findMany({
                where: chainScopeId ? { chainId: chainScopeId } : undefined,
                select: {
                    id: true,
                    email: true,
                    name: true,
                    role: true,
                    isActive: true,
                    chainId: true,
                    tenantId: true,
                    createdAt: true,
                },
                orderBy: [{ role: 'asc' }, { name: 'asc' }],
            }),
            (0, database_provisioning_1.getDatabaseRegistryOverview)(),
        ]);
        const tenantIds = tenants.map((entry) => entry.id);
        const chainIds = chains.map((entry) => entry.id);
        const [productCounts, categoryCounts, ingredientCounts, tenantUserCounts, chainUserCounts] = await Promise.all([
            tenantIds.length === 0
                ? Promise.resolve([])
                : prisma_1.prisma.product.groupBy({
                    by: ['tenantId'],
                    where: { tenantId: { in: tenantIds } },
                    _count: { _all: true },
                }),
            tenantIds.length === 0
                ? Promise.resolve([])
                : prisma_1.prisma.category.groupBy({
                    by: ['tenantId'],
                    where: { tenantId: { in: tenantIds } },
                    _count: { _all: true },
                }),
            tenantIds.length === 0
                ? Promise.resolve([])
                : prisma_1.prisma.ingredient.groupBy({
                    by: ['tenantId'],
                    where: { tenantId: { in: tenantIds } },
                    _count: { _all: true },
                }),
            tenantIds.length === 0
                ? Promise.resolve([])
                : prisma_1.prisma.user.groupBy({
                    by: ['tenantId'],
                    where: { tenantId: { in: tenantIds } },
                    _count: { _all: true },
                }),
            chainIds.length === 0
                ? Promise.resolve([])
                : prisma_1.prisma.user.groupBy({
                    by: ['chainId'],
                    where: { chainId: { in: chainIds } },
                    _count: { _all: true },
                }),
        ]);
        const productCountByTenantId = new Map(productCounts.map((entry) => [entry.tenantId, entry._count._all]));
        const categoryCountByTenantId = new Map(categoryCounts.map((entry) => [entry.tenantId, entry._count._all]));
        const ingredientCountByTenantId = new Map(ingredientCounts.map((entry) => [entry.tenantId, entry._count._all]));
        const userCountByTenantId = new Map(tenantUserCounts
            .filter((entry) => typeof entry.tenantId === 'string')
            .map((entry) => [entry.tenantId, entry._count._all]));
        const userCountByChainId = new Map(chainUserCounts
            .filter((entry) => typeof entry.chainId === 'string')
            .map((entry) => [entry.chainId, entry._count._all]));
        const tenantCountByChainId = new Map();
        for (const tenant of tenants) {
            if (!tenant.chainId) {
                continue;
            }
            tenantCountByChainId.set(tenant.chainId, (tenantCountByChainId.get(tenant.chainId) || 0) + 1);
        }
        const chainById = new Map(chains.map((entry) => [entry.id, entry]));
        const tenantById = new Map(tenants.map((entry) => [entry.id, entry]));
        const chainDbById = new Map(registryOverview.chainAssignments.map((entry) => [entry.chainId, entry]));
        const tenantDbById = new Map(registryOverview.tenantAssignments.map((entry) => [entry.tenantId, entry]));
        return res.json({
            generatedAt: new Date().toISOString(),
            users: users.map((user) => {
                const chain = user.chainId ? chainById.get(user.chainId) || null : null;
                const tenant = user.tenantId ? tenantById.get(user.tenantId) || null : null;
                const chainDb = user.chainId ? chainDbById.get(user.chainId) || null : null;
                const tenantDb = user.tenantId ? tenantDbById.get(user.tenantId) || null : null;
                const effectiveDb = tenantDb || chainDb || null;
                return {
                    id: user.id,
                    email: user.email,
                    name: user.name,
                    role: user.role,
                    isActive: user.isActive,
                    createdAt: formatTimestamp(user.createdAt),
                    chain: chain
                        ? {
                            id: chain.id,
                            name: chain.name,
                            code: chain.code,
                            databaseName: chainDb?.databaseName || null,
                        }
                        : null,
                    tenant: tenant
                        ? {
                            id: tenant.id,
                            name: tenant.name,
                            databaseName: tenantDb?.databaseName || null,
                        }
                        : null,
                    effectiveDatabaseName: effectiveDb?.databaseName || null,
                };
            }),
            chains: chains.map((chain) => {
                const chainDb = chainDbById.get(chain.id) || null;
                return {
                    id: chain.id,
                    name: chain.name,
                    code: chain.code,
                    tenantCount: tenantCountByChainId.get(chain.id) || 0,
                    userCount: userCountByChainId.get(chain.id) || 0,
                    databaseName: chainDb?.databaseName || null,
                    databaseUpdatedAt: chainDb?.updatedAt ? formatTimestamp(chainDb.updatedAt) : null,
                };
            }),
            tenants: tenants.map((tenant) => {
                const tenantDb = tenantDbById.get(tenant.id) || null;
                return {
                    id: tenant.id,
                    name: tenant.name,
                    chainId: tenant.chainId,
                    chainName: tenant.chain?.name || null,
                    chainCode: tenant.chain?.code || null,
                    productCount: productCountByTenantId.get(tenant.id) || 0,
                    categoryCount: categoryCountByTenantId.get(tenant.id) || 0,
                    ingredientCount: ingredientCountByTenantId.get(tenant.id) || 0,
                    userCount: userCountByTenantId.get(tenant.id) || 0,
                    databaseName: tenantDb?.databaseName || null,
                    databaseUpdatedAt: tenantDb?.updatedAt ? formatTimestamp(tenantDb.updatedAt) : null,
                };
            }),
            unassignedDatabases: actor?.role === client_1.UserRole.CHAINADMIN
                ? []
                : registryOverview.unassignedDatabases.map((entry) => ({
                    id: entry.id,
                    databaseName: entry.databaseName,
                    label: entry.label,
                    createdAt: formatTimestamp(entry.createdAt),
                    updatedAt: formatTimestamp(entry.updatedAt),
                })),
        });
    }
    catch (error) {
        console.error('GET DATABASE MANAGEMENT ADMIN OVERVIEW ERROR:', error);
        return res.status(500).json({ error: 'Admin-Uebersicht konnte nicht geladen werden' });
    }
});
router.post('/create-empty', (0, auth_1.requirePermission)(client_1.PermissionKey.TENANTS_WRITE), async (req, res) => {
    try {
        const actor = req.authUser;
        const roleError = enforceDatabaseManagementActorRole(actor?.role);
        if (roleError) {
            return res.status(403).json({ error: roleError });
        }
        const { label, databaseName, assignType: rawAssignType, chainId, tenantId, templateDatabase, } = req.body;
        const assignType = normalizeAssignType(rawAssignType);
        if (actor?.role === client_1.UserRole.CHAINADMIN && assignType === 'UNASSIGNED') {
            return res.status(403).json({
                error: 'CHAINADMIN darf keine unzugeordneten Datenbanken erstellen',
            });
        }
        let targetChainId = null;
        let targetChainCode = null;
        let targetTenantId = null;
        let targetTenantName = null;
        if (assignType === 'CHAIN') {
            const requestedChainId = actor?.role === client_1.UserRole.CHAINADMIN ? actor.chainId : chainId || null;
            if (!requestedChainId) {
                return res.status(400).json({ error: 'chainId ist erforderlich' });
            }
            const chain = await prisma_1.prisma.chain.findUnique({
                where: { id: requestedChainId },
                select: { id: true, code: true },
            });
            if (!chain) {
                return res.status(400).json({ error: 'Ungueltige chainId' });
            }
            targetChainId = chain.id;
            targetChainCode = chain.code;
        }
        if (assignType === 'TENANT') {
            if (!tenantId) {
                return res.status(400).json({ error: 'tenantId ist erforderlich' });
            }
            const tenant = await prisma_1.prisma.tenant.findUnique({
                where: {
                    id: tenantId,
                },
                select: {
                    id: true,
                    name: true,
                    chainId: true,
                    chain: {
                        select: {
                            code: true,
                        },
                    },
                },
            });
            if (!tenant) {
                return res.status(400).json({ error: 'Ungueltige tenantId' });
            }
            if (actor?.role === client_1.UserRole.CHAINADMIN && tenant.chainId !== actor.chainId) {
                return res.status(403).json({ error: 'Kein Zugriff auf diese Filiale' });
            }
            targetTenantId = tenant.id;
            targetTenantName = tenant.name;
            targetChainCode = tenant.chain?.code || null;
        }
        const createdDatabase = await (0, database_provisioning_1.createEmptyDatabase)({
            label,
            databaseName,
            templateDatabase,
        });
        await (0, database_provisioning_1.removeDatabaseAssignmentsByName)(createdDatabase.databaseName);
        if (assignType === 'CHAIN' && targetChainId) {
            await (0, database_provisioning_1.assignDatabaseToChain)({
                chainId: targetChainId,
                databaseName: createdDatabase.databaseName,
                databaseUrl: createdDatabase.databaseUrl,
            });
            await (0, database_provisioning_1.removeUnassignedDatabaseByName)(createdDatabase.databaseName);
        }
        else if (assignType === 'TENANT' && targetTenantId) {
            await (0, database_provisioning_1.assignDatabaseToTenant)({
                tenantId: targetTenantId,
                databaseName: createdDatabase.databaseName,
                databaseUrl: createdDatabase.databaseUrl,
                chainCode: targetChainCode,
                tenantName: targetTenantName,
            });
            await (0, database_provisioning_1.removeUnassignedDatabaseByName)(createdDatabase.databaseName);
        }
        else {
            await (0, database_provisioning_1.storeUnassignedDatabase)({
                databaseName: createdDatabase.databaseName,
                databaseUrl: createdDatabase.databaseUrl,
                label: label || null,
            });
        }
        await (0, audit_1.writeAuditLog)({
            req,
            module: 'database_management',
            action: 'empty_database_created',
            targetType: 'database',
            targetId: createdDatabase.databaseName,
            chainId: targetChainId,
            tenantId: targetTenantId,
            metadata: {
                assignType,
                chainId: targetChainId,
                tenantId: targetTenantId,
                chainCode: targetChainCode,
                created: createdDatabase.created,
            },
        });
        return res.status(201).json({
            ok: true,
            assignType,
            database: {
                databaseName: createdDatabase.databaseName,
                databaseUrl: createdDatabase.databaseUrl,
                created: createdDatabase.created,
            },
        });
    }
    catch (error) {
        if ((0, database_provisioning_1.isDatabaseProvisioningBlockedError)(error)) {
            await (0, audit_1.writeAuditLog)({
                req,
                module: 'database_management',
                action: 'database_provisioning_blocked',
                targetType: 'database',
                metadata: {
                    reason: 'ALLOW_PRODUCTION_DB_PROVISIONING_DISABLED',
                },
            });
            return res.status(403).json({ error: error.message, code: error.code });
        }
        console.error('CREATE EMPTY DATABASE ERROR:', error);
        return res.status(500).json({ error: 'Leere Datenbank konnte nicht erstellt werden' });
    }
});
router.post('/assign', (0, auth_1.requirePermission)(client_1.PermissionKey.TENANTS_WRITE), async (req, res) => {
    try {
        const actor = req.authUser;
        const roleError = enforceDatabaseManagementActorRole(actor?.role);
        if (roleError) {
            return res.status(403).json({ error: roleError });
        }
        const { databaseName: rawDatabaseName, assignType: rawAssignType, chainId, tenantId } = req.body;
        const databaseName = normalizeDatabaseName(rawDatabaseName);
        if (!databaseName) {
            return res.status(400).json({ error: 'databaseName ist ungueltig' });
        }
        const assignType = normalizeAssignType(rawAssignType);
        if (assignType === 'UNASSIGNED') {
            return res.status(400).json({ error: 'assignType muss CHAIN oder TENANT sein' });
        }
        const knownAssignments = await (0, database_provisioning_1.findDatabaseAssignmentsByName)(databaseName);
        const knownInRegistry = knownAssignments.chainAssignments.length > 0 ||
            knownAssignments.tenantAssignments.length > 0 ||
            knownAssignments.unassignedEntries.length > 0;
        let existsOnServer = false;
        try {
            existsOnServer = await (0, database_provisioning_1.databaseExists)(databaseName);
        }
        catch (lookupError) {
            console.warn('DATABASE EXISTS LOOKUP FAILED, CONTINUING WITH REGISTRY CHECK:', lookupError);
        }
        if (!knownInRegistry && !existsOnServer) {
            return res.status(400).json({ error: 'Datenbank existiert nicht auf dem Server' });
        }
        let targetChainId = null;
        let targetChainCode = null;
        let targetTenantId = null;
        let targetTenantName = null;
        if (assignType === 'CHAIN') {
            const requestedChainId = actor?.role === client_1.UserRole.CHAINADMIN ? actor.chainId : chainId || null;
            if (!requestedChainId) {
                return res.status(400).json({ error: 'chainId ist erforderlich' });
            }
            const chain = await prisma_1.prisma.chain.findUnique({
                where: { id: requestedChainId },
                select: { id: true, code: true },
            });
            if (!chain) {
                return res.status(400).json({ error: 'Ungueltige chainId' });
            }
            targetChainId = chain.id;
            targetChainCode = chain.code;
        }
        if (assignType === 'TENANT') {
            if (!tenantId) {
                return res.status(400).json({ error: 'tenantId ist erforderlich' });
            }
            const tenant = await prisma_1.prisma.tenant.findUnique({
                where: {
                    id: tenantId,
                },
                select: {
                    id: true,
                    name: true,
                    chainId: true,
                    chain: {
                        select: {
                            code: true,
                        },
                    },
                },
            });
            if (!tenant) {
                return res.status(400).json({ error: 'Ungueltige tenantId' });
            }
            if (actor?.role === client_1.UserRole.CHAINADMIN && tenant.chainId !== actor.chainId) {
                return res.status(403).json({ error: 'Kein Zugriff auf diese Filiale' });
            }
            targetTenantId = tenant.id;
            targetTenantName = tenant.name;
            targetChainCode = tenant.chain?.code || null;
        }
        const databaseUrl = (0, database_provisioning_1.buildDatabaseUrlFromName)(databaseName);
        await (0, database_provisioning_1.removeDatabaseAssignmentsByName)(databaseName);
        if (assignType === 'CHAIN' && targetChainId) {
            await (0, database_provisioning_1.assignDatabaseToChain)({
                chainId: targetChainId,
                databaseName,
                databaseUrl,
            });
        }
        else if (assignType === 'TENANT' && targetTenantId) {
            await (0, database_provisioning_1.assignDatabaseToTenant)({
                tenantId: targetTenantId,
                databaseName,
                databaseUrl,
                chainCode: targetChainCode,
                tenantName: targetTenantName,
            });
        }
        await (0, database_provisioning_1.removeUnassignedDatabaseByName)(databaseName);
        await (0, audit_1.writeAuditLog)({
            req,
            module: 'database_management',
            action: 'database_assigned',
            targetType: 'database',
            targetId: databaseName,
            chainId: targetChainId,
            tenantId: targetTenantId,
            metadata: {
                assignType,
                chainId: targetChainId,
                tenantId: targetTenantId,
                chainCode: targetChainCode,
            },
        });
        return res.json({
            ok: true,
            assignType,
            database: {
                databaseName,
                databaseUrl,
            },
        });
    }
    catch (error) {
        console.error('ASSIGN DATABASE ERROR:', error);
        return res.status(500).json({ error: 'Datenbank konnte nicht zugewiesen werden' });
    }
});
router.delete('/:databaseName', (0, auth_1.requirePermission)(client_1.PermissionKey.TENANTS_WRITE), async (req, res) => {
    try {
        const actor = req.authUser;
        const roleError = enforceDatabaseManagementActorRole(actor?.role);
        if (roleError) {
            return res.status(403).json({ error: roleError });
        }
        const rawDatabaseName = Array.isArray(req.params.databaseName)
            ? req.params.databaseName[0]
            : req.params.databaseName;
        const databaseName = normalizeDatabaseName(rawDatabaseName);
        if (!databaseName) {
            return res.status(400).json({ error: 'databaseName ist ungueltig' });
        }
        await (0, audit_1.writeAuditLog)({
            req,
            module: 'database_management',
            action: 'database_delete_blocked',
            targetType: 'database',
            targetId: databaseName,
            metadata: {
                reason: 'UI_DATABASE_DELETE_DISABLED',
                actorRole: actor?.role || null,
            },
        });
        return res
            .status(403)
            .json({ error: 'Datenbanken koennen nicht ueber die UI geloescht werden.' });
    }
    catch (error) {
        console.error('DELETE DATABASE ERROR:', error);
        return res.status(500).json({ error: 'Datenbank konnte nicht geloescht werden' });
    }
});
exports.default = router;
