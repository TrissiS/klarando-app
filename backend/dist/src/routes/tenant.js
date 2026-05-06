"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const client_1 = require("@prisma/client");
const prisma_1 = require("../lib/prisma");
const auth_1 = require("../middleware/auth");
const audit_1 = require("../lib/audit");
const router = (0, express_1.Router)();
function scopedTenantWhere(req) {
    const actor = req.authUser;
    if (!actor) {
        return {};
    }
    if (actor.role === client_1.UserRole.CHAINADMIN && actor.chainId) {
        return { chainId: actor.chainId };
    }
    if ((actor.role === client_1.UserRole.ADMIN || actor.role === client_1.UserRole.STAFF) && actor.tenantId) {
        return { id: actor.tenantId };
    }
    return {};
}
router.get('/', (0, auth_1.requirePermission)(client_1.PermissionKey.TENANTS_READ), async (req, res) => {
    try {
        const tenants = await prisma_1.prisma.tenant.findMany({
            where: scopedTenantWhere(req),
            include: {
                chain: true,
            },
            orderBy: { createdAt: 'desc' },
        });
        return res.json(tenants);
    }
    catch (error) {
        console.error('GET TENANTS ERROR:', error);
        return res.status(500).json({ error: 'Fehler beim Laden der Tenants' });
    }
});
router.post('/', (0, auth_1.requirePermission)(client_1.PermissionKey.TENANTS_WRITE), async (req, res) => {
    try {
        const actor = req.authUser;
        if (actor?.role === client_1.UserRole.ADMIN || actor?.role === client_1.UserRole.STAFF) {
            return res.status(403).json({ error: 'Diese Rolle darf keine Filiale erstellen' });
        }
        const { name, email, chainId } = req.body;
        if (!name) {
            return res.status(400).json({ error: 'Name fehlt' });
        }
        const resolvedChainId = actor?.role === client_1.UserRole.CHAINADMIN ? actor.chainId : chainId || null;
        if (actor?.role === client_1.UserRole.CHAINADMIN && !resolvedChainId) {
            return res.status(400).json({ error: 'CHAINADMIN braucht eine zugeordnete Kette' });
        }
        if (resolvedChainId) {
            const chain = await prisma_1.prisma.chain.findUnique({
                where: { id: resolvedChainId },
                select: { id: true },
            });
            if (!chain) {
                return res.status(400).json({ error: 'Ungueltige chainId' });
            }
        }
        const tenant = await prisma_1.prisma.tenant.create({
            data: {
                name: name.trim(),
                email: email?.trim().toLowerCase() || null,
                chainId: resolvedChainId,
            },
            include: {
                chain: true,
            },
        });
        await (0, audit_1.writeAuditLog)({
            req,
            module: 'tenant',
            action: 'tenant_created',
            targetType: 'tenant',
            targetId: tenant.id,
            chainId: tenant.chainId,
            tenantId: tenant.id,
            metadata: {
                name: tenant.name,
                email: tenant.email,
            },
        });
        return res.status(201).json(tenant);
    }
    catch (error) {
        console.error('CREATE TENANT ERROR:', error);
        return res.status(500).json({ error: 'Fehler beim Erstellen des Tenants' });
    }
});
exports.default = router;
