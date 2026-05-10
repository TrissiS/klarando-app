$ErrorActionPreference = 'Stop'

$projectRoot = Split-Path -Parent $PSScriptRoot
$deployScript = Join-Path $PSScriptRoot 'deploy-klarando-live.ps1'
$desktopPath = [Environment]::GetFolderPath('Desktop')
$powershellPath = 'C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe'
$iconPath = Join-Path $projectRoot 'app\favicon.ico'

if (-not (Test-Path $deployScript)) {
  Write-Host "Deploy-Script nicht gefunden: $deployScript" -ForegroundColor Red
  exit 1
}

if (-not (Test-Path $powershellPath)) {
  Write-Host "PowerShell nicht gefunden: $powershellPath" -ForegroundColor Red
  exit 1
}

$shortcuts = @(
  @{
    Name = 'Klarando Deploy LIVE.lnk'
    Arguments = "-NoProfile -ExecutionPolicy Bypass -File `"$deployScript`" -Mode live"
    Description = 'Klarando LIVE Deployment inkl. Checks, Versionierung und VPS-Rollout'
  },
  @{
    Name = 'Klarando Deploy TEST.lnk'
    Arguments = "-NoProfile -ExecutionPolicy Bypass -File `"$deployScript`" -Mode test"
    Description = 'Klarando TEST Deployment inkl. Checks, Versionierung und VPS-Rollout'
  },
  @{
    Name = 'Klarando Deploy QUICK.lnk'
    Arguments = "-NoProfile -ExecutionPolicy Bypass -File `"$deployScript`" -Mode quick"
    Description = 'Klarando QUICK Deployment (ohne vollständigen lokalen Build-Check)'
  }
)

$shell = New-Object -ComObject WScript.Shell
foreach ($entry in $shortcuts) {
  $shortcutPath = Join-Path $desktopPath $entry.Name
  $shortcut = $shell.CreateShortcut($shortcutPath)
  $shortcut.TargetPath = $powershellPath
  $shortcut.Arguments = $entry.Arguments
  $shortcut.WorkingDirectory = $projectRoot
  $shortcut.WindowStyle = 1
  $shortcut.Description = $entry.Description

  if (Test-Path $iconPath) {
    $shortcut.IconLocation = "$iconPath,0"
  }

  $shortcut.Save()
  Write-Host "Desktop-Verknüpfung erstellt: $shortcutPath" -ForegroundColor Green
}

exit 0
