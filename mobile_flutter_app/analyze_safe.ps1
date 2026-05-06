param(
  [int]$TimeoutSeconds = 90,
  [string]$FlutterBin = "C:\src\flutter\bin\flutter.bat"
)

$ErrorActionPreference = "Stop"
$projectRoot = Split-Path -Parent $MyInvocation.MyCommand.Path

if (-not (Test-Path -LiteralPath $FlutterBin)) {
  throw "Flutter wurde nicht gefunden: $FlutterBin"
}

Set-Location -LiteralPath $projectRoot

if (-not (Test-Path -LiteralPath (Join-Path $projectRoot "pubspec.yaml"))) {
  throw "Kein Flutter-Projekt gefunden (pubspec.yaml fehlt in $projectRoot)."
}

Write-Host "Starte flutter analyze (Timeout: $TimeoutSeconds s)..."
Write-Host "Projekt: $projectRoot"

$stdoutLog = Join-Path $env:TEMP "klarando_flutter_analyze_stdout.log"
$stderrLog = Join-Path $env:TEMP "klarando_flutter_analyze_stderr.log"

if (Test-Path -LiteralPath $stdoutLog) { Remove-Item -LiteralPath $stdoutLog -Force }
if (Test-Path -LiteralPath $stderrLog) { Remove-Item -LiteralPath $stderrLog -Force }

$command = "/c `"`"$FlutterBin`" analyze --no-pub --suppress-analytics 1>`"$stdoutLog`" 2>`"$stderrLog`"`""

$psi = New-Object System.Diagnostics.ProcessStartInfo
$psi.FileName = "cmd.exe"
$psi.Arguments = $command
$psi.WorkingDirectory = $projectRoot
$psi.UseShellExecute = $false
$psi.CreateNoWindow = $true

$proc = New-Object System.Diagnostics.Process
$proc.StartInfo = $psi
[void]$proc.Start()

$watch = [System.Diagnostics.Stopwatch]::StartNew()
$seenOut = 0
$seenErr = 0
$nextHeartbeatAt = 10

while (-not $proc.HasExited) {
  if ($watch.Elapsed.TotalSeconds -ge $nextHeartbeatAt) {
    Write-Host "Analyze laeuft... $([int]$watch.Elapsed.TotalSeconds)s / ${TimeoutSeconds}s"
    $nextHeartbeatAt += 10
  }

  if ($watch.Elapsed.TotalSeconds -ge $TimeoutSeconds) {
    $proc.Kill()
    throw "flutter analyze wurde nach $TimeoutSeconds Sekunden beendet (Timeout)."
  }

  if (Test-Path -LiteralPath $stdoutLog) {
    $lines = Get-Content -LiteralPath $stdoutLog
    if ($lines.Count -gt $seenOut) {
      $lines[$seenOut..($lines.Count - 1)] | ForEach-Object { Write-Host $_ }
      $seenOut = $lines.Count
    }
  }

  if (Test-Path -LiteralPath $stderrLog) {
    $lines = Get-Content -LiteralPath $stderrLog
    if ($lines.Count -gt $seenErr) {
      $lines[$seenErr..($lines.Count - 1)] | ForEach-Object { Write-Host $_ }
      $seenErr = $lines.Count
    }
  }

  Start-Sleep -Milliseconds 500
}

if (Test-Path -LiteralPath $stdoutLog) {
  $finalOut = Get-Content -LiteralPath $stdoutLog
  if ($finalOut.Count -gt $seenOut) {
    $finalOut[$seenOut..($finalOut.Count - 1)] | ForEach-Object { Write-Host $_ }
  }
}

if (Test-Path -LiteralPath $stderrLog) {
  $finalErr = Get-Content -LiteralPath $stderrLog
  if ($finalErr.Count -gt $seenErr) {
    $finalErr[$seenErr..($finalErr.Count - 1)] | ForEach-Object { Write-Host $_ }
  }
}

if ($proc.ExitCode -ne 0) {
  throw "flutter analyze fehlgeschlagen (ExitCode: $($proc.ExitCode))."
}

Write-Host "flutter analyze erfolgreich abgeschlossen."
