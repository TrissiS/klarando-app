# Mobile App Flavors (Android)

Stand: 2026-05-05

## Ziel

Die drei Apps nutzen jetzt eigene Android-Flavors mit separaten Paketnamen und App-Labels.

## Flavor-Mapping

- `customer`
  - Entry Point: `lib/main.dart`
  - Application ID: `com.klarando.customer`
  - Label: `Klarando`
- `driver`
  - Entry Point: `lib/driver_main.dart`
  - Application ID: `com.klarando.driver`
  - Label: `Klarando Driver`
- `orderdesk`
  - Entry Point: `lib/cash_main.dart`
  - Application ID: `com.klarando.orderdesk`
  - Label: `Klarando OrderDesk`

## Dev-Start (Android)

```powershell
cd "C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app\mobile_flutter_app"

# Kunden-App
C:\src\flutter\bin\flutter.bat run --flavor customer -t lib\main.dart

# Fahrer-App
C:\src\flutter\bin\flutter.bat run --flavor driver -t lib\driver_main.dart

# OrderDesk
C:\src\flutter\bin\flutter.bat run --flavor orderdesk -t lib\cash_main.dart
```

## Dev-Start (iOS)

```powershell
cd "C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app\mobile_flutter_app"

# Kunden-App (Scheme: customer)
C:\src\flutter\bin\flutter.bat run --flavor customer -t lib\main.dart

# Fahrer-App (Scheme: driver)
C:\src\flutter\bin\flutter.bat run --flavor driver -t lib\driver_main.dart

# OrderDesk (Scheme: orderdesk)
C:\src\flutter\bin\flutter.bat run --flavor orderdesk -t lib\cash_main.dart
```

## Release APK Build

```powershell
cd "C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app\mobile_flutter_app"

C:\src\flutter\bin\flutter.bat build apk --flavor customer -t lib\main.dart --release
C:\src\flutter\bin\flutter.bat build apk --flavor driver -t lib\driver_main.dart --release
C:\src\flutter\bin\flutter.bat build apk --flavor orderdesk -t lib\cash_main.dart --release
```

Typische Ausgaben:
- `build\app\outputs\flutter-apk\app-customer-release.apk`
- `build\app\outputs\flutter-apk\app-driver-release.apk`
- `build\app\outputs\flutter-apk\app-orderdesk-release.apk`

## iOS Build (ohne Signierung)

```powershell
cd "C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app\mobile_flutter_app"

C:\src\flutter\bin\flutter.bat build ios --flavor customer -t lib\main.dart --release --no-codesign
C:\src\flutter\bin\flutter.bat build ios --flavor driver -t lib\driver_main.dart --release --no-codesign
C:\src\flutter\bin\flutter.bat build ios --flavor orderdesk -t lib\cash_main.dart --release --no-codesign
```

## Update-Manifest Mapping

- Customer: `GET /api/mobile-updates/customer`
- Driver: `GET /api/mobile-updates/driver`
- OrderDesk: `GET /api/mobile-updates/cashier` (historischer Kanalname)
