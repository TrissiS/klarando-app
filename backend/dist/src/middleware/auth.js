"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.optionalAuth = optionalAuth;
exports.requireAuth = requireAuth;
exports.requirePermission = requirePermission;
const client_1 = require("@prisma/client");
const token_1 = require("../auth/token");
const permissions_1 = require("../auth/permissions");
const prisma_1 = require("../lib/prisma");
function readBearerToken(req) {
    const raw = req.header('authorization');
    if (!raw || !raw.toLowerCase().startsWith('bearer ')) {
        return null;
    }
    return raw.slice(7).trim();
}
async function resolvePermissions(userId, role) {
    const dbRolePermissions = await prisma_1.prisma.rolePermission.findMany({
        where: { role },
        select: { permission: true },
    });
    const basePermissions = dbRolePermissions.length > 0
        ? dbRolePermissions.map((entry) => entry.permission)
        : (0, permissions_1.getDefaultPermissions)(role);
    const userOverrides = await prisma_1.prisma.userPermission.findMany({
        where: { userId },
        select: { permission: true, allowed: true },
    });
    const effective = new Set(basePermissions);
    for (const entry of userOverrides) {
        if (entry.allowed) {
            effective.add(entry.permission);
            continue;
        }
        effective.delete(entry.permission);
    }
    return effective;
}
async function optionalAuth(req, res, next) {
    const token = readBearerToken(req);
    if (!token) {
        return next();
    }
    const payload = (0, token_1.verifyAuthToken)(token);
    if (!payload) {
        return res.status(401).json({ error: 'Ungueltiges Token' });
    }
    try {
        const user = await prisma_1.prisma.user.findUnique({
            where: { id: payload.sub },
        });
        if (!user || !user.isActive) {
            return res.status(401).json({ error: 'Benutzer nicht aktiv oder nicht gefunden' });
        }
        const permissions = await resolvePermissions(user.id, user.role);
        req.authUser = {
            id: user.id,
            email: user.email,
            name: user.name,
            role: user.role,
            chainId: user.chainId,
            tenantId: user.tenantId,
            permissions,
        };
        return next();
    }
    catch (error) {
        console.error('OPTIONAL AUTH ERROR:', error);
        return res.status(503).json({ error: 'Auth-Datenbank ist noch nicht bereit' });
    }
}
function requireAuth(req, res, next) {
    if (!(0, permissions_1.isAuthEnforced)() && !req.authUser) {
        return next();
    }
    if (!req.authUser) {
        return res.status(401).json({ error: 'Nicht eingeloggt' });
    }
    return next();
}
function requirePermission(permission) {
    return (req, res, next) => {
        if (!(0, permissions_1.isAuthEnforced)() && !req.authUser) {
            return next();
        }
        if (!req.authUser) {
            return res.status(401).json({ error: 'Nicht eingeloggt' });
        }
        if (req.authUser.role === client_1.UserRole.SUPERADMIN) {
            return next();
        }
        if (!req.authUser.permissions.has(permission)) {
            return res.status(403).json({ error: `Keine Berechtigung: ${permission}` });
        }
        return next();
    };
}
