import { Router } from 'express'
import { PermissionKey } from '@prisma/client'
import { prisma } from '../lib/prisma'
import { buildDisplayRuntimeForDevice } from '../lib/display-runtime-builder'
import {
  applyPerformanceModeToNotes,
  parseDisplayMetaFromNotes,
  type DisplayPerformanceMode,
} from '../lib/display-performance-mode'
import { requirePermission } from '../middleware/auth'

const router = Router()

function normalizeCodeParam(value: string | string[] | undefined) {
  if (Array.isArray(value)) {
    return value[0]?.trim().toUpperCase() || ''
  }
  return value?.trim().toUpperCase() || ''
}

function parsePerformanceMode(value: unknown): DisplayPerformanceMode | null {
  if (typeof value !== 'string') {
    return null
  }
  const normalized = value.trim().toUpperCase()
  if (normalized === 'AUTO' || normalized === 'NORMAL' || normalized === 'LOW') {
    return normalized
  }
  return null
}

router.get('/:deviceCode/config', async (req, res) => {
  try {
    const code = normalizeCodeParam(req.params.deviceCode)
    if (!code) {
      return res.status(400).json({ error: 'deviceCode fehlt' })
    }

    const runtime = await buildDisplayRuntimeForDevice(code)
    if (!runtime) {
      return res.status(404).json({ error: 'Display nicht gefunden' })
    }
    return res.json(runtime)
  } catch (error) {
    console.error('GET DISPLAY RUNTIME CONFIG ERROR:', error)
    return res.status(500).json({ error: 'Display-Konfiguration konnte nicht geladen werden' })
  }
})

router.get('/:deviceCode', async (req, res) => {
  try {
    const code = normalizeCodeParam(req.params.deviceCode)
    if (!code) {
      return res.status(400).json({ error: 'deviceCode fehlt' })
    }
    const runtime = await buildDisplayRuntimeForDevice(code)
    if (!runtime) {
      return res.status(404).json({ error: 'Display nicht gefunden' })
    }
    return res.json(runtime)
  } catch (error) {
    console.error('GET DISPLAY RUNTIME ERROR:', error)
    return res.status(500).json({ error: 'Display-Konfiguration konnte nicht geladen werden' })
  }
})

router.patch(
  '/:deviceCode/performance-mode',
  requirePermission(PermissionKey.SETTINGS_WRITE),
  async (req, res) => {
    try {
      const code = normalizeCodeParam(req.params.deviceCode)
      const performanceMode = parsePerformanceMode((req.body as { performanceMode?: unknown }).performanceMode)
      if (!code || !performanceMode) {
        return res.status(400).json({ error: 'deviceCode oder performanceMode fehlt/ungueltig' })
      }

      const screenDevice = await prisma.screenDevice.findUnique({
        where: { deviceCode: code },
        select: { id: true, notes: true },
      })

      if (screenDevice) {
        const updatedNotes = applyPerformanceModeToNotes(screenDevice.notes, performanceMode)
        await prisma.screenDevice.update({
          where: { id: screenDevice.id },
          data: { notes: updatedNotes },
        })
        return res.json({ ok: true, deviceCode: code, performanceMode })
      }

      const orderDisplay = await prisma.orderDisplay.findUnique({
        where: { displayCode: code },
        select: { id: true, notes: true },
      })
      if (!orderDisplay) {
        return res.status(404).json({ error: 'Display nicht gefunden' })
      }
      const updatedNotes = applyPerformanceModeToNotes(orderDisplay.notes, performanceMode)
      await prisma.orderDisplay.update({
        where: { id: orderDisplay.id },
        data: { notes: updatedNotes },
      })
      return res.json({ ok: true, deviceCode: code, performanceMode })
    } catch (error) {
      console.error('SET DISPLAY PERFORMANCE MODE ERROR:', error)
      return res.status(500).json({ error: 'Performance-Profil konnte nicht gesetzt werden' })
    }
  }
)

router.post('/:deviceCode/heartbeat', async (req, res) => {
  try {
    const code = normalizeCodeParam(req.params.deviceCode)
    if (!code) {
      return res.status(400).json({ error: 'deviceCode fehlt' })
    }

    const now = new Date()
    const screenDevice = await prisma.screenDevice.findUnique({
      where: { deviceCode: code },
      select: {
        id: true,
        isActive: true,
      },
    })

    if (screenDevice) {
      await prisma.screenDevice.update({
        where: { id: screenDevice.id },
        data: {
          lastSeenAt: now,
        },
      })

      return res.json({
        status: screenDevice.isActive ? 'online' : 'inactive',
        serverTime: now.toISOString(),
        displayId: screenDevice.id,
        displayType: 'MENU',
        recoveryHints: [
          'Bei Offline-Phasen letzte Konfiguration aus dem Cache nutzen.',
          'Heartbeat-Intervall auf 20-30 Sekunden setzen.',
        ],
      })
    }

    const orderDisplay = await prisma.orderDisplay.findUnique({
      where: { displayCode: code },
      select: {
        id: true,
        isActive: true,
        displayRole: true,
      },
    })

    if (!orderDisplay) {
      return res.status(404).json({ error: 'Display nicht gefunden' })
    }

    await prisma.orderDeskDeviceBinding.updateMany({
      where: {
        displayId: orderDisplay.id,
        isActive: true,
      },
      data: {
        lastSeenAt: now,
      },
    })

      return res.json({
        status: orderDisplay.isActive ? 'online' : 'inactive',
        serverTime: now.toISOString(),
        displayId: orderDisplay.id,
        displayType: orderDisplay.displayRole === 'KITCHEN' ? 'KITCHEN' : orderDisplay.displayRole === 'PICKUP' ? 'CUSTOMER' : 'ORDER',
        recoveryHints: [
          'Bei kurzen Ausfaellen automatische Reconnect-Logik aktiv lassen.',
          'Beim Start zuerst Runtime-Config neu laden, dann Feed pollen.',
      ],
    })
  } catch (error) {
    console.error('DISPLAY HEARTBEAT ERROR:', error)
    return res.status(500).json({ error: 'Heartbeat konnte nicht verarbeitet werden' })
  }
})

export default router
