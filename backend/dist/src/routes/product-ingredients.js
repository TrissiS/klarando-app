"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const prisma_1 = require("../lib/prisma");
const router = (0, express_1.Router)();
const INTEGER_ONLY_UNITS = new Set(['Stueck', 'Dose']);
function isIntegerOnlyUnit(unit) {
    return Boolean(unit && INTEGER_ONLY_UNITS.has(unit));
}
function normalizeRecipeQuantity(rawQuantity, unit, recipeUnit) {
    const effectiveUnit = recipeUnit || unit;
    if (isIntegerOnlyUnit(effectiveUnit)) {
        if (!Number.isInteger(rawQuantity)) {
            return { ok: false, value: 0 };
        }
        return { ok: true, value: rawQuantity };
    }
    return { ok: true, value: Number(rawQuantity.toFixed(3)) };
}
router.get('/', async (req, res) => {
    try {
        const productId = req.query.productId;
        if (!productId) {
            return res.status(400).json({ error: 'productId fehlt' });
        }
        const productIngredients = await prisma_1.prisma.productIngredient.findMany({
            where: { productId },
            include: {
                ingredient: true,
            },
            orderBy: { createdAt: 'desc' },
        });
        res.json(productIngredients);
    }
    catch (error) {
        console.error('GET PRODUCT INGREDIENTS ERROR:', error);
        res.status(500).json({ error: 'Produkt-Zutaten konnten nicht geladen werden' });
    }
});
router.post('/', async (req, res) => {
    try {
        const { productId, ingredientId, quantity } = req.body;
        if (!productId || !ingredientId || quantity === undefined) {
            return res.status(400).json({ error: 'Pflichtfelder fehlen' });
        }
        const parsedQuantity = Number(quantity);
        if (!Number.isFinite(parsedQuantity) || parsedQuantity <= 0) {
            return res.status(400).json({ error: 'Menge ist ungueltig' });
        }
        const ingredient = await prisma_1.prisma.ingredient.findUnique({
            where: { id: ingredientId },
            select: {
                id: true,
                unit: true,
                recipeUnit: true,
            },
        });
        if (!ingredient) {
            return res.status(404).json({ error: 'Zutat nicht gefunden' });
        }
        const normalizedQuantity = normalizeRecipeQuantity(parsedQuantity, ingredient.unit, ingredient.recipeUnit);
        if (!normalizedQuantity.ok) {
            return res.status(400).json({
                error: 'Bei Rezept-Einheit Stueck oder Dose sind nur ganze Zahlen erlaubt',
            });
        }
        const existingEntry = await prisma_1.prisma.productIngredient.findFirst({
            where: {
                productId,
                ingredientId,
            },
            orderBy: {
                createdAt: 'desc',
            },
            select: {
                id: true,
            },
        });
        const productIngredient = existingEntry
            ? await prisma_1.prisma.productIngredient.update({
                where: { id: existingEntry.id },
                data: {
                    quantity: normalizedQuantity.value,
                },
                include: {
                    ingredient: true,
                },
            })
            : await prisma_1.prisma.productIngredient.create({
                data: {
                    productId,
                    ingredientId,
                    quantity: normalizedQuantity.value,
                },
                include: {
                    ingredient: true,
                },
            });
        res.status(201).json(productIngredient);
    }
    catch (error) {
        console.error('CREATE PRODUCT INGREDIENT ERROR:', error);
        res.status(500).json({ error: 'Produkt-Zutat konnte nicht erstellt werden' });
    }
});
router.patch('/:id', async (req, res) => {
    try {
        const id = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id;
        const { quantity } = req.body;
        if (!id) {
            return res.status(400).json({ error: 'id fehlt' });
        }
        if (quantity === undefined) {
            return res.status(400).json({ error: 'Menge fehlt' });
        }
        const parsedQuantity = Number(quantity);
        if (!Number.isFinite(parsedQuantity) || parsedQuantity <= 0) {
            return res.status(400).json({ error: 'Menge ist ungueltig' });
        }
        const existing = await prisma_1.prisma.productIngredient.findUnique({
            where: { id },
            select: {
                id: true,
                ingredient: {
                    select: {
                        unit: true,
                        recipeUnit: true,
                    },
                },
            },
        });
        if (!existing) {
            return res.status(404).json({ error: 'Produkt-Zutat nicht gefunden' });
        }
        const normalizedQuantity = normalizeRecipeQuantity(parsedQuantity, existing.ingredient.unit, existing.ingredient.recipeUnit);
        if (!normalizedQuantity.ok) {
            return res.status(400).json({
                error: 'Bei Rezept-Einheit Stueck oder Dose sind nur ganze Zahlen erlaubt',
            });
        }
        const updated = await prisma_1.prisma.productIngredient.update({
            where: { id },
            data: {
                quantity: normalizedQuantity.value,
            },
            include: {
                ingredient: true,
            },
        });
        return res.json(updated);
    }
    catch (error) {
        console.error('UPDATE PRODUCT INGREDIENT ERROR:', error);
        return res.status(500).json({ error: 'Produkt-Zutat konnte nicht gespeichert werden' });
    }
});
router.delete('/:id', async (req, res) => {
    try {
        const id = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id;
        if (!id) {
            return res.status(400).json({ error: 'id fehlt' });
        }
        const existing = await prisma_1.prisma.productIngredient.findUnique({
            where: { id },
            select: { id: true },
        });
        if (!existing) {
            return res.status(404).json({ error: 'Produkt-Zutat nicht gefunden' });
        }
        await prisma_1.prisma.productIngredient.delete({
            where: { id },
        });
        return res.json({ ok: true });
    }
    catch (error) {
        console.error('DELETE PRODUCT INGREDIENT ERROR:', error);
        return res.status(500).json({ error: 'Produkt-Zutat konnte nicht geloescht werden' });
    }
});
exports.default = router;
