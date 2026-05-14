$ErrorActionPreference = "Stop"

$RepoRoot = "C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app"
$FlutterProjectDir = Join-Path $RepoRoot "mobile_flutter_app"
$OutputDir = "C:\Users\Tristan Stenger\Desktop\Klarando-App-Builds"
$Timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
$RunOutputDir = Join-Path $OutputDir $Timestamp

if (!(Test-Path $FlutterProjectDir)) {
  throw "Flutter-Projektordner nicht gefunden: $FlutterProjectDir"
}

New-Item -Path $RunOutputDir -ItemType Directory -Force | Out-Null

$orderdeskEntrypoint = Join-Path $FlutterProjectDir "lib/orderdesk_main.dart"
if (!(Test-Path $orderdeskEntrypoint)) {
  $fallbackCashEntrypoint = Join-Path $FlutterProjectDir "lib/cash_main.dart"
  if (Test-Path $fallbackCashEntrypoint) {
    $orderdeskEntrypoint = $fallbackCashEntrypoint
  } else {
    throw "Weder lib/orderdesk_main.dart noch lib/cash_main.dart gefunden."
  }
}

$flavors = @(
  @{ Name = "customer"; Entry = "lib/main.dart"; ApkName = "klarando-customer-release.apk"; AabName = "klarando-customer-release.aab" },
  @{ Name = "driver"; Entry = "lib/driver_main.dart"; ApkName = "klarando-driver-release.apk"; AabName = "klarando-driver-release.aab" },
  @{ Name = "orderdesk"; Entry = $orderdeskEntrypoint.Replace("$FlutterProjectDir\", "").Replace("\", "/"); ApkName = "klarando-orderdesk-release.apk"; AabName = "klarando-orderdesk-release.aab" }
)

$results = @()

function Invoke-BuildStep {
  param(
    [string]$Label,
    [scriptblock]$Command
  )
  Write-Host ""
  Write-Host "==> $Label"
  & $Command
}

Set-Location $FlutterProjectDir

Write-Host ""
Write-Host "======================================="
Write-Host " Klarando Mobile Release Build"
Write-Host "======================================="
Write-Host "Projekt: $FlutterProjectDir"
Write-Host "Ausgabe: $RunOutputDir"

Invoke-BuildStep -Label "flutter clean" -Command { flutter clean }
Invoke-BuildStep -Label "flutter pub get" -Command { flutter pub get }
Invoke-BuildStep -Label "flutter analyze" -Command { flutter analyze }

foreach ($flavor in $flavors) {
  $name = $flavor.Name
  $entry = $flavor.Entry
  $apkTarget = Join-Path $RunOutputDir $flavor.ApkName
  $aabTarget = Join-Path $RunOutputDir $flavor.AabName

  $record = [ordered]@{
    Flavor = $name
    Entrypoint = $entry
    Apk = "fehlgeschlagen"
    Aab = "fehlgeschlagen"
    ApkPath = ""
    AabPath = ""
    Error = ""
  }

  try {
    Invoke-BuildStep -Label "Build APK ($name)" -Command {
      flutter build apk --flavor $name -t $entry --release
    }
    $apkSource = Join-Path $FlutterProjectDir "build\app\outputs\flutter-apk\app-$name-release.apk"
    if (Test-Path $apkSource) {
      Copy-Item -Path $apkSource -Destination $apkTarget -Force
      $record.Apk = "ok"
      $record.ApkPath = $apkTarget
    } else {
      throw "APK nicht gefunden: $apkSource"
    }

    Invoke-BuildStep -Label "Build AAB ($name)" -Command {
      flutter build appbundle --flavor $name -t $entry --release
    }
    $aabSource = Join-Path $FlutterProjectDir "build\app\outputs\bundle\$($name)Release\app-$name-release.aab"
    if (Test-Path $aabSource) {
      Copy-Item -Path $aabSource -Destination $aabTarget -Force
      $record.Aab = "ok"
      $record.AabPath = $aabTarget
    } else {
      throw "AAB nicht gefunden: $aabSource"
    }
  } catch {
    $record.Error = $_.Exception.Message
  }

  $results += [pscustomobject]$record
}

Write-Host ""
Write-Host "======================================="
Write-Host " Build-Zusammenfassung"
Write-Host "======================================="
$results | Format-Table -AutoSize
Write-Host ""
Write-Host "Dateien liegen unter: $RunOutputDir"

$failed = $results | Where-Object { $_.Apk -ne "ok" -or $_.Aab -ne "ok" }
if ($failed.Count -gt 0) {
  Write-Host ""
  Write-Host "Mindestens ein Build ist fehlgeschlagen." -ForegroundColor Red
  exit 1
}

Write-Host ""
Write-Host "Alle Builds erfolgreich." -ForegroundColor Green
