"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const client_1 = require("@prisma/client");
const express_1 = require("express");
const prisma_1 = require("../lib/prisma");
const auth_1 = require("../middleware/auth");
const audit_1 = require("../lib/audit");
const tenant_scope_1 = require("../lib/tenant-scope");
const router = (0, express_1.Router)();
const INTEGER_ONLY_UNITS = new Set(['Stueck', 'Dose']);
function normalizeText(value) {
    if (!value) {
        return null;
    }
    const trimmed = value.trim();
    return trimmed.length > 0 ? trimmed : null;
}
function round3(value) {
    return Number(value.toFixed(3));
}
function round2(value) {
    return Number(value.toFixed(2));
}
function isIntegerOnlyUnit(unit) {
    return Boolean(unit && INTEGER_ONLY_UNITS.has(unit));
}
function parsePositiveNumber(value) {
    const parsed = Number(value);
    if (!Number.isFinite(parsed) || parsed <= 0) {
        return null;
    }
    return parsed;
}
function parseNonNegativeNumber(value) {
    const parsed = Number(value);
    if (!Number.isFinite(parsed) || parsed < 0) {
        return null;
    }
    return parsed;
}
async function getIngredientForTenant(tenantId, ingredientId) {
    return prisma_1.prisma.ingredient.findFirst({
        where: {
            id: ingredientId,
            tenantId,
        },
        select: {
            id: true,
            tenantId: true,
            name: true,
            unit: true,
            purchasePrice: true,
            supplier: true,
            articleNumber: true,
        },
    });
}
async function getCurrentQuantity(tenantId, ingredientId) {
    const aggregate = await prisma_1.prisma.stockMovement.aggregate({
        where: {
            tenantId,
            ingredientId,
        },
        _sum: {
            quantityDelta: true,
        },
    });
    return Number(aggregate._sum.quantityDelta ?? 0);
}
async function createMovement(params) {
    const movement = await prisma_1.prisma.stockMovement.create({
        data: {
            tenantId: params.tenantId,
            ingredientId: params.ingredientId,
            type: params.type,
            quantityDelta: round3(params.quantityDelta),
            resultingQuantity: round3(params.resultingQuantity),
            countedQuantity: params.countedQuantity === undefined || params.countedQuantity === null
                ? null
                : round3(params.countedQuantity),
            unitCost: params.unitCost === undefined || params.unitCost === null
                ? null
                : round2(params.unitCost),
            reference: normalizeText(params.reference),
            note: normalizeText(params.note),
            createdByUserId: params.req.authUser?.id || null,
        },
        include: {
            ingredient: {
                select: {
                    id: true,
                    name: true,
                    unit: true,
                    supplier: true,
                    articleNumber: true,
                },
            },
            createdByUser: {
                select: {
                    id: true,
                    name: true,
                    email: true,
                },
            },
        },
    });
    await (0, audit_1.writeAuditLog)({
        req: params.req,
        module: 'stock',
        action: params.auditAction,
        targetType: 'ingredient',
        targetId: params.ingredientId,
        tenantId: params.tenantId,
        metadata: params.metadata,
    });
    return movement;
}
router.get('/overview', (0, auth_1.requirePermission)(client_1.PermissionKey.INVENTORY_READ), async (req, res) => {
    try {
        const scope = await (0, tenant_scope_1.resolveTenantScope)(req, req.query.tenantId);
        const tenantId = scope.tenantId;
        const [ingredients, grouped] = await Promise.all([
            prisma_1.prisma.ingredient.findMany({
                where: { tenantId },
                select: {
                    id: true,
                    name: true,
                    unit: true,
                    purchasePrice: true,
                    minimumStock: true,
                    consumptionFactorPercent: true,
                    supplier: true,
                    articleNumber: true,
                },
                orderBy: [{ name: 'asc' }],
            }),
            prisma_1.prisma.stockMovement.groupBy({
                by: ['ingredientId'],
                where: { tenantId },
                _sum: {
                    quantityDelta: true,
                },
                _max: {
                    createdAt: true,
                },
            }),
        ]);
        const groupedMap = new Map(grouped.map((entry) => [
            entry.ingredientId,
            {
                currentQuantity: Number(entry._sum.quantityDelta ?? 0),
                lastMovementAt: entry._max.createdAt || null,
            },
        ]));
        const rows = ingredients.map((ingredient) => {
            const stock = groupedMap.get(ingredient.id);
            const currentQuantity = round3(stock?.currentQuantity ?? 0);
            const unitCost = Number(ingredient.purchasePrice);
            const stockValue = round2(currentQuantity * unitCost);
            const minimumStock = round3(Number(ingredient.minimumStock ?? 0));
            const consumptionFactorPercent = round3(Number(ingredient.consumptionFactorPercent ?? 0));
            const belowMinimum = currentQuantity < minimumStock;
            const suggestedOrderQuantity = round3(Math.max(0, minimumStock - currentQuantity));
            return {
                ingredientId: ingredient.id,
                ingredientName: ingredient.name,
                unit: ingredient.unit,
                supplier: ingredient.supplier,
                articleNumber: ingredient.articleNumber,
                purchasePrice: ingredient.purchasePrice,
                minimumStock,
                consumptionFactorPercent,
                belowMinimum,
                suggestedOrderQuantity,
                currentQuantity,
                stockValue,
                lastMovementAt: stock?.lastMovementAt || null,
            };
        });
        return res.json(rows);
    }
    catch (error) {
        const scopeError = (0, tenant_scope_1.asTenantScopeError)(error);
        if (scopeError) {
            return res.status(scopeError.status).json({ error: scopeError.message });
        }
        console.error('GET STOCK OVERVIEW ERROR:', error);
        return res.status(500).json({ error: 'Lagerdaten konnten nicht geladen werden' });
    }
});
router.get('/movements', (0, auth_1.requirePermission)(client_1.PermissionKey.INVENTORY_READ), async (req, res) => {
    try {
        const scope = await (0, tenant_scope_1.resolveTenantScope)(req, req.query.tenantId);
        const tenantId = scope.tenantId;
        const ingredientId = req.query.ingredientId;
        const typeQuery = req.query.type;
        const limitRaw = Number(req.query.limit ?? 100);
        const limit = Number.isFinite(limitRaw)
            ? Math.min(Math.max(Math.floor(limitRaw), 1), 250)
            : 100;
        let type;
        if (typeQuery) {
            if (!Object.values(client_1.StockMovementType).includes(typeQuery)) {
                return res.status(400).json({ error: 'ungueltiger type' });
            }
            type = typeQuery;
        }
        const movements = await prisma_1.prisma.stockMovement.findMany({
            where: {
                tenantId,
                ingredientId: ingredientId || undefined,
                type,
            },
            include: {
                ingredient: {
                    select: {
                        id: true,
                        name: true,
                        unit: true,
                        supplier: true,
                        articleNumber: true,
                    },
                },
                createdByUser: {
                    select: {
                        id: true,
                        name: true,
                        email: true,
                    },
                },
            },
            orderBy: [{ createdAt: 'desc' }],
            take: limit,
        });
        return res.json(movements);
    }
    catch (error) {
        const scopeError = (0, tenant_scope_1.asTenantScopeError)(error);
        if (scopeError) {
            return res.status(scopeError.status).json({ error: scopeError.message });
        }
        console.error('GET STOCK MOVEMENTS ERROR:', error);
        return res.status(500).json({ error: 'Lagerbewegungen konnten nicht geladen werden' });
    }
});
router.post('/goods-receipt', (0, auth_1.requirePermission)(client_1.PermissionKey.INVENTORY_WRITE), async (req, res) => {
    try {
        const { tenantId, ingredientId, quantity, unitCost, reference, note } = req.body;
        if (!tenantId || !ingredientId) {
            return res.status(400).json({ error: 'tenantId und ingredientId sind erforderlich' });
        }
        const scope = await (0, tenant_scope_1.resolveTenantScope)(req, tenantId);
        const scopedTenantId = scope.tenantId;
        const parsedQuantity = parsePositiveNumber(quantity);
        if (parsedQuantity === null) {
            return res.status(400).json({ error: 'quantity muss groesser als 0 sein' });
        }
        const ingredient = await getIngredientForTenant(scopedTenantId, ingredientId);
        if (!ingredient) {
            return res.status(404).json({ error: 'Zutat nicht gefunden' });
        }
        if (isIntegerOnlyUnit(ingredient.unit) && !Number.isInteger(parsedQuantity)) {
            return res.status(400).json({
                error: 'Bei Einheit Stueck oder Dose sind nur ganze Zahlen erlaubt',
            });
        }
        const currentQuantity = await getCurrentQuantity(scopedTenantId, ingredientId);
        const resultingQuantity = round3(currentQuantity + parsedQuantity);
        const parsedUnitCost = unitCost === undefined ? Number(ingredient.purchasePrice) : Number(unitCost);
        const movement = await createMovement({
            req,
            tenantId: scopedTenantId,
            ingredientId,
            type: client_1.StockMovementType.GOODS_RECEIPT,
            quantityDelta: parsedQuantity,
            resultingQuantity,
            unitCost: Number.isFinite(parsedUnitCost) ? parsedUnitCost : Number(ingredient.purchasePrice),
            reference,
            note,
            auditAction: 'goods_receipt',
            metadata: {
                ingredientName: ingredient.name,
                quantity: parsedQuantity,
                unit: ingredient.unit,
                resultingQuantity,
            },
        });
        return res.status(201).json(movement);
    }
    catch (error) {
        const scopeError = (0, tenant_scope_1.asTenantScopeError)(error);
        if (scopeError) {
            return res.status(scopeError.status).json({ error: scopeError.message });
        }
        console.error('POST GOODS RECEIPT ERROR:', error);
        return res.status(500).json({ error: 'Wareneingang konnte nicht gebucht werden' });
    }
});
router.post('/write-off', (0, auth_1.requirePermission)(client_1.PermissionKey.INVENTORY_WRITE), async (req, res) => {
    try {
        const { tenantId, ingredientId, quantity, reference, note } = req.body;
        if (!tenantId || !ingredientId) {
            return res.status(400).json({ error: 'tenantId und ingredientId sind erforderlich' });
        }
        const scope = await (0, tenant_scope_1.resolveTenantScope)(req, tenantId);
        const scopedTenantId = scope.tenantId;
        const parsedQuantity = parsePositiveNumber(quantity);
        if (parsedQuantity === null) {
            return res.status(400).json({ error: 'quantity muss groesser als 0 sein' });
        }
        const ingredient = await getIngredientForTenant(scopedTenantId, ingredientId);
        if (!ingredient) {
            return res.status(404).json({ error: 'Zutat nicht gefunden' });
        }
        if (isIntegerOnlyUnit(ingredient.unit) && !Number.isInteger(parsedQuantity)) {
            return res.status(400).json({
                error: 'Bei Einheit Stueck oder Dose sind nur ganze Zahlen erlaubt',
            });
        }
        const currentQuantity = await getCurrentQuantity(scopedTenantId, ingredientId);
        const resultingQuantity = round3(currentQuantity - parsedQuantity);
        if (resultingQuantity < 0) {
            return res.status(409).json({
                error: 'Ausbuchung groesser als aktueller Bestand',
                currentQuantity: round3(currentQuantity),
            });
        }
        const movement = await createMovement({
            req,
            tenantId: scopedTenantId,
            ingredientId,
            type: client_1.StockMovementType.WRITE_OFF,
            quantityDelta: -parsedQuantity,
            resultingQuantity,
            unitCost: Number(ingredient.purchasePrice),
            reference,
            note,
            auditAction: 'write_off',
            metadata: {
                ingredientName: ingredient.name,
                quantity: parsedQuantity,
                unit: ingredient.unit,
                resultingQuantity,
            },
        });
        return res.status(201).json(movement);
    }
    catch (error) {
        const scopeError = (0, tenant_scope_1.asTenantScopeError)(error);
        if (scopeError) {
            return res.status(scopeError.status).json({ error: scopeError.message });
        }
        console.error('POST WRITE OFF ERROR:', error);
        return res.status(500).json({ error: 'Ausbuchung konnte nicht gebucht werden' });
    }
});
router.post('/inventory-count', (0, auth_1.requirePermission)(client_1.PermissionKey.INVENTORY_WRITE), async (req, res) => {
    try {
        const { tenantId, ingredientId, countedQuantity, note } = req.body;
        if (!tenantId || !ingredientId) {
            return res.status(400).json({ error: 'tenantId und ingredientId sind erforderlich' });
        }
        const scope = await (0, tenant_scope_1.resolveTenantScope)(req, tenantId);
        const scopedTenantId = scope.tenantId;
        const parsedCountedQuantity = parseNonNegativeNumber(countedQuantity);
        if (parsedCountedQuantity === null) {
            return res.status(400).json({ error: 'countedQuantity muss >= 0 sein' });
        }
        const ingredient = await getIngredientForTenant(scopedTenantId, ingredientId);
        if (!ingredient) {
            return res.status(404).json({ error: 'Zutat nicht gefunden' });
        }
        if (isIntegerOnlyUnit(ingredient.unit) && !Number.isInteger(parsedCountedQuantity)) {
            return res.status(400).json({
                error: 'Bei Einheit Stueck oder Dose sind nur ganze Zahlen erlaubt',
            });
        }
        const currentQuantity = await getCurrentQuantity(scopedTenantId, ingredientId);
        const quantityDelta = round3(parsedCountedQuantity - currentQuantity);
        const resultingQuantity = round3(parsedCountedQuantity);
        const movement = await createMovement({
            req,
            tenantId: scopedTenantId,
            ingredientId,
            type: client_1.StockMovementType.INVENTORY_COUNT,
            quantityDelta,
            resultingQuantity,
            countedQuantity: parsedCountedQuantity,
            unitCost: Number(ingredient.purchasePrice),
            note,
            auditAction: 'inventory_count',
            metadata: {
                ingredientName: ingredient.name,
                previousQuantity: round3(currentQuantity),
                countedQuantity: parsedCountedQuantity,
                quantityDelta,
            },
        });
        return res.status(201).json(movement);
    }
    catch (error) {
        const scopeError = (0, tenant_scope_1.asTenantScopeError)(error);
        if (scopeError) {
            return res.status(scopeError.status).json({ error: scopeError.message });
        }
        console.error('POST INVENTORY COUNT ERROR:', error);
        return res.status(500).json({ error: 'Inventur konnte nicht gebucht werden' });
    }
});
exports.default = router;
