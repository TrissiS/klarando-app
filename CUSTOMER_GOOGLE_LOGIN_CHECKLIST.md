# Customer Google Login Checklist

## Plugin- und Gradle-Status
- Flutter Plugin vorhanden: `google_sign_in` (in `mobile_flutter_app/pubspec.yaml`)
- Flutter Plugin vorhanden: `flutter_facebook_auth` (in `mobile_flutter_app/pubspec.yaml`)
- Google Services Gradle Plugin vorbereitet:
  - `mobile_flutter_app/android/settings.gradle.kts` enthält `com.google.gms.google-services`
  - `mobile_flutter_app/android/app/build.gradle.kts` aktiviert Plugin nur, wenn `google-services.json` existiert
- Customer Flavor Application ID:
  - `com.klarando.customer` (in `mobile_flutter_app/android/app/build.gradle.kts`)

## customer_main.dart / Firebase-Init Status
- `mobile_flutter_app/lib/customer_main.dart` startet aktuell nur `KlarandoApp` (kein `Firebase.initializeApp()`).
- In diesem Schritt wurde **kein** Fake-Firebase-Setup ergänzt.
- Schutz ist eingebaut: Google Login wird in der UI deaktiviert, solange `GOOGLE_SERVICES_CONFIGURED` nicht gesetzt ist.

## 1) SHA-Fingerprints (Customer-App)
Quelle: lokaler Debug-Keystore (`%USERPROFILE%\\.android\\debug.keystore`)

- Debug SHA-1: `E5:2A:EE:1C:31:EF:BA:71:E3:7A:9E:4F:FD:5A:2D:63:90:AE:F1:7A`
- Debug SHA-256: `19:9B:16:03:E3:7D:D3:C2:BD:EE:28:F5:BA:55:C7:9F:C4:F1:50:7F:ED:71:0D:9B:94:7A:5E:51:1C:BC:FF:7D`

## 2) Release SHA-Fingerprints (aktueller Stand)
Aktuell existiert kein `mobile_flutter_app/android/key.properties` im Repo.
In `mobile_flutter_app/android/app/build.gradle.kts` ist konfiguriert:
- Wenn **kein Release-Keystore** vorhanden ist, wird fuer `release` die **debug signingConfig** verwendet.

Daher aktuell (solange kein eigener Release-Keystore eingebunden ist):
- Release SHA-1: `E5:2A:EE:1C:31:EF:BA:71:E3:7A:9E:4F:FD:5A:2D:63:90:AE:F1:7A`
- Release SHA-256: `19:9B:16:03:E3:7D:D3:C2:BD:EE:28:F5:BA:55:C7:9F:C4:F1:50:7F:ED:71:0D:9B:94:7A:5E:51:1C:BC:FF:7D`

Hinweis: Sobald ein echter Release-Keystore genutzt wird, muessen die Release-Werte neu ermittelt und in Firebase/Google Cloud aktualisiert werden.

## 3) Welches Firebase-Projekt wird aktuell verwendet?
Im Repo ist **keine** `google-services.json` vorhanden, daher ist das aktive Firebase-Projekt fuer Android aktuell nicht fest verdrahtet.
Es gibt nur eine hinterlegte Google Web Client ID in der App:
- `198427463115-m6u039q4ive21u9gjrg9v61hk4nqkejn.apps.googleusercontent.com`

Das deutet auf ein Google/Firebase Projekt mit Projekt-Nummer `198427463115` hin, ist aber ohne `google-services.json` nicht final verifiziert.

## 4) Welche Android-App muss in Firebase registriert werden?
- Package / Application ID: `com.klarando.customer`

## 5) Welche Datei fehlt genau?
Erwartet, aber aktuell nicht vorhanden:
- `mobile_flutter_app/android/app/google-services.json`

## Fehlverhalten ohne Datei (abgesichert)
- Wenn `google-services.json` fehlt, bleibt Google Login deaktiviert und zeigt eine klare Meldung statt still zu scheitern.
- Keine Fake-Datei und keine Fake-IDs wurden eingetragen.

## 6) Welche OAuth-Client-IDs werden benoetigt?
Mindestens:
1. **Android OAuth Client** fuer `com.klarando.customer` + SHA-Fingerprints (Debug + Release)
2. **Web OAuth Client** (serverClientId), aktuell im Code hinterlegt:
   - `198427463115-m6u039q4ive21u9gjrg9v61hk4nqkejn.apps.googleusercontent.com`

## 7) Welche Firebase Auth Provider muessen aktiviert sein?
- **Google** (zwingend fuer Google Login)
- Optional/je nach Produktfluss zusaetzlich:
  - E-Mail/Passwort
  - Facebook (wenn Social Login Facebook in Firebase laufen soll)

## 8) Kurzdiagnose zu Fehler 10
`PlatformException(sign_in_failed, ... 10, ...)` ist sehr wahrscheinlich ein Konfigurationsproblem:
- fehlende/falsche Android OAuth-Konfiguration (Package + SHA)
- fehlende oder nicht passende `google-services.json`
- Web/Android Client-Mismatch
