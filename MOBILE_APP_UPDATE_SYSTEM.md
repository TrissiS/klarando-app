# Mobile App Update System (APK außerhalb Play Store)

## Zielbild
Klarando verteilt Android-Updates für `customer`, `driver` und `orderdesk` über ein zentrales Backend-Manifest. Jede App prüft beim Start und manuell per Button auf Updates.

## Warum keine stillen Updates
Android erlaubt ohne Geräteverwaltung/MDM keine stille APK-Installation für normale Apps. Deshalb gilt:
- Download erfolgt in der App.
- Installation wird durch den Android-Installer gestartet.
- Nutzer bestätigt die Installation.

## Update-Manifest
Endpoint:
- `GET /api/mobile-updates/customer`
- `GET /api/mobile-updates/driver`
- `GET /api/mobile-updates/orderdesk`

Optional mit Clientstand:
- `GET /api/mobile-updates/:appKey?currentVersion=1.0.0&buildNumber=1`

Antwortfelder:
- `appKey`
- `platform`
- `latestVersion`
- `minRequiredVersion`
- `buildNumber`
- `apkUrl`
- `sha256`
- `releaseNotes`
- `forceUpdate`
- `publishedAt`
- `enabled`
- `updateAvailable`

## APK-Auslieferung
Route:
- `GET /api/mobile-updates/:appKey/apk`

Sicherheitsregeln:
- `appKey` wird strikt validiert (`customer|driver|orderdesk`, `cashier` nur Alias für OrderDesk-Manifest).
- Keine freie Dateipfad-Übergabe.
- Richtiger MIME-Type: `application/vnd.android.package-archive`.

Ablage:
- `backend/mobile-updates/apks/customer/latest.apk`
- `backend/mobile-updates/apks/driver/latest.apk`
- `backend/mobile-updates/apks/orderdesk/latest.apk`

## Flutter-Logik
Zentral in `mobile_flutter_app/lib/src/core/app_update_service.dart`:
1. Flavor-Erkennung über `packageName`.
2. Update-Check mit aktuellem Build/Version.
3. Cross-Flavor-Schutz: nur passender `appKey`.
4. APK-Download in temporären App-Speicher.
5. SHA256-Prüfung (wenn im Manifest gesetzt).
6. Start des Android-Installers.

## Force Update
Wenn `forceUpdate=true` und ein Update verfügbar ist:
- Dialog ist nicht wegklickbar.
- Es bleibt nur „Jetzt aktualisieren“.

Bei optionalen Updates:
- Buttons: „Jetzt aktualisieren“ und „Später“.

## Datenerhalt
Lokale Daten bleiben erhalten, solange **dieselbe applicationId** verwendet wird:
- `com.klarando.customer`
- `com.klarando.driver`
- `com.klarando.orderdesk`

Wichtig:
- Nicht deinstallieren, sondern über APK installieren.
- Keine Löschlogik in SharedPreferences/Secure Storage beim Update ausführen.
- Datenmigrationen nur additiv.

## Veröffentlichung einer neuen APK
1. Neue APK pro Flavor bauen.
2. Nach `backend/mobile-updates/apks/<flavor>/latest.apk` hochladen.
3. Manifest aktualisieren (`latestVersion`, `buildNumber`, `sha256`, `releaseNotes`, optional `forceUpdate`).
4. `enabled=true` setzen.

## Geplante Superadmin-Erweiterung
Später möglich:
- Übersicht veröffentlichter APKs
- `forceUpdate` umschalten
- `minRequiredVersion` pflegen
- Release Notes bearbeiten
