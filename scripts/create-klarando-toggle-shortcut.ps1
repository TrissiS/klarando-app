$ErrorActionPreference = "Stop"

$projectRoot = Split-Path -Parent $PSScriptRoot
$launcherScript = Join-Path $PSScriptRoot "toggle-klarando-all.ps1"
$desktopPath = [Environment]::GetFolderPath("Desktop")
$shortcutPath = Join-Path $desktopPath "Klarando Start-Stop.lnk"
$powershellPath = "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe"
$iconPath = Join-Path $projectRoot "app\favicon.ico"

if (-not (Test-Path $launcherScript)) {
  Write-Host "Launcher-Script nicht gefunden: $launcherScript" -ForegroundColor Red
  exit 1
}

if (-not (Test-Path $powershellPath)) {
  Write-Host "PowerShell nicht gefunden: $powershellPath" -ForegroundColor Red
  exit 1
}

$shortcut = (New-Object -ComObject WScript.Shell).CreateShortcut($shortcutPath)
$shortcut.TargetPath = $powershellPath
$shortcut.Arguments = "-NoProfile -ExecutionPolicy Bypass -File `"$launcherScript`" -OpenBrowsers"
$shortcut.WorkingDirectory = $projectRoot
$shortcut.WindowStyle = 1
$shortcut.Description = "Startet/stoppt alle Klarando-Server (Frontend, Backend, Kunden-App, Fahrer-App)"

if (Test-Path $iconPath) {
  $shortcut.IconLocation = "$iconPath,0"
}

$shortcut.Save()

Write-Host "Desktop-Verknuepfung erstellt: $shortcutPath" -ForegroundColor Green
exit 0

