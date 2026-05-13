import { OrderDisplayRole, PermissionKey } from '@prisma/client'
import { Router } from 'express'
import { prisma } from '../lib/prisma'
import { requirePermission } from '../middleware/auth'
import { writeAuditLog } from '../lib/audit'
import { decodeStoredProductModifierName } from '../lib/product-modifiers'
import { resolveDisplayRouting } from '../lib/order-routing'
import { generateNextPickupNumberForTenant } from '../lib/pickup-number'
import { asTenantScopeError, resolveTenantScope } from '../lib/tenant-scope'
import { rateLimitPublicOrderCreate } from '../middleware/rate-limit'
import {
  beginOrderCreateIdempotency,
  completeOrderCreateIdempotency,
  extractOrderIdempotencyKey,
  releaseOrderCreateIdempotency,
} from '../lib/order-idempotency'

const router = Router()

const PAYMENT_METHODS = new Set(['CASH', 'CARD'])

function normalizeText(input?: string | null) {
  if (input === undefined) {
    return undefined
  }

  if (input === null) {
    return null
  }

  const trimmed = input.trim()
  return trimmed.length > 0 ? trimmed : null
}

function normalizeColorHex(input?: string | null) {
  if (input === undefined) {
    return undefined
  }

  if (input === null) {
    return null
  }

  const trimmed = input.trim()
  if (!/^#[0-9A-Fa-f]{6}$/.test(trimmed)) {
    return null
  }

  return trimmed.toLowerCase()
}

function parseAllergenCodes(raw: string | null) {
  if (!raw) {
    return [] as string[]
  }

  return Array.from(
    new Set(
      raw
        .split(',')
        .map((entry) => entry.trim().toUpperCase())
        .filter(Boolean)
    )
  ).sort()
}

function isPackagingCategory(value: unknown) {
  return typeof value === 'string' && value.trim().toUpperCase() === 'PACKAGING'
}

function normalizeIdList(input?: string[] | string | null) {
  if (input === undefined || input === null) {
    return [] as string[]
  }

  const rawItems = Array.isArray(input) ? input : input.split(',')
  return Array.from(
    new Set(
      rawItems
        .map((entry) => entry.trim())
        .filter((entry) => entry.length > 0)
    )
  )
}

function modifierSelectionGroupKey(modifier: { name: string; ingredientId: string | null }) {
  const parsedName = decodeStoredProductModifierName(modifier.name)
  if (parsedName.kind === 'SIZE') {
    return 'SIZE'
  }
  const ingredientGroup = normalizeText(modifier.ingredientId) ?? '__default'
  return `OPTION:${ingredientGroup}`
}

function mapTerminalProduct(product: {
  id: string
  tenantId: string
  categoryId: string | null
  productNumber: string | null
  name: string
  imageUrl: string | null
  beverageContainerType: 'NONE' | 'EINWEG' | 'MEHRWEG'
  price: unknown
  vatRate: unknown
  available: boolean
  createdAt: Date
  category: {
    id: string
    tenantId: string
    name: string
    imageUrl: string | null
    sortOrder: number
    createdAt: Date
  } | null
  ingredients: Array<{
    ingredient: {
      name: string
      allergens: string | null
      category: string
    }
  }>
  modifiers: Array<{
    id: string
    productId: string
    ingredientId: string | null
    name: string
    priceDelta: unknown
    isDefaultSelected: boolean
    isActive: boolean
    sortOrder: number
    ingredient: {
      id: string
      name: string
    } | null
  }>
}) {
  const allergenSet = new Set<string>()
  const ingredients = product.ingredients
    .filter((entry) => !isPackagingCategory(entry.ingredient.category))
    .map((entry) => {
      const allergens = parseAllergenCodes(entry.ingredient.allergens)
      allergens.forEach((code) => allergenSet.add(code))

      return {
        name: entry.ingredient.name,
        allergens,
      }
    })

  return {
    ...product,
    ingredients,
    allergens: Array.from(allergenSet).sort(),
    modifiers: product.modifiers
      .filter((modifier) => modifier.isActive)
      .sort((left, right) => left.sortOrder - right.sortOrder)
      .map((modifier) => {
        const parsedName = decodeStoredProductModifierName(modifier.name)
        return {
          id: modifier.id,
          name: parsedName.displayName,
          kind: parsedName.kind,
          ingredientId: modifier.ingredientId,
          ingredientName: modifier.ingredient?.name ?? null,
          priceDelta: modifier.priceDelta,
          isDefaultSelected: modifier.isDefaultSelected,
        }
      }),
  }
}

function generateTerminalCode() {
  const alphabet = 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789'
  let output = 'KT-'

  for (let index = 0; index < 8; index += 1) {
    output += alphabet[Math.floor(Math.random() * alphabet.length)]
  }

  return output
}

async function createUniqueTerminalCode() {
  for (let attempt = 0; attempt < 10; attempt += 1) {
    const code = generateTerminalCode()
    const existing = await prisma.orderTerminal.findUnique({
      where: { terminalCode: code },
      select: { id: true },
    })

    if (!existing) {
      return code
    }
  }

  return `${generateTerminalCode()}${Date.now().toString().slice(-2)}`
}

async function validateDisplayAssignment(
  tenantId: string,
  displayId: string | null | undefined,
  role: OrderDisplayRole
) {
  if (!displayId) {
    return true
  }

  const display = await prisma.orderDisplay.findUnique({
    where: { id: displayId },
    select: {
      id: true,
      tenantId: true,
      displayRole: true,
    },
  })

  return Boolean(display && display.tenantId === tenantId && display.displayRole === role)
}

async function loadTerminalOrderForCreateResponse(orderId: string) {
  return prisma.order.findUnique({
    where: {
      id: orderId,
    },
    include: {
      terminal: {
        select: {
          id: true,
          name: true,
          terminalCode: true,
          location: true,
        },
      },
      items: {
        include: {
          product: {
            include: {
              category: true,
            },
          },
        },
      },
    },
  })
}

router.get('/', requirePermission(PermissionKey.ORDERS_READ), async (req, res) => {
  try {
    const scope = await resolveTenantScope(req, req.query.tenantId)
    const tenantId = scope.tenantId as string

    const terminals = await prisma.orderTerminal.findMany({
      where: { tenantId },
      orderBy: [{ name: 'asc' }],
      include: {
        cashDisplay: {
          select: {
            id: true,
            name: true,
            displayCode: true,
            displayRole: true,
          },
        },
        kitchenDisplay: {
          select: {
            id: true,
            name: true,
            displayCode: true,
            displayRole: true,
          },
        },
        pickupDisplay: {
          select: {
            id: true,
            name: true,
            displayCode: true,
            displayRole: true,
          },
        },
      },
    })

    return res.json(terminals)
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('GET ORDER TERMINALS ERROR:', error)
    return res.status(500).json({ error: 'Bestellterminals konnten nicht geladen werden' })
  }
})

router.post('/', requirePermission(PermissionKey.ORDERS_WRITE), async (req, res) => {
  try {
    const {
      tenantId,
      name,
      terminalCode,
      location,
      customerLogoUrl,
      customerAccentColor,
      customerBgFromColor,
      customerBgToColor,
      customerCardColor,
      autoScaleLayout,
      isActive,
      allowCashPayment,
      allowCardPayment,
      autoForwardToKitchen,
      cashDisplayId,
      kitchenDisplayId,
      pickupDisplayId,
      notes,
    } = req.body as {
      tenantId?: string
      name?: string
      terminalCode?: string
      location?: string | null
      customerLogoUrl?: string | null
      customerAccentColor?: string | null
      customerBgFromColor?: string | null
      customerBgToColor?: string | null
      customerCardColor?: string | null
      autoScaleLayout?: boolean
      isActive?: boolean
      allowCashPayment?: boolean
      allowCardPayment?: boolean
      autoForwardToKitchen?: boolean
      cashDisplayId?: string | null
      kitchenDisplayId?: string | null
      pickupDisplayId?: string | null
      notes?: string | null
    }

    if (!tenantId || !normalizeText(name)) {
      return res.status(400).json({ error: 'tenantId und name sind erforderlich' })
    }
    const scope = await resolveTenantScope(req, tenantId)
    const scopedTenantId = scope.tenantId as string

    if ((allowCashPayment ?? true) === false && (allowCardPayment ?? true) === false) {
      return res.status(400).json({
        error: 'Mindestens eine Zahlungsart muss aktiv sein',
      })
    }

    const normalizedCashDisplayId = normalizeText(cashDisplayId)
    const normalizedKitchenDisplayId = normalizeText(kitchenDisplayId)
    const normalizedPickupDisplayId = normalizeText(pickupDisplayId)

    if (!(await validateDisplayAssignment(scopedTenantId, normalizedCashDisplayId, 'CASH'))) {
      return res.status(400).json({ error: 'Kassen-Display ist ungueltig' })
    }

    if (!(await validateDisplayAssignment(scopedTenantId, normalizedKitchenDisplayId, 'KITCHEN'))) {
      return res.status(400).json({ error: 'Kuechen-Display ist ungueltig' })
    }

    if (!(await validateDisplayAssignment(scopedTenantId, normalizedPickupDisplayId, 'PICKUP'))) {
      return res.status(400).json({ error: 'Abhol-Display ist ungueltig' })
    }

    const normalizedAccentColor = normalizeColorHex(customerAccentColor)
    const normalizedBgFromColor = normalizeColorHex(customerBgFromColor)
    const normalizedBgToColor = normalizeColorHex(customerBgToColor)
    const normalizedCardColor = normalizeColorHex(customerCardColor)
    if (
      normalizedAccentColor === null ||
      normalizedBgFromColor === null ||
      normalizedBgToColor === null ||
      normalizedCardColor === null
    ) {
      return res.status(400).json({ error: 'ungueltige Farbe (erwartet #RRGGBB)' })
    }

    const normalizedCode = normalizeText(terminalCode) ?? (await createUniqueTerminalCode())

    const created = await prisma.orderTerminal.create({
      data: {
        tenantId: scopedTenantId,
        name: normalizeText(name) ?? 'Bestellterminal',
        terminalCode: normalizedCode.toUpperCase(),
        location: normalizeText(location),
        customerLogoUrl: normalizeText(customerLogoUrl),
        customerAccentColor: normalizedAccentColor ?? '#ea580c',
        customerBgFromColor: normalizedBgFromColor ?? '#ffedd5',
        customerBgToColor: normalizedBgToColor ?? '#f8fafc',
        customerCardColor: normalizedCardColor ?? '#ffffff',
        autoScaleLayout: autoScaleLayout ?? true,
        isActive: isActive ?? true,
        allowCashPayment: allowCashPayment ?? true,
        allowCardPayment: allowCardPayment ?? true,
        autoForwardToKitchen: autoForwardToKitchen ?? true,
        cashDisplayId: normalizedCashDisplayId,
        kitchenDisplayId: normalizedKitchenDisplayId,
        pickupDisplayId: normalizedPickupDisplayId,
        notes: normalizeText(notes),
      },
      include: {
        cashDisplay: {
          select: {
            id: true,
            name: true,
            displayCode: true,
            displayRole: true,
          },
        },
        kitchenDisplay: {
          select: {
            id: true,
            name: true,
            displayCode: true,
            displayRole: true,
          },
        },
        pickupDisplay: {
          select: {
            id: true,
            name: true,
            displayCode: true,
            displayRole: true,
          },
        },
      },
    })

    await writeAuditLog({
      req,
      module: 'order_terminal',
      action: 'order_terminal_created',
      targetType: 'order_terminal',
      targetId: created.id,
      tenantId: created.tenantId,
      metadata: {
        name: created.name,
        terminalCode: created.terminalCode,
      },
    })

    return res.status(201).json(created)
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('CREATE ORDER TERMINAL ERROR:', error)
    return res.status(500).json({ error: 'Bestellterminal konnte nicht erstellt werden' })
  }
})

router.patch('/:id', requirePermission(PermissionKey.ORDERS_WRITE), async (req, res) => {
  try {
    const id = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id
    const {
      name,
      location,
      customerLogoUrl,
      customerAccentColor,
      customerBgFromColor,
      customerBgToColor,
      customerCardColor,
      autoScaleLayout,
      isActive,
      allowCashPayment,
      allowCardPayment,
      autoForwardToKitchen,
      cashDisplayId,
      kitchenDisplayId,
      pickupDisplayId,
      notes,
    } = req.body as {
      name?: string
      location?: string | null
      customerLogoUrl?: string | null
      customerAccentColor?: string | null
      customerBgFromColor?: string | null
      customerBgToColor?: string | null
      customerCardColor?: string | null
      autoScaleLayout?: boolean
      isActive?: boolean
      allowCashPayment?: boolean
      allowCardPayment?: boolean
      autoForwardToKitchen?: boolean
      cashDisplayId?: string | null
      kitchenDisplayId?: string | null
      pickupDisplayId?: string | null
      notes?: string | null
    }

    if (!id) {
      return res.status(400).json({ error: 'id ist erforderlich' })
    }

    const existing = await prisma.orderTerminal.findUnique({
      where: { id },
      select: {
        id: true,
        tenantId: true,
        allowCashPayment: true,
        allowCardPayment: true,
      },
    })

    if (!existing) {
      return res.status(404).json({ error: 'Bestellterminal nicht gefunden' })
    }
    await resolveTenantScope(req, existing.tenantId)

    const nextAllowCash =
      allowCashPayment === undefined ? existing.allowCashPayment : Boolean(allowCashPayment)
    const nextAllowCard =
      allowCardPayment === undefined ? existing.allowCardPayment : Boolean(allowCardPayment)

    if (!nextAllowCash && !nextAllowCard) {
      return res.status(400).json({
        error: 'Mindestens eine Zahlungsart muss aktiv sein',
      })
    }

    const normalizedCashDisplayId =
      cashDisplayId === undefined ? undefined : normalizeText(cashDisplayId)
    const normalizedKitchenDisplayId =
      kitchenDisplayId === undefined ? undefined : normalizeText(kitchenDisplayId)
    const normalizedPickupDisplayId =
      pickupDisplayId === undefined ? undefined : normalizeText(pickupDisplayId)

    if (
      normalizedCashDisplayId !== undefined &&
      !(await validateDisplayAssignment(existing.tenantId, normalizedCashDisplayId, 'CASH'))
    ) {
      return res.status(400).json({ error: 'Kassen-Display ist ungueltig' })
    }

    if (
      normalizedKitchenDisplayId !== undefined &&
      !(await validateDisplayAssignment(existing.tenantId, normalizedKitchenDisplayId, 'KITCHEN'))
    ) {
      return res.status(400).json({ error: 'Kuechen-Display ist ungueltig' })
    }

    if (
      normalizedPickupDisplayId !== undefined &&
      !(await validateDisplayAssignment(existing.tenantId, normalizedPickupDisplayId, 'PICKUP'))
    ) {
      return res.status(400).json({ error: 'Abhol-Display ist ungueltig' })
    }

    const normalizedAccentColor =
      customerAccentColor === undefined ? undefined : normalizeColorHex(customerAccentColor)
    const normalizedBgFromColor =
      customerBgFromColor === undefined ? undefined : normalizeColorHex(customerBgFromColor)
    const normalizedBgToColor =
      customerBgToColor === undefined ? undefined : normalizeColorHex(customerBgToColor)
    const normalizedCardColor =
      customerCardColor === undefined ? undefined : normalizeColorHex(customerCardColor)
    if (
      normalizedAccentColor === null ||
      normalizedBgFromColor === null ||
      normalizedBgToColor === null ||
      normalizedCardColor === null
    ) {
      return res.status(400).json({ error: 'ungueltige Farbe (erwartet #RRGGBB)' })
    }

    const updated = await prisma.orderTerminal.update({
      where: { id },
      data: {
        name: name === undefined ? undefined : normalizeText(name) ?? undefined,
        location: location === undefined ? undefined : normalizeText(location),
        customerLogoUrl:
          customerLogoUrl === undefined ? undefined : normalizeText(customerLogoUrl),
        customerAccentColor: normalizedAccentColor,
        customerBgFromColor: normalizedBgFromColor,
        customerBgToColor: normalizedBgToColor,
        customerCardColor: normalizedCardColor,
        autoScaleLayout,
        isActive,
        allowCashPayment:
          allowCashPayment === undefined ? undefined : nextAllowCash,
        allowCardPayment:
          allowCardPayment === undefined ? undefined : nextAllowCard,
        autoForwardToKitchen,
        cashDisplayId: normalizedCashDisplayId,
        kitchenDisplayId: normalizedKitchenDisplayId,
        pickupDisplayId: normalizedPickupDisplayId,
        notes: notes === undefined ? undefined : normalizeText(notes),
      },
      include: {
        cashDisplay: {
          select: {
            id: true,
            name: true,
            displayCode: true,
            displayRole: true,
          },
        },
        kitchenDisplay: {
          select: {
            id: true,
            name: true,
            displayCode: true,
            displayRole: true,
          },
        },
        pickupDisplay: {
          select: {
            id: true,
            name: true,
            displayCode: true,
            displayRole: true,
          },
        },
      },
    })

    await writeAuditLog({
      req,
      module: 'order_terminal',
      action: 'order_terminal_updated',
      targetType: 'order_terminal',
      targetId: updated.id,
      tenantId: existing.tenantId,
      metadata: {
        name: updated.name,
        isActive: updated.isActive,
      },
    })

    return res.json(updated)
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('UPDATE ORDER TERMINAL ERROR:', error)
    return res.status(500).json({ error: 'Bestellterminal konnte nicht aktualisiert werden' })
  }
})

router.delete('/:id', requirePermission(PermissionKey.ORDERS_WRITE), async (req, res) => {
  try {
    const id = Array.isArray(req.params.id) ? req.params.id[0] : req.params.id

    if (!id) {
      return res.status(400).json({ error: 'id ist erforderlich' })
    }
    const scope = await resolveTenantScope(req, req.query.tenantId)
    const tenantId = scope.tenantId as string

    const existing = await prisma.orderTerminal.findUnique({
      where: { id },
      select: { id: true, tenantId: true, name: true },
    })

    if (!existing || existing.tenantId !== tenantId) {
      return res.status(404).json({ error: 'Bestellterminal nicht gefunden' })
    }

    const linkedOrders = await prisma.order.count({
      where: {
        tenantId,
        terminalId: id,
      },
    })

    if (linkedOrders > 0) {
      return res.status(409).json({
        error: 'Terminal hat bereits Bestellungen und kann nicht geloescht werden',
      })
    }

    await prisma.orderTerminal.delete({
      where: { id },
    })

    await writeAuditLog({
      req,
      module: 'order_terminal',
      action: 'order_terminal_deleted',
      targetType: 'order_terminal',
      targetId: existing.id,
      tenantId,
      metadata: {
        name: existing.name,
      },
    })

    return res.json({ ok: true })
  } catch (error) {
    const scopeError = asTenantScopeError(error)
    if (scopeError) {
      return res.status(scopeError.status).json({ error: scopeError.message })
    }
    console.error('DELETE ORDER TERMINAL ERROR:', error)
    return res.status(500).json({ error: 'Bestellterminal konnte nicht geloescht werden' })
  }
})

router.get('/public/:terminalCode/config', async (req, res) => {
  try {
    const terminalCode = Array.isArray(req.params.terminalCode)
      ? req.params.terminalCode[0]
      : req.params.terminalCode

    if (!terminalCode) {
      return res.status(400).json({ error: 'terminalCode fehlt' })
    }

    const terminal = await prisma.orderTerminal.findUnique({
      where: {
        terminalCode: terminalCode.toUpperCase(),
      },
      select: {
        id: true,
        tenantId: true,
        name: true,
        terminalCode: true,
        location: true,
        customerLogoUrl: true,
        customerAccentColor: true,
        customerBgFromColor: true,
        customerBgToColor: true,
        customerCardColor: true,
        autoScaleLayout: true,
        isActive: true,
        allowCashPayment: true,
        allowCardPayment: true,
        autoForwardToKitchen: true,
        cashDisplayId: true,
        kitchenDisplayId: true,
        pickupDisplayId: true,
      },
    })

    if (!terminal) {
      return res.status(404).json({ error: 'Bestellterminal nicht gefunden' })
    }

    if (!terminal.isActive) {
      return res.status(403).json({ error: 'Bestellterminal ist deaktiviert' })
    }

    const products = await prisma.product.findMany({
      where: {
        tenantId: terminal.tenantId,
        available: true,
      },
      include: {
        category: true,
        ingredients: {
          include: {
            ingredient: {
              select: {
                name: true,
                allergens: true,
                category: true,
              },
            },
          },
          orderBy: [{ createdAt: 'asc' }],
        },
        modifiers: {
          where: {
            isActive: true,
          },
          include: {
            ingredient: {
              select: {
                id: true,
                name: true,
              },
            },
          },
          orderBy: [{ sortOrder: 'asc' }, { createdAt: 'asc' }],
        },
      },
      orderBy: [{ createdAt: 'desc' }],
    })

    const mappedProducts = products
      .map(mapTerminalProduct)
      .sort((left, right) => {
        const leftCategorySort = left.category?.sortOrder ?? 9999
        const rightCategorySort = right.category?.sortOrder ?? 9999
        if (leftCategorySort !== rightCategorySort) {
          return leftCategorySort - rightCategorySort
        }

        const leftCategoryName = (left.category?.name ?? '').toLowerCase()
        const rightCategoryName = (right.category?.name ?? '').toLowerCase()
        if (leftCategoryName !== rightCategoryName) {
          return leftCategoryName.localeCompare(rightCategoryName, 'de-DE')
        }

        return left.name.localeCompare(right.name, 'de-DE')
      })

    return res.json({
      terminal,
      products: mappedProducts,
      generatedAt: new Date().toISOString(),
    })
  } catch (error) {
    console.error('GET PUBLIC TERMINAL CONFIG ERROR:', error)
    return res.status(500).json({ error: 'Terminaldaten konnten nicht geladen werden' })
  }
})

router.post('/public/:terminalCode/orders', rateLimitPublicOrderCreate, async (req, res) => {
  let idempotencyReservation:
    | {
        key: string
        fingerprint: string
      }
    | null = null
  try {
    const terminalCode = Array.isArray(req.params.terminalCode)
      ? req.params.terminalCode[0]
      : req.params.terminalCode

    const {
      items,
      paymentMethod,
      markPaid,
      forwardToKitchen,
      idempotencyKey,
    } = req.body as {
      items?: Array<{ productId: string; quantity: number; modifierIds?: string[] | string | null }>
      paymentMethod?: string | null
      markPaid?: boolean
      forwardToKitchen?: boolean
      idempotencyKey?: string | null
    }

    if (!terminalCode || !items || items.length === 0) {
      return res.status(400).json({ error: 'terminalCode oder items fehlen' })
    }

    if (items.some((item) => !Number.isInteger(item.quantity) || item.quantity <= 0)) {
      return res.status(400).json({ error: 'quantity muss eine positive ganze Zahl sein' })
    }

    const terminal = await prisma.orderTerminal.findUnique({
      where: {
        terminalCode: terminalCode.toUpperCase(),
      },
      select: {
        id: true,
        tenantId: true,
        isActive: true,
        allowCashPayment: true,
        allowCardPayment: true,
        autoForwardToKitchen: true,
        cashDisplayId: true,
        kitchenDisplayId: true,
        pickupDisplayId: true,
      },
    })

    if (!terminal) {
      return res.status(404).json({ error: 'Bestellterminal nicht gefunden' })
    }

    if (!terminal.isActive) {
      return res.status(403).json({ error: 'Bestellterminal ist deaktiviert' })
    }

    const requestIdempotencyKey = extractOrderIdempotencyKey(
      req.header('x-idempotency-key'),
      idempotencyKey
    )
    const idempotencyResult = beginOrderCreateIdempotency({
      tenantId: terminal.tenantId,
      routeKey: 'order-terminals',
      idempotencyKey: requestIdempotencyKey,
      fingerprintPayload: {
        tenantId: terminal.tenantId,
        terminalId: terminal.id,
        items,
        paymentMethod,
        markPaid: Boolean(markPaid),
        forwardToKitchen: forwardToKitchen ?? null,
      },
    })

    if (idempotencyResult.status === 'in_progress') {
      return res.status(409).json({
        error: 'Bestellung wird bereits verarbeitet. Bitte nicht mehrfach absenden.',
        code: 'TERMINAL_ORDER_CREATE_IN_PROGRESS',
      })
    }

    if (idempotencyResult.status === 'conflict') {
      return res.status(409).json({
        error: 'Idempotency-Key passt nicht zur Anfrage-Payload',
        code: 'TERMINAL_ORDER_IDEMPOTENCY_PAYLOAD_MISMATCH',
      })
    }

    if (idempotencyResult.status === 'replay') {
      const replayOrder = idempotencyResult.orderId
        ? await loadTerminalOrderForCreateResponse(idempotencyResult.orderId)
        : null
      if (replayOrder) {
        await writeAuditLog({
          req,
          module: 'orders',
          action: 'terminal_order_duplicate_replay',
          targetType: 'order',
          targetId: replayOrder.id,
          tenantId: replayOrder.tenantId,
          metadata: {
            idempotencySource: requestIdempotencyKey ? 'explicit' : 'derived',
          },
        })
        return res.status(200).json({
          ...replayOrder,
          idempotencyReplay: true,
        })
      }
      return res.status(409).json({
        error: 'Bestellung wurde bereits verarbeitet',
        code: 'TERMINAL_ORDER_ALREADY_PROCESSED',
      })
    }

    idempotencyReservation = idempotencyResult.reservation

    const normalizedPaymentMethod = normalizeText(paymentMethod)?.toUpperCase() ?? null
    if (normalizedPaymentMethod && !PAYMENT_METHODS.has(normalizedPaymentMethod)) {
      return res.status(400).json({ error: 'ungueltige paymentMethod' })
    }

    if (normalizedPaymentMethod === 'CASH' && !terminal.allowCashPayment) {
      return res.status(400).json({ error: 'Barzahlung ist an diesem Terminal deaktiviert' })
    }

    if (normalizedPaymentMethod === 'CARD' && !terminal.allowCardPayment) {
      return res.status(400).json({ error: 'Kartenzahlung ist an diesem Terminal deaktiviert' })
    }

    const productIds = items.map((item) => item.productId)
    const products = await prisma.product.findMany({
      where: {
        tenantId: terminal.tenantId,
        id: { in: productIds },
      },
      include: {
        modifiers: {
          where: {
            isActive: true,
          },
          include: {
            ingredient: {
              select: {
                id: true,
                name: true,
              },
            },
          },
          orderBy: [{ sortOrder: 'asc' }, { createdAt: 'asc' }],
        },
      },
    })

    if (products.length !== productIds.length) {
      return res.status(400).json({ error: 'Ein oder mehrere Produkte wurden nicht gefunden' })
    }

    const unavailable = products.filter((product) => !product.available)
    if (unavailable.length > 0) {
      return res.status(400).json({
        error: `Nicht verfuegbare Produkte in Bestellung: ${unavailable
          .map((product) => product.name)
          .join(', ')}`,
      })
    }

    let total = 0
    const orderItemsData = items.map((item) => {
      const product = products.find((entry) => entry.id === item.productId)

      if (!product) {
        throw new Error(`Produkt ${item.productId} nicht gefunden`)
      }

      const selectedModifierIds = normalizeIdList(item.modifierIds)
      const productModifierMap = new Map(
        product.modifiers.map((modifier) => [modifier.id, modifier])
      )
      const selectedModifiers = selectedModifierIds.map((modifierId) => {
        const modifier = productModifierMap.get(modifierId)
        if (!modifier) {
          throw new Error(`Ungueltige Produktoption fuer ${product.name}`)
        }
        return modifier
      })
      const selectedGroupKeys = new Set<string>()
      for (const selectedModifier of selectedModifiers) {
        const groupKey = modifierSelectionGroupKey(selectedModifier)
        if (selectedGroupKeys.has(groupKey)) {
          throw new Error(
            `Pro Gruppe/Typ darf nur eine Option je Produkt gewaehlt werden (${product.name})`
          )
        }
        selectedGroupKeys.add(groupKey)
      }
      const unitBasePrice = Number(product.price)
      const unitModifierDelta = selectedModifiers.reduce(
        (sum, modifier) => sum + Number(modifier.priceDelta),
        0
      )
      const unitPrice = Math.max(0, unitBasePrice + unitModifierDelta)
      total += unitPrice * item.quantity

      return {
        productId: product.id,
        quantity: item.quantity,
        price: unitPrice,
        unitBasePrice,
        unitModifierDelta,
        modifierSnapshot:
          selectedModifiers.length > 0
            ? selectedModifiers.map((modifier) => ({
                id: modifier.id,
                name: decodeStoredProductModifierName(modifier.name).displayName,
                ingredientId: modifier.ingredientId,
                ingredientName: modifier.ingredient?.name ?? null,
                priceDelta: Number(modifier.priceDelta),
              }))
            : undefined,
      }
    })

    const shouldMarkPaid = Boolean(markPaid)
    const shouldForward =
      forwardToKitchen === undefined
        ? terminal.autoForwardToKitchen
        : Boolean(forwardToKitchen)
    const status = shouldForward ? 'open' : 'pending_payment'
    const fallbackRouting = await resolveDisplayRouting({
      tenantId: terminal.tenantId,
      terminalId: terminal.id,
    })
    const routedCashDisplayId = terminal.cashDisplayId ?? fallbackRouting.cashDisplayId ?? null
    const routedKitchenDisplayId =
      terminal.kitchenDisplayId ?? fallbackRouting.kitchenDisplayId ?? null
    const routedPickupDisplayId = terminal.pickupDisplayId ?? fallbackRouting.pickupDisplayId ?? null
    const localPickupNumber = await generateNextPickupNumberForTenant(terminal.tenantId)

    const order = await prisma.order.create({
      data: {
        tenantId: terminal.tenantId,
        terminalId: terminal.id,
        cashDisplayId: routedCashDisplayId,
        kitchenDisplayId: routedKitchenDisplayId,
        pickupDisplayId: routedPickupDisplayId,
        pickupNumber: localPickupNumber,
        total,
        status,
        sourceChannel: 'TERMINAL',
        paymentStatus: shouldMarkPaid ? 'PAID' : 'UNPAID',
        paymentMethod: normalizedPaymentMethod,
        paidAt: shouldMarkPaid ? new Date() : null,
        forwardedToKitchenAt: shouldForward ? new Date() : null,
        items: {
          create: orderItemsData.map((item) => ({
            quantity: item.quantity,
            price: item.price,
            unitBasePrice: item.unitBasePrice,
            unitModifierDelta: item.unitModifierDelta,
            modifierSnapshot: item.modifierSnapshot ?? undefined,
            product: {
              connect: {
                id: item.productId,
              },
            },
          })),
        },
      },
      include: {
        terminal: {
          select: {
            id: true,
            name: true,
            terminalCode: true,
            location: true,
          },
        },
        items: {
          include: {
            product: {
              include: {
                category: true,
              },
            },
          },
        },
      },
    })

    if (idempotencyReservation) {
      completeOrderCreateIdempotency(idempotencyReservation, order.id)
    }

    return res.status(201).json(order)
  } catch (error) {
    if (idempotencyReservation) {
      releaseOrderCreateIdempotency(idempotencyReservation)
    }
    console.error('CREATE PUBLIC TERMINAL ORDER ERROR:', error)
    return res.status(500).json({ error: 'Terminal-Bestellung konnte nicht erstellt werden' })
  }
})

export default router
