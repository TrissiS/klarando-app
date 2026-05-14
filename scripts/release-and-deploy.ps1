$ErrorActionPreference = "Stop"

Set-StrictMode -Version Latest

$RepoRoot = "C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app"
$VpsHost = "root@31.70.76.55"
$VpsAppDir = "/opt/klarando-app"
$ComposeCmd = "docker compose --env-file .env.production -f docker-compose.prod.yml"

function Invoke-Step {
  param(
    [Parameter(Mandatory = $true)][string]$Title,
    [Parameter(Mandatory = $true)][scriptblock]$Action
  )
  Write-Host ""
  Write-Host "=== $Title ===" -ForegroundColor Cyan
  & $Action
}

Set-Location $RepoRoot

$releaseName = Read-Host "Release-Name eingeben (z. B. Pilot Fix)"
if ([string]::IsNullOrWhiteSpace($releaseName)) {
  throw "Release-Name darf nicht leer sein."
}

$confirm = Read-Host "Wirklich LIVE deployen? (Ja/Nein)"
if ($confirm -notin @("Ja", "ja", "J", "j")) {
  Write-Host "Abgebrochen durch Benutzer." -ForegroundColor Yellow
  exit 0
}

Invoke-Step -Title "Version erhöhen" -Action {
  npm run bump:version -- --releaseName "$releaseName"
}

Invoke-Step -Title "Env-Safety Check" -Action {
  npm run check:env-safety
}

Invoke-Step -Title "Backend Typecheck" -Action {
  npm --prefix backend run typecheck
}

Invoke-Step -Title "Lint" -Action {
  npm run lint
}

Invoke-Step -Title "Web Build" -Action {
  npm run build
}

Invoke-Step -Title "Git Status" -Action {
  git status
}

$versionJsonRaw = Get-Content -Path (Join-Path $RepoRoot "VERSION.json") -Raw
$versionData = $versionJsonRaw | ConvertFrom-Json
$version = [string]$versionData.version
if ([string]::IsNullOrWhiteSpace($version)) {
  throw "VERSION.json enthält keine gültige Version."
}

Invoke-Step -Title "Commit erstellen" -Action {
  git add .
  git commit -m "Release Klarando v$version"
}

Invoke-Step -Title "Push nach GitHub" -Action {
  git push origin main
}

$remoteScript = @"
set -euo pipefail
cd $VpsAppDir
git fetch origin
git reset --hard origin/main
$ComposeCmd up -d --build
$ComposeCmd ps
curl -fsS http://localhost/api/version
curl -fsS http://localhost/api/health
"@

Invoke-Step -Title "VPS Deploy + Healthcheck" -Action {
  ssh $VpsHost $remoteScript
}

Write-Host ""
Write-Host "Deploy erfolgreich: Klarando v$version ($releaseName)" -ForegroundColor Green
