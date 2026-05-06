"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const client_1 = require("@prisma/client");
const prisma_1 = require("../lib/prisma");
const auth_1 = require("../middleware/auth");
const audit_1 = require("../lib/audit");
const router = (0, express_1.Router)();
router.get('/', (0, auth_1.requirePermission)(client_1.PermissionKey.TENANTS_READ), async (req, res) => {
    try {
        const actor = req.authUser;
        if (actor?.role === client_1.UserRole.ADMIN || actor?.role === client_1.UserRole.STAFF) {
            return res.json([]);
        }
        const where = actor?.role === client_1.UserRole.CHAINADMIN && actor.chainId
            ? { id: actor.chainId }
            : undefined;
        const chains = await prisma_1.prisma.chain.findMany({
            where,
            orderBy: { createdAt: 'desc' },
        });
        return res.json(chains);
    }
    catch (error) {
        console.error('GET CHAINS ERROR:', error);
        return res.status(500).json({ error: 'Ketten konnten nicht geladen werden' });
    }
});
router.post('/', (0, auth_1.requirePermission)(client_1.PermissionKey.TENANTS_WRITE), async (req, res) => {
    try {
        const actor = req.authUser;
        if (actor && actor.role !== client_1.UserRole.SUPERADMIN) {
            return res.status(403).json({ error: 'Nur SUPERADMIN darf Ketten erstellen' });
        }
        const { name, code } = req.body;
        if (!name || !code) {
            return res.status(400).json({ error: 'name und code sind erforderlich' });
        }
        const created = await prisma_1.prisma.chain.create({
            data: {
                name: name.trim(),
                code: code.trim().toUpperCase(),
            },
        });
        await (0, audit_1.writeAuditLog)({
            req,
            module: 'chain',
            action: 'chain_created',
            targetType: 'chain',
            targetId: created.id,
            chainId: created.id,
            metadata: {
                name: created.name,
                code: created.code,
            },
        });
        return res.status(201).json(created);
    }
    catch (error) {
        console.error('CREATE CHAIN ERROR:', error);
        return res.status(500).json({ error: 'Kette konnte nicht erstellt werden' });
    }
});
exports.default = router;
