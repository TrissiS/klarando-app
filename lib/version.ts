import packageJson from '@/package.json'
import rootVersion from '@/VERSION.json'
import klarandoVersion from '@/klarando-version.json'

type RuntimeEnvironment = 'development' | 'staging' | 'production'

function resolveEnvironment(): RuntimeEnvironment {
  const raw = (process.env.NEXT_PUBLIC_APP_ENV || process.env.NODE_ENV || 'development')
    .toLowerCase()
    .trim()
  if (raw === 'production') return 'production'
  if (raw === 'staging') return 'staging'
  return 'development'
}

function resolveBuildDateIso() {
  return (
    process.env.NEXT_PUBLIC_BUILD_DATE ||
    process.env.BUILD_DATE ||
    rootVersion.buildTime ||
    klarandoVersion.buildDateUtc ||
    new Date().toISOString()
  )
}

export const appVersion = rootVersion.version || packageJson.version || klarandoVersion.version || '0.0.0'
export const releaseName = rootVersion.releaseName || 'Release'
export const buildNumber = Number(rootVersion.buildNumber || 0)
export const buildDateIso = resolveBuildDateIso()
export const commitSha =
  process.env.NEXT_PUBLIC_COMMIT_SHA || process.env.COMMIT_SHA || rootVersion.gitCommit || null
export const environment = resolveEnvironment()

export function formatBuildDateForUi(value = buildDateIso) {
  return new Date(value).toLocaleString('de-DE', {
    year: 'numeric',
    month: '2-digit',
    day: '2-digit',
    hour: '2-digit',
    minute: '2-digit',
  })
}
