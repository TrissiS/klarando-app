$ErrorActionPreference = "Stop"

$RepoRoot = "C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app"
$BuildScriptPath = Join-Path $RepoRoot "scripts\build-klarando-mobile-release.ps1"
$DesktopPath = [Environment]::GetFolderPath("Desktop")
$ShortcutPath = Join-Path $DesktopPath "Klarando Apps bauen.lnk"

if (!(Test-Path $BuildScriptPath)) {
  throw "Build-Skript nicht gefunden: $BuildScriptPath"
}

$WshShell = New-Object -ComObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut($ShortcutPath)
$Shortcut.TargetPath = "powershell.exe"
$Shortcut.Arguments = "-ExecutionPolicy Bypass -NoProfile -File `"$BuildScriptPath`""
$Shortcut.WorkingDirectory = $RepoRoot
$Shortcut.IconLocation = "powershell.exe,0"
$Shortcut.Description = "Baut Klarando Customer/Driver/OrderDesk APK + AAB für Upload."
$Shortcut.Save()

Write-Host "Desktop-Verknüpfung erstellt:"
Write-Host $ShortcutPath
