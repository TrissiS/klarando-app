param(
  [int]$TimeoutMinutes = 25
)

$ErrorActionPreference = 'Stop'

$projectRoot = Split-Path -Parent $PSScriptRoot
$mobileDir = Join-Path $projectRoot 'mobile_flutter_app'
$logDir = Join-Path $projectRoot 'run-logs'
$flutterExe = 'C:\src\flutter\bin\flutter.bat'

if (-not (Test-Path $flutterExe)) {
  throw "Flutter nicht gefunden: $flutterExe"
}

New-Item -ItemType Directory -Force -Path $logDir | Out-Null
$stamp = Get-Date -Format 'yyyyMMdd-HHmmss'
$logFile = Join-Path $logDir "apk-orderdesk-$stamp.log"
$errFile = Join-Path $logDir "apk-orderdesk-$stamp.err.log"

Write-Host "[OrderDesk] Build startet ..." -ForegroundColor Cyan
$proc = Start-Process -FilePath $flutterExe -ArgumentList 'build','apk','--flavor','orderdesk','-t','lib/orderdesk_main.dart','--release' -WorkingDirectory $mobileDir -NoNewWindow -PassThru -RedirectStandardOutput $logFile -RedirectStandardError $errFile

$timeoutMs = $TimeoutMinutes * 60 * 1000
if (-not $proc.WaitForExit($timeoutMs)) {
  try { Stop-Process -Id $proc.Id -Force } catch {}
  throw "OrderDesk-Build Timeout nach $TimeoutMinutes Minuten. Logs: $logFile | $errFile"
}

if ($proc.ExitCode -ne 0) {
  throw "OrderDesk-Build fehlgeschlagen (ExitCode $($proc.ExitCode)). Logs: $logFile | $errFile"
}

Write-Host "[OrderDesk] Build erfolgreich. Log: $logFile" -ForegroundColor Green
Write-Host "APK: $mobileDir\build\app\outputs\flutter-apk\app-orderdesk-release.apk" -ForegroundColor Green
