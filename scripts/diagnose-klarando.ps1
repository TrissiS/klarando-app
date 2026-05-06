$ErrorActionPreference = "SilentlyContinue"

$scriptDir = $PSScriptRoot
$projectRoot = Split-Path -Parent $scriptDir
$logsDir = Join-Path $projectRoot "run-logs"

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

function Test-UrlFast {
  param([string]$Url)
  try {
    $res = Invoke-WebRequest -UseBasicParsing -Uri $Url -TimeoutSec 2
    if ($res.StatusCode -ge 200 -and $res.StatusCode -lt 500) {
      return "OK ($($res.StatusCode))"
    }
    return "Antwort ($($res.StatusCode))"
  } catch {
    return "Nicht erreichbar"
  }
}

function Print-ServiceStatus {
  param(
    [string]$Name,
    [int]$Port,
    [string]$Url
  )
  $pid = Get-ListeningProcessId -Port $Port
  $urlState = Test-UrlFast -Url $Url
  if ($null -eq $pid) {
    Write-Host ("- {0} [{1}]: PORT OFFEN = nein | URL = {2}" -f $Name, $Port, $urlState) -ForegroundColor Red
    return
  }
  Write-Host ("- {0} [{1}]: PORT OFFEN = ja (PID {2}) | URL = {3}" -f $Name, $Port, $pid, $urlState) -ForegroundColor Green
}

Write-Host ""
Write-Host "Klarando Diagnose" -ForegroundColor Cyan
Write-Host ("Zeit: {0}" -f (Get-Date -Format "dd.MM.yyyy HH:mm:ss"))
Write-Host ""

Print-ServiceStatus -Name "Backend" -Port 4000 -Url "http://localhost:4000/api/health"
Print-ServiceStatus -Name "Dashboard" -Port 3000 -Url "http://localhost:3000/api/health"
Print-ServiceStatus -Name "Kunden-App" -Port 58520 -Url "http://localhost:58520"
Print-ServiceStatus -Name "Fahrer-App" -Port 58521 -Url "http://localhost:58521"

Write-Host ""
Write-Host "Letzte Fehler-Logs:" -ForegroundColor Yellow
if (Test-Path $logsDir) {
  $latestErrLogs = Get-ChildItem -Path $logsDir -Filter "*.err.log" |
    Sort-Object LastWriteTime -Descending |
    Select-Object -First 4

  if ($latestErrLogs.Count -eq 0) {
    Write-Host "- Keine Fehlerlogs gefunden." -ForegroundColor DarkGray
  } else {
    foreach ($log in $latestErrLogs) {
      Write-Host ("- {0} ({1})" -f $log.Name, $log.LastWriteTime.ToString("HH:mm:ss")) -ForegroundColor DarkYellow
      Get-Content -Path $log.FullName -Tail 12 | ForEach-Object { Write-Host ("  " + $_) }
      Write-Host ""
    }
  }
} else {
  Write-Host ("- Log-Ordner fehlt: {0}" -f $logsDir) -ForegroundColor DarkGray
}

Write-Host "Diagnose beendet." -ForegroundColor Cyan
exit 0
