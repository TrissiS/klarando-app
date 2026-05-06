"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const client_1 = require("@prisma/client");
const prisma_1 = require("../lib/prisma");
const password_1 = require("../auth/password");
const auth_1 = require("../middleware/auth");
const audit_1 = require("../lib/audit");
const router = (0, express_1.Router)();
function parseRole(value) {
    if (!value) {
        return null;
    }
    if (Object.values(client_1.UserRole).includes(value)) {
        return value;
    }
    return null;
}
function enforceUserScope(req, where) {
    const user = req.authUser;
    if (!user) {
        return where;
    }
    if (user.role === client_1.UserRole.CHAINADMIN && user.chainId) {
        return { ...where, chainId: user.chainId };
    }
    if (user.role === client_1.UserRole.ADMIN && user.tenantId) {
        return { ...where, tenantId: user.tenantId };
    }
    if (user.role === client_1.UserRole.STAFF) {
        return { ...where, id: user.id };
    }
    return where;
}
function enforceTenantScope(req, where) {
    const user = req.authUser;
    if (!user) {
        return where;
    }
    if (user.role === client_1.UserRole.CHAINADMIN && user.chainId) {
        return { ...where, chainId: user.chainId };
    }
    if ((user.role === client_1.UserRole.ADMIN || user.role === client_1.UserRole.STAFF) && user.tenantId) {
        return { ...where, id: user.tenantId };
    }
    return where;
}
function enforceAuditScope(req, where) {
    const user = req.authUser;
    if (!user) {
        return where;
    }
    if (user.role === client_1.UserRole.CHAINADMIN && user.chainId) {
        return { ...where, chainId: user.chainId };
    }
    if ((user.role === client_1.UserRole.ADMIN || user.role === client_1.UserRole.STAFF) && user.tenantId) {
        return { ...where, tenantId: user.tenantId };
    }
    return where;
}
router.get('/roles', (0, auth_1.requirePermission)(client_1.PermissionKey.USERS_READ), async (_req, res) => {
    return res.json({
        roles: Object.values(client_1.UserRole),
        permissions: Object.values(client_1.PermissionKey),
    });
});
router.get('/context', (0, auth_1.requirePermission)(client_1.PermissionKey.USERS_READ), async (req, res) => {
    try {
        const actor = req.authUser;
        const tenantWhere = enforceTenantScope(req, {});
        const tenants = await prisma_1.prisma.tenant.findMany({
            where: tenantWhere,
            select: {
                id: true,
                name: true,
                chainId: true,
            },
            orderBy: { createdAt: 'desc' },
        });
        let chainWhere = {};
        if (actor?.role === client_1.UserRole.CHAINADMIN && actor.chainId) {
            chainWhere = { id: actor.chainId };
        }
        if ((actor?.role === client_1.UserRole.ADMIN || actor?.role === client_1.UserRole.STAFF) && actor.tenantId) {
            const tenant = tenants.find((entry) => entry.id === actor.tenantId);
            chainWhere = tenant?.chainId ? { id: tenant.chainId } : { id: '__none__' };
        }
        const chains = await prisma_1.prisma.chain.findMany({
            where: chainWhere,
            select: {
                id: true,
                name: true,
                code: true,
            },
            orderBy: { createdAt: 'desc' },
        });
        return res.json({
            me: actor
                ? {
                    id: actor.id,
                    role: actor.role,
                    chainId: actor.chainId,
                    tenantId: actor.tenantId,
                }
                : null,
            chains,
            tenants,
        });
    }
    catch (error) {
        console.error('GET ACCESS CONTEXT ERROR:', error);
        return res.status(500).json({ error: 'Kontext konnte nicht geladen werden' });
    }
});
router.get('/users', (0, auth_1.requirePermission)(client_1.PermissionKey.USERS_READ), async (req, res) => {
    try {
        const where = {};
        const role = parseRole(req.query.role);
        const chainId = req.query.chainId;
        const tenantId = req.query.tenantId;
        if (role) {
            where.role = role;
        }
        if (chainId) {
            where.chainId = chainId;
        }
        if (tenantId) {
            where.tenantId = tenantId;
        }
        const scopedWhere = enforceAuditScope(req, where);
        const users = await prisma_1.prisma.user.findMany({
            where: scopedWhere,
            select: {
                id: true,
                email: true,
                name: true,
                role: true,
                isActive: true,
                chainId: true,
                tenantId: true,
                createdAt: true,
                updatedAt: true,
            },
            orderBy: { createdAt: 'desc' },
        });
        return res.json(users);
    }
    catch (error) {
        console.error('GET ACCESS USERS ERROR:', error);
        return res.status(500).json({ error: 'Benutzer konnten nicht geladen werden' });
    }
});
router.post('/users', (0, auth_1.requirePermission)(client_1.PermissionKey.USERS_WRITE), async (req, res) => {
    try {
        const actor = req.authUser;
        const { email, name, password, role: rawRole, chainId, tenantId, isActive, } = req.body;
        const role = parseRole(rawRole);
        if (!email || !name || !password || !role) {
            return res.status(400).json({ error: 'email, name, password und role sind erforderlich' });
        }
        if (actor?.role === client_1.UserRole.CHAINADMIN &&
            (role === client_1.UserRole.SUPERADMIN || role === client_1.UserRole.CHAINADMIN)) {
            return res.status(403).json({ error: 'CHAINADMIN darf diese Rolle nicht erstellen' });
        }
        if (actor?.role === client_1.UserRole.ADMIN && role !== client_1.UserRole.STAFF) {
            return res.status(403).json({ error: 'ADMIN darf nur STAFF erstellen' });
        }
        let resolvedTenantId = tenantId || null;
        let resolvedChainId = chainId || null;
        if (actor?.role === client_1.UserRole.CHAINADMIN) {
            resolvedChainId = actor.chainId;
        }
        if (actor?.role === client_1.UserRole.ADMIN) {
            resolvedTenantId = actor.tenantId;
            resolvedChainId = actor.chainId;
        }
        if (role === client_1.UserRole.CHAINADMIN && !resolvedChainId) {
            return res.status(400).json({ error: 'CHAINADMIN braucht eine chainId' });
        }
        if ((role === client_1.UserRole.ADMIN || role === client_1.UserRole.STAFF) && !resolvedTenantId) {
            return res.status(400).json({ error: 'ADMIN/STAFF braucht eine tenantId' });
        }
        if (resolvedTenantId) {
            const tenant = await prisma_1.prisma.tenant.findUnique({
                where: { id: resolvedTenantId },
                select: { id: true, chainId: true },
            });
            if (!tenant) {
                return res.status(400).json({ error: 'Ungueltige tenantId' });
            }
            if (actor?.role === client_1.UserRole.CHAINADMIN && tenant.chainId !== actor.chainId) {
                return res.status(403).json({ error: 'Filiale gehoert nicht zu deiner Kette' });
            }
            resolvedChainId = tenant.chainId || resolvedChainId;
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
        const createdUser = await prisma_1.prisma.user.create({
            data: {
                email: email.trim().toLowerCase(),
                name: name.trim(),
                passwordHash: (0, password_1.hashPassword)(password),
                role,
                chainId: resolvedChainId,
                tenantId: resolvedTenantId,
                isActive: isActive ?? true,
            },
            select: {
                id: true,
                email: true,
                name: true,
                role: true,
                chainId: true,
                tenantId: true,
                isActive: true,
                createdAt: true,
            },
        });
        await (0, audit_1.writeAuditLog)({
            req,
            module: 'access',
            action: 'user_created',
            targetType: 'user',
            targetId: createdUser.id,
            chainId: createdUser.chainId,
            tenantId: createdUser.tenantId,
            metadata: {
                role: createdUser.role,
                email: createdUser.email,
            },
        });
        return res.status(201).json(createdUser);
    }
    catch (error) {
        console.error('CREATE ACCESS USER ERROR:', error);
        return res.status(500).json({ error: 'Benutzer konnte nicht erstellt werden' });
    }
});
router.patch('/users/:id', (0, auth_1.requirePermission)(client_1.PermissionKey.USERS_WRITE), async (req, res) => {
    try {
        const id = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id;
        const actor = req.authUser;
        const current = await prisma_1.prisma.user.findUnique({
            where: { id },
            select: {
                id: true,
                role: true,
                chainId: true,
                tenantId: true,
            },
        });
        if (!current) {
            return res.status(404).json({ error: 'Benutzer nicht gefunden' });
        }
        if (actor?.role === client_1.UserRole.CHAINADMIN && current.chainId !== actor.chainId) {
            return res.status(403).json({ error: 'Kein Zugriff auf diesen Benutzer' });
        }
        if (actor?.role === client_1.UserRole.ADMIN && current.tenantId !== actor.tenantId) {
            return res.status(403).json({ error: 'Kein Zugriff auf diesen Benutzer' });
        }
        const { name, role: rawRole, chainId, tenantId, isActive, password, } = req.body;
        const role = rawRole ? parseRole(rawRole) : null;
        if (rawRole && !role) {
            return res.status(400).json({ error: 'Ungueltige Rolle' });
        }
        if (actor?.role === client_1.UserRole.CHAINADMIN &&
            role &&
            (role === client_1.UserRole.SUPERADMIN || role === client_1.UserRole.CHAINADMIN)) {
            return res.status(403).json({ error: 'CHAINADMIN darf diese Rolle nicht setzen' });
        }
        if (actor?.role === client_1.UserRole.ADMIN && role && role !== client_1.UserRole.STAFF) {
            return res.status(403).json({ error: 'ADMIN darf nur STAFF setzen' });
        }
        const updated = await prisma_1.prisma.user.update({
            where: { id },
            data: {
                name,
                role: role || undefined,
                chainId: actor?.role === client_1.UserRole.SUPERADMIN
                    ? chainId === undefined
                        ? undefined
                        : chainId
                    : undefined,
                tenantId: actor?.role === client_1.UserRole.SUPERADMIN
                    ? tenantId === undefined
                        ? undefined
                        : tenantId
                    : undefined,
                isActive,
                passwordHash: password ? (0, password_1.hashPassword)(password) : undefined,
            },
            select: {
                id: true,
                email: true,
                name: true,
                role: true,
                chainId: true,
                tenantId: true,
                isActive: true,
                updatedAt: true,
            },
        });
        await (0, audit_1.writeAuditLog)({
            req,
            module: 'access',
            action: 'user_updated',
            targetType: 'user',
            targetId: updated.id,
            chainId: updated.chainId,
            tenantId: updated.tenantId,
            metadata: {
                role: updated.role,
                isActive: updated.isActive,
            },
        });
        return res.json(updated);
    }
    catch (error) {
        console.error('UPDATE ACCESS USER ERROR:', error);
        return res.status(500).json({ error: 'Benutzer konnte nicht aktualisiert werden' });
    }
});
router.get('/audit', (0, auth_1.requirePermission)(client_1.PermissionKey.AUDIT_READ), async (req, res) => {
    try {
        const limit = Math.min(Number(req.query.limit || 100), 300);
        const module = req.query.module;
        const tenantId = req.query.tenantId;
        const chainId = req.query.chainId;
        const where = {};
        if (module) {
            where.module = module;
        }
        if (tenantId) {
            where.tenantId = tenantId;
        }
        if (chainId) {
            where.chainId = chainId;
        }
        const scopedWhere = enforceUserScope(req, where);
        const logs = await prisma_1.prisma.auditLog.findMany({
            where: scopedWhere,
            orderBy: { createdAt: 'desc' },
            take: Number.isFinite(limit) && limit > 0 ? limit : 100,
        });
        return res.json(logs);
    }
    catch (error) {
        console.error('GET AUDIT LOGS ERROR:', error);
        return res.status(500).json({ error: 'Audit-Logs konnten nicht geladen werden' });
    }
});
exports.default = router;
