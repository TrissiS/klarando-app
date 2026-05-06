param(
  [switch]$OpenBrowsers,
  [switch]$UseDevFrontend,
  [switch]$IncludeFrontend
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

function Get-ListeningProcessId {
  param([int]$Port)
  $line = netstat -ano -p tcp | Select-String -Pattern (":{0}\s+.*LISTENING" -f $Port) | Select-Object -First 1
  if ($null -eq $line) {
    return $null
  }
  $parts = ($line.ToString() -split "\s+") | Where-Object { $_ -ne "" }
  if ($parts.Count -gt 0) {
    return [int]$parts[$parts.Count - 1]
  }
  return $null
}

function Stop-PortProcess {
  param([int]$Port)
  $pidOnPort = Get-ListeningProcessId -Port $Port
  if ($null -ne $pidOnPort) {
    Stop-Process -Id $pidOnPort -Force -ErrorAction SilentlyContinue
    Write-Host ("Port {0} freigegeben (PID {1})." -f $Port, $pidOnPort) -ForegroundColor Yellow
  }
}

function Test-PrivateIPv4 {
  param([string]$Ip)
  if ($Ip -match "^10\.") { return $true }
  if ($Ip -match "^192\.168\.") { return $true }
  if ($Ip -match "^172\.(1[6-9]|2[0-9]|3[0-1])\.") { return $true }
  return $false
}

function Get-LocalIPv4 {
  $addresses = [System.Net.Dns]::GetHostAddresses([System.Net.Dns]::GetHostName()) |
    Where-Object {
      $_.AddressFamily -eq [System.Net.Sockets.AddressFamily]::InterNetwork -and
      -not $_.IsIPv6LinkLocal
    } |
    ForEach-Object { $_.IPAddressToString } |
    Where-Object { $_ -ne "127.0.0.1" -and $_ -notmatch "^169\.254\." } |
    Select-Object -Unique

  $privateIp = $addresses | Where-Object { Test-PrivateIPv4 $_ } | Select-Object -First 1
  if ($privateIp) {
    return $privateIp
  }
  return ($addresses | Select-Object -First 1)
}

if (-not (Test-Path $projectRoot)) { throw "Projektpfad nicht gefunden: $projectRoot" }
if (-not (Test-Path $mobileProjectDir)) { throw "Mobile-Projekt nicht gefunden: $mobileProjectDir" }
if (-not (Test-Path $flutterBat)) { throw "Flutter nicht gefunden: $flutterBat" }
if (-not (Test-Path $npmCmd)) { throw "npm nicht gefunden: $npmCmd" }
if (-not (Test-Path $cmdExe)) { throw "cmd.exe nicht gefunden: $cmdExe" }
if (-not (Test-Path $logsDir)) {
  New-Item -ItemType Directory -Path $logsDir -Force | Out-Null
}

$customerPort = 58520
$driverPort = 58521
$cashierPort = 58522
$backendPort = 4000

Write-Host "Bereinige Klarando-Ports..." -ForegroundColor Yellow
Stop-PortProcess -Port $backendPort
Stop-PortProcess -Port $customerPort
Stop-PortProcess -Port $driverPort
Stop-PortProcess -Port $cashierPort
if ($IncludeFrontend) {
  Stop-PortProcess -Port 3000
}

$backendLog = Join-Path $logsDir "$timestamp-backend-mobile.log"
$backendErr = Join-Path $logsDir "$timestamp-backend-mobile.err.log"
$customerLog = Join-Path $logsDir "$timestamp-customer-mobile.log"
$customerErr = Join-Path $logsDir "$timestamp-customer-mobile.err.log"
$driverLog = Join-Path $logsDir "$timestamp-driver-mobile.log"
$driverErr = Join-Path $logsDir "$timestamp-driver-mobile.err.log"
$cashierLog = Join-Path $logsDir "$timestamp-cashier-mobile.log"
$cashierErr = Join-Path $logsDir "$timestamp-cashier-mobile.err.log"
$frontendLog = Join-Path $logsDir "$timestamp-frontend-mobile.log"
$frontendErr = Join-Path $logsDir "$timestamp-frontend-mobile.err.log"

$backendCmd = "cd /d `"$projectRoot`" && `"$npmCmd`" run dev:backend 1>>`"$backendLog`" 2>>`"$backendErr`""
$customerCmd = "cd /d `"$mobileProjectDir`" && `"$flutterBat`" run -d web-server --web-hostname 0.0.0.0 --web-port $customerPort --no-pub 1>>`"$customerLog`" 2>>`"$customerErr`""
$driverCmd = "cd /d `"$mobileProjectDir`" && `"$flutterBat`" run -d web-server --web-hostname 0.0.0.0 --web-port $driverPort --target lib/driver_main.dart --no-pub 1>>`"$driverLog`" 2>>`"$driverErr`""
$cashierCmd = "cd /d `"$mobileProjectDir`" && `"$flutterBat`" run -d web-server --web-hostname 0.0.0.0 --web-port $cashierPort --target lib/cash_main.dart --no-pub 1>>`"$cashierLog`" 2>>`"$cashierErr`""

Start-Process -FilePath $cmdExe -ArgumentList "/c", $backendCmd -WindowStyle Hidden | Out-Null
Start-Process -FilePath $cmdExe -ArgumentList "/c", $customerCmd -WindowStyle Hidden | Out-Null
Start-Process -FilePath $cmdExe -ArgumentList "/c", $driverCmd -WindowStyle Hidden | Out-Null
Start-Process -FilePath $cmdExe -ArgumentList "/c", $cashierCmd -WindowStyle Hidden | Out-Null

if ($IncludeFrontend) {
  $frontendScript = if ($UseDevFrontend) { "dev" } else { "start" }
  $frontendCmd = "cd /d `"$projectRoot`" && `"$npmCmd`" run $frontendScript 1>>`"$frontendLog`" 2>>`"$frontendErr`""
  Start-Process -FilePath $cmdExe -ArgumentList "/c", $frontendCmd -WindowStyle Hidden | Out-Null
}

Start-Sleep -Seconds 2

$localIp = Get-LocalIPv4
if (-not $localIp) {
  Write-Host "Keine lokale IPv4 gefunden. Nutze 'ipconfig' und trage die IP manuell ein." -ForegroundColor Red
  exit 1
}

$customerUrl = "http://${localIp}:${customerPort}"
$driverUrl = "http://${localIp}:${driverPort}"
$cashierUrl = "http://${localIp}:${cashierPort}"
$backendUrl = "http://${localIp}:${backendPort}"

if ($OpenBrowsers) {
  Start-Process "http://localhost:$customerPort"
  Start-Process "http://localhost:$driverPort"
  Start-Process "http://localhost:$cashierPort"
  if ($IncludeFrontend) {
    Start-Process "http://localhost:3000"
  }
}

Write-Host ""
Write-Host "Klarando Mobile LAN-Start ist gestartet." -ForegroundColor Green
Write-Host "Handy und PC muessen im selben WLAN sein."
Write-Host ""
Write-Host ("Kunden-App am Handy:  {0}" -f $customerUrl) -ForegroundColor Cyan
Write-Host ("Fahrer-App am Handy:  {0}" -f $driverUrl) -ForegroundColor Cyan
Write-Host ("OrderDesk am Handy:   {0}" -f $cashierUrl) -ForegroundColor Cyan
Write-Host ("Backend-URL in App:   {0}" -f $backendUrl) -ForegroundColor Cyan
if ($IncludeFrontend) {
  Write-Host "Dashboard lokal:      http://localhost:3000" -ForegroundColor Cyan
}
Write-Host ""
Write-Host ("Logs: {0}" -f $logsDir) -ForegroundColor Yellow
exit 0
