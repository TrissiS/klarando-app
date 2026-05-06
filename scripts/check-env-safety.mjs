import fs from 'node:fs'
import path from 'node:path'

const ROOT_DIR = process.cwd()

const ALWAYS_CHECK_FILES = [
  '.env.example',
  '.env.production.example',
  path.join('backend', '.env.example'),
]

const SKIP_DIRS = new Set(['node_modules', '.git', '.next', 'dist', 'build'])
const SECRET_KEYS = new Set([
  'JWT_SECRET',
  'AUTH_SECRET',
  'APP_AUTH_SECRET',
  'POSTGRES_PASSWORD',
  'DATABASE_URL',
  'PASSWORD_SALT',
])

const PLACEHOLDER_MARKERS = [
  'replace',
  'example',
  'your-',
  'your_',
  '<',
  '>',
  'user:password@host',
  'postgres:replace',
]

function walkForEnvExamples(startDir, result) {
  const entries = fs.readdirSync(startDir, { withFileTypes: true })
  for (const entry of entries) {
    if (entry.name.startsWith('.git')) {
      continue
    }

    const fullPath = path.join(startDir, entry.name)
    if (entry.isDirectory()) {
      if (SKIP_DIRS.has(entry.name)) {
        continue
      }
      walkForEnvExamples(fullPath, result)
      continue
    }

    if (/^\.env(\..+)?\.example$/i.test(entry.name)) {
      result.add(path.relative(ROOT_DIR, fullPath))
    }
  }
}

function parseEnvLines(content) {
  const pairs = []
  const lines = content.split(/\r?\n/)
  for (const line of lines) {
    const trimmed = line.trim()
    if (!trimmed || trimmed.startsWith('#')) {
      continue
    }

    const idx = trimmed.indexOf('=')
    if (idx <= 0) {
      continue
    }

    const key = trimmed.slice(0, idx).trim()
    let value = trimmed.slice(idx + 1).trim()
    value = value.replace(/^['"]|['"]$/g, '')
    pairs.push({ key, value })
  }
  return pairs
}

function looksLikePlaceholder(value) {
  const lower = value.toLowerCase()
  return PLACEHOLDER_MARKERS.some((marker) => lower.includes(marker))
}

function collectFilesToCheck() {
  const discovered = new Set()
  walkForEnvExamples(ROOT_DIR, discovered)
  for (const required of ALWAYS_CHECK_FILES) {
    const full = path.join(ROOT_DIR, required)
    if (fs.existsSync(full)) {
      discovered.add(required)
    }
  }
  return Array.from(discovered).sort((a, b) => a.localeCompare(b))
}

function main() {
  const files = collectFilesToCheck()
  if (files.length === 0) {
    console.log('[check-env-safety] Keine .env*.example-Dateien gefunden.')
    return
  }

  const violations = []

  for (const relFile of files) {
    const fullPath = path.join(ROOT_DIR, relFile)
    const parsed = parseEnvLines(fs.readFileSync(fullPath, 'utf8'))
    const values = new Map(parsed.map((entry) => [entry.key, entry.value]))

    const destructiveFlag = values.get('ALLOW_PRODUCTION_DB_DESTRUCTIVE_ACTIONS')
    if (typeof destructiveFlag === 'string' && destructiveFlag.toLowerCase() === 'true') {
      violations.push(
        `${relFile}: ALLOW_PRODUCTION_DB_DESTRUCTIVE_ACTIONS darf nicht auf true stehen.`
      )
    }

    for (const [key, value] of values) {
      const lower = value.toLowerCase()

      if (SECRET_KEYS.has(key)) {
        if (lower === 'changeme' || lower === 'change_me' || lower === 'change-me') {
          violations.push(`${relFile}: ${key} darf nicht "changeme" sein.`)
        } else if (value && !looksLikePlaceholder(value)) {
          violations.push(
            `${relFile}: ${key} sieht nicht nach Platzhalter aus. Bitte keinen echten Secret-Wert committen.`
          )
        }
      }

      if (key === 'CORS_ORIGINS' && (lower === '*' || lower.includes(',*') || lower.includes('*,') || lower.includes('=*'))) {
        violations.push(`${relFile}: CORS_ORIGINS darf fuer Produktion keine Wildcard enthalten.`)
      }
    }
  }

  if (violations.length > 0) {
    console.error('[check-env-safety] FEHLER')
    for (const violation of violations) {
      console.error(`- ${violation}`)
    }
    process.exit(1)
  }

  console.log(`[check-env-safety] OK (${files.length} Dateien geprueft)`)
}

main()
