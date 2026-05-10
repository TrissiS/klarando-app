"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const client_1 = require("@prisma/client");
const express_1 = require("express");
const prisma_1 = require("../lib/prisma");
const auth_1 = require("../middleware/auth");
const product_modifiers_1 = require("../lib/product-modifiers");
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
function normalizeNumber(value, min, max) {
    const parsed = Number(value);
    if (!Number.isFinite(parsed)) {
        return null;
    }
    return Math.min(max, Math.max(min, parsed));
}
function mapProductModifierOutput(modifier) {
    const parsedName = (0, product_modifiers_1.decodeStoredProductModifierName)(modifier.name);
    return {
        ...modifier,
        name: parsedName.displayName,
        kind: parsedName.kind,
    };
}
router.get('/', (0, auth_1.requirePermission)(client_1.PermissionKey.PRODUCTS_READ), async (req, res) => {
    try {
        const productId = req.query.productId;
        if (!productId) {
            return res.status(400).json({ error: 'productId fehlt' });
        }
        const modifiers = await prisma_1.prisma.productModifier.findMany({
            where: {
                productId,
            },
            include: {
                ingredient: {
                    select: {
                        id: true,
                        name: true,
                        unit: true,
                    },
                },
            },
            orderBy: [{ sortOrder: 'asc' }, { createdAt: 'asc' }],
        });
        return res.json(modifiers.map(mapProductModifierOutput));
    }
    catch (error) {
        console.error('GET PRODUCT MODIFIERS ERROR:', error);
        return res.status(500).json({ error: 'Produktoptionen konnten nicht geladen werden' });
    }
});
router.post('/', (0, auth_1.requirePermission)(client_1.PermissionKey.PRODUCTS_WRITE), async (req, res) => {
    try {
        const { productId, ingredientId, kind, name, priceDelta, isDefaultSelected, isActive, sortOrder, } = req.body;
        if (!productId) {
            return res.status(400).json({ error: 'productId fehlt' });
        }
        const product = await prisma_1.prisma.product.findUnique({
            where: { id: productId },
            select: {
                id: true,
                tenantId: true,
            },
        });
        if (!product) {
            return res.status(404).json({ error: 'Produkt nicht gefunden' });
        }
        const normalizedIngredientId = normalizeText(ingredientId);
        let ingredientName = null;
        if (normalizedIngredientId) {
            const ingredient = await prisma_1.prisma.ingredient.findUnique({
                where: { id: normalizedIngredientId },
                select: {
                    id: true,
                    tenantId: true,
                    name: true,
                },
            });
            if (!ingredient || ingredient.tenantId !== product.tenantId) {
                return res.status(400).json({ error: 'Zutat ist ungueltig' });
            }
            ingredientName = ingredient.name;
        }
        const normalizedKind = (0, product_modifiers_1.normalizeProductModifierKind)(kind);
        const normalizedName = normalizeText(name) ?? ingredientName;
        if (!normalizedName) {
            return res.status(400).json({ error: 'name fehlt' });
        }
        const normalizedPriceDelta = normalizeNumber(priceDelta, -50, 50);
        if (normalizedPriceDelta === null) {
            return res.status(400).json({ error: 'priceDelta fehlt oder ist ungueltig' });
        }
        const normalizedSortOrder = normalizeNumber(sortOrder, -5000, 5000) ?? 0;
        const storedName = (0, product_modifiers_1.encodeStoredProductModifierName)(normalizedName, normalizedKind);
        const existingProductModifiers = normalizedKind === 'SIZE'
            ? await prisma_1.prisma.productModifier.findMany({
                where: {
                    productId: product.id,
                },
                select: {
                    id: true,
                    name: true,
                },
            })
            : [];
        const hasExistingSizeModifier = existingProductModifiers.some((entry) => (0, product_modifiers_1.isSizeProductModifierName)(entry.name));
        const normalizedDefaultSelected = normalizedKind === 'SIZE' && isDefaultSelected === undefined
            ? !hasExistingSizeModifier
            : (isDefaultSelected ?? false);
        const created = await prisma_1.prisma.$transaction(async (tx) => {
            const inserted = await tx.productModifier.create({
                data: {
                    tenantId: product.tenantId,
                    productId: product.id,
                    ingredientId: normalizedIngredientId,
                    name: storedName,
                    priceDelta: normalizedPriceDelta,
                    isDefaultSelected: normalizedDefaultSelected,
                    isActive: isActive ?? true,
                    sortOrder: normalizedSortOrder,
                },
                include: {
                    ingredient: {
                        select: {
                            id: true,
                            name: true,
                            unit: true,
                        },
                    },
                },
            });
            if (normalizedKind === 'SIZE' && normalizedDefaultSelected) {
                const otherSizeIds = existingProductModifiers
                    .filter((entry) => (0, product_modifiers_1.isSizeProductModifierName)(entry.name))
                    .map((entry) => entry.id);
                if (otherSizeIds.length > 0) {
                    await tx.productModifier.updateMany({
                        where: {
                            id: {
                                in: otherSizeIds,
                            },
                        },
                        data: {
                            isDefaultSelected: false,
                        },
                    });
                }
            }
            return inserted;
        });
        return res.status(201).json(mapProductModifierOutput(created));
    }
    catch (error) {
        console.error('CREATE PRODUCT MODIFIER ERROR:', error);
        return res.status(500).json({ error: 'Produktoption konnte nicht erstellt werden' });
    }
});
router.patch('/:id', (0, auth_1.requirePermission)(client_1.PermissionKey.PRODUCTS_WRITE), async (req, res) => {
    try {
        const id = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id;
        const { ingredientId, kind, name, priceDelta, isDefaultSelected, isActive, sortOrder, } = req.body;
        if (!id) {
            return res.status(400).json({ error: 'id fehlt' });
        }
        const existing = await prisma_1.prisma.productModifier.findUnique({
            where: { id },
            select: {
                id: true,
                tenantId: true,
                productId: true,
                name: true,
            },
        });
        if (!existing) {
            return res.status(404).json({ error: 'Produktoption nicht gefunden' });
        }
        const normalizedIngredientId = ingredientId === undefined ? undefined : normalizeText(ingredientId);
        if (normalizedIngredientId) {
            const ingredient = await prisma_1.prisma.ingredient.findUnique({
                where: { id: normalizedIngredientId },
                select: {
                    id: true,
                    tenantId: true,
                },
            });
            if (!ingredient || ingredient.tenantId !== existing.tenantId) {
                return res.status(400).json({ error: 'Zutat ist ungueltig' });
            }
        }
        const normalizedName = name === undefined ? undefined : normalizeText(name);
        if (name !== undefined && !normalizedName) {
            return res.status(400).json({ error: 'name darf nicht leer sein' });
        }
        const nextKind = kind === undefined
            ? (0, product_modifiers_1.decodeStoredProductModifierName)(existing.name).kind
            : (0, product_modifiers_1.normalizeProductModifierKind)(kind);
        const nextDisplayName = normalizedName ??
            (kind === undefined ? undefined : (0, product_modifiers_1.decodeStoredProductModifierName)(existing.name).displayName);
        const nextStoredName = nextDisplayName === undefined
            ? undefined
            : (0, product_modifiers_1.encodeStoredProductModifierName)(nextDisplayName, nextKind);
        const normalizedPriceDelta = priceDelta === undefined ? undefined : normalizeNumber(priceDelta, -50, 50);
        if (priceDelta !== undefined && normalizedPriceDelta === null) {
            return res.status(400).json({ error: 'priceDelta ist ungueltig' });
        }
        const normalizedSortOrder = sortOrder === undefined ? undefined : normalizeNumber(sortOrder, -5000, 5000);
        if (sortOrder !== undefined && normalizedSortOrder === null) {
            return res.status(400).json({ error: 'sortOrder ist ungueltig' });
        }
        const updated = await prisma_1.prisma.$transaction(async (tx) => {
            const persisted = await tx.productModifier.update({
                where: { id },
                data: {
                    ingredientId: normalizedIngredientId,
                    name: nextStoredName,
                    priceDelta: normalizedPriceDelta ?? undefined,
                    isDefaultSelected,
                    isActive,
                    sortOrder: normalizedSortOrder ?? undefined,
                },
                include: {
                    ingredient: {
                        select: {
                            id: true,
                            name: true,
                            unit: true,
                        },
                    },
                },
            });
            const persistedKind = (0, product_modifiers_1.decodeStoredProductModifierName)(persisted.name).kind;
            if (persistedKind === 'SIZE' && persisted.isDefaultSelected) {
                const sameProductModifiers = await tx.productModifier.findMany({
                    where: {
                        productId: existing.productId,
                    },
                    select: {
                        id: true,
                        name: true,
                    },
                });
                const otherSizeIds = sameProductModifiers
                    .filter((entry) => entry.id !== persisted.id && (0, product_modifiers_1.isSizeProductModifierName)(entry.name))
                    .map((entry) => entry.id);
                if (otherSizeIds.length > 0) {
                    await tx.productModifier.updateMany({
                        where: {
                            id: {
                                in: otherSizeIds,
                            },
                        },
                        data: {
                            isDefaultSelected: false,
                        },
                    });
                }
            }
            return persisted;
        });
        return res.json(mapProductModifierOutput(updated));
    }
    catch (error) {
        console.error('UPDATE PRODUCT MODIFIER ERROR:', error);
        return res.status(500).json({ error: 'Produktoption konnte nicht gespeichert werden' });
    }
});
router.delete('/:id', (0, auth_1.requirePermission)(client_1.PermissionKey.PRODUCTS_WRITE), async (req, res) => {
    try {
        const id = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id;
        if (!id) {
            return res.status(400).json({ error: 'id fehlt' });
        }
        const existing = await prisma_1.prisma.productModifier.findUnique({
            where: { id },
            select: { id: true },
        });
        if (!existing) {
            return res.status(404).json({ error: 'Produktoption nicht gefunden' });
        }
        await prisma_1.prisma.productModifier.delete({
            where: { id },
        });
        return res.json({ ok: true });
    }
    catch (error) {
        console.error('DELETE PRODUCT MODIFIER ERROR:', error);
        return res.status(500).json({ error: 'Produktoption konnte nicht geloescht werden' });
    }
});
exports.default = router;
