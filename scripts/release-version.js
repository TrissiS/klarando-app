const fs = require('node:fs/promises')
const path = require('node:path')

const rootDir = process.cwd()
const files = {
  version: path.join(rootDir, 'VERSION.json'),
  backendVersion: path.join(rootDir, 'backend', 'VERSION.json'),
  packageJson: path.join(rootDir, 'package.json'),
  backendPackageJson: path.join(rootDir, 'backend', 'package.json'),
  flutterPubspec: path.join(rootDir, 'mobile_flutter_app', 'pubspec.yaml'),
  legacyVersion: path.join(rootDir, 'klarando-version.json'),
}

function bumpPatch(version) {
  const parts = version.split('.').map((x) => Number.parseInt(x, 10))
  if (parts.length !== 3 || parts.some((x) => Number.isNaN(x) || x < 0)) {
    throw new Error(`Ungueltige Version: ${version}`)
  }
  return `${parts[0]}.${parts[1]}.${parts[2] + 1}`
}

function parseReleaseNameArg() {
  const arg = process.argv.find((entry) => entry.startsWith('--releaseName='))
  if (!arg) return null
  const value = arg.split('=').slice(1).join('=').trim()
  return value || null
}

function withTrailingNewline(content) {
  return `${content}\n`
}

async function readJson(filePath) {
  const raw = await fs.readFile(filePath, 'utf8')
  return JSON.parse(raw)
}

async function writeJson(filePath, value) {
  await fs.writeFile(filePath, withTrailingNewline(JSON.stringify(value, null, 2)), 'utf8')
}

async function main() {
  const nowIso = new Date().toISOString()
  const releaseNameArg = parseReleaseNameArg()

  const rootVersion = await readJson(files.version)
  const nextVersion = bumpPatch(rootVersion.version)
  const nextBuildNumber = Number(rootVersion.buildNumber || 0) + 1
  const nextReleaseName = releaseNameArg || rootVersion.releaseName || 'Release'

  const nextVersionPayload = {
    ...rootVersion,
    version: nextVersion,
    buildNumber: nextBuildNumber,
    releaseName: nextReleaseName,
    buildTime: nowIso,
    gitCommit: process.env.GIT_COMMIT_SHA || null,
    environment: process.env.NODE_ENV || rootVersion.environment || null,
  }

  await writeJson(files.version, nextVersionPayload)
  await writeJson(files.backendVersion, { ...nextVersionPayload, environment: 'production' })

  const rootPackage = await readJson(files.packageJson)
  rootPackage.version = nextVersion
  rootPackage.klarandoVersion = nextVersion
  rootPackage.klarandoBuildDateUtc = nowIso
  await writeJson(files.packageJson, rootPackage)

  const backendPackage = await readJson(files.backendPackageJson)
  backendPackage.version = nextVersion
  backendPackage.klarandoVersion = nextVersion
  backendPackage.klarandoBuildDateUtc = nowIso
  await writeJson(files.backendPackageJson, backendPackage)

  const pubspecRaw = await fs.readFile(files.flutterPubspec, 'utf8')
  const pubspecNext = pubspecRaw.replace(
    /^version:\s*.+$/m,
    `version: ${nextVersion}+${nextBuildNumber}`
  )
  await fs.writeFile(files.flutterPubspec, pubspecNext, 'utf8')

  try {
    const legacy = await readJson(files.legacyVersion)
    legacy.version = nextVersion
    legacy.frontendVersion = nextVersion
    legacy.backendVersion = nextVersion
    legacy.displayApiVersion = nextVersion
    legacy.mobileCustomerVersion = nextVersion
    legacy.mobileDriverVersion = nextVersion
    legacy.buildDateUtc = nowIso
    legacy.updatedAtUtc = nowIso
    await writeJson(files.legacyVersion, legacy)
  } catch {
    // optional legacy file
  }

  console.log(`Release-Version erhoeht: ${rootVersion.version} -> ${nextVersion}`)
  console.log(`Buildnummer: ${rootVersion.buildNumber} -> ${nextBuildNumber}`)
  console.log(`Build-Datum: ${nowIso}`)
  console.log('Optionaler Commit-Befehl:')
  console.log(`git commit -am "release: klarando v${nextVersion}"`)
}

main().catch((error) => {
  console.error('release:patch fehlgeschlagen:', error)
  process.exit(1)
})
