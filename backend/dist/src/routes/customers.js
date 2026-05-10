"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const client_1 = require("@prisma/client");
const prisma_1 = require("../lib/prisma");
const auth_1 = require("../middleware/auth");
const audit_1 = require("../lib/audit");
const router = (0, express_1.Router)();
function normalizeText(value) {
    if (typeof value !== 'string') {
        return null;
    }
    const trimmed = value.trim();
    return trimmed.length > 0 ? trimmed : null;
}
function normalizeBoolean(value, fallback = false) {
    if (typeof value === 'boolean') {
        return value;
    }
    if (typeof value === 'string') {
        const lowered = value.trim().toLowerCase();
        if (lowered === 'true' || lowered === '1' || lowered === 'yes') {
            return true;
        }
        if (lowered === 'false' || lowered === '0' || lowered === 'no') {
            return false;
        }
    }
    return fallback;
}
function normalizeDate(value) {
    if (typeof value !== 'string') {
        return null;
    }
    const trimmed = value.trim();
    if (!trimmed) {
        return null;
    }
    if (!/^\d{4}-\d{2}-\d{2}$/.test(trimmed)) {
        return null;
    }
    const parsed = new Date(`${trimmed}T00:00:00.000Z`);
    if (Number.isNaN(parsed.getTime())) {
        return null;
    }
    return parsed;
}
function parsePositiveInt(value, fallback, max) {
    const parsed = Number(value);
    if (!Number.isFinite(parsed)) {
        return fallback;
    }
    return Math.min(Math.max(Math.round(parsed), 1), max);
}
function parseOptionalBoolean(value) {
    if (typeof value === 'boolean') {
        return value;
    }
    if (typeof value === 'string') {
        const lowered = value.trim().toLowerCase();
        if (lowered === 'true' || lowered === '1' || lowered === 'yes') {
            return true;
        }
        if (lowered === 'false' || lowered === '0' || lowered === 'no') {
            return false;
        }
    }
    return null;
}
async function resolveAppTenantScope(input) {
    const actor = input.authUser;
    if (!actor) {
        if (input.requestedTenantId) {
            return {
                restrictToTenantIds: true,
                tenantIds: [input.requestedTenantId],
            };
        }
        if (input.requestedChainId) {
            const chainTenants = await prisma_1.prisma.tenant.findMany({
                where: { chainId: input.requestedChainId },
                select: { id: true },
            });
            return {
                restrictToTenantIds: true,
                tenantIds: chainTenants.map((entry) => entry.id),
            };
        }
        return {
            restrictToTenantIds: false,
            tenantIds: [],
        };
    }
    if (actor.role === client_1.UserRole.SUPERADMIN) {
        const restrictToTenantIds = Boolean(input.requestedChainId || input.requestedTenantId);
        if (!restrictToTenantIds) {
            return {
                restrictToTenantIds: false,
                tenantIds: [],
            };
        }
        const tenants = await prisma_1.prisma.tenant.findMany({
            where: {
                id: input.requestedTenantId || undefined,
                chainId: input.requestedTenantId ? undefined : input.requestedChainId || undefined,
            },
            select: {
                id: true,
            },
        });
        return {
            restrictToTenantIds: true,
            tenantIds: tenants.map((entry) => entry.id),
        };
    }
    if (actor.role === client_1.UserRole.CHAINADMIN) {
        if (!actor.chainId) {
            return {
                restrictToTenantIds: true,
                tenantIds: [],
            };
        }
        if (input.requestedChainId && input.requestedChainId !== actor.chainId) {
            return {
                restrictToTenantIds: true,
                tenantIds: [],
            };
        }
        const tenants = await prisma_1.prisma.tenant.findMany({
            where: {
                chainId: actor.chainId,
                id: input.requestedTenantId || undefined,
            },
            select: {
                id: true,
            },
        });
        return {
            restrictToTenantIds: true,
            tenantIds: tenants.map((entry) => entry.id),
        };
    }
    if (!actor.tenantId) {
        return {
            restrictToTenantIds: true,
            tenantIds: [],
        };
    }
    if (input.requestedTenantId && input.requestedTenantId !== actor.tenantId) {
        return {
            restrictToTenantIds: true,
            tenantIds: [],
        };
    }
    if (input.requestedChainId) {
        const actorTenant = await prisma_1.prisma.tenant.findUnique({
            where: { id: actor.tenantId },
            select: { chainId: true },
        });
        if (!actorTenant || actorTenant.chainId !== input.requestedChainId) {
            return {
                restrictToTenantIds: true,
                tenantIds: [],
            };
        }
    }
    return {
        restrictToTenantIds: true,
        tenantIds: [actor.tenantId],
    };
}
function topEntriesFromCounter(counter, limit = 3) {
    return Array.from(counter.entries())
        .map(([name, count]) => ({ name, count }))
        .sort((left, right) => {
        if (right.count !== left.count) {
            return right.count - left.count;
        }
        return left.name.localeCompare(right.name, 'de');
    })
        .slice(0, limit);
}
function scopedCustomerWhere(req) {
    const actor = req.authUser;
    if (!actor) {
        return {};
    }
    if (actor.role === client_1.UserRole.CHAINADMIN && actor.chainId) {
        return { chainId: actor.chainId };
    }
    if ((actor.role === client_1.UserRole.ADMIN || actor.role === client_1.UserRole.STAFF) && actor.tenantId) {
        return { tenantId: actor.tenantId };
    }
    return {};
}
async function resolveTenantForWrite(req, tenantId) {
    const tenant = await prisma_1.prisma.tenant.findUnique({
        where: { id: tenantId },
        select: {
            id: true,
            chainId: true,
        },
    });
    if (!tenant) {
        return { ok: false, error: 'Filiale nicht gefunden' };
    }
    const actor = req.authUser;
    if (!actor) {
        return { ok: true, tenant };
    }
    if (actor.role === client_1.UserRole.SUPERADMIN) {
        return { ok: true, tenant };
    }
    if (actor.role === client_1.UserRole.CHAINADMIN) {
        if (!actor.chainId || tenant.chainId !== actor.chainId) {
            return { ok: false, error: 'Filiale liegt nicht in deiner Kette' };
        }
        return { ok: true, tenant };
    }
    if (!actor.tenantId || actor.tenantId !== tenant.id) {
        return { ok: false, error: 'Kein Zugriff auf diese Filiale' };
    }
    return { ok: true, tenant };
}
router.get('/', (0, auth_1.requirePermission)(client_1.PermissionKey.TENANTS_READ), async (req, res) => {
    try {
        const q = normalizeText(req.query.q);
        const tenantId = normalizeText(req.query.tenantId);
        const chainId = normalizeText(req.query.chainId);
        const activeParam = normalizeText(req.query.active);
        const limitRaw = Number(req.query.limit || 200);
        const limit = Number.isFinite(limitRaw) ? Math.min(Math.max(Math.round(limitRaw), 1), 500) : 200;
        const where = {
            ...scopedCustomerWhere(req),
        };
        if (tenantId) {
            where.tenantId = tenantId;
        }
        if (chainId) {
            where.chainId = chainId;
        }
        if (activeParam === 'true') {
            where.isActive = true;
        }
        else if (activeParam === 'false') {
            where.isActive = false;
        }
        if (q) {
            where.OR = [
                { firstName: { contains: q, mode: 'insensitive' } },
                { lastName: { contains: q, mode: 'insensitive' } },
                { email: { contains: q, mode: 'insensitive' } },
                { phone: { contains: q, mode: 'insensitive' } },
                { loyaltyCode: { contains: q, mode: 'insensitive' } },
            ];
        }
        const rows = await prisma_1.prisma.customerProfile.findMany({
            where,
            include: {
                tenant: {
                    select: {
                        id: true,
                        name: true,
                        chainId: true,
                    },
                },
                chain: {
                    select: {
                        id: true,
                        name: true,
                        code: true,
                    },
                },
            },
            orderBy: [{ updatedAt: 'desc' }],
            take: limit,
        });
        return res.json(rows);
    }
    catch (error) {
        console.error('GET CUSTOMERS ERROR:', error);
        return res.status(500).json({ error: 'Kundenstamm konnte nicht geladen werden' });
    }
});
router.post('/', (0, auth_1.requirePermission)(client_1.PermissionKey.TENANTS_WRITE), async (req, res) => {
    try {
        const tenantId = normalizeText(req.body.tenantId);
        const firstName = normalizeText(req.body.firstName);
        const lastName = normalizeText(req.body.lastName);
        const email = normalizeText(req.body.email)?.toLowerCase() || null;
        const phone = normalizeText(req.body.phone);
        const street = normalizeText(req.body.street);
        const zipCode = normalizeText(req.body.zipCode);
        const city = normalizeText(req.body.city);
        const birthDate = normalizeDate(req.body.birthDate);
        const loyaltyCode = normalizeText(req.body.loyaltyCode);
        const marketingOptIn = normalizeBoolean(req.body.marketingOptIn);
        const isActive = normalizeBoolean(req.body.isActive, true);
        const notes = normalizeText(req.body.notes);
        if (!tenantId || !firstName) {
            return res.status(400).json({ error: 'tenantId und firstName sind erforderlich' });
        }
        const access = await resolveTenantForWrite(req, tenantId);
        if (!access.ok) {
            return res.status(403).json({ error: access.error });
        }
        const created = await prisma_1.prisma.customerProfile.create({
            data: {
                tenantId: access.tenant.id,
                chainId: access.tenant.chainId,
                firstName,
                lastName,
                email,
                phone,
                street,
                zipCode,
                city,
                birthDate,
                loyaltyCode,
                marketingOptIn,
                isActive,
                notes,
                createdByUserId: req.authUser?.id || null,
            },
            include: {
                tenant: {
                    select: {
                        id: true,
                        name: true,
                        chainId: true,
                    },
                },
                chain: {
                    select: {
                        id: true,
                        name: true,
                        code: true,
                    },
                },
            },
        });
        await (0, audit_1.writeAuditLog)({
            req,
            module: 'customer-master',
            action: 'customer_profile_created',
            targetType: 'customer',
            targetId: created.id,
            chainId: created.chainId,
            tenantId: created.tenantId,
            metadata: {
                email: created.email,
                phone: created.phone,
            },
        });
        return res.status(201).json(created);
    }
    catch (error) {
        console.error('CREATE CUSTOMER ERROR:', error);
        return res.status(500).json({ error: 'Kunde konnte nicht erstellt werden' });
    }
});
router.patch('/:id', (0, auth_1.requirePermission)(client_1.PermissionKey.TENANTS_WRITE), async (req, res) => {
    try {
        const id = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id;
        if (!id) {
            return res.status(400).json({ error: 'id fehlt' });
        }
        const current = await prisma_1.prisma.customerProfile.findUnique({
            where: { id },
            select: {
                id: true,
                tenantId: true,
            },
        });
        if (!current) {
            return res.status(404).json({ error: 'Kunde nicht gefunden' });
        }
        const access = await resolveTenantForWrite(req, current.tenantId);
        if (!access.ok) {
            return res.status(403).json({ error: access.error });
        }
        const patch = req.body;
        const updated = await prisma_1.prisma.customerProfile.update({
            where: { id: current.id },
            data: {
                firstName: patch.firstName === undefined
                    ? undefined
                    : normalizeText(patch.firstName) || undefined,
                lastName: patch.lastName === undefined
                    ? undefined
                    : normalizeText(patch.lastName),
                email: patch.email === undefined
                    ? undefined
                    : normalizeText(patch.email)?.toLowerCase() || null,
                phone: patch.phone === undefined ? undefined : normalizeText(patch.phone),
                street: patch.street === undefined ? undefined : normalizeText(patch.street),
                zipCode: patch.zipCode === undefined ? undefined : normalizeText(patch.zipCode),
                city: patch.city === undefined ? undefined : normalizeText(patch.city),
                loyaltyCode: patch.loyaltyCode === undefined ? undefined : normalizeText(patch.loyaltyCode),
                notes: patch.notes === undefined ? undefined : normalizeText(patch.notes),
                birthDate: patch.birthDate === undefined
                    ? undefined
                    : patch.birthDate === null
                        ? null
                        : normalizeDate(patch.birthDate),
                marketingOptIn: patch.marketingOptIn === undefined
                    ? undefined
                    : normalizeBoolean(patch.marketingOptIn),
                isActive: patch.isActive === undefined ? undefined : normalizeBoolean(patch.isActive),
            },
            include: {
                tenant: {
                    select: {
                        id: true,
                        name: true,
                        chainId: true,
                    },
                },
                chain: {
                    select: {
                        id: true,
                        name: true,
                        code: true,
                    },
                },
            },
        });
        await (0, audit_1.writeAuditLog)({
            req,
            module: 'customer-master',
            action: 'customer_profile_updated',
            targetType: 'customer',
            targetId: updated.id,
            chainId: updated.chainId,
            tenantId: updated.tenantId,
            metadata: {
                isActive: updated.isActive,
            },
        });
        return res.json(updated);
    }
    catch (error) {
        console.error('UPDATE CUSTOMER ERROR:', error);
        return res.status(500).json({ error: 'Kunde konnte nicht aktualisiert werden' });
    }
});
router.delete('/:id', (0, auth_1.requirePermission)(client_1.PermissionKey.TENANTS_WRITE), async (req, res) => {
    try {
        const id = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id;
        if (!id) {
            return res.status(400).json({ error: 'id fehlt' });
        }
        const current = await prisma_1.prisma.customerProfile.findUnique({
            where: { id },
            select: {
                id: true,
                tenantId: true,
            },
        });
        if (!current) {
            return res.status(404).json({ error: 'Kunde nicht gefunden' });
        }
        const access = await resolveTenantForWrite(req, current.tenantId);
        if (!access.ok) {
            return res.status(403).json({ error: access.error });
        }
        const archived = await prisma_1.prisma.customerProfile.update({
            where: { id: current.id },
            data: {
                isActive: false,
            },
        });
        await (0, audit_1.writeAuditLog)({
            req,
            module: 'customer-master',
            action: 'customer_profile_archived',
            targetType: 'customer',
            targetId: archived.id,
            chainId: archived.chainId,
            tenantId: archived.tenantId,
        });
        return res.json({ ok: true, id: archived.id });
    }
    catch (error) {
        console.error('ARCHIVE CUSTOMER ERROR:', error);
        return res.status(500).json({ error: 'Kunde konnte nicht archiviert werden' });
    }
});
router.get('/app-accounts', (0, auth_1.requirePermission)(client_1.PermissionKey.TENANTS_READ), async (req, res) => {
    try {
        const chainId = normalizeText(req.query.chainId);
        const tenantId = normalizeText(req.query.tenantId);
        const q = normalizeText(req.query.q);
        const marketingOptIn = parseOptionalBoolean(req.query.marketingOptIn);
        const isActive = parseOptionalBoolean(req.query.isActive);
        const limit = parsePositiveInt(req.query.limit, 300, 600);
        const behaviorDays = parsePositiveInt(req.query.behaviorDays, 180, 365);
        const scope = await resolveAppTenantScope({
            authUser: req.authUser,
            requestedChainId: chainId,
            requestedTenantId: tenantId,
        });
        if (scope.restrictToTenantIds && scope.tenantIds.length === 0) {
            return res.json({
                generatedAt: new Date().toISOString(),
                behaviorDays,
                rows: [],
            });
        }
        const where = {};
        if (q) {
            where.OR = [
                { fullName: { contains: q, mode: 'insensitive' } },
                { email: { contains: q, mode: 'insensitive' } },
                { phone: { contains: q, mode: 'insensitive' } },
                { zipCode: { contains: q, mode: 'insensitive' } },
                { city: { contains: q, mode: 'insensitive' } },
            ];
        }
        if (typeof marketingOptIn === 'boolean') {
            where.marketingOptIn = marketingOptIn;
        }
        if (typeof isActive === 'boolean') {
            where.isActive = isActive;
        }
        if (scope.restrictToTenantIds) {
            where.orders = {
                some: {
                    tenantId: {
                        in: scope.tenantIds,
                    },
                },
            };
        }
        const accounts = await prisma_1.prisma.appCustomerAccount.findMany({
            where,
            select: {
                id: true,
                email: true,
                fullName: true,
                phone: true,
                street: true,
                zipCode: true,
                city: true,
                marketingOptIn: true,
                isActive: true,
                deletionRequestedAt: true,
                lastLoginAt: true,
                createdAt: true,
                updatedAt: true,
            },
            orderBy: [{ updatedAt: 'desc' }],
            take: limit,
        });
        if (accounts.length === 0) {
            return res.json({
                generatedAt: new Date().toISOString(),
                behaviorDays,
                rows: [],
            });
        }
        const accountIds = accounts.map((entry) => entry.id);
        const orderWhereBase = {
            appCustomerAccountId: { in: accountIds },
            tenantId: scope.restrictToTenantIds ? { in: scope.tenantIds } : undefined,
        };
        const groupedOrders = await prisma_1.prisma.order.groupBy({
            by: ['appCustomerAccountId'],
            where: orderWhereBase,
            _count: {
                _all: true,
            },
            _sum: {
                total: true,
            },
            _avg: {
                total: true,
            },
            _min: {
                createdAt: true,
            },
            _max: {
                createdAt: true,
            },
        });
        const groupedPaidOrders = await prisma_1.prisma.order.groupBy({
            by: ['appCustomerAccountId'],
            where: {
                ...orderWhereBase,
                paymentStatus: 'PAID',
            },
            _count: {
                _all: true,
            },
        });
        const now = Date.now();
        const behaviorSince = new Date(now - behaviorDays * 24 * 60 * 60 * 1000);
        const behaviorOrders = await prisma_1.prisma.order.findMany({
            where: {
                ...orderWhereBase,
                createdAt: {
                    gte: behaviorSince,
                },
            },
            select: {
                id: true,
                appCustomerAccountId: true,
                tenantId: true,
                serviceType: true,
                customerZipCode: true,
                customerCity: true,
                createdAt: true,
                tenant: {
                    select: {
                        id: true,
                        name: true,
                        chain: {
                            select: {
                                id: true,
                                name: true,
                                code: true,
                            },
                        },
                    },
                },
                items: {
                    select: {
                        quantity: true,
                        product: {
                            select: {
                                name: true,
                                category: {
                                    select: {
                                        name: true,
                                    },
                                },
                            },
                        },
                    },
                },
            },
            orderBy: [{ createdAt: 'desc' }],
            take: 5000,
        });
        const metricsByAccount = new Map(groupedOrders.map((entry) => [
            entry.appCustomerAccountId || '',
            {
                orderCount: entry._count._all,
                totalRevenue: Number(entry._sum.total ?? 0),
                avgOrderValue: Number(entry._avg.total ?? 0),
                firstOrderAt: entry._min.createdAt?.toISOString() || null,
                lastOrderAt: entry._max.createdAt?.toISOString() || null,
            },
        ]));
        const paidCountByAccount = new Map(groupedPaidOrders.map((entry) => [entry.appCustomerAccountId || '', entry._count._all]));
        const behaviorByAccount = new Map();
        for (const order of behaviorOrders) {
            if (!order.appCustomerAccountId) {
                continue;
            }
            const accountId = order.appCustomerAccountId;
            const current = behaviorByAccount.get(accountId) ||
                {
                    productCounter: new Map(),
                    categoryCounter: new Map(),
                    serviceTypeCounter: new Map(),
                    locationCounter: new Map(),
                    locationLookup: new Map(),
                    tenantCounter: new Map(),
                };
            const serviceType = normalizeText(order.serviceType) || 'Unbekannt';
            current.serviceTypeCounter.set(serviceType, (current.serviceTypeCounter.get(serviceType) || 0) + 1);
            const zipCode = normalizeText(order.customerZipCode);
            const city = normalizeText(order.customerCity);
            const locationKey = `${zipCode || '-'}|${city || '-'}`;
            current.locationCounter.set(locationKey, (current.locationCounter.get(locationKey) || 0) + 1);
            current.locationLookup.set(locationKey, { zipCode, city });
            const tenantKey = order.tenantId;
            const tenantName = order.tenant?.name || order.tenantId;
            const chainName = order.tenant?.chain?.name || null;
            const tenantCounterCurrent = current.tenantCounter.get(tenantKey) || {
                tenantId: tenantKey,
                tenantName,
                chainName,
                count: 0,
            };
            tenantCounterCurrent.count += 1;
            current.tenantCounter.set(tenantKey, tenantCounterCurrent);
            for (const item of order.items) {
                const quantity = Math.max(1, Number(item.quantity) || 1);
                const productName = normalizeText(item.product?.name) || 'Unbekanntes Produkt';
                current.productCounter.set(productName, (current.productCounter.get(productName) || 0) + quantity);
                const categoryName = normalizeText(item.product?.category?.name) || 'Ohne Kategorie';
                current.categoryCounter.set(categoryName, (current.categoryCounter.get(categoryName) || 0) + quantity);
            }
            behaviorByAccount.set(accountId, current);
        }
        const rows = accounts.map((account) => {
            const orderMetrics = metricsByAccount.get(account.id) || {
                orderCount: 0,
                totalRevenue: 0,
                avgOrderValue: 0,
                firstOrderAt: null,
                lastOrderAt: null,
            };
            const paidOrderCount = paidCountByAccount.get(account.id) || 0;
            const behavior = behaviorByAccount.get(account.id);
            const topProducts = behavior ? topEntriesFromCounter(behavior.productCounter, 3) : [];
            const topCategories = behavior ? topEntriesFromCounter(behavior.categoryCounter, 3) : [];
            const favoriteServiceType = behavior
                ? topEntriesFromCounter(behavior.serviceTypeCounter, 1)[0]?.name || null
                : null;
            const primaryLocationKey = behavior
                ? topEntriesFromCounter(behavior.locationCounter, 1)[0]?.name || null
                : null;
            const primaryLocation = primaryLocationKey
                ? behavior?.locationLookup.get(primaryLocationKey) || null
                : null;
            const tenantBreakdown = behavior
                ? Array.from(behavior.tenantCounter.values())
                    .sort((left, right) => right.count - left.count)
                    .slice(0, 6)
                : [];
            return {
                ...account,
                metrics: {
                    orderCount: orderMetrics.orderCount,
                    paidOrderCount,
                    totalRevenue: Number(orderMetrics.totalRevenue.toFixed(2)),
                    avgOrderValue: Number(orderMetrics.avgOrderValue.toFixed(2)),
                    firstOrderAt: orderMetrics.firstOrderAt,
                    lastOrderAt: orderMetrics.lastOrderAt,
                    topProducts,
                    topCategories,
                    favoriteServiceType,
                    primaryLocation,
                    tenantBreakdown,
                },
            };
        });
        return res.json({
            generatedAt: new Date().toISOString(),
            behaviorDays,
            rows,
        });
    }
    catch (error) {
        console.error('GET APP CUSTOMER ANALYTICS ERROR:', error);
        return res.status(500).json({ error: 'App-Kundenanalyse konnte nicht geladen werden' });
    }
});
router.post('/app-accounts/campaigns', (0, auth_1.requirePermission)(client_1.PermissionKey.TENANTS_WRITE), async (req, res) => {
    try {
        const actor = req.authUser;
        if (actor?.role !== client_1.UserRole.SUPERADMIN) {
            return res
                .status(403)
                .json({ error: 'Marketingkampagnen sind nur im Superadmin-Bereich erlaubt' });
        }
        const chainId = normalizeText(req.body.chainId);
        const tenantId = normalizeText(req.body.tenantId);
        const channelRaw = normalizeText(req.body.channel) || 'EMAIL';
        const subject = normalizeText(req.body.subject);
        const title = normalizeText(req.body.title);
        const message = normalizeText(req.body.message);
        const q = normalizeText(req.body.q);
        const channel = channelRaw.toUpperCase();
        if (!['EMAIL', 'PUSH', 'EMAIL_AND_PUSH'].includes(channel)) {
            return res
                .status(400)
                .json({ error: 'channel muss EMAIL, PUSH oder EMAIL_AND_PUSH sein' });
        }
        if (!message || message.length < 3) {
            return res.status(400).json({ error: 'message ist erforderlich' });
        }
        const scope = await resolveAppTenantScope({
            authUser: req.authUser,
            requestedChainId: chainId,
            requestedTenantId: tenantId,
        });
        if (scope.restrictToTenantIds && scope.tenantIds.length === 0) {
            return res.status(400).json({ error: 'Keine passenden Filialen fuer Kampagne gefunden' });
        }
        const where = {
            isActive: true,
            marketingOptIn: true,
            orders: scope.restrictToTenantIds
                ? {
                    some: {
                        tenantId: {
                            in: scope.tenantIds,
                        },
                    },
                }
                : undefined,
        };
        if (q) {
            where.OR = [
                { fullName: { contains: q, mode: 'insensitive' } },
                { email: { contains: q, mode: 'insensitive' } },
                { phone: { contains: q, mode: 'insensitive' } },
                { city: { contains: q, mode: 'insensitive' } },
            ];
        }
        const recipients = await prisma_1.prisma.appCustomerAccount.findMany({
            where,
            select: {
                id: true,
                email: true,
                fullName: true,
                lastLoginAt: true,
            },
            orderBy: [{ updatedAt: 'desc' }],
            take: 5000,
        });
        if (recipients.length === 0) {
            return res
                .status(400)
                .json({ error: 'Keine Empfaenger mit Marketing-Einwilligung gefunden' });
        }
        await (0, audit_1.writeAuditLog)({
            req,
            module: 'customer-master',
            action: 'app_customer_marketing_campaign_queued',
            targetType: 'appCustomerCampaign',
            chainId,
            tenantId,
            metadata: {
                channel,
                subject,
                title,
                messageLength: message.length,
                recipientCount: recipients.length,
                query: q,
            },
        });
        return res.status(202).json({
            ok: true,
            channel,
            queuedAt: new Date().toISOString(),
            recipientCount: recipients.length,
            recipientsPreview: recipients.slice(0, 120),
        });
    }
    catch (error) {
        console.error('POST APP CUSTOMER CAMPAIGN ERROR:', error);
        return res.status(500).json({ error: 'Marketingkampagne konnte nicht erstellt werden' });
    }
});
exports.default = router;
