"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const client_1 = require("@prisma/client");
const prisma_1 = require("../lib/prisma");
const auth_1 = require("../middleware/auth");
const router = (0, express_1.Router)();
router.get('/', (0, auth_1.requirePermission)(client_1.PermissionKey.PRODUCTS_READ), async (req, res) => {
    try {
        const tenantId = req.query.tenantId;
        if (!tenantId) {
            return res.status(400).json({ error: 'tenantId fehlt' });
        }
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
        console.error(error);
        res.status(500).json({ error: 'Fehler beim Laden der Kategorien' });
    }
});
router.post('/', (0, auth_1.requirePermission)(client_1.PermissionKey.PRODUCTS_WRITE), async (req, res) => {
    try {
        const { tenantId, name, sortOrder } = req.body;
        if (!tenantId || !name) {
            return res.status(400).json({ error: 'tenantId oder name fehlt' });
        }
        const category = await prisma_1.prisma.category.create({
            data: {
                tenantId,
                name: name.trim(),
                sortOrder: sortOrder ?? 0,
            },
        });
        res.status(201).json(category);
    }
    catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Fehler beim Erstellen der Kategorie' });
    }
});
router.put('/:id', (0, auth_1.requirePermission)(client_1.PermissionKey.PRODUCTS_WRITE), async (req, res) => {
    try {
        const id = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id;
        const { tenantId, name, sortOrder } = req.body;
        if (!id || !tenantId) {
            return res.status(400).json({ error: 'id oder tenantId fehlt' });
        }
        const existing = await prisma_1.prisma.category.findUnique({
            where: { id },
            select: { id: true, tenantId: true },
        });
        if (!existing || existing.tenantId !== tenantId) {
            return res.status(404).json({ error: 'Kategorie nicht gefunden' });
        }
        const updated = await prisma_1.prisma.category.update({
            where: { id },
            data: {
                name: name === undefined ? undefined : name.trim(),
                sortOrder,
            },
        });
        return res.json(updated);
    }
    catch (error) {
        console.error(error);
        return res.status(500).json({ error: 'Fehler beim Aktualisieren der Kategorie' });
    }
});
exports.default = router;
