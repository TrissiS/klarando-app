param(
  [ValidateSet('live', 'test', 'quick')]
  [string]$Mode = 'live',

  [ValidateSet('patch', 'minor', 'major', 'none')]
  [string]$VersionBump = 'patch',

  [switch]$SkipPush,
  [switch]$SkipRemoteDeploy,
  [switch]$SkipRemoteBackup,
  [switch]$NonInteractive
)

$ErrorActionPreference = 'Stop'

# ===== VPS Konfiguration =====
$VpsHost = '31.70.76.55'
$VpsUser = 'root'
$VpsPort = 22
$VpsProjectPath = '/opt/klarando-app'
$VpsProjectPathTest = '/opt/klarando-app-test'
$PublicHealthUrlLive = 'http://31.70.76.55/api/health'
$PublicHealthUrlTest = 'http://31.70.76.55/api/health'
$SshKeyPath = '' # optional, z.B. C:\Users\<du>\.ssh\id_ed25519

function Write-Step {
  param([string]$Message)
  Write-Host "`n=== $Message ===" -ForegroundColor Cyan
}

function Ask-YesNo {
  param(
    [string]$Question,
    [bool]$DefaultYes = $true
  )

  if ($NonInteractive) {
    return $DefaultYes
  }

  while ($true) {
    $suffix = if ($DefaultYes) { '[Y/n]' } else { '[y/N]' }
    $answer = (Read-Host "$Question $suffix").Trim().ToLowerInvariant()

    if ([string]::IsNullOrWhiteSpace($answer)) {
      return $DefaultYes
    }

    if ($answer -in @('y', 'yes', 'j', 'ja')) {
      return $true
    }

    if ($answer -in @('n', 'no', 'nein')) {
      return $false
    }

    Write-Host 'Bitte nur y oder n eingeben.' -ForegroundColor Yellow
  }
}

function Invoke-CheckedCommand {
  param(
    [Parameter(Mandatory = $true)][string]$Label,
    [Parameter(Mandatory = $true)][scriptblock]$Command
  )

  Write-Host "> $Label" -ForegroundColor DarkCyan
  & $Command
  if ($LASTEXITCODE -ne 0) {
    throw "Fehler bei: $Label"
  }
}

function Get-VersionData {
  $raw = node scripts/version-manager.mjs show
  if ($LASTEXITCODE -ne 0) {
    throw 'Version konnte nicht gelesen werden.'
  }
  return $raw | Out-String | ConvertFrom-Json
}

function Ensure-ReleaseNotes {
  param(
    [string]$Version,
    [string]$ModeName,
    [string]$CommitMessage,
    [string]$BaseCommit
  )

  $releaseDir = Join-Path $projectRoot 'docs\releases'
  $releaseFile = Join-Path $releaseDir 'RELEASE_NOTES.md'

  if (-not (Test-Path $releaseDir)) {
    New-Item -ItemType Directory -Path $releaseDir | Out-Null
  }

  if (-not (Test-Path $releaseFile)) {
    @(
      '# Klarando Release Notes',
      '',
      'Automatisch erzeugte Release-Historie für lokale Desktop-Deployments.',
      ''
    ) | Set-Content -LiteralPath $releaseFile -Encoding utf8
  }

  $timestamp = (Get-Date).ToUniversalTime().ToString('yyyy-MM-dd HH:mm:ss')
  $entry = @(
    "## v$Version ($timestamp UTC)",
    "- Modus: $ModeName",
    "- Basis-Commit: $BaseCommit",
    "- Commit-Message: $CommitMessage",
    '- Quelle: lokales Desktop-Deploy-Script',
    ''
  )

  Add-Content -LiteralPath $releaseFile -Value $entry -Encoding utf8
}

$projectRoot = Split-Path -Parent $PSScriptRoot
Set-Location $projectRoot

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
  throw 'git wurde nicht gefunden.'
}
if (-not (Get-Command ssh -ErrorAction SilentlyContinue)) {
  throw 'ssh wurde nicht gefunden. Bitte OpenSSH Client installieren.'
}
if (-not (Get-Command node -ErrorAction SilentlyContinue)) {
  throw 'node wurde nicht gefunden.'
}
if (-not (Get-Command npm -ErrorAction SilentlyContinue)) {
  throw 'npm wurde nicht gefunden.'
}

if (-not (Test-Path 'klarando-version.json')) {
  throw 'klarando-version.json fehlt. Bitte zuerst Versionierung initialisieren.'
}

$mergeConflicts = git diff --name-only --diff-filter=U
if (-not [string]::IsNullOrWhiteSpace(($mergeConflicts -join ''))) {
  throw 'Deployment abgebrochen: Es gibt ungelöste Git-Konflikte.'
}

if ($Mode -eq 'live' -and -not $NonInteractive) {
  $confirmLive = Ask-YesNo -Question 'ACHTUNG: LIVE Deployment starten?' -DefaultYes $false
  if (-not $confirmLive) {
    Write-Host 'Deployment abgebrochen.' -ForegroundColor Yellow
    exit 0
  }

  $confirmFinalLive = Ask-YesNo -Question "Letzte Bestätigung: LIVE auf $VpsHost wirklich jetzt deployen?" -DefaultYes $false
  if (-not $confirmFinalLive) {
    Write-Host 'Deployment abgebrochen.' -ForegroundColor Yellow
    exit 0
  }
}

Write-Step 'Git Status'
Invoke-CheckedCommand -Label 'git status --short --branch' -Command { git status --short --branch }

$runFullChecks = $Mode -ne 'quick'

if ($runFullChecks) {
  Write-Step 'Qualitätschecks'
  Invoke-CheckedCommand -Label 'npm run lint' -Command { npm run lint }
  Invoke-CheckedCommand -Label 'npm --prefix backend run typecheck' -Command { npm --prefix backend run typecheck }
  Invoke-CheckedCommand -Label 'npm run build' -Command { npm run build }
  Invoke-CheckedCommand -Label 'npm --prefix backend run build' -Command { npm --prefix backend run build }
} else {
  Write-Step 'Quick Mode'
  Write-Host 'Quick Deploy überspringt lokale Build-Schritte.' -ForegroundColor Yellow
}

Write-Step 'Version erhöhen'
Invoke-CheckedCommand -Label "node scripts/version-manager.mjs bump $VersionBump" -Command {
  node scripts/version-manager.mjs bump $VersionBump
}
$versionData = Get-VersionData
$nextVersion = $versionData.version
Write-Host "Neue Klarando-Version: $nextVersion" -ForegroundColor Green

$defaultCommitMessage = "release: klarando v$nextVersion ($Mode)"
$commitMessage = $defaultCommitMessage
if (-not $NonInteractive) {
  $inputMessage = (Read-Host "Commit-Message (Enter = '$defaultCommitMessage')").Trim()
  if (-not [string]::IsNullOrWhiteSpace($inputMessage)) {
    $commitMessage = $inputMessage
  }
}

$baseCommit = (git rev-parse --short HEAD).Trim()
Ensure-ReleaseNotes -Version $nextVersion -ModeName $Mode -CommitMessage $commitMessage -BaseCommit $baseCommit

Write-Step 'Git Commit erstellen'
Invoke-CheckedCommand -Label 'git add -A' -Command { git add -A }

$stagedChanges = git diff --cached --name-only
if ([string]::IsNullOrWhiteSpace(($stagedChanges -join ''))) {
  throw 'Es sind keine Änderungen zum Committen vorhanden.'
}

Invoke-CheckedCommand -Label "git commit -m '$commitMessage'" -Command { git commit -m $commitMessage }
$currentBranch = (git rev-parse --abbrev-ref HEAD).Trim()
$currentCommit = (git rev-parse --short HEAD).Trim()
Write-Host "Neuer Commit: $currentCommit auf Branch $currentBranch" -ForegroundColor Green

if (-not $SkipPush) {
  Write-Step 'Git Push'
  Invoke-CheckedCommand -Label "git push origin $currentBranch" -Command { git push origin $currentBranch }
} else {
  Write-Host 'Push wurde mit -SkipPush übersprungen.' -ForegroundColor Yellow
}

if ($SkipRemoteDeploy) {
  Write-Host 'Remote-Deploy wurde mit -SkipRemoteDeploy übersprungen.' -ForegroundColor Yellow
  exit 0
}

if ([string]::IsNullOrWhiteSpace($VpsHost) -or [string]::IsNullOrWhiteSpace($VpsProjectPath)) {
  throw 'VPS-Konfiguration unvollständig: Host oder Projektpfad fehlt.'
}

$remoteAppPath = if ($Mode -eq 'test') { $VpsProjectPathTest } else { $VpsProjectPath }
$publicHealthUrl = if ($Mode -eq 'test') { $PublicHealthUrlTest } else { $PublicHealthUrlLive }

Write-Step 'Remote Deploy auf VPS'
$remoteCommands = @(
  'set -euo pipefail',
  "cd $remoteAppPath",
  'if [ ! -f .env.production ]; then echo "FEHLER: .env.production fehlt"; exit 12; fi',
  'git pull --ff-only'
)

if (-not $SkipRemoteBackup) {
  $remoteCommands += 'if [ -f deploy/backup/postgres-backup.sh ]; then chmod +x deploy/backup/postgres-backup.sh && bash deploy/backup/postgres-backup.sh; else echo "WARN: Kein Backup-Script gefunden: deploy/backup/postgres-backup.sh"; fi'
}

$remoteCommands += @(
  'docker compose --env-file .env.production -f docker-compose.prod.yml up -d --build',
  'docker compose --env-file .env.production -f docker-compose.prod.yml ps',
  'echo "--- Healthcheck localhost/api/health ---"',
  'if command -v curl >/dev/null 2>&1; then curl -fsS http://localhost/api/health || curl -fsS http://localhost:4000/api/health; else wget -qO- http://localhost/api/health || wget -qO- http://localhost:4000/api/health; fi',
  'echo "--- Healthcheck public ---"',
  "if command -v curl >/dev/null 2>&1; then curl -fsS $publicHealthUrl; else wget -qO- $publicHealthUrl; fi"
)

$remoteScript = ($remoteCommands -join "`n")

$sshArgs = @('-p', $VpsPort.ToString())
if (-not [string]::IsNullOrWhiteSpace($SshKeyPath)) {
  $sshArgs += @('-i', $SshKeyPath)
}
$sshArgs += "$VpsUser@$VpsHost"
$sshArgs += 'bash -s'

$remoteScript | & ssh @sshArgs
if ($LASTEXITCODE -ne 0) {
  throw 'Remote Deploy via SSH fehlgeschlagen.'
}

Write-Host "`nDeploy erfolgreich abgeschlossen: Klarando v$nextVersion ($Mode)" -ForegroundColor Green
