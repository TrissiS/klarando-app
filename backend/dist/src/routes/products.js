"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const client_1 = require("@prisma/client");
const prisma_1 = require("../lib/prisma");
const auth_1 = require("../middleware/auth");
const audit_1 = require("../lib/audit");
const router = (0, express_1.Router)();
function collectAllergens(product) {
    const codes = new Set();
    for (const item of product.ingredients) {
        const raw = item.ingredient.allergens;
        if (!raw) {
            continue;
        }
        raw
            .split(',')
            .map((part) => part.trim().toUpperCase())
            .filter(Boolean)
            .forEach((code) => codes.add(code));
    }
    return Array.from(codes).sort();
}
router.get('/', (0, auth_1.requirePermission)(client_1.PermissionKey.PRODUCTS_READ), async (req, res) => {
    try {
        const tenantId = req.query.tenantId;
        const availableOnly = req.query.availableOnly === 'true';
        if (!tenantId) {
            return res.status(400).json({ error: 'tenantId fehlt' });
        }
        const products = await prisma_1.prisma.product.findMany({
            where: {
                tenantId,
                ...(availableOnly ? { available: true } : {}),
            },
            orderBy: { createdAt: 'desc' },
            include: {
                category: true,
                ingredients: {
                    include: {
                        ingredient: {
                            select: {
                                allergens: true,
                            },
                        },
                    },
                },
            },
        });
        return res.json(products.map((product) => ({
            ...product,
            allergens: collectAllergens(product),
        })));
    }
    catch (error) {
        console.error('GET PRODUCTS ERROR:', error);
        return res.status(500).json({ error: 'Fehler beim Laden der Produkte' });
    }
});
router.post('/', (0, auth_1.requirePermission)(client_1.PermissionKey.PRODUCTS_WRITE), async (req, res) => {
    try {
        const { tenantId, categoryId, productNumber, name, price, vatRate, available } = req.body;
        if (!tenantId || !productNumber || !name || price === undefined) {
            return res.status(400).json({ error: 'Pflichtfelder fehlen' });
        }
        const product = await prisma_1.prisma.product.create({
            data: {
                tenantId,
                categoryId: categoryId || null,
                productNumber,
                name,
                price: Number(price),
                vatRate: vatRate === undefined ? 19.0 : Number(vatRate),
                available: available ?? true,
            },
            include: {
                category: true,
                ingredients: {
                    include: {
                        ingredient: {
                            select: {
                                allergens: true,
                            },
                        },
                    },
                },
            },
        });
        await (0, audit_1.writeAuditLog)({
            req,
            module: 'product',
            action: 'product_created',
            targetType: 'product',
            targetId: product.id,
            tenantId: product.tenantId,
            metadata: {
                productNumber: product.productNumber,
                name: product.name,
                available: product.available,
            },
        });
        return res.status(201).json({
            ...product,
            allergens: collectAllergens(product),
        });
    }
    catch (error) {
        console.error('CREATE PRODUCT ERROR:', error);
        return res.status(500).json({ error: 'Fehler beim Erstellen des Produkts' });
    }
});
router.put('/:id', (0, auth_1.requirePermission)(client_1.PermissionKey.PRODUCTS_WRITE), async (req, res) => {
    try {
        const id = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id;
        const { name, price, vatRate, categoryId, available } = req.body;
        if (!id) {
            return res.status(400).json({ error: 'Produkt-ID fehlt' });
        }
        const product = await prisma_1.prisma.product.update({
            where: { id },
            data: {
                name,
                price: price === undefined ? undefined : Number(price),
                vatRate: vatRate === undefined ? undefined : Number(vatRate),
                categoryId: categoryId === undefined ? undefined : categoryId || null,
                available,
            },
            include: {
                category: true,
                ingredients: {
                    include: {
                        ingredient: {
                            select: {
                                allergens: true,
                            },
                        },
                    },
                },
            },
        });
        await (0, audit_1.writeAuditLog)({
            req,
            module: 'product',
            action: 'product_updated',
            targetType: 'product',
            targetId: product.id,
            tenantId: product.tenantId,
            metadata: {
                name: product.name,
                available: product.available,
            },
        });
        return res.json({
            ...product,
            allergens: collectAllergens(product),
        });
    }
    catch (error) {
        console.error('UPDATE PRODUCT ERROR:', error);
        return res.status(500).json({ error: 'Produkt konnte nicht aktualisiert werden' });
    }
});
exports.default = router;
