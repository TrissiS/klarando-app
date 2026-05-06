param(
  [int]$Port = 58522
)

$ErrorActionPreference = "Stop"

$scriptDir = $PSScriptRoot
$projectRoot = Split-Path -Parent $scriptDir
$mobileProjectDir = Join-Path $projectRoot "mobile_flutter_app"
$flutterBat = "C:\src\flutter\bin\flutter.bat"
$cmdExe = "C:\Windows\System32\cmd.exe"

if (-not (Test-Path $mobileProjectDir)) { throw "Mobile-Projekt nicht gefunden: $mobileProjectDir" }
if (-not (Test-Path $flutterBat)) { throw "Flutter nicht gefunden: $flutterBat" }
if (-not (Test-Path $cmdExe)) { throw "cmd.exe nicht gefunden: $cmdExe" }

$timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
$logsDir = Join-Path $projectRoot "run-logs"
if (-not (Test-Path $logsDir)) {
  New-Item -ItemType Directory -Path $logsDir -Force | Out-Null
}
$cashierLog = Join-Path $logsDir "$timestamp-cashier-web.log"
$cashierErr = Join-Path $logsDir "$timestamp-cashier-web.err.log"

$line = netstat -ano -p tcp | Select-String -Pattern (":{0}\s+.*LISTENING" -f $Port) | Select-Object -First 1
if ($null -ne $line) {
  $parts = ($line.ToString() -split "\s+") | Where-Object { $_ -ne "" }
  if ($parts.Count -gt 0) {
    $pidOnPort = [int]$parts[$parts.Count - 1]
    Stop-Process -Id $pidOnPort -Force -ErrorAction SilentlyContinue
    Write-Host ("Port {0} freigegeben (PID {1})." -f $Port, $pidOnPort) -ForegroundColor Yellow
  }
}

$cashierCmd = "cd /d `"$mobileProjectDir`" && `"$flutterBat`" run -d web-server --web-hostname localhost --web-port $Port --target lib/cash_main.dart --no-pub 1>>`"$cashierLog`" 2>>`"$cashierErr`""
Start-Process -FilePath $cmdExe -ArgumentList "/c", $cashierCmd -WindowStyle Hidden | Out-Null

Start-Sleep -Seconds 2
Start-Process "http://localhost:$Port"

Write-Host "Klarando OrderDesk Start ausgelost." -ForegroundColor Green
Write-Host ("OrderDesk: http://localhost:{0}" -f $Port)
Write-Host ("Logs: {0}" -f $logsDir)
exit 0
