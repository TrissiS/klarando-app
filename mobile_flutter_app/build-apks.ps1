$ErrorActionPreference = "Stop"

$ProjectDir = "C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app\mobile_flutter_app"
$JavaHome = "C:\Program Files\Android\Android Studio\jbr"

Set-Location $ProjectDir

$env:JAVA_HOME = $JavaHome
$env:Path = "$env:JAVA_HOME\bin;$env:Path"

Write-Host ""
Write-Host "======================================="
Write-Host " Klarando APK Debug Build"
Write-Host "======================================="
Write-Host ""

Write-Host "Projektordner:"
Write-Host $ProjectDir

Write-Host ""
Write-Host "Java Version:"
java -version

Write-Host ""
Write-Host "Stoppe alte Java/Gradle/Dart Prozesse..."
Get-Process java,dart,gradle -ErrorAction SilentlyContinue | Stop-Process -Force -ErrorAction SilentlyContinue

Write-Host ""
Write-Host "Flutter clean..."
flutter clean

Write-Host ""
Write-Host "Flutter pub get..."
flutter pub get

Write-Host ""
Write-Host "Baue Customer Debug APK..."
flutter build apk --flavor customer -t lib/main.dart --debug --no-shrink

Write-Host ""
Write-Host "Baue Driver Debug APK..."
flutter build apk --flavor driver -t lib/driver_main.dart --debug --no-shrink

Write-Host ""
Write-Host "Baue OrderDesk Debug APK..."
flutter build apk --flavor orderdesk -t lib/orderdesk_main.dart --debug --no-shrink

Write-Host ""
Write-Host "======================================="
Write-Host " Fertig! APKs:"
Write-Host "======================================="

Get-ChildItem "$ProjectDir\build\app\outputs\flutter-apk\"
