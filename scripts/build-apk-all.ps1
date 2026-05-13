param(
  [int]$TimeoutMinutesPerBuild = 25
)

$ErrorActionPreference = 'Stop'

Write-Host 'Starte alle drei APK-Builds nacheinander ...' -ForegroundColor Cyan
& "$PSScriptRoot\build-apk-customer.ps1" -TimeoutMinutes $TimeoutMinutesPerBuild
& "$PSScriptRoot\build-apk-driver.ps1" -TimeoutMinutes $TimeoutMinutesPerBuild
& "$PSScriptRoot\build-apk-orderdesk.ps1" -TimeoutMinutes $TimeoutMinutesPerBuild
Write-Host 'Alle APK-Builds abgeschlossen.' -ForegroundColor Green
