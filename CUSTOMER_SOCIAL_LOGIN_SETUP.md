# Customer Social Login Setup

## Aktueller Konfigurationsstatus
- Customer `applicationId`: `com.klarando.customer`
- Aktuell fehlt: `mobile_flutter_app/android/app/google-services.json`
- Aktuell fehlen Facebook Android Metadaten (noch nicht eingetragen):
  - `facebook_app_id`
  - `facebook_client_token`
  - `fb_login_protocol_scheme`

## Google Login (Firebase) Voraussetzungen
1. Firebase Projekt mit Android-App fuer `com.klarando.customer` anlegen/verknuepfen.
2. `google-services.json` herunterladen und ablegen unter:
   - `mobile_flutter_app/android/app/google-services.json`
3. OAuth-Client/Fingerprints hinterlegen:
   - Debug SHA-1
   - Debug SHA-256
   - Release SHA-1
   - Release SHA-256
4. Sicherstellen, dass Package Name exakt `com.klarando.customer` ist.

## SHA Fingerprints (benoetigt)
Fuer **Debug** und **Release** jeweils:
- SHA-1
- SHA-256

Hinweis: Die Fingerprints muessen zur jeweils genutzten Signatur passen (debug keystore bzw. release keystore).

## Facebook Login Voraussetzungen
1. Facebook App in der Meta Developer Console erstellen/konfigurieren.
2. Android Plattform konfigurieren mit:
   - Package Name: `com.klarando.customer`
   - Key Hash (Debug)
   - Key Hash (Release)
3. Werte bereitstellen:
   - Facebook App ID
   - Facebook Client Token
   - Login Redirect Scheme (`fb<APP_ID>`)
4. Diese Werte anschliessend in Android-Konfiguration/Manifest korrekt verdrahten.

## Fehlerbild Google `sign_in_failed` Code 10
`PlatformException(sign_in_failed, ... 10, ...)` deutet sehr wahrscheinlich auf Konfigurationsabweichung hin:
- falscher/fehlender OAuth Android Client
- fehlende oder falsche SHA-1/SHA-256
- `google-services.json` fehlt oder passt nicht zum Package
- falsches `applicationId` in OAuth/Firebase

## Hinweis
Es wurden bewusst **keine Fake IDs** oder Platzhalterwerte ins Manifest eingetragen.
