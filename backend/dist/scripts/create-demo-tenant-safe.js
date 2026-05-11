"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const client_1 = require("@prisma/client");
const prisma_1 = require("../src/lib/prisma");
const permissions_1 = require("../src/auth/permissions");
const password_1 = require("../src/auth/password");
const MIN_PASSWORD_LENGTH = 12;
const DEMO_SOURCE_CHANNEL = 'DEMO_SAFE_SCRIPT';
function isProductionEnvironment() {
    return (process.env.NODE_ENV || '').toLowerCase() === 'production';
}
function parseBooleanEnv(name, fallback = false) {
    const value = process.env[name];
    if (value == null || value.trim().length === 0) {
        return fallback;
    }
    return value.trim().toLowerCase() === 'true';
}
function requireEnv(name) {
    const value = process.env[name];
    if (!value || value.trim().length === 0) {
        throw new Error(`ENV ${name} ist erforderlich.`);
    }
    return value.trim();
}
function optionalEnv(name, fallback) {
    const value = process.env[name];
    if (!value || value.trim().length === 0) {
        return fallback;
    }
    return value.trim();
}
function assertProductionGuards() {
    if (!isProductionEnvironment()) {
        throw new Error('Dieses Skript darf nur mit NODE_ENV=production laufen.');
    }
    if (!parseBooleanEnv('ALLOW_PRODUCTION_DEMO_DATA_SETUP')) {
        throw new Error('Safety-Guard aktiv. Setze ALLOW_PRODUCTION_DEMO_DATA_SETUP=true fuer einen expliziten, additiven Demo-Run.');
    }
    if (parseBooleanEnv('ALLOW_PRODUCTION_DB_DESTRUCTIVE_ACTIONS')) {
        throw new Error('Unsichere ENV erkannt: ALLOW_PRODUCTION_DB_DESTRUCTIVE_ACTIONS=true. Abbruch aus Sicherheitsgruenden.');
    }
}
function assertPasswordStrength(password) {
    if (password.length < MIN_PASSWORD_LENGTH) {
        throw new Error(`DEMO_ADMIN_PASSWORD muss mindestens ${MIN_PASSWORD_LENGTH} Zeichen lang sein.`);
    }
}
async function loadSnapshot() {
    const [users, superadmins, chainadmins, admins, adminUsersWithTenant, tenants, chains, products, categories, orders, rolePermissions, userPermissions,] = await prisma_1.prisma.$transaction([
        prisma_1.prisma.user.count(),
        prisma_1.prisma.user.count({ where: { role: client_1.UserRole.SUPERADMIN } }),
        prisma_1.prisma.user.count({ where: { role: client_1.UserRole.CHAINADMIN } }),
        prisma_1.prisma.user.count({ where: { role: client_1.UserRole.ADMIN } }),
        prisma_1.prisma.user.count({ where: { role: client_1.UserRole.ADMIN, tenantId: { not: null } } }),
        prisma_1.prisma.tenant.count(),
        prisma_1.prisma.chain.count(),
        prisma_1.prisma.product.count(),
        prisma_1.prisma.category.count(),
        prisma_1.prisma.order.count(),
        prisma_1.prisma.rolePermission.count(),
        prisma_1.prisma.userPermission.count(),
    ]);
    return {
        users,
        superadmins,
        chainadmins,
        admins,
        adminUsersWithTenant,
        tenants,
        chains,
        products,
        categories,
        orders,
        rolePermissions,
        userPermissions,
    };
}
function logSnapshot(label, snapshot) {
    console.log(`\n=== ${label} ===`);
    console.table(snapshot);
}
async function seedRolePermissions() {
    const entries = [];
    for (const role of Object.values(client_1.UserRole)) {
        const defaults = permissions_1.DEFAULT_ROLE_PERMISSIONS[role] ?? [];
        for (const permission of defaults) {
            entries.push({
                role,
                permission,
            });
        }
    }
    if (entries.length === 0) {
        throw new Error('Keine Standard-RolePermissions geladen. Abbruch.');
    }
    await prisma_1.prisma.rolePermission.createMany({
        data: entries,
        skipDuplicates: true,
    });
}
async function ensureDemoData() {
    const chainCode = optionalEnv('DEMO_CHAIN_CODE', 'KLARANDO-DEMO-CHAIN');
    const chainName = optionalEnv('DEMO_CHAIN_NAME', 'Klarando Demo Chain');
    const tenantName = optionalEnv('DEMO_TENANT_NAME', 'Demo Filiale');
    const tenantEmail = optionalEnv('DEMO_TENANT_EMAIL', 'demo-tenant@klarando.local').toLowerCase();
    const adminName = optionalEnv('DEMO_ADMIN_NAME', 'Demo Filialadmin');
    const adminEmail = optionalEnv('DEMO_ADMIN_EMAIL', 'demo.admin@klarando.local').toLowerCase();
    const adminPassword = requireEnv('DEMO_ADMIN_PASSWORD');
    const shouldCreateDemoOrder = parseBooleanEnv('DEMO_CREATE_ORDER');
    assertPasswordStrength(adminPassword);
    await seedRolePermissions();
    const chain = await prisma_1.prisma.chain.upsert({
        where: { code: chainCode },
        update: { name: chainName },
        create: {
            code: chainCode,
            name: chainName,
        },
    });
    const tenant = await prisma_1.prisma.tenant.upsert({
        where: { email: tenantEmail },
        update: {
            name: tenantName,
            chainId: chain.id,
        },
        create: {
            name: tenantName,
            email: tenantEmail,
            chainId: chain.id,
        },
    });
    const adminUser = await prisma_1.prisma.user.upsert({
        where: { email: adminEmail },
        update: {
            name: adminName,
            role: client_1.UserRole.ADMIN,
            chainId: chain.id,
            tenantId: tenant.id,
            isActive: true,
            passwordHash: (0, password_1.hashPassword)(adminPassword),
        },
        create: {
            email: adminEmail,
            name: adminName,
            role: client_1.UserRole.ADMIN,
            chainId: chain.id,
            tenantId: tenant.id,
            isActive: true,
            passwordHash: (0, password_1.hashPassword)(adminPassword),
        },
    });
    const categoryName = optionalEnv('DEMO_CATEGORY_NAME', 'Klassiker');
    const existingCategory = await prisma_1.prisma.category.findFirst({
        where: {
            tenantId: tenant.id,
            name: categoryName,
        },
        select: { id: true },
        orderBy: { createdAt: 'asc' },
    });
    const category = existingCategory ??
        (await prisma_1.prisma.category.create({
            data: {
                tenantId: tenant.id,
                name: categoryName,
                sortOrder: 1,
            },
        }));
    const demoProducts = [
        {
            productNumber: 'D-100',
            name: 'Demo Doener',
            price: new client_1.Prisma.Decimal('8.90'),
        },
        {
            productNumber: 'D-200',
            name: 'Pommes Gross',
            price: new client_1.Prisma.Decimal('4.50'),
        },
        {
            productNumber: 'D-300',
            name: 'Cola 0,33',
            price: new client_1.Prisma.Decimal('2.50'),
        },
    ];
    const createdProductIds = [];
    for (const demoProduct of demoProducts) {
        const existingProduct = await prisma_1.prisma.product.findFirst({
            where: {
                tenantId: tenant.id,
                productNumber: demoProduct.productNumber,
            },
            select: { id: true },
        });
        if (existingProduct) {
            createdProductIds.push(existingProduct.id);
            continue;
        }
        const created = await prisma_1.prisma.product.create({
            data: {
                tenantId: tenant.id,
                categoryId: category.id,
                productNumber: demoProduct.productNumber,
                name: demoProduct.name,
                price: demoProduct.price,
                vatRate: new client_1.Prisma.Decimal('7.00'),
                available: true,
            },
            select: { id: true },
        });
        createdProductIds.push(created.id);
    }
    if (shouldCreateDemoOrder && createdProductIds.length > 0) {
        const existingDemoOrder = await prisma_1.prisma.order.findFirst({
            where: {
                tenantId: tenant.id,
                sourceChannel: DEMO_SOURCE_CHANNEL,
            },
            select: { id: true },
            orderBy: { createdAt: 'desc' },
        });
        if (!existingDemoOrder) {
            const firstProductId = createdProductIds[0];
            const firstProduct = await prisma_1.prisma.product.findUnique({
                where: { id: firstProductId },
                select: { price: true },
            });
            if (firstProduct) {
                await prisma_1.prisma.order.create({
                    data: {
                        tenantId: tenant.id,
                        customerName: 'Demo Kunde',
                        customerPhone: '0000000',
                        customerAddress: 'Musterstrasse 1',
                        customerZipCode: '00000',
                        customerCity: 'Demo Stadt',
                        serviceType: 'DELIVERY',
                        subtotal: firstProduct.price,
                        deliveryFee: new client_1.Prisma.Decimal('0.00'),
                        total: firstProduct.price,
                        status: 'OPEN',
                        sourceChannel: DEMO_SOURCE_CHANNEL,
                        paymentStatus: 'UNPAID',
                        items: {
                            create: {
                                productId: firstProductId,
                                quantity: 1,
                                price: firstProduct.price,
                            },
                        },
                    },
                });
            }
        }
    }
    console.log('\nDemo-Daten wurden additiv geprueft/angelegt:');
    console.log(`- Chain: ${chain.name} (${chain.code})`);
    console.log(`- Tenant: ${tenant.name} (${tenant.id})`);
    console.log(`- Admin: ${adminUser.email}`);
    console.log(`- Demo-Order erstellt: ${shouldCreateDemoOrder ? 'ja (wenn noch nicht vorhanden)' : 'nein'}`);
}
async function run() {
    assertProductionGuards();
    const before = await loadSnapshot();
    logSnapshot('Diagnose VORHER', before);
    await ensureDemoData();
    const after = await loadSnapshot();
    logSnapshot('Diagnose NACHHER', after);
}
run()
    .catch((error) => {
    console.error('DEMO-SETUP FEHLER:', error instanceof Error ? error.message : error);
    process.exitCode = 1;
})
    .finally(async () => {
    await prisma_1.prisma.$disconnect();
});
