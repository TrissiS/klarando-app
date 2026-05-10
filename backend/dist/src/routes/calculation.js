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
function normalizeUnit(value) {
    return (value || '').trim().toLowerCase();
}
function convertToPurchaseQuantity(params) {
    const recipeUnit = normalizeUnit(params.recipeUnit || params.purchaseUnit);
    const purchaseUnit = normalizeUnit(params.purchaseUnit);
    const quantity = Number.isFinite(params.quantity) ? params.quantity : 0;
    if (recipeUnit === purchaseUnit) {
        return {
            purchaseQuantity: quantity,
            conversionApplied: false,
            normalizedRecipeUnit: params.recipeUnit || params.purchaseUnit,
        };
    }
    if (purchaseUnit === 'kg' && recipeUnit === 'g') {
        return {
            purchaseQuantity: quantity / 1000,
            conversionApplied: true,
            normalizedRecipeUnit: params.recipeUnit || 'g',
        };
    }
    if (purchaseUnit === 'g' && recipeUnit === 'kg') {
        return {
            purchaseQuantity: quantity * 1000,
            conversionApplied: true,
            normalizedRecipeUnit: params.recipeUnit || 'kg',
        };
    }
    if (purchaseUnit === 'l' && recipeUnit === 'ml') {
        return {
            purchaseQuantity: quantity / 1000,
            conversionApplied: true,
            normalizedRecipeUnit: params.recipeUnit || 'ml',
        };
    }
    if (purchaseUnit === 'ml' && recipeUnit === 'l') {
        return {
            purchaseQuantity: quantity * 1000,
            conversionApplied: true,
            normalizedRecipeUnit: params.recipeUnit || 'l',
        };
    }
    const isPiecePurchaseUnit = new Set(['stueck', 'stk', 'piece', 'dose', 'becher', 'flasche']);
    const gramsPerPurchaseUnit = params.gramsPerPurchaseUnit && params.gramsPerPurchaseUnit > 0
        ? params.gramsPerPurchaseUnit
        : null;
    if (isPiecePurchaseUnit.has(purchaseUnit) && gramsPerPurchaseUnit) {
        if (recipeUnit === 'g') {
            return {
                purchaseQuantity: quantity / gramsPerPurchaseUnit,
                conversionApplied: true,
                normalizedRecipeUnit: params.recipeUnit || 'g',
            };
        }
        if (recipeUnit === 'kg') {
            return {
                purchaseQuantity: (quantity * 1000) / gramsPerPurchaseUnit,
                conversionApplied: true,
                normalizedRecipeUnit: params.recipeUnit || 'kg',
            };
        }
    }
    return {
        purchaseQuantity: quantity,
        conversionApplied: false,
        normalizedRecipeUnit: params.recipeUnit || params.purchaseUnit,
    };
}
function calculateProduct(product) {
    const vatRate = Number(product.vatRate);
    const safeVatRate = Number.isFinite(vatRate) && vatRate >= 0 ? vatRate : 0;
    const vatFactor = 1 + safeVatRate / 100;
    let totalCostNet = 0;
    let totalCostGross = 0;
    const allergenSet = new Set();
    const details = product.ingredients.map((item) => {
        const priceNet = Number(item.ingredient.purchasePrice);
        const safePriceNet = Number.isFinite(priceNet) ? priceNet : 0;
        const priceGross = safePriceNet * vatFactor;
        const quantity = Number(item.quantity);
        const gramsPerPurchaseUnit = Number(item.ingredient.gramsPerPurchaseUnit ?? 0);
        const conversion = convertToPurchaseQuantity({
            quantity,
            purchaseUnit: item.ingredient.unit,
            recipeUnit: item.ingredient.recipeUnit,
            gramsPerPurchaseUnit: Number.isFinite(gramsPerPurchaseUnit) && gramsPerPurchaseUnit > 0
                ? gramsPerPurchaseUnit
                : null,
        });
        const costNet = safePriceNet * conversion.purchaseQuantity;
        const costGross = priceGross * conversion.purchaseQuantity;
        totalCostNet += costNet;
        totalCostGross += costGross;
        splitAllergens(item.ingredient.allergens).forEach((code) => allergenSet.add(code));
        return {
            name: item.ingredient.name,
            unit: conversion.normalizedRecipeUnit,
            purchaseUnit: item.ingredient.unit,
            quantity,
            purchaseQuantity: conversion.purchaseQuantity,
            price: priceNet,
            priceNet,
            priceGross,
            cost: costGross,
            costNet,
            costGross,
            conversionApplied: conversion.conversionApplied,
            allergens: splitAllergens(item.ingredient.allergens),
        };
    });
    const sellingPriceGross = Number(product.price);
    const safeSellingPriceGross = Number.isFinite(sellingPriceGross) ? sellingPriceGross : 0;
    const sellingPriceNet = vatFactor > 0 ? safeSellingPriceGross / vatFactor : safeSellingPriceGross;
    const marginGross = safeSellingPriceGross - totalCostGross;
    const marginNet = sellingPriceNet - totalCostNet;
    const marginPercent = safeSellingPriceGross > 0 ? (marginGross / safeSellingPriceGross) * 100 : 0;
    const costPercent = safeSellingPriceGross > 0 ? (totalCostGross / safeSellingPriceGross) * 100 : 0;
    const costPercentNet = sellingPriceNet > 0 ? (totalCostNet / sellingPriceNet) * 100 : 0;
    return {
        productId: product.id,
        productName: product.name,
        available: product.available,
        vatRate: safeVatRate,
        sellingPrice: safeSellingPriceGross,
        sellingPriceGross: safeSellingPriceGross,
        sellingPriceNet,
        totalCost: totalCostGross,
        totalCostGross,
        totalCostNet,
        margin: marginGross,
        marginGross,
        marginNet,
        marginPercent,
        costPercent,
        costPercentNet,
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
