$ErrorActionPreference = "Stop"

$projectRoot = Split-Path -Parent $PSScriptRoot
$diagnoseScript = Join-Path $PSScriptRoot "diagnose-klarando.ps1"
$desktopPath = [Environment]::GetFolderPath("Desktop")
$shortcutPath = Join-Path $desktopPath "Klarando Diagnose.lnk"
$powershellPath = "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe"
$iconPath = Join-Path $projectRoot "app\favicon.ico"

if (-not (Test-Path $diagnoseScript)) {
  Write-Host "Diagnose-Skript nicht gefunden: $diagnoseScript" -ForegroundColor Red
  exit 1
}

if (-not (Test-Path $powershellPath)) {
  Write-Host "PowerShell nicht gefunden: $powershellPath" -ForegroundColor Red
  exit 1
}

$shortcut = (New-Object -ComObject WScript.Shell).CreateShortcut($shortcutPath)
$shortcut.TargetPath = $powershellPath
$shortcut.Arguments = "-NoProfile -ExecutionPolicy Bypass -File `"$diagnoseScript`""
$shortcut.WorkingDirectory = $projectRoot
$shortcut.WindowStyle = 1
$shortcut.Description = "Zeigt Klarando-Status inkl. Ports, URLs und Fehlerlogs"

if (Test-Path $iconPath) {
  $shortcut.IconLocation = "$iconPath,0"
}

$shortcut.Save()

Write-Host "Desktop-Verknuepfung erstellt: $shortcutPath" -ForegroundColor Green
exit 0
