param(
  [switch]$OpenBrowsers
)

$ErrorActionPreference = "Stop"

$scriptDir = $PSScriptRoot
$startScript = Join-Path $scriptDir "start-klarando-all.ps1"
$stopScript = Join-Path $scriptDir "stop-klarando-all.ps1"

function Get-ListeningProcessId {
  param([int]$Port)

  $line = netstat -ano -p tcp |
    Select-String -Pattern (":{0}\s+.*(LISTENING|ABH)" -f $Port) |
    Select-Object -First 1
  if ($null -eq $line) {
    return $null
  }

  $parts = ($line.ToString() -split "\s+") | Where-Object { $_ -ne "" }
  if ($parts.Count -gt 0) {
    return [int]$parts[$parts.Count - 1]
  }

  return $null
}

if (-not (Test-Path $startScript)) {
  Write-Host "Start-Script nicht gefunden: $startScript" -ForegroundColor Red
  exit 1
}

if (-not (Test-Path $stopScript)) {
  Write-Host "Stop-Script nicht gefunden: $stopScript" -ForegroundColor Red
  exit 1
}

$ports = @(3000, 4000, 58520, 58521)
$running = $false

foreach ($port in $ports) {
  if ($null -ne (Get-ListeningProcessId -Port $port)) {
    $running = $true
    break
  }
}

if ($running) {
  Write-Host "Klarando laeuft bereits. Stoppe alle Server..." -ForegroundColor Yellow
  & $stopScript
  Write-Host "Alle Klarando-Server wurden gestoppt." -ForegroundColor Green
  exit 0
}

Write-Host "Klarando ist gestoppt. Starte alle Server mit aktuellen Daten..." -ForegroundColor Yellow

$startParams = @{}
if ($OpenBrowsers) {
  $startParams.OpenBrowsers = $true
}

& $startScript @startParams
exit $LASTEXITCODE
