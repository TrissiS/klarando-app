"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const client_1 = require("@prisma/client");
const express_1 = require("express");
const prisma_1 = require("../lib/prisma");
const auth_1 = require("../middleware/auth");
const audit_1 = require("../lib/audit");
const tenant_scope_1 = require("../lib/tenant-scope");
const router = (0, express_1.Router)();
function normalizeText(value) {
    if (value === undefined) {
        return undefined;
    }
    if (value === null) {
        return null;
    }
    const normalized = value.trim();
    return normalized.length > 0 ? normalized : null;
}
router.get('/', (0, auth_1.requirePermission)(client_1.PermissionKey.PRODUCTS_READ), async (req, res) => {
    try {
        const scope = await (0, tenant_scope_1.resolveTenantScope)(req, req.query.tenantId);
        const tenantId = scope.tenantId;
        const includeIngredients = req.query.includeIngredients === 'true';
        const suppliers = await prisma_1.prisma.supplier.findMany({
            where: { tenantId },
            orderBy: [{ name: 'asc' }],
        });
        const supplierNames = suppliers.map((supplier) => supplier.name);
        const ingredientsBySupplier = new Map();
        const supplierKey = (rowTenantId, supplierName) => `${rowTenantId}::${supplierName}`;
        if (includeIngredients && supplierNames.length > 0) {
            const ingredients = await prisma_1.prisma.ingredient.findMany({
                where: {
                    tenantId,
                    supplier: {
                        in: supplierNames,
                    },
                },
                select: {
                    id: true,
                    name: true,
                    unit: true,
                    purchasePrice: true,
                    articleNumber: true,
                    ean: true,
                    supplier: true,
                },
                orderBy: [{ name: 'asc' }],
            });
            for (const ingredient of ingredients) {
                if (!ingredient.supplier) {
                    continue;
                }
                const key = supplierKey(tenantId, ingredient.supplier);
                const current = ingredientsBySupplier.get(key) || [];
                current.push({
                    id: ingredient.id,
                    name: ingredient.name,
                    unit: ingredient.unit,
                    purchasePrice: ingredient.purchasePrice,
                    articleNumber: ingredient.articleNumber,
                    ean: ingredient.ean,
                });
                ingredientsBySupplier.set(key, current);
            }
        }
        return res.json(suppliers.map((supplier) => {
            const supplierIngredients = ingredientsBySupplier.get(supplierKey(supplier.tenantId, supplier.name)) || [];
            return {
                ...supplier,
                ingredientCount: supplierIngredients.length,
                ingredients: supplierIngredients,
            };
        }));
    }
    catch (error) {
        const scopeError = (0, tenant_scope_1.asTenantScopeError)(error);
        if (scopeError) {
            return res.status(scopeError.status).json({ error: scopeError.message });
        }
        console.error('GET SUPPLIERS ERROR:', error);
        return res.status(500).json({ error: 'Lieferanten konnten nicht geladen werden' });
    }
});
router.post('/', (0, auth_1.requirePermission)(client_1.PermissionKey.PRODUCTS_WRITE), async (req, res) => {
    try {
        const { tenantId, name, contactName, phone, email, notes } = req.body;
        if (!name) {
            return res.status(400).json({ error: 'tenantId und name sind erforderlich' });
        }
        const scope = await (0, tenant_scope_1.resolveTenantScope)(req, tenantId);
        const scopedTenantId = scope.tenantId;
        const supplier = await prisma_1.prisma.supplier.create({
            data: {
                tenantId: scopedTenantId,
                name: name.trim(),
                contactName: normalizeText(contactName),
                phone: normalizeText(phone),
                email: normalizeText(email),
                notes: normalizeText(notes),
            },
        });
        await (0, audit_1.writeAuditLog)({
            req,
            module: 'supplier',
            action: 'supplier_created',
            targetType: 'supplier',
            targetId: supplier.id,
            tenantId: supplier.tenantId,
            metadata: {
                name: supplier.name,
            },
        });
        return res.status(201).json({
            ...supplier,
            ingredientCount: 0,
            ingredients: [],
        });
    }
    catch (error) {
        const scopeError = (0, tenant_scope_1.asTenantScopeError)(error);
        if (scopeError) {
            return res.status(scopeError.status).json({ error: scopeError.message });
        }
        if (error instanceof client_1.Prisma.PrismaClientKnownRequestError &&
            error.code === 'P2002') {
            return res.status(409).json({ error: 'Lieferant existiert bereits' });
        }
        console.error('CREATE SUPPLIER ERROR:', error);
        return res.status(500).json({ error: 'Lieferant konnte nicht erstellt werden' });
    }
});
router.patch('/:id', (0, auth_1.requirePermission)(client_1.PermissionKey.PRODUCTS_WRITE), async (req, res) => {
    try {
        const id = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id;
        const { tenantId, name, contactName, phone, email, notes } = req.body;
        if (!id || !tenantId) {
            return res.status(400).json({ error: 'id und tenantId sind erforderlich' });
        }
        const scope = await (0, tenant_scope_1.resolveTenantScope)(req, tenantId);
        const scopedTenantId = scope.tenantId;
        const existing = await prisma_1.prisma.supplier.findUnique({
            where: { id },
        });
        if (!existing || existing.tenantId !== scopedTenantId) {
            return res.status(404).json({ error: 'Lieferant nicht gefunden' });
        }
        const nextName = name?.trim();
        if (nextName !== undefined && nextName.length === 0) {
            return res.status(400).json({ error: 'Name darf nicht leer sein' });
        }
        const updated = await prisma_1.prisma.supplier.update({
            where: { id },
            data: {
                name: nextName,
                contactName: normalizeText(contactName),
                phone: normalizeText(phone),
                email: normalizeText(email),
                notes: normalizeText(notes),
            },
        });
        let updatedIngredients = 0;
        if (nextName && nextName !== existing.name) {
            const updateResult = await prisma_1.prisma.ingredient.updateMany({
                where: {
                    tenantId: scopedTenantId,
                    supplier: existing.name,
                },
                data: {
                    supplier: nextName,
                },
            });
            updatedIngredients = updateResult.count;
        }
        const ingredients = await prisma_1.prisma.ingredient.findMany({
            where: {
                tenantId: scopedTenantId,
                supplier: updated.name,
            },
            select: {
                id: true,
                name: true,
                unit: true,
                purchasePrice: true,
                articleNumber: true,
                ean: true,
            },
            orderBy: [{ name: 'asc' }],
        });
        await (0, audit_1.writeAuditLog)({
            req,
            module: 'supplier',
            action: 'supplier_updated',
            targetType: 'supplier',
            targetId: updated.id,
            tenantId: updated.tenantId,
            metadata: {
                oldName: existing.name,
                newName: updated.name,
                updatedIngredients,
            },
        });
        return res.json({
            ...updated,
            ingredientCount: ingredients.length,
            ingredients,
        });
    }
    catch (error) {
        const scopeError = (0, tenant_scope_1.asTenantScopeError)(error);
        if (scopeError) {
            return res.status(scopeError.status).json({ error: scopeError.message });
        }
        if (error instanceof client_1.Prisma.PrismaClientKnownRequestError &&
            error.code === 'P2002') {
            return res.status(409).json({ error: 'Lieferant existiert bereits' });
        }
        console.error('UPDATE SUPPLIER ERROR:', error);
        return res.status(500).json({ error: 'Lieferant konnte nicht aktualisiert werden' });
    }
});
router.delete('/:id', (0, auth_1.requirePermission)(client_1.PermissionKey.PRODUCTS_WRITE), async (req, res) => {
    try {
        const id = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id;
        const tenantIdInput = req.query.tenantId;
        if (!id || !tenantIdInput) {
            return res.status(400).json({ error: 'id und tenantId sind erforderlich' });
        }
        const scope = await (0, tenant_scope_1.resolveTenantScope)(req, tenantIdInput);
        const tenantId = scope.tenantId;
        const existing = await prisma_1.prisma.supplier.findUnique({
            where: { id },
        });
        if (!existing || existing.tenantId !== tenantId) {
            return res.status(404).json({ error: 'Lieferant nicht gefunden' });
        }
        const ingredientCount = await prisma_1.prisma.ingredient.count({
            where: {
                tenantId,
                supplier: existing.name,
            },
        });
        if (ingredientCount > 0) {
            return res.status(409).json({
                error: 'Lieferant wird noch von Zutaten verwendet',
                ingredientCount,
            });
        }
        await prisma_1.prisma.supplier.delete({
            where: { id },
        });
        await (0, audit_1.writeAuditLog)({
            req,
            module: 'supplier',
            action: 'supplier_deleted',
            targetType: 'supplier',
            targetId: existing.id,
            tenantId: existing.tenantId,
            metadata: {
                name: existing.name,
            },
        });
        return res.json({ ok: true });
    }
    catch (error) {
        const scopeError = (0, tenant_scope_1.asTenantScopeError)(error);
        if (scopeError) {
            return res.status(scopeError.status).json({ error: scopeError.message });
        }
        console.error('DELETE SUPPLIER ERROR:', error);
        return res.status(500).json({ error: 'Lieferant konnte nicht geloescht werden' });
    }
});
exports.default = router;
