"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.seedRolePermissions = seedRolePermissions;
const express_1 = require("express");
const client_1 = require("@prisma/client");
const prisma_1 = require("../lib/prisma");
const permissions_1 = require("../auth/permissions");
const password_1 = require("../auth/password");
const token_1 = require("../auth/token");
const auth_1 = require("../middleware/auth");
const audit_1 = require("../lib/audit");
const router = (0, express_1.Router)();
async function seedRolePermissions() {
    try {
        const rows = Object.entries(permissions_1.DEFAULT_ROLE_PERMISSIONS).flatMap(([role, permissions]) => permissions.map((permission) => ({
            role: role,
            permission,
        })));
        if (rows.length === 0) {
            return;
        }
        await prisma_1.prisma.rolePermission.createMany({
            data: rows,
            skipDuplicates: true,
        });
    }
    catch (error) {
        console.error('SEED ROLE PERMISSIONS ERROR:', error);
    }
}
async function resolvePermissionsForUser(userId, role) {
    const dbRolePermissions = await prisma_1.prisma.rolePermission.findMany({
        where: { role },
        select: { permission: true },
    });
    const rolePermissions = dbRolePermissions.length > 0
        ? dbRolePermissions.map((entry) => entry.permission)
        : (0, permissions_1.getDefaultPermissions)(role);
    const userPermissions = await prisma_1.prisma.userPermission.findMany({
        where: { userId },
        select: { permission: true, allowed: true },
    });
    const effective = new Set(rolePermissions);
    for (const entry of userPermissions) {
        if (entry.allowed) {
            effective.add(entry.permission);
            continue;
        }
        effective.delete(entry.permission);
    }
    return Array.from(effective);
}
router.post('/bootstrap-superadmin', async (req, res) => {
    try {
        const { email, password, name } = req.body;
        if (!email || !password) {
            return res.status(400).json({ error: 'email und password sind erforderlich' });
        }
        const normalizedEmail = email.trim().toLowerCase();
        const superadminCount = await prisma_1.prisma.user.count({
            where: { role: client_1.UserRole.SUPERADMIN },
        });
        if (superadminCount > 0 && req.authUser?.role !== client_1.UserRole.SUPERADMIN) {
            return res.status(403).json({ error: 'Bootstrap nur fuer Superadmin erlaubt' });
        }
        await seedRolePermissions();
        const created = await prisma_1.prisma.user.create({
            data: {
                email: normalizedEmail,
                name: name?.trim() || 'Superadmin',
                passwordHash: (0, password_1.hashPassword)(password),
                role: client_1.UserRole.SUPERADMIN,
            },
            select: {
                id: true,
                email: true,
                name: true,
                role: true,
                createdAt: true,
            },
        });
        await (0, audit_1.writeAuditLog)({
            req,
            module: 'auth',
            action: 'bootstrap_superadmin',
            targetType: 'user',
            targetId: created.id,
            metadata: { email: created.email },
        });
        return res.status(201).json(created);
    }
    catch (error) {
        console.error('BOOTSTRAP SUPERADMIN ERROR:', error);
        return res.status(500).json({ error: 'Superadmin konnte nicht erstellt werden' });
    }
});
router.post('/login', async (req, res) => {
    try {
        const { email, password } = req.body;
        if (!email || !password) {
            return res.status(400).json({ error: 'email und password fehlen' });
        }
        const normalizedEmail = email.trim().toLowerCase();
        const user = await prisma_1.prisma.user.findUnique({
            where: { email: normalizedEmail },
        });
        if (!user || !user.isActive || !(0, password_1.verifyPassword)(password, user.passwordHash)) {
            await (0, audit_1.writeAuditLog)({
                req,
                module: 'auth',
                action: 'login_failed',
                metadata: { email: normalizedEmail },
            });
            return res.status(401).json({ error: 'Login fehlgeschlagen' });
        }
        const permissions = await resolvePermissionsForUser(user.id, user.role);
        const token = (0, token_1.signAuthToken)({
            sub: user.id,
            email: user.email,
            role: user.role,
            chainId: user.chainId,
            tenantId: user.tenantId,
        });
        await (0, audit_1.writeAuditLog)({
            req,
            module: 'auth',
            action: 'login_success',
            targetType: 'user',
            targetId: user.id,
            chainId: user.chainId,
            tenantId: user.tenantId,
        });
        return res.json({
            token,
            user: {
                id: user.id,
                email: user.email,
                name: user.name,
                role: user.role,
                chainId: user.chainId,
                tenantId: user.tenantId,
            },
            permissions,
        });
    }
    catch (error) {
        console.error('LOGIN ERROR:', error);
        return res.status(500).json({ error: 'Login konnte nicht verarbeitet werden' });
    }
});
router.get('/me', auth_1.requireAuth, async (req, res) => {
    if (!req.authUser) {
        return res.status(401).json({ error: 'Nicht eingeloggt' });
    }
    return res.json({
        user: {
            id: req.authUser.id,
            email: req.authUser.email,
            name: req.authUser.name,
            role: req.authUser.role,
            chainId: req.authUser.chainId,
            tenantId: req.authUser.tenantId,
        },
        permissions: Array.from(req.authUser.permissions),
    });
});
router.get('/permissions/matrix', (0, auth_1.requirePermission)(client_1.PermissionKey.USERS_READ), async (_req, res) => {
    try {
        await seedRolePermissions();
        const rows = await prisma_1.prisma.rolePermission.findMany({
            orderBy: [{ role: 'asc' }, { permission: 'asc' }],
        });
        return res.json(rows);
    }
    catch (error) {
        console.error('GET PERMISSION MATRIX ERROR:', error);
        return res.status(500).json({ error: 'Permissions konnten nicht geladen werden' });
    }
});
exports.default = router;
