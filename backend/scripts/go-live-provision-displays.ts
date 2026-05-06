import path from 'path'
import dotenv from 'dotenv'
import { OrderDisplayRole } from '@prisma/client'
import { prisma } from '../src/lib/prisma'
import { parseSettings } from '../src/lib/business-settings'

dotenv.config({ path: path.resolve(__dirname, '../.env') })
dotenv.config({ path: path.resolve(__dirname, '../../.env.local') })

function randomCode(prefix: string, length: number) {
  const alphabet = 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789'
  let out = prefix
  for (let index = 0; index < length; index += 1) {
    out += alphabet[Math.floor(Math.random() * alphabet.length)]
  }
  return out
}

async function createUniqueDisplayCode() {
  for (let attempt = 0; attempt < 20; attempt += 1) {
    const code = randomCode('DS-', 8)
    const existing = await prisma.orderDisplay.findUnique({
      where: { displayCode: code },
      select: { id: true },
    })
    if (!existing) {
      return code
    }
  }
  return `${randomCode('DS-', 6)}${Date.now().toString().slice(-2)}`
}

async function createUniqueTerminalCode() {
  for (let attempt = 0; attempt < 20; attempt += 1) {
    const code = randomCode('KT-', 8)
    const existing = await prisma.orderTerminal.findUnique({
      where: { terminalCode: code },
      select: { id: true },
    })
    if (!existing) {
      return code
    }
  }
  return `${randomCode('KT-', 6)}${Date.now().toString().slice(-2)}`
}

async function ensureDisplay(
  tenantId: string,
  role: OrderDisplayRole,
  name: string,
  notes: string
) {
  const existing = await prisma.orderDisplay.findFirst({
    where: {
      tenantId,
      displayRole: role,
      isActive: true,
    },
    orderBy: [{ updatedAt: 'desc' }, { createdAt: 'desc' }],
  })

  if (existing) {
    return { id: existing.id, created: false }
  }

  const created = await prisma.orderDisplay.create({
    data: {
      tenantId,
      name,
      displayCode: await createUniqueDisplayCode(),
      displayRole: role,
      isActive: true,
      notes,
    },
    select: { id: true },
  })

  return { id: created.id, created: true }
}

async function run() {
  const tenants = await prisma.tenant.findMany({
    select: {
      id: true,
      name: true,
      email: true,
      businessSettings: true,
    },
    orderBy: [{ name: 'asc' }],
  })

  const notes = `auto_go_live_bootstrap_${new Date().toISOString()}`
  const rows: Array<{
    tenantId: string
    tenantName: string
    createdCash: boolean
    createdKitchen: boolean
    createdPickup: boolean
    createdTerminal: boolean
  }> = []

  for (const tenant of tenants) {
    const settings = parseSettings(tenant.businessSettings, {
      name: tenant.name,
      email: tenant.email,
    })

    if (!settings.customerApp.orderingEnabled) {
      continue
    }

    const cash = await ensureDisplay(tenant.id, 'CASH', 'Kasse Auto', notes)
    const kitchen = await ensureDisplay(tenant.id, 'KITCHEN', 'Kueche Auto', notes)
    const pickup = await ensureDisplay(tenant.id, 'PICKUP', 'Abholung Auto', notes)

    const existingTerminal = await prisma.orderTerminal.findFirst({
      where: {
        tenantId: tenant.id,
        isActive: true,
      },
      select: { id: true },
    })

    let createdTerminal = false
    if (!existingTerminal) {
      await prisma.orderTerminal.create({
        data: {
          tenantId: tenant.id,
          name: 'Bestellterminal Auto',
          terminalCode: await createUniqueTerminalCode(),
          isActive: true,
          allowCashPayment: true,
          allowCardPayment: true,
          autoForwardToKitchen: true,
          cashDisplayId: cash.id,
          kitchenDisplayId: kitchen.id,
          pickupDisplayId: pickup.id,
          notes,
        },
      })
      createdTerminal = true
    }

    rows.push({
      tenantId: tenant.id,
      tenantName: tenant.name,
      createdCash: cash.created,
      createdKitchen: kitchen.created,
      createdPickup: pickup.created,
      createdTerminal,
    })
  }

  console.log('')
  console.log('=== KLARANDO GO-LIVE PROVISION DISPLAYS ===')
  if (rows.length === 0) {
    console.log('Keine orderingEnabled-Filialen gefunden.')
  } else {
    for (const row of rows) {
      console.log(`${row.tenantName} (${row.tenantId})`)
      console.log(
        `  cash:${row.createdCash ? 'created' : 'kept'} | kitchen:${row.createdKitchen ? 'created' : 'kept'} | pickup:${row.createdPickup ? 'created' : 'kept'} | terminal:${row.createdTerminal ? 'created' : 'kept'}`
      )
    }
  }
  console.log('')
}

run()
  .catch((error) => {
    console.error('Provision fehlgeschlagen:', error)
    process.exitCode = 1
  })
  .finally(async () => {
    await prisma.$disconnect()
  })
