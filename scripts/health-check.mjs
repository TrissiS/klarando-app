#!/usr/bin/env node
import process from 'node:process'

const url = process.argv[2]
const label = process.argv[3] || 'service'
const timeoutMs = Number(process.argv[4] || 4000)
const retries = 3

if (!url) {
  console.error('Usage: node scripts/health-check.mjs <url> [label] [timeoutMs]')
  process.exit(1)
}

function sleep(ms) {
  return new Promise((resolve) => setTimeout(resolve, ms))
}

async function runAttempt(attempt) {
  const controller = new AbortController()
  const timer = setTimeout(() => controller.abort(), timeoutMs)

  try {
    const startedAt = Date.now()
    const response = await fetch(url, {
      method: 'GET',
      signal: controller.signal,
      headers: {
        Accept: 'application/json',
      },
    })
    const latency = Date.now() - startedAt
    if (!response.ok) {
      throw new Error(`HTTP ${response.status}`)
    }
    const body = await response.json().catch(() => ({}))
    console.log(
      `[health:${label}] OK (${latency} ms) - ${body?.message || 'Antwort erhalten'}`
    )
    return true
  } catch (error) {
    const reason = error instanceof Error ? error.message : 'Unbekannter Fehler'
    console.warn(`[health:${label}] Versuch ${attempt}/${retries} fehlgeschlagen: ${reason}`)
    return false
  } finally {
    clearTimeout(timer)
  }
}

let success = false
for (let attempt = 1; attempt <= retries; attempt += 1) {
  // eslint-disable-next-line no-await-in-loop
  success = await runAttempt(attempt)
  if (success) break
  if (attempt < retries) {
    // eslint-disable-next-line no-await-in-loop
    await sleep(700)
  }
}

if (!success) {
  console.error(`[health:${label}] FAIL nach ${retries} Versuchen: ${url}`)
  process.exit(1)
}
