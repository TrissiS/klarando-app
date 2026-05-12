import { Prisma, UserRole, type PermissionKey } from '@prisma/client'
import { prisma } from '../src/lib/prisma'
import { DEFAULT_ROLE_PERMISSIONS } from '../src/auth/permissions'
import { hashPassword } from '../src/auth/password'

const MIN_PASSWORD_LENGTH = 12
const DEMO_SOURCE_CHANNEL = 'DEMO_SAFE_SCRIPT'

type DatabaseSnapshot = {
  users: number
  superadmins: number
  chainadmins: number
  admins: number
  adminUsersWithTenant: number
  tenants: number
  chains: number
  products: number
  categories: number
  orders: number
  rolePermissions: number
  userPermissions: number
}

function isProductionEnvironment() {
  return (process.env.NODE_ENV || '').toLowerCase() === 'production'
}

function parseBooleanEnv(name: string, fallback = false) {
  const value = process.env[name]
  if (value == null || value.trim().length === 0) {
    return fallback
  }

  return value.trim().toLowerCase() === 'true'
}

function requireEnv(name: string) {
  const value = process.env[name]
  if (!value || value.trim().length === 0) {
    throw new Error(`ENV ${name} ist erforderlich.`)
  }

  return value.trim()
}

function optionalEnv(name: string, fallback: string) {
  const value = process.env[name]
  if (!value || value.trim().length === 0) {
    return fallback
  }

  return value.trim()
}

function assertProductionGuards() {
  if (!isProductionEnvironment()) {
    throw new Error('Dieses Skript darf nur mit NODE_ENV=production laufen.')
  }

  if (!parseBooleanEnv('ALLOW_PRODUCTION_DEMO_DATA_SETUP')) {
    throw new Error(
      'Safety-Guard aktiv. Setze ALLOW_PRODUCTION_DEMO_DATA_SETUP=true fuer einen expliziten, additiven Demo-Run.'
    )
  }

  if (parseBooleanEnv('ALLOW_PRODUCTION_DB_DESTRUCTIVE_ACTIONS')) {
    throw new Error(
      'Unsichere ENV erkannt: ALLOW_PRODUCTION_DB_DESTRUCTIVE_ACTIONS=true. Abbruch aus Sicherheitsgruenden.'
    )
  }
}

function assertPasswordStrength(password: string) {
  if (password.length < MIN_PASSWORD_LENGTH) {
    throw new Error(`DEMO_ADMIN_PASSWORD muss mindestens ${MIN_PASSWORD_LENGTH} Zeichen lang sein.`)
  }
}

async function loadSnapshot(): Promise<DatabaseSnapshot> {
  const [
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
  ] = await prisma.$transaction([
    prisma.user.count(),
    prisma.user.count({ where: { role: UserRole.SUPERADMIN } }),
    prisma.user.count({ where: { role: UserRole.CHAINADMIN } }),
    prisma.user.count({ where: { role: UserRole.ADMIN } }),
    prisma.user.count({ where: { role: UserRole.ADMIN, tenantId: { not: null } } }),
    prisma.tenant.count(),
    prisma.chain.count(),
    prisma.product.count(),
    prisma.category.count(),
    prisma.order.count(),
    prisma.rolePermission.count(),
    prisma.userPermission.count(),
  ])

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
  }
}

function logSnapshot(label: string, snapshot: DatabaseSnapshot) {
  console.log(`\n=== ${label} ===`)
  console.table(snapshot)
}

async function seedRolePermissions() {
  const entries: Array<{ role: UserRole; permission: PermissionKey }> = []
  for (const role of Object.values(UserRole)) {
    const defaults = DEFAULT_ROLE_PERMISSIONS[role] ?? []
    for (const permission of defaults) {
      entries.push({
        role,
        permission,
      })
    }
  }

  if (entries.length === 0) {
    throw new Error('Keine Standard-RolePermissions geladen. Abbruch.')
  }

  await prisma.rolePermission.createMany({
    data: entries,
    skipDuplicates: true,
  })
}

async function ensureDemoData() {
  const chainCode = optionalEnv('DEMO_CHAIN_CODE', 'KLARANDO-DEMO-CHAIN')
  const chainName = optionalEnv('DEMO_CHAIN_NAME', 'Klarando Demo Chain')
  const tenantName = optionalEnv('DEMO_TENANT_NAME', 'Demo Filiale')
  const tenantEmail = optionalEnv('DEMO_TENANT_EMAIL', 'demo-tenant@klarando.local').toLowerCase()
  const adminName = optionalEnv('DEMO_ADMIN_NAME', 'Demo Filialadmin')
  const adminEmail = optionalEnv('DEMO_ADMIN_EMAIL', 'demo.admin@klarando.local').toLowerCase()
  const adminPassword = requireEnv('DEMO_ADMIN_PASSWORD')
  const shouldCreateDemoOrder = parseBooleanEnv('DEMO_CREATE_ORDER')

  assertPasswordStrength(adminPassword)

  await seedRolePermissions()

  const chain = await prisma.chain.upsert({
    where: { code: chainCode },
    update: { name: chainName },
    create: {
      code: chainCode,
      name: chainName,
    },
  })

  const tenant = await prisma.tenant.upsert({
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
  })

  const adminUser = await prisma.user.upsert({
    where: { email: adminEmail },
    update: {
      name: adminName,
      role: UserRole.ADMIN,
      chainId: chain.id,
      tenantId: tenant.id,
      isActive: true,
      passwordHash: hashPassword(adminPassword),
    },
    create: {
      email: adminEmail,
      name: adminName,
      role: UserRole.ADMIN,
      chainId: chain.id,
      tenantId: tenant.id,
      isActive: true,
      passwordHash: hashPassword(adminPassword),
    },
  })

  const categoryName = optionalEnv('DEMO_CATEGORY_NAME', 'Klassiker')
  const existingCategory = await prisma.category.findFirst({
    where: {
      tenantId: tenant.id,
      name: categoryName,
    },
    select: { id: true },
    orderBy: { createdAt: 'asc' },
  })

  const category =
    existingCategory ??
    (await prisma.category.create({
      data: {
        tenantId: tenant.id,
        name: categoryName,
        sortOrder: 1,
      },
    }))

  const demoProducts = [
    {
      productNumber: 'D-100',
      name: 'Demo Döner',
      price: new Prisma.Decimal('8.90'),
    },
    {
      productNumber: 'D-200',
      name: 'Pommes Gross',
      price: new Prisma.Decimal('4.50'),
    },
    {
      productNumber: 'D-300',
      name: 'Cola 0,33',
      price: new Prisma.Decimal('2.50'),
    },
  ]

  const createdProductIds: string[] = []
  for (const demoProduct of demoProducts) {
    const existingProduct = await prisma.product.findFirst({
      where: {
        tenantId: tenant.id,
        productNumber: demoProduct.productNumber,
      },
      select: { id: true },
    })

    if (existingProduct) {
      createdProductIds.push(existingProduct.id)
      continue
    }

    const created = await prisma.product.create({
      data: {
        tenantId: tenant.id,
        categoryId: category.id,
        productNumber: demoProduct.productNumber,
        name: demoProduct.name,
        price: demoProduct.price,
        vatRate: new Prisma.Decimal('7.00'),
        available: true,
      },
      select: { id: true },
    })
    createdProductIds.push(created.id)
  }

  if (shouldCreateDemoOrder && createdProductIds.length > 0) {
    const existingDemoOrder = await prisma.order.findFirst({
      where: {
        tenantId: tenant.id,
        sourceChannel: DEMO_SOURCE_CHANNEL,
      },
      select: { id: true },
      orderBy: { createdAt: 'desc' },
    })

    if (!existingDemoOrder) {
      const firstProductId = createdProductIds[0]
      const firstProduct = await prisma.product.findUnique({
        where: { id: firstProductId },
        select: { price: true },
      })

      if (firstProduct) {
        await prisma.order.create({
          data: {
            tenantId: tenant.id,
            customerName: 'Demo Kunde',
            customerPhone: '0000000',
            customerAddress: 'Musterstrasse 1',
            customerZipCode: '00000',
            customerCity: 'Demo Stadt',
            serviceType: 'DELIVERY',
            subtotal: firstProduct.price,
            deliveryFee: new Prisma.Decimal('0.00'),
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
        })
      }
    }
  }

  console.log('\nDemo-Daten wurden additiv geprueft/angelegt:')
  console.log(`- Chain: ${chain.name} (${chain.code})`)
  console.log(`- Tenant: ${tenant.name} (${tenant.id})`)
  console.log(`- Admin: ${adminUser.email}`)
  console.log(`- Demo-Order erstellt: ${shouldCreateDemoOrder ? 'ja (wenn noch nicht vorhanden)' : 'nein'}`)
}

async function run() {
  assertProductionGuards()

  const before = await loadSnapshot()
  logSnapshot('Diagnose VORHER', before)

  await ensureDemoData()

  const after = await loadSnapshot()
  logSnapshot('Diagnose NACHHER', after)
}

run()
  .catch((error) => {
    console.error('DEMO-SETUP FEHLER:', error instanceof Error ? error.message : error)
    process.exitCode = 1
  })
  .finally(async () => {
    await prisma.$disconnect()
  })

