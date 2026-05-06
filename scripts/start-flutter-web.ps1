param(
  [int]$Port = 58520,
  [int]$StartupTimeoutSeconds = 90
)

$ErrorActionPreference = "Stop"

$projectDir = "C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app\mobile_flutter_app"
$flutterBat = "C:\src\flutter\bin\flutter.bat"
$timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
$logFile = "C:\Users\Tristan Stenger\Documents\New project\flutter-web-$timestamp.log"
$errFile = "C:\Users\Tristan Stenger\Documents\New project\flutter-web-$timestamp.err.log"

if (-not (Test-Path $flutterBat)) {
  Write-Host "Flutter nicht gefunden: $flutterBat" -ForegroundColor Red
  exit 1
}

Get-Process dart,flutter -ErrorAction SilentlyContinue | Stop-Process -Force

$process = Start-Process -FilePath $flutterBat `
  -ArgumentList "run","-d","web-server","--web-hostname","localhost","--web-port",$Port,"--no-pub" `
  -WorkingDirectory $projectDir `
  -RedirectStandardOutput $logFile `
  -RedirectStandardError $errFile `
  -PassThru

Write-Host "Flutter-Start wurde ausgeloest (PID $($process.Id)). Pruefe Verfuegbarkeit..." -ForegroundColor Yellow

$deadline = (Get-Date).AddSeconds($StartupTimeoutSeconds)
$isReady = $false

while ((Get-Date) -lt $deadline) {
  if ($process.HasExited) {
    Write-Host "Flutter-Prozess wurde beendet (ExitCode $($process.ExitCode))." -ForegroundColor Red
    break
  }

  try {
    $response = Invoke-WebRequest -Uri "http://localhost:$Port" -UseBasicParsing -TimeoutSec 3
    if ($response.StatusCode -ge 200 -and $response.StatusCode -lt 500) {
      $isReady = $true
      break
    }
  } catch {
    # Noch nicht bereit.
  }

  Start-Sleep -Milliseconds 1200
}

if ($isReady) {
  Write-Host "Flutter Web laeuft stabil auf http://localhost:$Port" -ForegroundColor Green
  Write-Host "Log: $logFile"
  Write-Host "Err: $errFile"
  exit 0
}

if (-not $process.HasExited) {
  Write-Host "Flutter startet noch im Hintergrund (Timeout nach $StartupTimeoutSeconds Sekunden)." -ForegroundColor Yellow
  Write-Host "Bitte 10-30 Sekunden warten und Seite neu laden: http://localhost:$Port"
  Write-Host "Log: $logFile"
  Write-Host "Err: $errFile"
  exit 0
}

Write-Host "Flutter-Prozess wurde beendet (ExitCode $($process.ExitCode))." -ForegroundColor Red
Write-Host "Fehlerlog (letzte 40 Zeilen):" -ForegroundColor Red
if (Test-Path $errFile) {
  Get-Content $errFile -Tail 40
}
Write-Host "Standardlog (letzte 40 Zeilen):" -ForegroundColor Yellow
if (Test-Path $logFile) {
  Get-Content $logFile -Tail 40
}

exit 1
