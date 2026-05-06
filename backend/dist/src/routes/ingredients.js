"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const client_1 = require("@prisma/client");
const prisma_1 = require("../lib/prisma");
const auth_1 = require("../middleware/auth");
const audit_1 = require("../lib/audit");
const router = (0, express_1.Router)();
function normalizeAllergens(input) {
    if (!input) {
        return null;
    }
    const unique = Array.from(new Set(input
        .split(',')
        .map((part) => part.trim().toUpperCase())
        .filter(Boolean)));
    return unique.length > 0 ? unique.join(',') : null;
}
function normalizeText(input) {
    if (!input) {
        return null;
    }
    const trimmed = input.trim();
    return trimmed.length > 0 ? trimmed : null;
}
async function ensureSupplierExists(tenantId, supplierName) {
    if (!supplierName) {
        return;
    }
    await prisma_1.prisma.supplier.upsert({
        where: {
            tenantId_name: {
                tenantId,
                name: supplierName,
            },
        },
        update: {},
        create: {
            tenantId,
            name: supplierName,
        },
    });
}
router.get('/', (0, auth_1.requirePermission)(client_1.PermissionKey.PRODUCTS_READ), async (req, res) => {
    try {
        const tenantId = req.query.tenantId;
        if (!tenantId) {
            return res.status(400).json({ error: 'tenantId fehlt' });
        }
        const ingredients = await prisma_1.prisma.ingredient.findMany({
            where: { tenantId },
            orderBy: { createdAt: 'desc' },
        });
        return res.json(ingredients);
    }
    catch (error) {
        console.error(error);
        return res.status(500).json({ error: 'Fehler beim Laden der Zutaten' });
    }
});
router.post('/', (0, auth_1.requirePermission)(client_1.PermissionKey.PRODUCTS_WRITE), async (req, res) => {
    try {
        const { tenantId, name, unit, purchasePrice, deposit, supplier, articleNumber, allergens, } = req.body;
        if (!tenantId || !name || !unit || purchasePrice === undefined) {
            return res.status(400).json({ error: 'Pflichtfelder fehlen' });
        }
        const normalizedSupplier = normalizeText(supplier);
        await ensureSupplierExists(tenantId, normalizedSupplier);
        const ingredient = await prisma_1.prisma.ingredient.create({
            data: {
                tenantId,
                name,
                unit,
                purchasePrice: Number(purchasePrice),
                deposit: deposit ? Number(deposit) : 0,
                supplier: normalizedSupplier,
                articleNumber: normalizeText(articleNumber),
                allergens: normalizeAllergens(allergens),
            },
        });
        await (0, audit_1.writeAuditLog)({
            req,
            module: 'ingredient',
            action: 'ingredient_created',
            targetType: 'ingredient',
            targetId: ingredient.id,
            tenantId: ingredient.tenantId,
            metadata: {
                name: ingredient.name,
                allergens: ingredient.allergens,
            },
        });
        return res.status(201).json(ingredient);
    }
    catch (error) {
        console.error(error);
        return res.status(500).json({ error: 'Fehler beim Erstellen der Zutat' });
    }
});
router.put('/:id', (0, auth_1.requirePermission)(client_1.PermissionKey.PRODUCTS_WRITE), async (req, res) => {
    try {
        const id = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id;
        const { name, unit, purchasePrice, deposit, supplier, articleNumber, allergens, } = req.body;
        if (!id) {
            return res.status(400).json({ error: 'id fehlt' });
        }
        const existing = await prisma_1.prisma.ingredient.findUnique({
            where: { id },
            select: { tenantId: true },
        });
        if (!existing) {
            return res.status(404).json({ error: 'Zutat nicht gefunden' });
        }
        const normalizedSupplier = supplier === undefined ? undefined : normalizeText(supplier);
        await ensureSupplierExists(existing.tenantId, normalizedSupplier ?? null);
        const updated = await prisma_1.prisma.ingredient.update({
            where: { id },
            data: {
                name,
                unit,
                purchasePrice: purchasePrice === undefined ? undefined : Number(purchasePrice),
                deposit: deposit === undefined ? undefined : Number(deposit),
                supplier: supplier === undefined ? undefined : normalizedSupplier,
                articleNumber: articleNumber === undefined ? undefined : normalizeText(articleNumber),
                allergens: allergens === undefined ? undefined : normalizeAllergens(allergens || undefined),
            },
        });
        await (0, audit_1.writeAuditLog)({
            req,
            module: 'ingredient',
            action: 'ingredient_updated',
            targetType: 'ingredient',
            targetId: updated.id,
            tenantId: updated.tenantId,
            metadata: {
                name: updated.name,
                allergens: updated.allergens,
            },
        });
        return res.json(updated);
    }
    catch (error) {
        console.error(error);
        return res.status(500).json({ error: 'Zutat konnte nicht aktualisiert werden' });
    }
});
exports.default = router;
