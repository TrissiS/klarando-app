"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const prisma_1 = require("../lib/prisma");
const router = (0, express_1.Router)();
router.get('/', async (req, res) => {
    try {
        const tenantId = req.query.tenantId;
        if (!tenantId) {
            return res.status(400).json({ error: 'tenantId fehlt' });
        }
        const orders = await prisma_1.prisma.order.findMany({
            where: { tenantId },
            include: {
                items: {
                    include: {
                        product: true,
                    },
                },
            },
            orderBy: { createdAt: 'desc' },
        });
        res.json(orders);
    }
    catch (error) {
        console.error('GET ORDERS ERROR:', error);
        res.status(500).json({ error: 'Fehler beim Laden der Bestellungen' });
    }
});
router.post('/', async (req, res) => {
    try {
        const { tenantId, items } = req.body;
        if (!tenantId || !items || items.length === 0) {
            return res.status(400).json({ error: 'tenantId oder items fehlen' });
        }
        const productIds = items.map((item) => item.productId);
        const products = await prisma_1.prisma.product.findMany({
            where: {
                tenantId,
                id: { in: productIds },
            },
        });
        if (products.length !== productIds.length) {
            return res.status(400).json({ error: 'Ein oder mehrere Produkte wurden nicht gefunden' });
        }
        const unavailable = products.filter((product) => !product.available);
        if (unavailable.length > 0) {
            return res.status(400).json({
                error: `Nicht verfuegbare Produkte in Bestellung: ${unavailable
                    .map((product) => product.name)
                    .join(', ')}`,
            });
        }
        let total = 0;
        const orderItemsData = items.map((item) => {
            const product = products.find((p) => p.id === item.productId);
            if (!product) {
                throw new Error(`Produkt ${item.productId} nicht gefunden`);
            }
            const price = Number(product.price);
            const lineTotal = price * item.quantity;
            total += lineTotal;
            return {
                productId: product.id,
                quantity: item.quantity,
                price,
            };
        });
        const order = await prisma_1.prisma.order.create({
            data: {
                tenantId,
                total,
                status: 'open',
                items: {
                    create: orderItemsData,
                },
            },
            include: {
                items: {
                    include: {
                        product: true,
                    },
                },
            },
        });
        res.status(201).json(order);
    }
    catch (error) {
        console.error('POST ORDER ERROR:', error);
        res.status(500).json({ error: 'Fehler beim Erstellen der Bestellung' });
    }
});
router.patch('/:orderId/status', async (req, res) => {
    try {
        const { orderId } = req.params;
        const { status } = req.body;
        if (!status) {
            return res.status(400).json({ error: 'status fehlt' });
        }
        const allowedStatuses = ['open', 'preparing', 'done', 'archived'];
        if (!allowedStatuses.includes(status)) {
            return res.status(400).json({ error: 'Ungültiger Status' });
        }
        const order = await prisma_1.prisma.order.update({
            where: { id: orderId },
            data: { status },
            include: {
                items: {
                    include: {
                        product: true,
                    },
                },
            },
        });
        res.json(order);
    }
    catch (error) {
        console.error('PATCH ORDER STATUS ERROR:', error);
        res.status(500).json({ error: 'Fehler beim Aktualisieren des Status' });
    }
});
exports.default = router;
