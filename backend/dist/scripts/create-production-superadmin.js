"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const client_1 = require("@prisma/client");
const prisma_1 = require("../src/lib/prisma");
const permissions_1 = require("../src/auth/permissions");
const password_1 = require("../src/auth/password");
const MIN_PASSWORD_LENGTH = 12;
function isProductionEnvironment() {
    return (process.env.NODE_ENV || '').toLowerCase() === 'production';
}
function requireEnv(name) {
    const value = process.env[name];
    if (!value || value.trim().length === 0) {
        throw new Error(`ENV ${name} ist erforderlich.`);
    }
    return value.trim();
}
function assertBootstrapGuards() {
    if (!isProductionEnvironment()) {
        throw new Error('Bootstrap ist nur mit NODE_ENV=production erlaubt.');
    }
    if (process.env.ALLOW_PRODUCTION_ADMIN_BOOTSTRAP !== 'true') {
        throw new Error('Bootstrap ist blockiert. Setze ALLOW_PRODUCTION_ADMIN_BOOTSTRAP=true für einen expliziten Run.');
    }
}
function normalizeEmail(rawEmail) {
    return rawEmail.trim().toLowerCase();
}
function assertPasswordStrength(password) {
    if (password.length < MIN_PASSWORD_LENGTH) {
        throw new Error(`BOOTSTRAP_ADMIN_PASSWORD muss mindestens ${MIN_PASSWORD_LENGTH} Zeichen lang sein.`);
    }
}
function isPasswordResetAllowed() {
    return process.env.BOOTSTRAP_ADMIN_RESET_PASSWORD === 'true';
}
async function seedSuperadminPermissions() {
    const superadminPermissions = permissions_1.DEFAULT_ROLE_PERMISSIONS[client_1.UserRole.SUPERADMIN] ?? [];
    const rows = superadminPermissions.map((permission) => ({
        role: client_1.UserRole.SUPERADMIN,
        permission: permission,
    }));
    if (rows.length === 0) {
        throw new Error('Es konnten keine SUPERADMIN-Standardrechte geladen werden.');
    }
    await prisma_1.prisma.rolePermission.createMany({
        data: rows,
        skipDuplicates: true,
    });
}
async function run() {
    assertBootstrapGuards();
    const email = normalizeEmail(requireEnv('BOOTSTRAP_ADMIN_EMAIL'));
    const password = requireEnv('BOOTSTRAP_ADMIN_PASSWORD');
    const allowPasswordReset = isPasswordResetAllowed();
    assertPasswordStrength(password);
    const existingUser = await prisma_1.prisma.user.findUnique({
        where: { email },
        select: { id: true, role: true, isActive: true },
    });
    if (existingUser) {
        if (!allowPasswordReset) {
            if (existingUser.role === client_1.UserRole.SUPERADMIN) {
                console.log('Superadmin existiert bereits, keine Änderung');
                return;
            }
            throw new Error('Es existiert bereits ein User mit dieser E-Mail, aber ohne SUPERADMIN-Rolle.');
        }
        await seedSuperadminPermissions();
        await prisma_1.prisma.user.update({
            where: { id: existingUser.id },
            data: {
                role: client_1.UserRole.SUPERADMIN,
                passwordHash: (0, password_1.hashPassword)(password),
                isActive: true,
            },
        });
        console.log('Superadmin Passwort wurde zurückgesetzt');
        return;
    }
    const existingSuperadminCount = await prisma_1.prisma.user.count({
        where: { role: client_1.UserRole.SUPERADMIN },
    });
    if (existingSuperadminCount > 0) {
        if (!allowPasswordReset) {
            throw new Error('Es existiert bereits mindestens ein SUPERADMIN. Dieses Bootstrap-Skript erstellt nur den initialen Superadmin.');
        }
        throw new Error('BOOTSTRAP_ADMIN_RESET_PASSWORD=true wurde gesetzt, aber kein User mit BOOTSTRAP_ADMIN_EMAIL gefunden.');
    }
    await seedSuperadminPermissions();
    const createdUser = await prisma_1.prisma.user.create({
        data: {
            email,
            name: 'Klarando Superadmin',
            passwordHash: (0, password_1.hashPassword)(password),
            role: client_1.UserRole.SUPERADMIN,
            isActive: true,
        },
        select: {
            id: true,
            email: true,
            role: true,
            createdAt: true,
        },
    });
    console.log('Superadmin erstellt');
    console.log(`- ID: ${createdUser.id}`);
    console.log(`- E-Mail: ${createdUser.email}`);
    console.log(`- Rolle: ${createdUser.role}`);
    console.log(`- Erstellt am: ${createdUser.createdAt.toISOString()}`);
}
run()
    .catch((error) => {
    console.error('SUPERADMIN BOOTSTRAP FEHLER:', error instanceof Error ? error.message : error);
    process.exitCode = 1;
})
    .finally(async () => {
    await prisma_1.prisma.$disconnect();
});
