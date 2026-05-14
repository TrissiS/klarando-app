$ErrorActionPreference = "Stop"

$RepoRoot = "C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app"
$ScriptPath = Join-Path $RepoRoot "scripts\release-and-deploy.ps1"
$DesktopPath = [Environment]::GetFolderPath("Desktop")
$ShortcutPath = Join-Path $DesktopPath "Klarando Live aktualisieren.lnk"

if (!(Test-Path $ScriptPath)) {
  throw "Deploy-Skript nicht gefunden: $ScriptPath"
}

$WshShell = New-Object -ComObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut($ShortcutPath)
$Shortcut.TargetPath = "powershell.exe"
$Shortcut.Arguments = "-ExecutionPolicy Bypass -NoProfile -File `"$ScriptPath`""
$Shortcut.WorkingDirectory = $RepoRoot
$Shortcut.IconLocation = "powershell.exe,0"
$Shortcut.Description = "Erhöht Version, prüft Checks, pusht und deployed Klarando live."
$Shortcut.Save()

Write-Host "Desktop-Verknüpfung erstellt:"
Write-Host $ShortcutPath
