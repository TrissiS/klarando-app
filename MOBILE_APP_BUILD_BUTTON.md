# Klarando Apps bauen (Desktop-Button)

## Zweck
Mit einem Desktop-Button werden die Flutter-Apps `customer`, `driver` und `orderdesk` automatisch für den Upload gebaut.

## Erstellte Skripte
- `C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app\scripts\build-klarando-mobile-release.ps1`
- `C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app\scripts\create-klarando-mobile-build-shortcut.ps1`

## Desktop-Button erstellen
In PowerShell im Projektordner ausführen:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\create-klarando-mobile-build-shortcut.ps1
```

Danach liegt auf dem Desktop die Verknüpfung:
- `Klarando Apps bauen`

## Nutzung
Einfach auf dem Desktop auf **Klarando Apps bauen** klicken.

Das Skript führt automatisch aus:
1. `flutter clean`
2. `flutter pub get`
3. `flutter analyze`
4. Release APK Build:
   - `customer`
   - `driver`
   - `orderdesk` (Fallback auf `cash_main.dart`, falls `orderdesk_main.dart` fehlt)
5. Release AAB Build:
   - `customer`
   - `driver`
   - `orderdesk`
6. Kopieren aller Build-Artefakte auf den Desktop

## Zielordner für Artefakte
- Basisordner: `C:\Users\Tristan Stenger\Desktop\Klarando-App-Builds`
- Pro Lauf wird ein Zeitstempel-Unterordner erstellt, z. B.:
  - `C:\Users\Tristan Stenger\Desktop\Klarando-App-Builds\20260514-153000`

Typische Dateinamen:
- `klarando-customer-release.apk`
- `klarando-customer-release.aab`
- `klarando-driver-release.apk`
- `klarando-driver-release.aab`
- `klarando-orderdesk-release.apk`
- `klarando-orderdesk-release.aab`

## Hinweis
- Keine Secrets sind im Skript hinterlegt.
- Das Skript beendet sich mit Exit-Code `1`, falls ein Build fehlschlägt.
