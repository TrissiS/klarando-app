"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const client_1 = require("@prisma/client");
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
    const trimmed = value.trim();
    return trimmed.length > 0 ? trimmed : null;
}
router.get('/', (0, auth_1.requirePermission)(client_1.PermissionKey.PRODUCTS_READ), async (req, res) => {
    try {
        const scope = await (0, tenant_scope_1.resolveTenantScope)(req, req.query.tenantId);
        const tenantId = scope.tenantId;
        const categories = await prisma_1.prisma.category.findMany({
            where: { tenantId },
            orderBy: [
                { sortOrder: 'asc' },
                { createdAt: 'desc' },
            ],
        });
        res.json(categories);
    }
    catch (error) {
        const scopeError = (0, tenant_scope_1.asTenantScopeError)(error);
        if (scopeError) {
            return res.status(scopeError.status).json({ error: scopeError.message });
        }
        console.error(error);
        return res.status(500).json({ error: 'Fehler beim Laden der Kategorien' });
    }
});
router.post('/', (0, auth_1.requirePermission)(client_1.PermissionKey.PRODUCTS_WRITE), async (req, res) => {
    try {
        const { tenantId, name, sortOrder, imageUrl } = req.body;
        if (!name) {
            return res.status(400).json({ error: 'tenantId oder name fehlt' });
        }
        const scope = await (0, tenant_scope_1.resolveTenantScope)(req, tenantId);
        const scopedTenantId = scope.tenantId;
        const category = await prisma_1.prisma.category.create({
            data: {
                tenantId: scopedTenantId,
                name: name.trim(),
                sortOrder: sortOrder ?? 0,
                imageUrl: normalizeText(imageUrl),
            },
        });
        res.status(201).json(category);
    }
    catch (error) {
        const scopeError = (0, tenant_scope_1.asTenantScopeError)(error);
        if (scopeError) {
            return res.status(scopeError.status).json({ error: scopeError.message });
        }
        console.error(error);
        return res.status(500).json({ error: 'Fehler beim Erstellen der Kategorie' });
    }
});
router.put('/:id', (0, auth_1.requirePermission)(client_1.PermissionKey.PRODUCTS_WRITE), async (req, res) => {
    try {
        const id = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id;
        const { tenantId, name, sortOrder, imageUrl } = req.body;
        if (!id || !tenantId) {
            return res.status(400).json({ error: 'id oder tenantId fehlt' });
        }
        const scope = await (0, tenant_scope_1.resolveTenantScope)(req, tenantId);
        const scopedTenantId = scope.tenantId;
        const existing = await prisma_1.prisma.category.findUnique({
            where: { id },
            select: { id: true, tenantId: true },
        });
        if (!existing || existing.tenantId !== scopedTenantId) {
            return res.status(404).json({ error: 'Kategorie nicht gefunden' });
        }
        const updated = await prisma_1.prisma.category.update({
            where: { id },
            data: {
                name: name === undefined ? undefined : name.trim(),
                sortOrder,
                imageUrl: normalizeText(imageUrl),
            },
        });
        return res.json(updated);
    }
    catch (error) {
        const scopeError = (0, tenant_scope_1.asTenantScopeError)(error);
        if (scopeError) {
            return res.status(scopeError.status).json({ error: scopeError.message });
        }
        console.error(error);
        return res.status(500).json({ error: 'Fehler beim Aktualisieren der Kategorie' });
    }
});
router.delete('/:id', (0, auth_1.requirePermission)(client_1.PermissionKey.PRODUCTS_WRITE), async (req, res) => {
    try {
        const id = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id;
        const tenantIdInput = req.query.tenantId;
        if (!id || !tenantIdInput) {
            return res.status(400).json({ error: 'id oder tenantId fehlt' });
        }
        const scope = await (0, tenant_scope_1.resolveTenantScope)(req, tenantIdInput);
        const tenantId = scope.tenantId;
        const existing = await prisma_1.prisma.category.findUnique({
            where: { id },
            select: {
                id: true,
                tenantId: true,
                name: true,
            },
        });
        if (!existing || existing.tenantId !== tenantId) {
            return res.status(404).json({ error: 'Kategorie nicht gefunden' });
        }
        const productCount = await prisma_1.prisma.product.count({
            where: {
                tenantId,
                categoryId: id,
            },
        });
        if (productCount > 0) {
            return res.status(409).json({
                error: 'Kategorie wird noch von Produkten verwendet',
                productCount,
            });
        }
        await prisma_1.prisma.category.delete({
            where: { id },
        });
        await (0, audit_1.writeAuditLog)({
            req,
            module: 'category',
            action: 'category_deleted',
            targetType: 'category',
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
        console.error(error);
        return res.status(500).json({ error: 'Kategorie konnte nicht geloescht werden' });
    }
});
exports.default = router;
