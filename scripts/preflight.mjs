#!/usr/bin/env node
import fs from 'node:fs'
import net from 'node:net'
import path from 'node:path'
import process from 'node:process'

const root = process.cwd()

function fileExists(relativePath) {
  return fs.existsSync(path.join(root, relativePath))
}

function checkPortInUse(port) {
  return new Promise((resolve) => {
    const socket = new net.Socket()
    let settled = false

    const finish = (value) => {
      if (settled) return
      settled = true
      socket.destroy()
      resolve(value)
    }

    socket.setTimeout(800)
    socket.once('connect', () => finish(true))
    socket.once('timeout', () => finish(false))
    socket.once('error', () => finish(false))
    socket.connect(port, '127.0.0.1')
  })
}

const checks = [
  { name: 'root node_modules', ok: fileExists('node_modules') },
  { name: 'backend node_modules', ok: fileExists('backend/node_modules') },
  { name: '.env.local', ok: fileExists('.env.local') },
]

for (const check of checks) {
  console.log(`[preflight] ${check.name}: ${check.ok ? 'OK' : 'FEHLT'}`)
}

const webPortBusy = await checkPortInUse(3000)
const apiPortBusy = await checkPortInUse(4000)

if (webPortBusy) {
  console.warn('[preflight] Port 3000 ist bereits belegt.')
}
if (apiPortBusy) {
  console.warn('[preflight] Port 4000 ist bereits belegt.')
}

const missingRequired = checks.some((entry) => !entry.ok)
if (missingRequired) {
  console.error('[preflight] Abbruch: benötigte Dateien/Abhängigkeiten fehlen.')
  process.exit(1)
}

console.log('[preflight] Basischeck erfolgreich.')
