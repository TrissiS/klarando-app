"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const prisma_1 = require("../lib/prisma");
const router = (0, express_1.Router)();
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
        const productIngredient = await prisma_1.prisma.productIngredient.create({
            data: {
                productId,
                ingredientId,
                quantity: Number(quantity),
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
exports.default = router;
