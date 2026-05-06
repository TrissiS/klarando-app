param(
  [switch]$UseDevFrontend,
  [switch]$OpenBrowser
)

$ErrorActionPreference = "SilentlyContinue"

$projectRoot = Split-Path -Parent $PSScriptRoot
$npmPath = "C:\Program Files\nodejs\npm.cmd"
if (-not (Test-Path $npmPath)) {
  $npmPath = "npm"
}

function Stop-ByName {
  param([string]$Name)
  Get-Process -Name $Name | Stop-Process -Force
}

function Wait-Url {
  param(
    [string]$Url,
    [int]$TimeoutSeconds = 45
  )

  $start = Get-Date
  while (((Get-Date) - $start).TotalSeconds -lt $TimeoutSeconds) {
    try {
      $response = Invoke-WebRequest -UseBasicParsing -Uri $Url -TimeoutSec 3
      if ($response.StatusCode -ge 200 -and $response.StatusCode -lt 500) {
        return $true
      }
    } catch {}
    Start-Sleep -Milliseconds 800
  }
  return $false
}

Write-Host "Stoppe alte Prozesse..." -ForegroundColor Yellow
Stop-ByName node
Stop-ByName dart
Stop-ByName flutter

$frontendScript = if ($UseDevFrontend) { "dev" } else { "start" }

Write-Host "Starte Backend..." -ForegroundColor Cyan
Start-Process -WindowStyle Hidden -FilePath "C:\Windows\System32\cmd.exe" -ArgumentList "/c", "cd /d `"$projectRoot`" && `"$npmPath`" run dev:backend"

Write-Host "Starte Frontend ($frontendScript)..." -ForegroundColor Cyan
Start-Process -WindowStyle Hidden -FilePath "C:\Windows\System32\cmd.exe" -ArgumentList "/c", "cd /d `"$projectRoot`" && `"$npmPath`" run $frontendScript"

$backendOk = Wait-Url -Url "http://localhost:4000/api/health" -TimeoutSeconds 90
$frontendOk = Wait-Url -Url "http://localhost:3000/api/health" -TimeoutSeconds 180

Write-Host ("Backend:  " + ($(if ($backendOk) { "OK" } else { "NICHT ERREICHBAR" })))
Write-Host ("Frontend: " + ($(if ($frontendOk) { "OK" } else { "NICHT ERREICHBAR" })))

if ($OpenBrowser -and $frontendOk) {
  Start-Process "http://localhost:3000"
}

if (-not ($backendOk -and $frontendOk)) {
  Write-Host "Hinweis: Ein Dienst startet noch im Hintergrund. Bitte nach 10-30 Sekunden erneut pruefen." -ForegroundColor Yellow
  exit 0
}

exit 0
