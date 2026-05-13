# Klarando Mobile APK Build

Diese Anleitung baut getrennte APKs für `customer`, `driver` und `orderdesk` mit eigener App-ID, eigenem App-Namen und eigenem Einstiegspunkt.

## 1) Flavor-Übersicht

- `customer`
  - Entry: `lib/main.dart`
  - App-ID: `com.klarando.customer`
  - App-Name: `Klarando`
- `driver`
  - Entry: `lib/driver_main.dart`
  - App-ID: `com.klarando.driver`
  - App-Name: `Klarando Driver`
- `orderdesk`
  - Entry: `lib/cash_main.dart` (alternativ `lib/orderdesk_main.dart`)
  - App-ID: `com.klarando.orderdesk`
  - App-Name: `Klarando OrderDesk`

## 2) API-Umgebungen

Die App liest `ENV` aus `--dart-define=ENV=...`:

- `dev` -> `http://10.0.2.2:4000/api`
- `test` -> `http://31.70.76.55:8080/api`
- `live` -> `https://api.klarando.com/api`

## 3) Vorbereitung

```bash
cd mobile_flutter_app
flutter clean
flutter pub get
flutter analyze
```

## 4) Release APKs bauen

```bash
flutter build apk --release --flavor customer -t lib/main.dart --dart-define=ENV=live
flutter build apk --release --flavor driver -t lib/driver_main.dart --dart-define=ENV=live
flutter build apk --release --flavor orderdesk -t lib/cash_main.dart --dart-define=ENV=live
```

Optional für OrderDesk:

```bash
flutter build apk --release --flavor orderdesk -t lib/orderdesk_main.dart --dart-define=ENV=live
```

## 5) Ausgabe-Dateien

Unter `mobile_flutter_app/build/app/outputs/flutter-apk/`:

- `app-customer-release.apk`
- `app-driver-release.apk`
- `app-orderdesk-release.apk`

## 6) Wichtige Hinweise

- Ohne `--flavor` und `-t` baut Flutter immer die Standard-App.
- Damit APKs nicht identisch sind, immer pro Flavor den passenden Entrypoint nutzen.
- Launcher-Icons sind pro Flavor vorbereitet (eigene Farbstile als Platzhalter in `android/app/src/<flavor>/res/drawable`).

## Stabile Build-Skripte (Windows)
- scripts/build-apk-customer.ps1
- scripts/build-apk-driver.ps1
- scripts/build-apk-orderdesk.ps1
- scripts/build-apk-all.ps1

Beispiele:
`powershell
# einzelner Build mit Timeout
./scripts/build-apk-customer.ps1 -TimeoutMinutes 25

# alle drei nacheinander
./scripts/build-apk-all.ps1 -TimeoutMinutesPerBuild 25
`

Logs liegen unter: un-logs/ mit Zeitstempel.


## Social Login Setup (Customer)

Google:
- Android OAuth Client in Google Cloud Console erstellen
- SHA-1 und SHA-256 Fingerprints hinterlegen
- Web Client ID erstellen und im Backend setzen: GOOGLE_OAUTH_CLIENT_ID
- Flutter holt nur das idToken; Backend prueft den Token serverseitig

Facebook:
- Facebook App erstellen
- Android Package Name + Key Hash hinterlegen
- Facebook Login Produkt aktivieren
- Backend setzen: FACEBOOK_APP_ID, FACEBOOK_APP_SECRET
- Flutter holt nur das Access Token; Backend prueft es ueber Graph API

