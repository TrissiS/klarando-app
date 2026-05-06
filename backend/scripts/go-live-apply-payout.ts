import path from 'path'
import dotenv from 'dotenv'
import { Prisma } from '@prisma/client'
import { prisma } from '../src/lib/prisma'
import { parseSettings } from '../src/lib/business-settings'
import { mergePayoutProfile, readDefaultPayoutProfile } from '../src/lib/payout-profile'

dotenv.config({ path: path.resolve(__dirname, '../.env') })
dotenv.config({ path: path.resolve(__dirname, '../../.env.local') })

async function run() {
  const defaults = readDefaultPayoutProfile()

  const chains = await prisma.chain.findMany({
    select: {
      id: true,
      name: true,
      payoutAccountHolder: true,
      payoutBankName: true,
      payoutIban: true,
      payoutBic: true,
      payoutEmail: true,
      payoutReference: true,
    },
    orderBy: [{ name: 'asc' }],
  })

  for (const chain of chains) {
    const next = mergePayoutProfile(
      {
        payoutAccountHolder: chain.payoutAccountHolder || undefined,
        payoutBankName: chain.payoutBankName || undefined,
        payoutIban: chain.payoutIban || undefined,
        payoutBic: chain.payoutBic || undefined,
        payoutEmail: chain.payoutEmail || undefined,
        payoutReference: chain.payoutReference || undefined,
      },
      defaults
    )

    const changed =
      next.payoutAccountHolder !== chain.payoutAccountHolder ||
      next.payoutBankName !== chain.payoutBankName ||
      next.payoutIban !== chain.payoutIban ||
      next.payoutBic !== chain.payoutBic ||
      next.payoutEmail !== chain.payoutEmail ||
      next.payoutReference !== chain.payoutReference

    if (!changed) {
      continue
    }

    await prisma.chain.update({
      where: { id: chain.id },
      data: next,
    })
    console.log(`Kette aktualisiert: ${chain.name}`)
  }

  const tenants = await prisma.tenant.findMany({
    select: {
      id: true,
      name: true,
      email: true,
      chainId: true,
      businessSettings: true,
      chain: {
        select: {
          payoutAccountHolder: true,
          payoutBankName: true,
          payoutIban: true,
          payoutBic: true,
          payoutEmail: true,
          payoutReference: true,
        },
      },
    },
    orderBy: [{ name: 'asc' }],
  })

  let updatedTenants = 0
  for (const tenant of tenants) {
    const current = parseSettings(tenant.businessSettings, {
      name: tenant.name,
      email: tenant.email,
    })

    const chainProfile = tenant.chain
      ? mergePayoutProfile(
          {
            payoutAccountHolder: tenant.chain.payoutAccountHolder || undefined,
            payoutBankName: tenant.chain.payoutBankName || undefined,
            payoutIban: tenant.chain.payoutIban || undefined,
            payoutBic: tenant.chain.payoutBic || undefined,
            payoutEmail: tenant.chain.payoutEmail || undefined,
            payoutReference: tenant.chain.payoutReference || undefined,
          },
          defaults
        )
      : defaults

    const next = {
      ...current,
      payoutAccountHolder: current.payoutAccountHolder || chainProfile.payoutAccountHolder,
      payoutBankName: current.payoutBankName || chainProfile.payoutBankName,
      payoutIban: current.payoutIban || chainProfile.payoutIban,
      payoutBic: current.payoutBic || chainProfile.payoutBic,
      payoutEmail: current.payoutEmail || chainProfile.payoutEmail,
      payoutReference:
        current.payoutReference || `${chainProfile.payoutReference}-${tenant.id.slice(0, 8).toUpperCase()}`,
    }

    const changed =
      next.payoutAccountHolder !== current.payoutAccountHolder ||
      next.payoutBankName !== current.payoutBankName ||
      next.payoutIban !== current.payoutIban ||
      next.payoutBic !== current.payoutBic ||
      next.payoutEmail !== current.payoutEmail ||
      next.payoutReference !== current.payoutReference

    if (!changed) {
      continue
    }

    await prisma.tenant.update({
      where: { id: tenant.id },
      data: {
        businessSettings: next as unknown as Prisma.InputJsonValue,
      },
    })
    updatedTenants += 1
    console.log(`Filiale aktualisiert: ${tenant.name}`)
  }

  console.log('')
  console.log(`Fertig. Filialen aktualisiert: ${updatedTenants}`)
}

run()
  .catch((error) => {
    console.error('Payout-Backfill fehlgeschlagen:', error)
    process.exitCode = 1
  })
  .finally(async () => {
    await prisma.$disconnect()
  })
