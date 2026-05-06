$ErrorActionPreference = "SilentlyContinue"

$scriptDir = $PSScriptRoot
$projectRoot = Split-Path -Parent $scriptDir
$mobileProjectDir = Join-Path $projectRoot "mobile_flutter_app"

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
    Start-Sleep -Milliseconds 200
    Write-Host ("Port {0} Prozessbaum beendet (PID {1})." -f $Port, $pidOnPort) -ForegroundColor Yellow
  }
}

Write-Host "Stoppe Klarando-Dienste..." -ForegroundColor Yellow

Write-Host "Bereinige Klarando-Ports..." -ForegroundColor Yellow

Stop-PortProcess -Port 3000
Stop-PortProcess -Port 4000
Stop-PortProcess -Port 58520
Stop-PortProcess -Port 58521
Stop-PortProcess -Port 58522

Write-Host "Klarando-Dienste sind gestoppt." -ForegroundColor Green
exit 0
