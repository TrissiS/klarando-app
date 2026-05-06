param(
  [switch]$OpenBrowsers,
  [switch]$UseDevFrontend
)

$ErrorActionPreference = "Stop"

$scriptDir = $PSScriptRoot
$projectRoot = Split-Path -Parent $scriptDir
$mobileProjectDir = Join-Path $projectRoot "mobile_flutter_app"
$logsDir = Join-Path $projectRoot "run-logs"
$timestamp = Get-Date -Format "yyyyMMdd-HHmmss"

$flutterBat = "C:\src\flutter\bin\flutter.bat"
$npmCmd = "C:\Program Files\nodejs\npm.cmd"
$cmdExe = "C:\Windows\System32\cmd.exe"

if (-not (Test-Path $logsDir)) {
  New-Item -ItemType Directory -Path $logsDir -Force | Out-Null
}

if (-not (Test-Path $projectRoot)) { throw "Projektpfad nicht gefunden: $projectRoot" }
if (-not (Test-Path $mobileProjectDir)) { throw "Mobile-Projekt nicht gefunden: $mobileProjectDir" }
if (-not (Test-Path $flutterBat)) { throw "Flutter nicht gefunden: $flutterBat" }
if (-not (Test-Path $npmCmd)) { throw "npm nicht gefunden: $npmCmd" }
if (-not (Test-Path $cmdExe)) { throw "cmd.exe nicht gefunden: $cmdExe" }

$frontendScript = if ($UseDevFrontend) { "dev" } else { "start" }

$backendLog = Join-Path $logsDir "$timestamp-backend-quick.log"
$backendErr = Join-Path $logsDir "$timestamp-backend-quick.err.log"
$frontendLog = Join-Path $logsDir "$timestamp-frontend-quick.log"
$frontendErr = Join-Path $logsDir "$timestamp-frontend-quick.err.log"
$appLog = Join-Path $logsDir "$timestamp-app-58520-quick.log"
$appErr = Join-Path $logsDir "$timestamp-app-58520-quick.err.log"
$driverLog = Join-Path $logsDir "$timestamp-driver-58521-quick.log"
$driverErr = Join-Path $logsDir "$timestamp-driver-58521-quick.err.log"
$cashierLog = Join-Path $logsDir "$timestamp-cashier-58522-quick.log"
$cashierErr = Join-Path $logsDir "$timestamp-cashier-58522-quick.err.log"

$backendCmd = "cd /d `"$projectRoot`" && `"$npmCmd`" run dev:backend 1>>`"$backendLog`" 2>>`"$backendErr`""
$frontendCmd = "cd /d `"$projectRoot`" && `"$npmCmd`" run $frontendScript 1>>`"$frontendLog`" 2>>`"$frontendErr`""
$appCmd = "cd /d `"$mobileProjectDir`" && `"$flutterBat`" run -d web-server --web-hostname localhost --web-port 58520 --no-pub 1>>`"$appLog`" 2>>`"$appErr`""
$driverCmd = "cd /d `"$mobileProjectDir`" && `"$flutterBat`" run -d web-server --web-hostname localhost --web-port 58521 --target lib/driver_main.dart --no-pub 1>>`"$driverLog`" 2>>`"$driverErr`""
$cashierCmd = "cd /d `"$mobileProjectDir`" && `"$flutterBat`" run -d web-server --web-hostname localhost --web-port 58522 --target lib/cash_main.dart --no-pub 1>>`"$cashierLog`" 2>>`"$cashierErr`""

Start-Process -FilePath $cmdExe -ArgumentList "/c", $backendCmd -WindowStyle Hidden | Out-Null
Start-Process -FilePath $cmdExe -ArgumentList "/c", $frontendCmd -WindowStyle Hidden | Out-Null
Start-Process -FilePath $cmdExe -ArgumentList "/c", $appCmd -WindowStyle Hidden | Out-Null
Start-Process -FilePath $cmdExe -ArgumentList "/c", $driverCmd -WindowStyle Hidden | Out-Null
Start-Process -FilePath $cmdExe -ArgumentList "/c", $cashierCmd -WindowStyle Hidden | Out-Null

if ($OpenBrowsers) {
  Start-Sleep -Seconds 3
  Start-Process "http://localhost:3000"
  Start-Process "http://localhost:58520"
  Start-Process "http://localhost:58521"
  Start-Process "http://localhost:58522"
}

Write-Host "Klarando Schnellstart ausgelost (nicht blockierend)." -ForegroundColor Green
Write-Host "Frontend-Modus: $frontendScript"
Write-Host "Dashboard: http://localhost:3000"
Write-Host "App:       http://localhost:58520"
Write-Host "Driver:    http://localhost:58521"
Write-Host "OrderDesk: http://localhost:58522"
Write-Host "Logs: $logsDir"
exit 0
