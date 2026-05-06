param(
  [switch]$OpenBrowsers,
  [switch]$UseProductionFrontend,
  [switch]$WaitForHealth,
  [bool]$WindowedStart = $true,
  [int]$StartupTimeoutSeconds = 75
)

$ErrorActionPreference = "Stop"

$scriptDir = $PSScriptRoot
$projectRoot = Split-Path -Parent $scriptDir
$mobileProjectDir = Join-Path $projectRoot "mobile_flutter_app"

$flutterBat = "C:\src\flutter\bin\flutter.bat"
$npmCmd = "C:\Program Files\nodejs\npm.cmd"

function Write-Step {
  param(
    [string]$Text,
    [ConsoleColor]$Color = [ConsoleColor]::Cyan
  )
  Write-Host $Text -ForegroundColor $Color
}

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

function Stop-PortProcess {
  param([int]$Port)

  $pidOnPort = Get-ListeningProcessId -Port $Port
  if ($null -ne $pidOnPort) {
    $null = taskkill /PID $pidOnPort /T /F 2>$null
    Start-Sleep -Milliseconds 250
    Write-Step ("Port {0} freigegeben (Prozessbaum PID {1})." -f $Port, $pidOnPort) Yellow
  }
}

function Stop-KlarandoProcesses {
  Write-Step "Bereinige nur Klarando-Ports (schneller Modus)." Yellow
  Stop-PortProcess -Port 3000
  Stop-PortProcess -Port 4000
  Stop-PortProcess -Port 58520
  Stop-PortProcess -Port 58521
  Stop-PortProcess -Port 58522
}

function Start-InTerminalWindow {
  param(
    [string]$Title,
    [string]$WorkingDirectory,
    [string]$Command
  )

  $escapedWd = $WorkingDirectory.Replace("'", "''")
  $fullCommand = @"
Set-Location -LiteralPath '$escapedWd'
$Command
"@

  Start-Process -FilePath "powershell.exe" -ArgumentList @(
    "-NoExit",
    "-ExecutionPolicy", "Bypass",
    "-Command", $fullCommand
  ) | Out-Null
}

function Start-ServiceProcess {
  param(
    [string]$Name,
    [string]$FilePath,
    [string[]]$CommandArgs,
    [string]$WorkingDirectory
  )

  $proc = Start-Process `
    -FilePath $FilePath `
    -ArgumentList $CommandArgs `
    -WorkingDirectory $WorkingDirectory `
    -PassThru

  return [pscustomobject]@{
    Name = $Name
    Process = $proc
  }
}

function Wait-ServiceReady {
  param(
    [string]$Name,
    [string]$Url,
    [int]$Port,
    [System.Diagnostics.Process]$Process,
    [int]$TimeoutSeconds
  )

  $deadline = (Get-Date).AddSeconds($TimeoutSeconds)
  $nextProgressAt = (Get-Date).AddSeconds(5)
  while ((Get-Date) -lt $deadline) {
    if ($null -ne $script:hardDeadline -and (Get-Date) -gt $script:hardDeadline) {
      return [pscustomobject]@{
        Ok = $false
        Message = "Gesamt-Timeout erreicht (3 Minuten)."
      }
    }

    if ($Process.HasExited) {
      return [pscustomobject]@{
        Ok = $false
        Message = ("{0} beendet (ExitCode {1})." -f $Name, $Process.ExitCode)
      }
    }

    try {
      $response = Invoke-WebRequest -UseBasicParsing -Uri $Url -TimeoutSec 3
      if ($response.StatusCode -ge 200 -and $response.StatusCode -lt 500) {
        return [pscustomobject]@{ Ok = $true; Message = "$Name laeuft." }
      }
    } catch {}

    if ((Get-Date) -ge $nextProgressAt) {
      $remaining = [Math]::Max(0, [int][Math]::Ceiling(($deadline - (Get-Date)).TotalSeconds))
      Write-Step ("Warte auf {0}... noch ca. {1}s" -f $Name, $remaining) DarkYellow
      $nextProgressAt = (Get-Date).AddSeconds(5)
    }

    Start-Sleep -Milliseconds 900
  }

  if ($null -ne (Get-ListeningProcessId -Port $Port)) {
    return [pscustomobject]@{ Ok = $true; Message = "$Name antwortet verzoegert, Port ist offen." }
  }

  return [pscustomobject]@{
    Ok = $false
    Message = ("Timeout bei {0} ({1}s)." -f $Name, $TimeoutSeconds)
  }
}

if (-not (Test-Path $projectRoot)) {
  Write-Step ("Projektpfad nicht gefunden: {0}" -f $projectRoot) Red
  exit 1
}

if (-not (Test-Path $mobileProjectDir)) {
  Write-Step ("Mobile-Projekt nicht gefunden: {0}" -f $mobileProjectDir) Red
  exit 1
}

if (-not (Test-Path $flutterBat)) {
  Write-Step ("Flutter nicht gefunden: {0}" -f $flutterBat) Red
  exit 1
}

if (-not (Test-Path $npmCmd)) {
  Write-Step ("npm nicht gefunden: {0}" -f $npmCmd) Red
  exit 1
}

$frontendScript = if ($UseProductionFrontend) { "start" } else { "dev" }
$script:hardDeadline = (Get-Date).AddMinutes(3)

Write-Step "Stoppe alte Klarando-Prozesse..." Yellow
Stop-KlarandoProcesses

if ($WindowedStart -and -not $WaitForHealth) {
  Write-Step "Starte Dienste in separaten Fenstern (stabiler Modus)..." Yellow
  Start-InTerminalWindow -Title "Klarando Backend" -WorkingDirectory $projectRoot -Command "& '$npmCmd' run dev:backend"
  Start-InTerminalWindow -Title "Klarando Frontend" -WorkingDirectory $projectRoot -Command "& '$npmCmd' run $frontendScript"
  Start-InTerminalWindow -Title "Klarando Kunden-App" -WorkingDirectory $mobileProjectDir -Command "& '$flutterBat' run -d web-server --web-hostname 0.0.0.0 --web-port 58520 --no-pub"
  Start-InTerminalWindow -Title "Klarando Fahrer-App" -WorkingDirectory $mobileProjectDir -Command "& '$flutterBat' run -d web-server --web-hostname 0.0.0.0 --web-port 58521 --target lib/driver_main.dart --no-pub"
  Start-InTerminalWindow -Title "Klarando OrderDesk" -WorkingDirectory $mobileProjectDir -Command "& '$flutterBat' run -d web-server --web-hostname 0.0.0.0 --web-port 58522 --target lib/cash_main.dart --no-pub"

  if ($OpenBrowsers) {
    Start-Process "http://localhost:3000"
    Start-Process "http://localhost:58520"
    Start-Process "http://localhost:58521"
    Start-Process "http://localhost:58522"
  }

  Write-Host ""
  Write-Step "Klarando wurde gestartet (Fenster-Modus)." Green
  Write-Host "Dashboard: http://localhost:3000"
  Write-Host "App:       http://localhost:58520"
  Write-Host "Driver:    http://localhost:58521"
  Write-Host "OrderDesk: http://localhost:58522"
  exit 0
}

$services = @()

Write-Step "Starte Backend..."
$backend = Start-ServiceProcess -Name "backend" -FilePath $npmCmd -CommandArgs @("run", "dev:backend") -WorkingDirectory $projectRoot
$services += $backend
if ($WaitForHealth) {
  $backendCheck = Wait-ServiceReady -Name "Backend" -Url "http://localhost:4000/api/health" -Port 4000 -Process $backend.Process -TimeoutSeconds $StartupTimeoutSeconds
  if (-not $backendCheck.Ok) {
    Write-Step $backendCheck.Message Red
    exit 1
  }
  Write-Step $backendCheck.Message Green
} else {
  Write-Step "Backend gestartet (Schnellstart, ohne Wartepruefung)." Green
}

Write-Step ("Starte Frontend ({0})..." -f $frontendScript)
$frontendTimeout = if ($frontendScript -eq "dev") { [Math]::Max(45, $StartupTimeoutSeconds + 15) } else { $StartupTimeoutSeconds }
$frontend = Start-ServiceProcess -Name "frontend" -FilePath $npmCmd -CommandArgs @("run", $frontendScript) -WorkingDirectory $projectRoot
$services += $frontend
if ($WaitForHealth) {
  $frontendCheck = Wait-ServiceReady -Name "Frontend" -Url "http://localhost:3000/api/health" -Port 3000 -Process $frontend.Process -TimeoutSeconds $frontendTimeout
  if (-not $frontendCheck.Ok -and $frontendScript -eq "dev") {
    Write-Step "Frontend-Dev nicht bereit. Fallback auf Start-Modus..." Yellow
    $frontend = Start-ServiceProcess -Name "frontend-start" -FilePath $npmCmd -CommandArgs @("run", "start") -WorkingDirectory $projectRoot
    $services += $frontend
    $frontendCheck = Wait-ServiceReady -Name "Frontend (start)" -Url "http://localhost:3000/api/health" -Port 3000 -Process $frontend.Process -TimeoutSeconds $StartupTimeoutSeconds
  }
  if (-not $frontendCheck.Ok) {
    Write-Step $frontendCheck.Message Red
    exit 1
  }
  Write-Step $frontendCheck.Message Green
} else {
  Write-Step "Frontend gestartet (Schnellstart, ohne Wartepruefung)." Green
}

Write-Step "Starte Kunden-App (58520)..."
$customer = Start-ServiceProcess `
  -Name "app-customer" `
  -FilePath $flutterBat `
  -CommandArgs @("run", "-d", "web-server", "--web-hostname", "0.0.0.0", "--web-port", "58520", "--no-pub") `
  -WorkingDirectory $mobileProjectDir
$services += $customer
if ($WaitForHealth) {
  $customerCheck = Wait-ServiceReady -Name "Kunden-App" -Url "http://localhost:58520" -Port 58520 -Process $customer.Process -TimeoutSeconds $StartupTimeoutSeconds
  if (-not $customerCheck.Ok) {
    Write-Step $customerCheck.Message Red
    exit 1
  }
  Write-Step $customerCheck.Message Green
} else {
  Write-Step "Kunden-App gestartet (Schnellstart, ohne Wartepruefung)." Green
}

Write-Step "Starte Fahrer-App (58521)..."
$driver = Start-ServiceProcess `
  -Name "app-driver" `
  -FilePath $flutterBat `
  -CommandArgs @("run", "-d", "web-server", "--web-hostname", "0.0.0.0", "--web-port", "58521", "--target", "lib/driver_main.dart", "--no-pub") `
  -WorkingDirectory $mobileProjectDir
$services += $driver
if ($WaitForHealth) {
  $driverCheck = Wait-ServiceReady -Name "Fahrer-App" -Url "http://localhost:58521" -Port 58521 -Process $driver.Process -TimeoutSeconds $StartupTimeoutSeconds
  if (-not $driverCheck.Ok) {
    Write-Step $driverCheck.Message Red
    exit 1
  }
  Write-Step $driverCheck.Message Green
} else {
  Write-Step "Fahrer-App gestartet (Schnellstart, ohne Wartepruefung)." Green
}

Write-Step "Starte Klarando OrderDesk (58522)..."
$cashier = Start-ServiceProcess `
  -Name "app-cashier" `
  -FilePath $flutterBat `
  -CommandArgs @("run", "-d", "web-server", "--web-hostname", "0.0.0.0", "--web-port", "58522", "--target", "lib/cash_main.dart", "--no-pub") `
  -WorkingDirectory $mobileProjectDir
$services += $cashier
if ($WaitForHealth) {
  $cashierCheck = Wait-ServiceReady -Name "Klarando OrderDesk" -Url "http://localhost:58522" -Port 58522 -Process $cashier.Process -TimeoutSeconds $StartupTimeoutSeconds
  if (-not $cashierCheck.Ok) {
    Write-Step $cashierCheck.Message Red
    exit 1
  }
  Write-Step $cashierCheck.Message Green
} else {
  Write-Step "Klarando OrderDesk gestartet (Schnellstart, ohne Wartepruefung)." Green
}

if ($OpenBrowsers) {
  Start-Process "http://localhost:3000"
  Start-Process "http://localhost:58520"
  Start-Process "http://localhost:58521"
  Start-Process "http://localhost:58522"
}

Write-Host ""
Write-Step "Klarando ist gestartet." Green
Write-Host "Dashboard: http://localhost:3000"
Write-Host "App:       http://localhost:58520"
Write-Host "Driver:    http://localhost:58521"
Write-Host "OrderDesk: http://localhost:58522"
if (-not $WaitForHealth) {
  Write-Host "Modus:     Schnellstart (keine blockierende Wartepruefung)"
}
exit 0
