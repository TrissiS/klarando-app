"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const client_1 = require("@prisma/client");
const express_1 = require("express");
const prisma_1 = require("../lib/prisma");
const auth_1 = require("../middleware/auth");
const audit_1 = require("../lib/audit");
const router = (0, express_1.Router)();
function normalizeText(value) {
    if (!value) {
        return null;
    }
    const trimmed = value.trim();
    return trimmed.length > 0 ? trimmed : null;
}
function parseWeeklyDays(input) {
    if (!Array.isArray(input)) {
        return [];
    }
    const parsed = Array.from(new Set(input
        .map((entry) => Number(entry))
        .filter((entry) => Number.isInteger(entry) && entry >= 1 && entry <= 7)));
    return parsed.sort((a, b) => a - b);
}
function normalizeWeeklyDays(input) {
    const parsed = parseWeeklyDays(input);
    return parsed.length > 0 ? parsed.join(',') : null;
}
function readWeeklyDays(raw) {
    if (!raw) {
        return [];
    }
    return raw
        .split(',')
        .map((entry) => Number(entry))
        .filter((entry) => Number.isInteger(entry) && entry >= 1 && entry <= 7);
}
function parseTime(input) {
    if (!input) {
        return null;
    }
    if (!/^\d{2}:\d{2}$/.test(input)) {
        return null;
    }
    const [hourText, minuteText] = input.split(':');
    const hour = Number(hourText);
    const minute = Number(minuteText);
    if (hour < 0 || hour > 23 || minute < 0 || minute > 59) {
        return null;
    }
    return `${hourText}:${minuteText}`;
}
function currentTimeHHMM(date = new Date()) {
    const hour = String(date.getHours()).padStart(2, '0');
    const minute = String(date.getMinutes()).padStart(2, '0');
    return `${hour}:${minute}`;
}
function isActionCurrentlyActive(action) {
    if (!action.isActive) {
        return false;
    }
    const now = new Date();
    if (action.startAt && now < action.startAt) {
        return false;
    }
    if (action.endAt && now > action.endAt) {
        return false;
    }
    const currentTime = currentTimeHHMM(now);
    const startTime = parseTime(action.dailyStartTime);
    const endTime = parseTime(action.dailyEndTime);
    if (startTime && endTime) {
        if (currentTime < startTime || currentTime > endTime) {
            return false;
        }
    }
    if (action.kind === client_1.ActionKind.WEEKLY) {
        const weekday = now.getDay() === 0 ? 7 : now.getDay();
        const allowedDays = readWeeklyDays(action.weeklyDays);
        if (allowedDays.length === 0 || !allowedDays.includes(weekday)) {
            return false;
        }
    }
    return true;
}
async function validateProductScope(tenantId, productIds) {
    if (productIds.length === 0) {
        return true;
    }
    const products = await prisma_1.prisma.product.findMany({
        where: {
            tenantId,
            id: {
                in: productIds,
            },
        },
        select: { id: true },
    });
    return products.length === productIds.length;
}
router.get('/', (0, auth_1.requirePermission)(client_1.PermissionKey.PRODUCTS_READ), async (req, res) => {
    try {
        const tenantId = req.query.tenantId;
        if (!tenantId) {
            return res.status(400).json({ error: 'tenantId fehlt' });
        }
        const actions = await prisma_1.prisma.action.findMany({
            where: { tenantId },
            include: {
                products: {
                    include: {
                        product: {
                            select: {
                                id: true,
                                name: true,
                                productNumber: true,
                                price: true,
                                available: true,
                            },
                        },
                    },
                    orderBy: [{ createdAt: 'asc' }],
                },
            },
            orderBy: [{ createdAt: 'desc' }],
        });
        return res.json(actions.map((action) => ({
            ...action,
            weeklyDays: readWeeklyDays(action.weeklyDays),
        })));
    }
    catch (error) {
        console.error('GET ACTIONS ERROR:', error);
        return res.status(500).json({ error: 'Aktionen konnten nicht geladen werden' });
    }
});
router.get('/active', (0, auth_1.requirePermission)(client_1.PermissionKey.PRODUCTS_READ), async (req, res) => {
    try {
        const tenantId = req.query.tenantId;
        if (!tenantId) {
            return res.status(400).json({ error: 'tenantId fehlt' });
        }
        const actions = await prisma_1.prisma.action.findMany({
            where: {
                tenantId,
                isActive: true,
            },
            include: {
                products: {
                    include: {
                        product: {
                            select: {
                                id: true,
                                name: true,
                                productNumber: true,
                                price: true,
                            },
                        },
                    },
                },
            },
            orderBy: [{ createdAt: 'desc' }],
        });
        const active = actions.filter((action) => isActionCurrentlyActive(action));
        return res.json(active.map((action) => ({
            ...action,
            weeklyDays: readWeeklyDays(action.weeklyDays),
        })));
    }
    catch (error) {
        console.error('GET ACTIVE ACTIONS ERROR:', error);
        return res.status(500).json({ error: 'Aktive Aktionen konnten nicht geladen werden' });
    }
});
router.post('/', (0, auth_1.requirePermission)(client_1.PermissionKey.PRODUCTS_WRITE), async (req, res) => {
    try {
        const { tenantId, name, description, kind, valueType, value, isActive, startAt, endAt, weeklyDays, dailyStartTime, dailyEndTime, productIds, } = req.body;
        if (!tenantId || !name || !kind || !valueType || value === undefined) {
            return res.status(400).json({ error: 'Pflichtfelder fehlen' });
        }
        if (!Object.values(client_1.ActionKind).includes(kind)) {
            return res.status(400).json({ error: 'ungueltiger kind' });
        }
        if (!Object.values(client_1.ActionValueType).includes(valueType)) {
            return res.status(400).json({ error: 'ungueltiger valueType' });
        }
        const parsedValue = Number(value);
        if (!Number.isFinite(parsedValue) || parsedValue <= 0) {
            return res.status(400).json({ error: 'value muss groesser als 0 sein' });
        }
        if (valueType === client_1.ActionValueType.PERCENT && parsedValue > 100) {
            return res.status(400).json({ error: 'Prozentwert darf max. 100 sein' });
        }
        const normalizedStartAt = startAt ? new Date(startAt) : null;
        const normalizedEndAt = endAt ? new Date(endAt) : null;
        if (startAt && Number.isNaN(normalizedStartAt?.getTime())) {
            return res.status(400).json({ error: 'ungueltiges startAt' });
        }
        if (endAt && Number.isNaN(normalizedEndAt?.getTime())) {
            return res.status(400).json({ error: 'ungueltiges endAt' });
        }
        if (normalizedStartAt && normalizedEndAt && normalizedStartAt > normalizedEndAt) {
            return res.status(400).json({ error: 'startAt darf nicht nach endAt liegen' });
        }
        if (kind === client_1.ActionKind.ONE_TIME && (!normalizedStartAt || !normalizedEndAt)) {
            return res
                .status(400)
                .json({ error: 'Einmalige Aktionen benoetigen startAt und endAt' });
        }
        const normalizedWeeklyDays = normalizeWeeklyDays(weeklyDays);
        if (kind === client_1.ActionKind.WEEKLY && !normalizedWeeklyDays) {
            return res.status(400).json({ error: 'Woechentliche Aktionen brauchen Wochentage' });
        }
        const normalizedDailyStartTime = parseTime(normalizeText(dailyStartTime));
        const normalizedDailyEndTime = parseTime(normalizeText(dailyEndTime));
        if (normalizeText(dailyStartTime) && !normalizedDailyStartTime) {
            return res.status(400).json({ error: 'ungueltige dailyStartTime (HH:mm)' });
        }
        if (normalizeText(dailyEndTime) && !normalizedDailyEndTime) {
            return res.status(400).json({ error: 'ungueltige dailyEndTime (HH:mm)' });
        }
        if (normalizedDailyStartTime &&
            normalizedDailyEndTime &&
            normalizedDailyStartTime > normalizedDailyEndTime) {
            return res
                .status(400)
                .json({ error: 'dailyStartTime darf nicht nach dailyEndTime liegen' });
        }
        const normalizedProductIds = Array.isArray(productIds)
            ? Array.from(new Set(productIds.filter((id) => typeof id === 'string' && id.length > 0)))
            : [];
        const productsAreValid = await validateProductScope(tenantId, normalizedProductIds);
        if (!productsAreValid) {
            return res.status(400).json({ error: 'Mindestens ein Produkt gehoert nicht zum Tenant' });
        }
        const action = await prisma_1.prisma.action.create({
            data: {
                tenantId,
                name: name.trim(),
                description: normalizeText(description),
                kind,
                valueType,
                value: parsedValue,
                isActive: isActive ?? true,
                startAt: normalizedStartAt,
                endAt: normalizedEndAt,
                weeklyDays: kind === client_1.ActionKind.WEEKLY ? normalizedWeeklyDays : null,
                dailyStartTime: normalizedDailyStartTime,
                dailyEndTime: normalizedDailyEndTime,
                products: {
                    create: normalizedProductIds.map((productId) => ({
                        productId,
                    })),
                },
            },
            include: {
                products: {
                    include: {
                        product: {
                            select: {
                                id: true,
                                name: true,
                                productNumber: true,
                                price: true,
                                available: true,
                            },
                        },
                    },
                    orderBy: [{ createdAt: 'asc' }],
                },
            },
        });
        await (0, audit_1.writeAuditLog)({
            req,
            module: 'actions',
            action: 'action_created',
            targetType: 'action',
            targetId: action.id,
            tenantId: action.tenantId,
            metadata: {
                name: action.name,
                kind: action.kind,
                productCount: action.products.length,
            },
        });
        return res.status(201).json({
            ...action,
            weeklyDays: readWeeklyDays(action.weeklyDays),
        });
    }
    catch (error) {
        if (error instanceof client_1.Prisma.PrismaClientKnownRequestError &&
            error.code === 'P2003') {
            return res.status(400).json({ error: 'Ungueltige Referenzdaten' });
        }
        console.error('CREATE ACTION ERROR:', error);
        return res.status(500).json({ error: 'Aktion konnte nicht erstellt werden' });
    }
});
router.patch('/:id', (0, auth_1.requirePermission)(client_1.PermissionKey.PRODUCTS_WRITE), async (req, res) => {
    try {
        const id = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id;
        const { tenantId, name, description, kind, valueType, value, isActive, startAt, endAt, weeklyDays, dailyStartTime, dailyEndTime, productIds, } = req.body;
        if (!id || !tenantId) {
            return res.status(400).json({ error: 'id und tenantId sind erforderlich' });
        }
        const existing = await prisma_1.prisma.action.findUnique({
            where: { id },
            select: { id: true, tenantId: true },
        });
        if (!existing || existing.tenantId !== tenantId) {
            return res.status(404).json({ error: 'Aktion nicht gefunden' });
        }
        if (kind && !Object.values(client_1.ActionKind).includes(kind)) {
            return res.status(400).json({ error: 'ungueltiger kind' });
        }
        if (valueType && !Object.values(client_1.ActionValueType).includes(valueType)) {
            return res.status(400).json({ error: 'ungueltiger valueType' });
        }
        const parsedValue = value === undefined ? undefined : Number(value);
        if (parsedValue !== undefined && (!Number.isFinite(parsedValue) || parsedValue <= 0)) {
            return res.status(400).json({ error: 'value muss groesser als 0 sein' });
        }
        if (valueType === client_1.ActionValueType.PERCENT &&
            parsedValue !== undefined &&
            parsedValue > 100) {
            return res.status(400).json({ error: 'Prozentwert darf max. 100 sein' });
        }
        const normalizedStartAt = startAt === undefined ? undefined : startAt ? new Date(startAt) : null;
        const normalizedEndAt = endAt === undefined ? undefined : endAt ? new Date(endAt) : null;
        if (normalizedStartAt && Number.isNaN(normalizedStartAt.getTime())) {
            return res.status(400).json({ error: 'ungueltiges startAt' });
        }
        if (normalizedEndAt && Number.isNaN(normalizedEndAt.getTime())) {
            return res.status(400).json({ error: 'ungueltiges endAt' });
        }
        if (normalizedStartAt && normalizedEndAt && normalizedStartAt > normalizedEndAt) {
            return res.status(400).json({ error: 'startAt darf nicht nach endAt liegen' });
        }
        const normalizedDailyStartTime = dailyStartTime === undefined ? undefined : parseTime(normalizeText(dailyStartTime));
        const normalizedDailyEndTime = dailyEndTime === undefined ? undefined : parseTime(normalizeText(dailyEndTime));
        if (dailyStartTime !== undefined && normalizeText(dailyStartTime) && !normalizedDailyStartTime) {
            return res.status(400).json({ error: 'ungueltige dailyStartTime (HH:mm)' });
        }
        if (dailyEndTime !== undefined && normalizeText(dailyEndTime) && !normalizedDailyEndTime) {
            return res.status(400).json({ error: 'ungueltige dailyEndTime (HH:mm)' });
        }
        if (normalizedDailyStartTime &&
            normalizedDailyEndTime &&
            normalizedDailyStartTime > normalizedDailyEndTime) {
            return res
                .status(400)
                .json({ error: 'dailyStartTime darf nicht nach dailyEndTime liegen' });
        }
        let normalizedProductIds;
        if (productIds !== undefined) {
            normalizedProductIds = Array.from(new Set(productIds.filter((entry) => typeof entry === 'string' && entry.length > 0)));
            const productsAreValid = await validateProductScope(tenantId, normalizedProductIds);
            if (!productsAreValid) {
                return res
                    .status(400)
                    .json({ error: 'Mindestens ein Produkt gehoert nicht zum Tenant' });
            }
        }
        const normalizedWeeklyDays = weeklyDays === undefined ? undefined : normalizeWeeklyDays(weeklyDays);
        const action = await prisma_1.prisma.$transaction(async (tx) => {
            const updated = await tx.action.update({
                where: { id },
                data: {
                    name: name === undefined ? undefined : name.trim(),
                    description: description === undefined ? undefined : normalizeText(description),
                    kind,
                    valueType,
                    value: parsedValue,
                    isActive,
                    startAt: normalizedStartAt,
                    endAt: normalizedEndAt,
                    weeklyDays: normalizedWeeklyDays,
                    dailyStartTime: normalizedDailyStartTime,
                    dailyEndTime: normalizedDailyEndTime,
                },
            });
            if (normalizedProductIds !== undefined) {
                await tx.actionProduct.deleteMany({
                    where: { actionId: id },
                });
                if (normalizedProductIds.length > 0) {
                    await tx.actionProduct.createMany({
                        data: normalizedProductIds.map((productId) => ({
                            actionId: id,
                            productId,
                        })),
                        skipDuplicates: true,
                    });
                }
            }
            return tx.action.findUniqueOrThrow({
                where: { id: updated.id },
                include: {
                    products: {
                        include: {
                            product: {
                                select: {
                                    id: true,
                                    name: true,
                                    productNumber: true,
                                    price: true,
                                    available: true,
                                },
                            },
                        },
                        orderBy: [{ createdAt: 'asc' }],
                    },
                },
            });
        });
        await (0, audit_1.writeAuditLog)({
            req,
            module: 'actions',
            action: 'action_updated',
            targetType: 'action',
            targetId: action.id,
            tenantId: action.tenantId,
            metadata: {
                name: action.name,
                kind: action.kind,
                productCount: action.products.length,
            },
        });
        return res.json({
            ...action,
            weeklyDays: readWeeklyDays(action.weeklyDays),
        });
    }
    catch (error) {
        console.error('UPDATE ACTION ERROR:', error);
        return res.status(500).json({ error: 'Aktion konnte nicht aktualisiert werden' });
    }
});
router.delete('/:id', (0, auth_1.requirePermission)(client_1.PermissionKey.PRODUCTS_WRITE), async (req, res) => {
    try {
        const id = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id;
        const tenantId = req.query.tenantId;
        if (!id || !tenantId) {
            return res.status(400).json({ error: 'id und tenantId sind erforderlich' });
        }
        const existing = await prisma_1.prisma.action.findUnique({
            where: { id },
            select: { id: true, tenantId: true, name: true },
        });
        if (!existing || existing.tenantId !== tenantId) {
            return res.status(404).json({ error: 'Aktion nicht gefunden' });
        }
        await prisma_1.prisma.action.delete({
            where: { id },
        });
        await (0, audit_1.writeAuditLog)({
            req,
            module: 'actions',
            action: 'action_deleted',
            targetType: 'action',
            targetId: existing.id,
            tenantId: existing.tenantId,
            metadata: {
                name: existing.name,
            },
        });
        return res.json({ ok: true });
    }
    catch (error) {
        console.error('DELETE ACTION ERROR:', error);
        return res.status(500).json({ error: 'Aktion konnte nicht geloescht werden' });
    }
});
exports.default = router;
