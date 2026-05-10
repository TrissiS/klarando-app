param(
  [switch]$SkipLint,
  [switch]$SkipBackendTypecheck,
  [switch]$SkipRemoteDeploy,
  [switch]$ForceDeployWithoutChanges
)

$ErrorActionPreference = 'Stop'

# --- VPS Konfiguration (bitte anpassen) ---
$VpsHost = 'YOUR_VPS_IP_OR_HOSTNAME'
$VpsUser = 'root'
$VpsPort = 22
$VpsAppPath = '/opt/klarando-app'
$PublicHealthUrl = 'https://api.klarando.com/api/health'
$SshKeyPath = '' # optional, z.B. C:\Users\<YOU>\.ssh\id_ed25519

function Write-Step {
  param([string]$Message)
  Write-Host "`n=== $Message ===" -ForegroundColor Cyan
}

function Ask-YesNo {
  param(
    [string]$Question,
    [bool]$DefaultYes = $true
  )

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

if ($VpsHost -eq 'YOUR_VPS_IP_OR_HOSTNAME') {
  throw 'Bitte zuerst $VpsHost in scripts/deploy-to-vps.ps1 konfigurieren.'
}

$projectRoot = Split-Path -Parent $PSScriptRoot
Set-Location $projectRoot

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
  throw 'git wurde nicht gefunden.'
}
if (-not (Get-Command ssh -ErrorAction SilentlyContinue)) {
  throw 'ssh wurde nicht gefunden. Bitte OpenSSH Client installieren.'
}

Write-Step 'Git Status'
Invoke-CheckedCommand -Label 'git status --short --branch' -Command { git status --short --branch }

$changes = git status --porcelain
$hasChanges = -not [string]::IsNullOrWhiteSpace(($changes -join ''))

if ($hasChanges) {
  Write-Host 'Lokale Aenderungen gefunden.' -ForegroundColor Green

  if (-not $SkipLint) {
    if (Ask-YesNo -Question 'Frontend Typecheck (npm run lint) ausfuehren?' -DefaultYes $true) {
      Invoke-CheckedCommand -Label 'npm run lint' -Command { npm run lint }
    }
  }

  if (-not $SkipBackendTypecheck) {
    if (Ask-YesNo -Question 'Backend Typecheck (npm --prefix backend run typecheck) ausfuehren?' -DefaultYes $true) {
      Invoke-CheckedCommand -Label 'npm --prefix backend run typecheck' -Command { npm --prefix backend run typecheck }
    }
  }

  Invoke-CheckedCommand -Label 'git add -A' -Command { git add -A }

  $commitMessage = ''
  while ([string]::IsNullOrWhiteSpace($commitMessage)) {
    $commitMessage = (Read-Host 'Commit-Message eingeben').Trim()
    if ([string]::IsNullOrWhiteSpace($commitMessage)) {
      Write-Host 'Commit-Message darf nicht leer sein.' -ForegroundColor Yellow
    }
  }

  Invoke-CheckedCommand -Label "git commit -m \"$commitMessage\"" -Command { git commit -m $commitMessage }
} else {
  Write-Host 'Keine lokalen Aenderungen gefunden.' -ForegroundColor Yellow
  if (-not $ForceDeployWithoutChanges) {
    $continue = Ask-YesNo -Question 'Trotzdem push/deploy ohne neuen Commit fortsetzen?' -DefaultYes $false
    if (-not $continue) {
      Write-Host 'Abgebrochen.' -ForegroundColor Yellow
      exit 0
    }
  }
}

$currentBranch = (git rev-parse --abbrev-ref HEAD).Trim()
if ([string]::IsNullOrWhiteSpace($currentBranch)) {
  throw 'Konnte aktuellen Git-Branch nicht ermitteln.'
}

Write-Step 'Git Push'
Invoke-CheckedCommand -Label "git push origin $currentBranch" -Command { git push origin $currentBranch }

if ($SkipRemoteDeploy) {
  Write-Host 'Remote-Deploy wurde mit -SkipRemoteDeploy uebersprungen.' -ForegroundColor Yellow
  exit 0
}

Write-Step 'VPS Deploy via SSH'

$remoteCommands = @(
  'set -euo pipefail',
  "cd $VpsAppPath",
  'git pull --ff-only',
  'docker compose --env-file .env.production -f docker-compose.prod.yml up -d --build',
  'docker compose --env-file .env.production -f docker-compose.prod.yml ps',
  "echo '--- Healthcheck localhost:4000 ---'",
  "if command -v curl >/dev/null 2>&1; then curl -fsS http://localhost:4000/api/health || true; else wget -qO- http://localhost:4000/api/health || true; fi",
  "echo '--- Healthcheck public ---'",
  "if command -v curl >/dev/null 2>&1; then curl -fsS $PublicHealthUrl || true; else wget -qO- $PublicHealthUrl || true; fi"
)
$remoteCommand = $remoteCommands -join '; '

$sshArgs = @('-p', $VpsPort.ToString())
if (-not [string]::IsNullOrWhiteSpace($SshKeyPath)) {
  $sshArgs += @('-i', $SshKeyPath)
}
$sshArgs += "$VpsUser@$VpsHost"
$sshArgs += $remoteCommand

& ssh @sshArgs
if ($LASTEXITCODE -ne 0) {
  throw 'SSH Deploy fehlgeschlagen.'
}

Write-Host "`nDeploy abgeschlossen." -ForegroundColor Green
