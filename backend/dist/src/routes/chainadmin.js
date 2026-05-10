"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const client_1 = require("@prisma/client");
const express_1 = require("express");
const prisma_1 = require("../lib/prisma");
const auth_1 = require("../middleware/auth");
const audit_1 = require("../lib/audit");
const router = (0, express_1.Router)();
function parseDays(rawValue) {
    const parsed = Number(rawValue);
    if (!Number.isFinite(parsed)) {
        return 30;
    }
    return Math.min(365, Math.max(1, Math.trunc(parsed)));
}
function resolveDateRange(days) {
    const to = new Date();
    const from = new Date(to.getTime() - days * 24 * 60 * 60 * 1000);
    return { from, to };
}
function normalizeText(input) {
    if (input === undefined) {
        return undefined;
    }
    if (input === null) {
        return null;
    }
    const trimmed = input.trim();
    return trimmed.length > 0 ? trimmed : null;
}
router.get('/dashboard', (0, auth_1.requirePermission)(client_1.PermissionKey.ORDERS_READ), async (req, res) => {
    try {
        const actor = req.authUser;
        if (!actor) {
            return res.status(401).json({ error: 'Nicht eingeloggt' });
        }
        if (actor.role !== client_1.UserRole.CHAINADMIN && actor.role !== client_1.UserRole.SUPERADMIN) {
            return res.status(403).json({ error: 'Nur CHAINADMIN oder SUPERADMIN erlaubt' });
        }
        const requestedChainId = req.query.chainId;
        const chainId = actor.role === client_1.UserRole.SUPERADMIN ? requestedChainId : actor.chainId;
        if (!chainId) {
            return res.status(400).json({ error: 'chainId fehlt' });
        }
        const periodDays = parseDays(req.query.days);
        const { from, to } = resolveDateRange(periodDays);
        const chainTenants = await prisma_1.prisma.tenant.findMany({
            where: {
                chainId,
            },
            select: {
                id: true,
                name: true,
            },
            orderBy: {
                name: 'asc',
            },
        });
        let accessRows = [];
        if (actor.role === client_1.UserRole.CHAINADMIN) {
            accessRows = await prisma_1.prisma.chainAdminTenantAccess.findMany({
                where: {
                    chainAdminUserId: actor.id,
                    tenant: {
                        chainId,
                    },
                },
                select: {
                    tenantId: true,
                    superadminGranted: true,
                    canViewRevenue: true,
                    canManageAppOrders: true,
                    canManageDelivery: true,
                    canManagePickup: true,
                    canViewPurchasing: true,
                    canViewStaffPlanning: true,
                    canOverrideSettings: true,
                    notes: true,
                },
            });
        }
        const allowedTenantIds = actor.role === client_1.UserRole.CHAINADMIN
            ? accessRows.filter((entry) => entry.superadminGranted).map((entry) => entry.tenantId)
            : chainTenants.map((entry) => entry.id);
        if (allowedTenantIds.length === 0) {
            return res.json({
                periodDays,
                from: from.toISOString(),
                to: to.toISOString(),
                totals: {
                    revenue: 0,
                    paidOrders: 0,
                    purchasingVolume: 0,
                    plannedShifts: 0,
                    activeStaff: 0,
                    tenants: 0,
                },
                tenants: [],
            });
        }
        const [paidOrders, goodsReceipts, shifts, activeStaff] = await Promise.all([
            prisma_1.prisma.order.findMany({
                where: {
                    tenantId: {
                        in: allowedTenantIds,
                    },
                    paymentStatus: 'PAID',
                    createdAt: {
                        gte: from,
                        lte: to,
                    },
                },
                select: {
                    tenantId: true,
                    total: true,
                },
            }),
            prisma_1.prisma.stockMovement.findMany({
                where: {
                    tenantId: {
                        in: allowedTenantIds,
                    },
                    type: 'GOODS_RECEIPT',
                    createdAt: {
                        gte: from,
                        lte: to,
                    },
                },
                select: {
                    tenantId: true,
                    quantityDelta: true,
                    unitCost: true,
                },
            }),
            prisma_1.prisma.staffShift.findMany({
                where: {
                    tenantId: {
                        in: allowedTenantIds,
                    },
                    shiftDate: {
                        gte: from,
                        lte: to,
                    },
                },
                select: {
                    tenantId: true,
                    status: true,
                },
            }),
            prisma_1.prisma.staffMember.findMany({
                where: {
                    tenantId: {
                        in: allowedTenantIds,
                    },
                    isActive: true,
                },
                select: {
                    tenantId: true,
                },
            }),
        ]);
        const statsByTenant = new Map();
        for (const tenantId of allowedTenantIds) {
            statsByTenant.set(tenantId, {
                paidOrders: 0,
                revenue: 0,
                purchasingVolume: 0,
                plannedShifts: 0,
                activeStaff: 0,
            });
        }
        for (const order of paidOrders) {
            const current = statsByTenant.get(order.tenantId);
            if (!current) {
                continue;
            }
            current.paidOrders += 1;
            current.revenue += Number(order.total);
        }
        for (const movement of goodsReceipts) {
            const current = statsByTenant.get(movement.tenantId);
            if (!current) {
                continue;
            }
            const quantity = Math.abs(Number(movement.quantityDelta));
            const unitCost = movement.unitCost ? Number(movement.unitCost) : 0;
            current.purchasingVolume += quantity * unitCost;
        }
        for (const shift of shifts) {
            const current = statsByTenant.get(shift.tenantId);
            if (!current) {
                continue;
            }
            if (shift.status === 'PLANNED') {
                current.plannedShifts += 1;
            }
        }
        for (const member of activeStaff) {
            const current = statsByTenant.get(member.tenantId);
            if (!current) {
                continue;
            }
            current.activeStaff += 1;
        }
        const accessByTenant = new Map(accessRows.map((entry) => [entry.tenantId, entry]));
        const tenantRows = chainTenants
            .filter((tenant) => allowedTenantIds.includes(tenant.id))
            .map((tenant) => {
            const stats = statsByTenant.get(tenant.id) ?? {
                paidOrders: 0,
                revenue: 0,
                purchasingVolume: 0,
                plannedShifts: 0,
                activeStaff: 0,
            };
            const access = accessByTenant.get(tenant.id);
            return {
                tenantId: tenant.id,
                tenantName: tenant.name,
                paidOrders: stats.paidOrders,
                revenue: Number(stats.revenue.toFixed(2)),
                purchasingVolume: Number(stats.purchasingVolume.toFixed(2)),
                plannedShifts: stats.plannedShifts,
                activeStaff: stats.activeStaff,
                rights: access
                    ? {
                        superadminGranted: access.superadminGranted,
                        canViewRevenue: access.canViewRevenue,
                        canManageAppOrders: access.canManageAppOrders,
                        canManageDelivery: access.canManageDelivery,
                        canManagePickup: access.canManagePickup,
                        canViewPurchasing: access.canViewPurchasing,
                        canViewStaffPlanning: access.canViewStaffPlanning,
                        canOverrideSettings: access.canOverrideSettings,
                        notes: access.notes,
                    }
                    : null,
            };
        })
            .sort((left, right) => left.tenantName.localeCompare(right.tenantName, 'de-DE'));
        const totals = tenantRows.reduce((acc, entry) => {
            acc.revenue += entry.revenue;
            acc.paidOrders += entry.paidOrders;
            acc.purchasingVolume += entry.purchasingVolume;
            acc.plannedShifts += entry.plannedShifts;
            acc.activeStaff += entry.activeStaff;
            return acc;
        }, {
            revenue: 0,
            paidOrders: 0,
            purchasingVolume: 0,
            plannedShifts: 0,
            activeStaff: 0,
            tenants: tenantRows.length,
        });
        return res.json({
            periodDays,
            from: from.toISOString(),
            to: to.toISOString(),
            totals: {
                ...totals,
                revenue: Number(totals.revenue.toFixed(2)),
                purchasingVolume: Number(totals.purchasingVolume.toFixed(2)),
            },
            tenants: tenantRows,
        });
    }
    catch (error) {
        console.error('GET CHAINADMIN DASHBOARD ERROR:', error);
        return res.status(500).json({ error: 'Kettenadmin-Dashboard konnte nicht geladen werden' });
    }
});
router.get('/access-rights', (0, auth_1.requirePermission)(client_1.PermissionKey.TENANTS_READ), async (req, res) => {
    try {
        const actor = req.authUser;
        if (!actor) {
            return res.status(401).json({ error: 'Nicht eingeloggt' });
        }
        const requestedUserId = req.query.chainAdminUserId;
        let chainAdminUserId = actor.id;
        let chainId = actor.chainId;
        if (actor.role === client_1.UserRole.SUPERADMIN) {
            if (!requestedUserId) {
                return res.status(400).json({ error: 'chainAdminUserId fehlt' });
            }
            const chainadminUser = await prisma_1.prisma.user.findUnique({
                where: { id: requestedUserId },
                select: {
                    id: true,
                    role: true,
                    chainId: true,
                },
            });
            if (!chainadminUser || chainadminUser.role !== client_1.UserRole.CHAINADMIN) {
                return res.status(404).json({ error: 'CHAINADMIN nicht gefunden' });
            }
            chainAdminUserId = chainadminUser.id;
            chainId = chainadminUser.chainId;
        }
        else if (actor.role !== client_1.UserRole.CHAINADMIN) {
            return res.status(403).json({ error: 'Nur CHAINADMIN oder SUPERADMIN erlaubt' });
        }
        if (!chainId) {
            return res.status(400).json({ error: 'Kette konnte nicht aufgeloest werden' });
        }
        const [tenants, rights] = await Promise.all([
            prisma_1.prisma.tenant.findMany({
                where: {
                    chainId,
                },
                select: {
                    id: true,
                    name: true,
                },
                orderBy: {
                    name: 'asc',
                },
            }),
            prisma_1.prisma.chainAdminTenantAccess.findMany({
                where: {
                    chainAdminUserId,
                    tenant: {
                        chainId,
                    },
                },
                orderBy: {
                    tenant: {
                        name: 'asc',
                    },
                },
            }),
        ]);
        const rightsByTenant = new Map(rights.map((entry) => [entry.tenantId, entry]));
        const rows = tenants.map((tenant) => {
            const existing = rightsByTenant.get(tenant.id);
            return {
                tenantId: tenant.id,
                tenantName: tenant.name,
                superadminGranted: existing?.superadminGranted ?? false,
                canViewRevenue: existing?.canViewRevenue ?? true,
                canManageAppOrders: existing?.canManageAppOrders ?? true,
                canManageDelivery: existing?.canManageDelivery ?? true,
                canManagePickup: existing?.canManagePickup ?? true,
                canViewPurchasing: existing?.canViewPurchasing ?? true,
                canViewStaffPlanning: existing?.canViewStaffPlanning ?? true,
                canOverrideSettings: existing?.canOverrideSettings ?? false,
                notes: existing?.notes ?? null,
            };
        });
        return res.json({
            chainAdminUserId,
            chainId,
            rights: rows,
        });
    }
    catch (error) {
        console.error('GET CHAINADMIN ACCESS RIGHTS ERROR:', error);
        return res.status(500).json({ error: 'Filialrechte konnten nicht geladen werden' });
    }
});
router.put('/access-rights', (0, auth_1.requirePermission)(client_1.PermissionKey.TENANTS_WRITE), async (req, res) => {
    try {
        const actor = req.authUser;
        if (!actor) {
            return res.status(401).json({ error: 'Nicht eingeloggt' });
        }
        const { chainAdminUserId: rawChainAdminUserId, tenantId, superadminGranted, canViewRevenue, canManageAppOrders, canManageDelivery, canManagePickup, canViewPurchasing, canViewStaffPlanning, canOverrideSettings, notes, } = req.body;
        if (!tenantId) {
            return res.status(400).json({ error: 'tenantId fehlt' });
        }
        const tenant = await prisma_1.prisma.tenant.findUnique({
            where: {
                id: tenantId,
            },
            select: {
                id: true,
                chainId: true,
                name: true,
            },
        });
        if (!tenant) {
            return res.status(404).json({ error: 'Filiale nicht gefunden' });
        }
        let chainAdminUserId = actor.id;
        let chainAdminUserChainId = actor.chainId;
        if (actor.role === client_1.UserRole.SUPERADMIN) {
            if (!rawChainAdminUserId) {
                return res.status(400).json({ error: 'chainAdminUserId fehlt' });
            }
            const chainadminUser = await prisma_1.prisma.user.findUnique({
                where: {
                    id: rawChainAdminUserId,
                },
                select: {
                    id: true,
                    role: true,
                    chainId: true,
                },
            });
            if (!chainadminUser || chainadminUser.role !== client_1.UserRole.CHAINADMIN) {
                return res.status(404).json({ error: 'CHAINADMIN nicht gefunden' });
            }
            chainAdminUserId = chainadminUser.id;
            chainAdminUserChainId = chainadminUser.chainId;
        }
        else if (actor.role !== client_1.UserRole.CHAINADMIN) {
            return res.status(403).json({ error: 'Nur CHAINADMIN oder SUPERADMIN erlaubt' });
        }
        if (!chainAdminUserChainId || tenant.chainId !== chainAdminUserChainId) {
            return res.status(403).json({ error: 'Filiale gehoert nicht zur Kette des CHAINADMIN' });
        }
        const existing = await prisma_1.prisma.chainAdminTenantAccess.findUnique({
            where: {
                chainAdminUserId_tenantId: {
                    chainAdminUserId,
                    tenantId,
                },
            },
            select: {
                id: true,
                superadminGranted: true,
                canOverrideSettings: true,
            },
        });
        if (actor.role === client_1.UserRole.CHAINADMIN && (!existing || !existing.superadminGranted)) {
            return res.status(403).json({
                error: 'Keine Superadmin-Freigabe fuer diese Filiale vorhanden',
            });
        }
        if (actor.role === client_1.UserRole.CHAINADMIN &&
            (superadminGranted !== undefined || canOverrideSettings !== undefined)) {
            return res.status(403).json({
                error: 'Superadmin-Freigabe und Oberhand bei Einstellungen kann nur SUPERADMIN setzen',
            });
        }
        const updated = await prisma_1.prisma.chainAdminTenantAccess.upsert({
            where: {
                chainAdminUserId_tenantId: {
                    chainAdminUserId,
                    tenantId,
                },
            },
            create: {
                chainAdminUserId,
                tenantId,
                superadminGranted: actor.role === client_1.UserRole.SUPERADMIN ? superadminGranted ?? true : true,
                canViewRevenue: canViewRevenue ?? true,
                canManageAppOrders: canManageAppOrders ?? true,
                canManageDelivery: canManageDelivery ?? true,
                canManagePickup: canManagePickup ?? true,
                canViewPurchasing: canViewPurchasing ?? true,
                canViewStaffPlanning: canViewStaffPlanning ?? true,
                canOverrideSettings: actor.role === client_1.UserRole.SUPERADMIN ? canOverrideSettings ?? false : false,
                notes: normalizeText(notes),
            },
            update: {
                superadminGranted: actor.role === client_1.UserRole.SUPERADMIN ? superadminGranted : undefined,
                canViewRevenue,
                canManageAppOrders,
                canManageDelivery,
                canManagePickup,
                canViewPurchasing,
                canViewStaffPlanning,
                canOverrideSettings: actor.role === client_1.UserRole.SUPERADMIN ? canOverrideSettings : undefined,
                notes: notes === undefined ? undefined : normalizeText(notes),
            },
            select: {
                chainAdminUserId: true,
                tenantId: true,
                superadminGranted: true,
                canViewRevenue: true,
                canManageAppOrders: true,
                canManageDelivery: true,
                canManagePickup: true,
                canViewPurchasing: true,
                canViewStaffPlanning: true,
                canOverrideSettings: true,
                notes: true,
                updatedAt: true,
            },
        });
        await (0, audit_1.writeAuditLog)({
            req,
            module: 'chainadmin',
            action: 'chainadmin_tenant_access_updated',
            targetType: 'tenant',
            targetId: tenant.id,
            chainId: tenant.chainId,
            tenantId: tenant.id,
            metadata: {
                chainAdminUserId: updated.chainAdminUserId,
                superadminGranted: updated.superadminGranted,
                canViewRevenue: updated.canViewRevenue,
                canManageAppOrders: updated.canManageAppOrders,
                canManageDelivery: updated.canManageDelivery,
                canManagePickup: updated.canManagePickup,
                canViewPurchasing: updated.canViewPurchasing,
                canViewStaffPlanning: updated.canViewStaffPlanning,
                canOverrideSettings: updated.canOverrideSettings,
            },
        });
        return res.json(updated);
    }
    catch (error) {
        console.error('UPDATE CHAINADMIN ACCESS RIGHTS ERROR:', error);
        return res.status(500).json({ error: 'Filialrechte konnten nicht gespeichert werden' });
    }
});
exports.default = router;
