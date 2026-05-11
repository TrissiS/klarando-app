"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.seedRolePermissions = seedRolePermissions;
const express_1 = require("express");
const crypto_1 = __importDefault(require("crypto"));
const client_1 = require("@prisma/client");
const prisma_1 = require("../lib/prisma");
const permissions_1 = require("../auth/permissions");
const password_1 = require("../auth/password");
const token_1 = require("../auth/token");
const auth_1 = require("../middleware/auth");
const audit_1 = require("../lib/audit");
const rate_limit_1 = require("../middleware/rate-limit");
const mail_1 = require("../lib/mail");
const router = (0, express_1.Router)();
function validatePasswordRules(value) {
    const trimmed = value.trim();
    if (trimmed.length < 10) {
        return 'Passwort muss mindestens 10 Zeichen lang sein.';
    }
    if (!/[A-Z]/.test(trimmed) || !/[a-z]/.test(trimmed) || !/[0-9]/.test(trimmed)) {
        return 'Passwort muss Groß-/Kleinbuchstaben und Zahlen enthalten.';
    }
    return null;
}
function hashResetToken(token) {
    return crypto_1.default.createHash('sha256').update(token).digest('hex');
}
function buildPasswordResetLink(token) {
    const appUrl = (process.env.PUBLIC_APP_URL || 'http://localhost:3000').trim().replace(/\/+$/, '');
    return `${appUrl}/reset-password?token=${encodeURIComponent(token)}`;
}
async function loadSupportedUserRolesFromDatabase() {
    try {
        const rows = await prisma_1.prisma.$queryRawUnsafe('SELECT unnest(enum_range(NULL::"UserRole"))::text AS role');
        return new Set(rows.map((entry) => entry.role));
    }
    catch (error) {
        console.warn('LOAD USER ROLE ENUM ERROR:', error);
        return null;
    }
}
async function seedRolePermissions() {
    try {
        const supportedRoles = await loadSupportedUserRolesFromDatabase();
        const rows = Object.entries(permissions_1.DEFAULT_ROLE_PERMISSIONS).flatMap(([role, permissions]) => (supportedRoles && !supportedRoles.has(role)
            ? []
            : permissions.map((permission) => ({
                role: role,
                permission,
            }))));
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
router.post('/login', rate_limit_1.rateLimitAuthLogin, async (req, res) => {
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
        if ((0, password_1.needsPasswordRehash)(user.passwordHash)) {
            await prisma_1.prisma.user.update({
                where: { id: user.id },
                data: {
                    passwordHash: (0, password_1.hashPassword)(password),
                },
            });
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
router.post('/forgot-password', async (req, res) => {
    const genericMessage = 'Wenn ein Konto mit dieser E-Mail existiert, wurde ein Link zum Zurücksetzen versendet.';
    try {
        const { email } = req.body;
        const normalizedEmail = typeof email === 'string' ? email.trim().toLowerCase() : '';
        if (!normalizedEmail) {
            return res.json({ ok: true, message: genericMessage });
        }
        const user = await prisma_1.prisma.user.findUnique({
            where: { email: normalizedEmail },
            select: {
                id: true,
                email: true,
                isActive: true,
                tenantId: true,
                chainId: true,
            },
        });
        if (user && user.isActive) {
            const rawToken = crypto_1.default.randomBytes(32).toString('hex');
            const tokenHash = hashResetToken(rawToken);
            const expiresAt = new Date(Date.now() + 30 * 60 * 1000);
            await prisma_1.prisma.passwordResetToken.create({
                data: {
                    userId: user.id,
                    tokenHash,
                    expiresAt,
                    requestedIp: req.ip || req.socket.remoteAddress || null,
                    userAgent: req.get('user-agent') || null,
                },
            });
            const resetLink = buildPasswordResetLink(rawToken);
            const subject = 'Klarando Passwort zurücksetzen';
            const text = `Hallo,\n\nhier ist dein Link zum Zurücksetzen deines Passworts:\n${resetLink}\n\nDer Link ist 30 Minuten gültig und nur einmal nutzbar.\nWenn du das nicht angefordert hast, ignoriere diese E-Mail.\n\nViele Grüße\nKlarando`;
            const html = `
        <p>Hallo,</p>
        <p>hier ist dein Link zum Zurücksetzen deines Passworts:</p>
        <p><a href="${resetLink}">${resetLink}</a></p>
        <p>Der Link ist <strong>30 Minuten</strong> gültig und nur einmal nutzbar.</p>
        <p>Wenn du das nicht angefordert hast, ignoriere diese E-Mail.</p>
        <p>Viele Grüße<br/>Klarando</p>
      `;
            try {
                if ((0, mail_1.isMailConfigured)()) {
                    await (0, mail_1.sendMail)({
                        to: user.email,
                        subject,
                        text,
                        html,
                    });
                }
                else {
                    console.warn('FORGOT PASSWORD MAIL SKIPPED: SMTP nicht konfiguriert');
                }
            }
            catch (mailError) {
                console.error('FORGOT PASSWORD MAIL ERROR:', mailError);
            }
            await (0, audit_1.writeAuditLog)({
                req,
                module: 'auth',
                action: 'password_reset_requested',
                targetType: 'user',
                targetId: user.id,
                chainId: user.chainId,
                tenantId: user.tenantId,
            });
        }
        return res.json({ ok: true, message: genericMessage });
    }
    catch (error) {
        console.error('FORGOT PASSWORD ERROR:', error);
        return res.json({ ok: true, message: genericMessage });
    }
});
router.post('/reset-password', async (req, res) => {
    try {
        const { token, password } = req.body;
        if (!token || !password) {
            return res.status(400).json({ error: 'Token und Passwort sind erforderlich.' });
        }
        const passwordValidationError = validatePasswordRules(password);
        if (passwordValidationError) {
            return res.status(400).json({ error: passwordValidationError });
        }
        const tokenHash = hashResetToken(token);
        const resetToken = await prisma_1.prisma.passwordResetToken.findUnique({
            where: { tokenHash },
            include: {
                user: {
                    select: {
                        id: true,
                        email: true,
                        chainId: true,
                        tenantId: true,
                        isActive: true,
                    },
                },
            },
        });
        if (!resetToken ||
            resetToken.usedAt ||
            resetToken.expiresAt.getTime() < Date.now() ||
            !resetToken.user?.isActive) {
            return res.status(400).json({ error: 'Reset-Link ist ungültig oder abgelaufen.' });
        }
        await prisma_1.prisma.$transaction(async (tx) => {
            await tx.user.update({
                where: { id: resetToken.userId },
                data: {
                    passwordHash: (0, password_1.hashPassword)(password),
                },
            });
            await tx.passwordResetToken.update({
                where: { id: resetToken.id },
                data: {
                    usedAt: new Date(),
                },
            });
            await tx.passwordResetToken.updateMany({
                where: {
                    userId: resetToken.userId,
                    usedAt: null,
                    id: { not: resetToken.id },
                },
                data: {
                    usedAt: new Date(),
                },
            });
        });
        await (0, audit_1.writeAuditLog)({
            req,
            module: 'auth',
            action: 'password_reset_success',
            targetType: 'user',
            targetId: resetToken.user.id,
            chainId: resetToken.user.chainId,
            tenantId: resetToken.user.tenantId,
        });
        return res.json({ ok: true, message: 'Passwort wurde erfolgreich zurückgesetzt.' });
    }
    catch (error) {
        console.error('RESET PASSWORD ERROR:', error);
        return res.status(500).json({ error: 'Passwort konnte nicht zurückgesetzt werden.' });
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
