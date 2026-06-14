import express from 'express'
import cors from 'cors'
import dotenv from 'dotenv'
import fs from 'node:fs'
import path from 'node:path'
import type { NextFunction, Request, Response } from 'express'
import authRoutes, { seedRolePermissions } from './routes/auth'
import appAuthRoutes from './routes/app-auth'
import accessRoutes from './routes/access'
import chainRoutes from './routes/chains'
import chainadminRoutes from './routes/chainadmin'
import tenantRoutes from './routes/tenant'
import customerRoutes from './routes/customers'
import productRoutes from './routes/products'
import categoryRoutes from './routes/categories'
import ingredientRoutes from './routes/ingredients'
import productIngredientRoutes from './routes/product-ingredients'
import productModifierRoutes from './routes/product-modifiers'
import calculationRoutes from './routes/calculation'
import orderRoutes from './routes/orders'
import orderTerminalRoutes from './routes/order-terminals'
import orderDisplayRoutes from './routes/order-displays'
import orderDeskDeviceRoutes from './routes/orderdesk-devices'
import businessSettingsRoutes from './routes/business-settings'
import supplierRoutes from './routes/suppliers'
import stockRoutes from './routes/stock'
import businessTemplateRoutes from './routes/business-templates'
import actionRoutes from './routes/actions'
import couponRoutes from './routes/coupons'
import staffRoutes from './routes/staff'
import screenRoutes from './routes/screen'
import displayRuntimeRoutes from './routes/display-runtime'
import displayPairingRoutes from './routes/display-pairing'
import displayRoutes from './routes/display'
import deliveryRoutes from './routes/delivery'
import adminDisplayRoutes from './routes/admin-displays'
import databaseManagementRoutes from './routes/database-management'
import cashClosingRoutes from './routes/cash-closings'
import platformBrandingRoutes from './routes/platform-branding'
import platformHolidayRoutes from './routes/platform-holidays'
import mobileUpdatesRoutes from './routes/mobile-updates'
import mobileCheckoutRoutes from './routes/mobile-checkout'
import onboardingRoutes from './routes/onboarding'
import paypalPaymentRoutes from './routes/payments-paypal'
import paymentRoutes from './routes/payments'
import stripeConnectRoutes from './routes/stripe-connect'
import stripeWebhookRoutes from './routes/webhooks-stripe'
import financeRoutes from './routes/finance'
import billingRoutes from './routes/billing'
import promotionRoutes from './routes/promotions'
import cmsRoutes from './routes/cms'
import superadminMenuImportRoutes from './routes/superadmin-menu-import'
import tableOrderingRoutes from './routes/table-ordering'
import branchOrderIntakeRoutes from './routes/branch-order-intake'
import superadminPrivacyRoutes from './routes/superadmin-privacy'
import customerPrivacyRoutes from './routes/customer-privacy'
import tradeCatalogRoutes from './routes/trade-catalog'
import { optionalAuth } from './middleware/auth'
import { rateLimitPasswordReset, rateLimitTokenRefresh } from './middleware/rate-limit'
import { prisma } from './lib/prisma'

dotenv.config()

const app = express()
const processStartedAt = new Date()

function readBackendBuildMetadata() {
  const versionFileCandidates = [
    path.resolve(process.cwd(), 'VERSION.json'),
    path.resolve(process.cwd(), '..', 'VERSION.json'),
  ]
  const packageJsonPath = path.resolve(process.cwd(), 'package.json')
  for (const versionFilePath of versionFileCandidates) {
    try {
      const versionRaw = fs.readFileSync(versionFilePath, 'utf8')
      const versionData = JSON.parse(versionRaw) as {
        version?: string
        buildNumber?: number
        releaseName?: string
        gitCommit?: string | null
        buildTime?: string | null
        environment?: string | null
      }
      return {
        version: versionData.version || null,
        buildNumber: Number(versionData.buildNumber || 0),
        releaseName: versionData.releaseName || null,
        gitCommit: versionData.gitCommit || process.env.GIT_COMMIT_SHA || null,
        buildTime: versionData.buildTime || null,
        environment: versionData.environment || process.env.NODE_ENV || 'development',
        backendVersion: versionData.version || null,
        buildDateUtc: versionData.buildTime || null,
      }
    } catch {
      // Naechsten Kandidaten pruefen.
    }
  }

  try {
    const packageJsonRaw = fs.readFileSync(packageJsonPath, 'utf8')
    const packageJson = JSON.parse(packageJsonRaw) as {
      version?: string
      klarandoVersion?: string
      klarandoBuildDateUtc?: string
    }
    return {
      version: packageJson.klarandoVersion || packageJson.version || null,
      buildNumber: 0,
      releaseName: null,
      gitCommit: process.env.GIT_COMMIT_SHA || null,
      buildTime: packageJson.klarandoBuildDateUtc || null,
      environment: process.env.NODE_ENV || 'development',
      backendVersion: packageJson.klarandoVersion || packageJson.version || null,
      buildDateUtc: packageJson.klarandoBuildDateUtc || null,
    }
  } catch {
    return {
      version: null,
      buildNumber: 0,
      releaseName: null,
      gitCommit: process.env.GIT_COMMIT_SHA || null,
      buildTime: null,
      environment: process.env.NODE_ENV || 'development',
      backendVersion: null,
      buildDateUtc: null,
    }
  }
}

const backendBuildMetadata = readBackendBuildMetadata()
const uploadsDirectory = path.resolve(process.cwd(), 'data', 'uploads')

const DEFAULT_PRODUCTION_ORIGINS = [
  'https://klarando.com',
  'https://www.klarando.com',
  'https://app.klarando.com',
  'https://admin.klarando.com',
  'https://orderdesk.klarando.com',
  'https://driver.klarando.com',
]

function parseCorsOriginsFromEnv() {
  const configured = (process.env.CORS_ORIGINS || '')
    .split(',')
    .map((entry) => entry.trim())
    .filter(Boolean)

  if (configured.includes('*') && process.env.NODE_ENV === 'production') {
    throw new Error('CORS_ORIGINS darf in Produktion kein "*" enthalten')
  }

  if (configured.length > 0) {
    return configured
  }

  if (process.env.NODE_ENV === 'production') {
    return DEFAULT_PRODUCTION_ORIGINS
  }

  return [...DEFAULT_PRODUCTION_ORIGINS, 'http://localhost:3000', 'http://localhost:5173']
}

const allowedCorsOrigins = new Set(parseCorsOriginsFromEnv())

app.use(
  cors({
    origin: (origin, callback) => {
      if (!origin) {
        return callback(null, true)
      }
      if (allowedCorsOrigins.has(origin)) {
        return callback(null, true)
      }
      return callback(new Error(`CORS blockiert fuer Origin: ${origin}`))
    },
    credentials: true,
  })
)
app.use('/api/webhooks/stripe', stripeWebhookRoutes)
app.use('/api/payments/webhook', stripeWebhookRoutes)
app.use(express.json({ limit: '8mb' }))
app.use(express.urlencoded({ extended: true, limit: '8mb' }))
app.use(optionalAuth)
app.use(
  '/uploads',
  express.static(uploadsDirectory, {
    maxAge: '7d',
    etag: true,
  })
)

app.use('/api/auth/reset-password', rateLimitPasswordReset)
app.use('/api/auth/forgot-password', rateLimitPasswordReset)
app.use('/api/auth/refresh', rateLimitTokenRefresh)
app.use('/api/app-auth/refresh', rateLimitTokenRefresh)

app.get('/api/health', (_req, res) => {
  res.json({
    ok: true,
    message: 'Backend laeuft',
    backendVersion: backendBuildMetadata.backendVersion,
    buildDateUtc: backendBuildMetadata.buildDateUtc,
    uptimeSeconds: Math.floor(process.uptime()),
    startedAt: processStartedAt.toISOString(),
    serverTime: new Date().toISOString(),
  })
})

app.get('/api/ready', async (_req, res) => {
  const startedAtIso = processStartedAt.toISOString()
  try {
    await prisma.$queryRaw`SELECT 1`
    return res.json({
      ok: true,
      ready: true,
      checks: {
        database: 'ok',
      },
      backendVersion: backendBuildMetadata.backendVersion,
      startedAt: startedAtIso,
      serverTime: new Date().toISOString(),
    })
  } catch (error) {
    console.error('READY CHECK ERROR:', error)
    return res.status(503).json({
      ok: false,
      ready: false,
      checks: {
        database: 'failed',
      },
      backendVersion: backendBuildMetadata.backendVersion,
      startedAt: startedAtIso,
      serverTime: new Date().toISOString(),
    })
  }
})

app.get('/api/version', (_req, res) => {
  res.json({
    version: backendBuildMetadata.version,
    buildNumber: backendBuildMetadata.buildNumber,
    releaseName: backendBuildMetadata.releaseName,
    gitCommit: backendBuildMetadata.gitCommit,
    buildTime: backendBuildMetadata.buildTime,
    environment: backendBuildMetadata.environment,
  })
})

app.get('/api/health/ready', async (_req, res) => {
  try {
    await prisma.$queryRaw`SELECT 1`
    return res.json({
      ok: true,
      backendVersion: backendBuildMetadata.backendVersion,
      buildDateUtc: backendBuildMetadata.buildDateUtc,
      checks: {
        database: 'ok',
      },
      uptimeSeconds: Math.floor(process.uptime()),
      startedAt: processStartedAt.toISOString(),
      serverTime: new Date().toISOString(),
    })
  } catch (error) {
    console.error('READINESS CHECK ERROR:', error)
    return res.status(503).json({
      ok: false,
      backendVersion: backendBuildMetadata.backendVersion,
      buildDateUtc: backendBuildMetadata.buildDateUtc,
      checks: {
        database: 'down',
      },
      uptimeSeconds: Math.floor(process.uptime()),
      startedAt: processStartedAt.toISOString(),
      serverTime: new Date().toISOString(),
    })
  }
})

app.get('/api/health/display-heartbeats', async (_req, res) => {
  try {
    const now = Date.now()
    const onlineThreshold = new Date(now - 5 * 60 * 1000)
    const staleThreshold = new Date(now - 30 * 60 * 1000)

    const [total, onlineRecent, staleRecent] = await Promise.all([
      prisma.displayDevice.count(),
      prisma.displayDevice.count({
        where: { lastSeenAt: { gte: onlineThreshold } },
      }),
      prisma.displayDevice.count({
        where: {
          OR: [{ lastSeenAt: null }, { lastSeenAt: { lt: staleThreshold } }],
        },
      }),
    ])

    return res.json({
      ok: true,
      serverTime: new Date().toISOString(),
      thresholds: {
        onlineMinutes: 5,
        staleMinutes: 30,
      },
      devices: {
        total,
        onlineRecent,
        staleOrOffline: staleRecent,
      },
      backendVersion: backendBuildMetadata.backendVersion,
    })
  } catch (error) {
    console.error('DISPLAY HEARTBEAT HEALTH ERROR:', error)
    return res.status(500).json({
      ok: false,
      error: 'Display-Heartbeat-Status konnte nicht geladen werden',
      backendVersion: backendBuildMetadata.backendVersion,
      serverTime: new Date().toISOString(),
    })
  }
})

app.use('/api/auth', authRoutes)
app.use('/api/app-auth', appAuthRoutes)
app.use('/api/access', accessRoutes)
app.use('/api/chains', chainRoutes)
app.use('/api/chainadmin', chainadminRoutes)
app.use('/api/tenants', tenantRoutes)
app.use('/api/customers', customerRoutes)
app.use('/api/products', productRoutes)
app.use('/api/categories', categoryRoutes)
app.use('/api/ingredients', ingredientRoutes)
app.use('/api/product-ingredients', productIngredientRoutes)
app.use('/api/product-modifiers', productModifierRoutes)
app.use('/api/calculation', calculationRoutes)
app.use('/api/orders', orderRoutes)
app.use('/api/order-terminals', orderTerminalRoutes)
app.use('/api/order-displays', orderDisplayRoutes)
app.use('/api/orderdesk-devices', orderDeskDeviceRoutes)
app.use('/api/business-settings', businessSettingsRoutes)
app.use('/api/suppliers', supplierRoutes)
app.use('/api/stock', stockRoutes)
app.use('/api/business-templates', businessTemplateRoutes)
app.use('/api/actions', actionRoutes)
app.use('/api/coupons', couponRoutes)
app.use('/api/staff', staffRoutes)
app.use('/api/screen', screenRoutes)
app.use('/api/display-runtime', displayRuntimeRoutes)
app.use('/api/display-pairing', displayPairingRoutes)
app.use('/api/displayPairing', displayPairingRoutes)
app.use('/api/legacy/display-pairing', displayPairingRoutes)
app.use('/api/display', displayRoutes)
app.use('/api/delivery', deliveryRoutes)
app.use('/api/admin/displays', adminDisplayRoutes)
app.use('/api/database-management', databaseManagementRoutes)
app.use('/api/cash-closings', cashClosingRoutes)
app.use('/api/platform-branding', platformBrandingRoutes)
app.use('/api/platform-holidays', platformHolidayRoutes)
app.use('/api/mobile-updates', mobileUpdatesRoutes)
app.use('/api/mobile/checkout', mobileCheckoutRoutes)
app.use('/api/onboarding', onboardingRoutes)
app.use('/api/payments/paypal', paypalPaymentRoutes)
app.use('/api/stripe', stripeConnectRoutes)
app.use('/api/payments', paymentRoutes)
app.use('/api/finance', financeRoutes)
app.use('/api/billing', billingRoutes)
app.use('/api/promotions', promotionRoutes)
app.use('/api/cms', cmsRoutes)
app.use('/api/superadmin/menu-import', superadminMenuImportRoutes)
app.use('/api/table-ordering', tableOrderingRoutes)
app.use('/api/branches', branchOrderIntakeRoutes)
app.use('/api/superadmin/privacy', superadminPrivacyRoutes)
app.use('/api/customer/privacy', customerPrivacyRoutes)
app.use('/api/trade-catalog', tradeCatalogRoutes)

app.use((req, res) => {
  res.status(404).json({
    error: `Route nicht gefunden: ${req.method} ${req.originalUrl}`,
  })
})

app.use((error: unknown, _req: Request, res: Response, _next: NextFunction) => {
  if (error instanceof Error && error.message.startsWith('CORS blockiert')) {
    return res.status(403).json({
      error: 'Origin ist nicht fuer CORS freigegeben',
    })
  }

  console.error('UNHANDLED SERVER ERROR:', error)
  res.status(500).json({
    error: 'Interner Serverfehler',
  })
})

const PORT = Number.parseInt(process.env.PORT ?? '4000', 10)

if (!Number.isFinite(PORT) || PORT <= 0) {
  throw new Error(`Ungueltiger PORT Wert: ${process.env.PORT}`)
}

async function startServer() {
  await seedRolePermissions()

  const server = app.listen(PORT, () => {
    console.log(`Server laeuft auf http://localhost:${PORT}`)
  })

  server.on('error', (error) => {
    if (
      typeof error === 'object' &&
      error !== null &&
      'code' in error &&
      (error as { code?: string }).code === 'EADDRINUSE'
    ) {
      console.error(`Port ${PORT} ist bereits belegt. Bitte alten Backend-Prozess beenden.`)
      process.exit(1)
    }
    console.error('Server listen error:', error)
    process.exit(1)
  })
}

process.on('unhandledRejection', (reason) => {
  console.error('UNHANDLED REJECTION:', reason)
})

process.on('uncaughtException', (error) => {
  console.error('UNCAUGHT EXCEPTION:', error)
})

startServer().catch((error) => {
  console.error('Server start failed:', error)
  process.exit(1)
})
