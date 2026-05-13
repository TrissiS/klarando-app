# Klarando Mobile (Flutter)

## Google Login (Customer-App)

Der Google Login in der Customer-App nutzt bereits die korrekte `serverClientId`:

- `198427463115-m6u039q4ive21u9gjrg9v61hk4nqkejn.apps.googleusercontent.com`

Diese ID ist die **Web Client ID** und wird für den serverseitigen Token-Flow benötigt.

## Wichtige Android OAuth Voraussetzungen

Für `ApiException: 10` müssen die OAuth-Daten in der Google Cloud Console exakt zum Customer-Flavor passen.

### 1) Package/Application ID (Customer)

Aus `android/app/build.gradle.kts`:

- `customer`: `com.klarando.customer`

Nur diese ID für den Customer-Android-OAuth-Client verwenden.

### 2) Fingerprints erfassen (Debug)

Im Ordner `mobile_flutter_app/android` ausführen:

```bash
./gradlew signingReport
```

Benötigt werden für den **customerDebug** Variant:

- `SHA-1`
- `SHA-256`

Diese beiden Werte müssen im Android OAuth Client in der Google Cloud Console hinterlegt sein.

### 3) Release-Fingerprints

Für produktive APKs zusätzlich hinterlegen:

- Release `SHA-1`
- Release `SHA-256`

Wenn später über Play Store veröffentlicht wird, zusätzlich eintragen:

- Play App Signing `SHA-1`
- Play App Signing `SHA-256`

## Backend-Ziel für Social Login

Die Customer-App sendet den Google `idToken` an:

- `POST https://api.klarando.com/api/auth/social/google`

Secrets bleiben ausschließlich im Backend.

## Fehleranzeige in der App

Google-Login-Fehler werden absichtlich sichtbar gehalten:

- technische Exception wird per `debugPrint(...)` ausgegeben
- API-Fehler werden mit Servermeldung angezeigt
- bei fehlendem `idToken`:
  - `Google-ID-Token fehlt. Bitte Google Client ID / SHA-1 prüfen.`
