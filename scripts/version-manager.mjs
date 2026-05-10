#!/usr/bin/env node
import fs from 'node:fs'
import path from 'node:path'

const scriptDir = path.dirname(decodeURIComponent(new URL(import.meta.url).pathname))
const rootDir = path.resolve(
  process.platform === 'win32' && scriptDir.startsWith('/')
    ? scriptDir.slice(1)
    : scriptDir,
  '..'
)
const versionFilePath = path.join(rootDir, 'klarando-version.json')
const frontendPackagePath = path.join(rootDir, 'package.json')
const backendPackagePath = path.join(rootDir, 'backend', 'package.json')

function readJson(filePath) {
  return JSON.parse(fs.readFileSync(filePath, 'utf8'))
}

function writeJson(filePath, value) {
  fs.writeFileSync(filePath, `${JSON.stringify(value, null, 2)}\n`, 'utf8')
}

function readVersionFile() {
  if (!fs.existsSync(versionFilePath)) {
    const frontendPackage = readJson(frontendPackagePath)
    const backendPackage = readJson(backendPackagePath)
    const bootstrapVersion = frontendPackage.version || backendPackage.version || '0.1.0'
    const nowIso = new Date().toISOString()
    const created = {
      version: bootstrapVersion,
      frontendVersion: bootstrapVersion,
      backendVersion: bootstrapVersion,
      displayApiVersion: bootstrapVersion,
      mobileCustomerVersion: bootstrapVersion,
      mobileDriverVersion: bootstrapVersion,
      buildDateUtc: nowIso,
      updatedAtUtc: nowIso,
    }
    writeJson(versionFilePath, created)
    return created
  }

  return readJson(versionFilePath)
}

function isSemver(value) {
  return /^\d+\.\d+\.\d+$/.test(value)
}

function bumpSemver(version, bumpType) {
  if (!isSemver(version)) {
    throw new Error(`Ungültige Semver-Version: ${version}`)
  }

  const [major, minor, patch] = version.split('.').map((part) => Number.parseInt(part, 10))

  if (bumpType === 'major') {
    return `${major + 1}.0.0`
  }
  if (bumpType === 'minor') {
    return `${major}.${minor + 1}.0`
  }
  if (bumpType === 'patch') {
    return `${major}.${minor}.${patch + 1}`
  }

  if (bumpType === 'none') {
    return version
  }

  throw new Error(`Unbekannter Bump-Typ: ${bumpType}`)
}

function syncPackageVersions(sharedVersion, buildDateUtc) {
  const frontendPackage = readJson(frontendPackagePath)
  frontendPackage.version = sharedVersion
  frontendPackage.klarandoVersion = sharedVersion
  frontendPackage.klarandoBuildDateUtc = buildDateUtc
  writeJson(frontendPackagePath, frontendPackage)

  const backendPackage = readJson(backendPackagePath)
  backendPackage.version = sharedVersion
  backendPackage.klarandoVersion = sharedVersion
  backendPackage.klarandoBuildDateUtc = buildDateUtc
  writeJson(backendPackagePath, backendPackage)
}

function printUsage() {
  console.log('Nutzung: node scripts/version-manager.mjs <show|bump> [patch|minor|major|none]')
}

function run() {
  const command = process.argv[2] || 'show'
  const versionData = readVersionFile()

  if (command === 'show') {
    console.log(JSON.stringify(versionData, null, 2))
    return
  }

  if (command === 'bump') {
    const bumpType = (process.argv[3] || 'patch').toLowerCase()
    if (!['patch', 'minor', 'major', 'none'].includes(bumpType)) {
      throw new Error('Bump-Typ muss patch, minor, major oder none sein.')
    }

    const nextVersion = bumpSemver(versionData.version, bumpType)
    const nowIso = new Date().toISOString()

    const nextData = {
      ...versionData,
      version: nextVersion,
      frontendVersion: nextVersion,
      backendVersion: nextVersion,
      displayApiVersion: nextVersion,
      mobileCustomerVersion: nextVersion,
      mobileDriverVersion: nextVersion,
      buildDateUtc: nowIso,
      updatedAtUtc: nowIso,
    }

    writeJson(versionFilePath, nextData)
    syncPackageVersions(nextVersion, nowIso)

    console.log(JSON.stringify(nextData, null, 2))
    return
  }

  printUsage()
  throw new Error(`Unbekannter Befehl: ${command}`)
}

try {
  run()
} catch (error) {
  console.error('[version-manager] Fehler:', error instanceof Error ? error.message : error)
  process.exit(1)
}
