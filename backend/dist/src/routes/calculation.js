"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const client_1 = require("@prisma/client");
const prisma_1 = require("../lib/prisma");
const auth_1 = require("../middleware/auth");
const router = (0, express_1.Router)();
function splitAllergens(value) {
    if (!value) {
        return [];
    }
    return value
        .split(',')
        .map((part) => part.trim().toUpperCase())
        .filter(Boolean);
}
function calculateProduct(product) {
    let totalCost = 0;
    const allergenSet = new Set();
    const details = product.ingredients.map((item) => {
        const price = Number(item.ingredient.purchasePrice);
        const quantity = Number(item.quantity);
        const cost = price * quantity;
        totalCost += cost;
        splitAllergens(item.ingredient.allergens).forEach((code) => allergenSet.add(code));
        return {
            name: item.ingredient.name,
            unit: item.ingredient.unit,
            quantity,
            price,
            cost,
            allergens: splitAllergens(item.ingredient.allergens),
        };
    });
    const sellingPrice = Number(product.price);
    const margin = sellingPrice - totalCost;
    const marginPercent = sellingPrice > 0 ? (margin / sellingPrice) * 100 : 0;
    const costPercent = sellingPrice > 0 ? (totalCost / sellingPrice) * 100 : 0;
    return {
        productId: product.id,
        productName: product.name,
        available: product.available,
        sellingPrice,
        totalCost,
        margin,
        marginPercent,
        costPercent,
        allergens: Array.from(allergenSet).sort(),
        ingredients: details,
    };
}
router.get('/', (0, auth_1.requirePermission)(client_1.PermissionKey.PRODUCTS_READ), async (req, res) => {
    try {
        const tenantId = req.query.tenantId;
        if (!tenantId) {
            return res.status(400).json({ error: 'tenantId fehlt' });
        }
        const products = await prisma_1.prisma.product.findMany({
            where: { tenantId },
            include: {
                ingredients: {
                    include: {
                        ingredient: true,
                    },
                },
            },
            orderBy: { createdAt: 'desc' },
        });
        return res.json(products.map(calculateProduct));
    }
    catch (error) {
        console.error('GET CALCULATION LIST ERROR:', error);
        return res.status(500).json({ error: 'Kalkulationsliste konnte nicht geladen werden' });
    }
});
router.get('/:productId', (0, auth_1.requirePermission)(client_1.PermissionKey.PRODUCTS_READ), async (req, res) => {
    try {
        const productId = Array.isArray(req.params.productId)
            ? req.params.productId[0]
            : req.params.productId;
        const product = await prisma_1.prisma.product.findUnique({
            where: { id: productId },
            include: {
                ingredients: {
                    include: {
                        ingredient: true,
                    },
                },
            },
        });
        if (!product) {
            return res.status(404).json({ error: 'Produkt nicht gefunden' });
        }
        return res.json(calculateProduct(product));
    }
    catch (error) {
        console.error('GET CALCULATION ERROR:', error);
        return res.status(500).json({ error: 'Fehler bei der Kalkulation' });
    }
});
exports.default = router;
