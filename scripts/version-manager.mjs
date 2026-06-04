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
const versionFilePath = path.join(rootDir, 'VERSION.json')
const frontendPackagePath = path.join(rootDir, 'package.json')
const backendPackagePath = path.join(rootDir, 'backend', 'package.json')
const flutterPubspecPath = path.join(rootDir, 'mobile_flutter_app', 'pubspec.yaml')
const legacyVersionPath = path.join(rootDir, 'klarando-version.json')

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
      releaseName: 'Release',
      buildNumber: 0,
      gitCommit: null,
      buildTime: nowIso,
      environment: null,
      release: 'Release',
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

  const flutterPubspec = fs.readFileSync(flutterPubspecPath, 'utf8')
  const currentBuildNumber = Number(readVersionFile().buildNumber || 0)
  const nextPubspec = flutterPubspec.replace(
    /^version:\s*.+$/m,
    `version: ${sharedVersion}+${currentBuildNumber}`
  )
  fs.writeFileSync(flutterPubspecPath, nextPubspec, 'utf8')
}

function syncLegacyCompatibility(versionData) {
  if (!fs.existsSync(legacyVersionPath)) {
    return
  }

  writeJson(legacyVersionPath, {
    version: versionData.version,
    frontendVersion: versionData.version,
    backendVersion: versionData.version,
    displayApiVersion: versionData.version,
    mobileCustomerVersion: versionData.version,
    mobileDriverVersion: versionData.version,
    buildDateUtc: versionData.buildTime,
    updatedAtUtc: versionData.buildTime,
  })
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
      buildNumber: Number(versionData.buildNumber || 0) + 1,
      buildTime: nowIso,
      gitCommit: process.env.GIT_COMMIT_SHA || null,
      environment: process.env.NODE_ENV || versionData.environment || null,
      release: versionData.releaseName || versionData.release || 'Release',
    }

    writeJson(versionFilePath, nextData)
    syncPackageVersions(nextVersion, nowIso)
    syncLegacyCompatibility(nextData)

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
