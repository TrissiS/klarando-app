# Installation Klarando OrderDesk (Android)

Stand: 2026-05-04

## 1) APK bauen

```powershell
cd "C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app\mobile_flutter_app"
C:\src\flutter\bin\flutter.bat pub get
C:\src\flutter\bin\flutter.bat build apk --flavor orderdesk -t lib\cash_main.dart --release
```

## 2) APK-Datei

Nach erfolgreichem Build liegt die Installationsdatei hier:

`C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app\mobile_flutter_app\build\app\outputs\flutter-apk\app-orderdesk-release.apk`

## 3) Auf Android installieren

1. APK auf das Geraet kopieren.
2. Auf dem Geraet "Installation aus unbekannten Quellen" erlauben.
3. APK oeffnen und installieren.

## 4) Erster Start

1. In der App Backend-URL eintragen.
2. Display-Code eintragen.
3. Druckmodus waehlen:
- `Debug-Log (ohne Druck)` solange noch kein Geraet/Drucker vorhanden ist.
- `Sunmi (integriert)` sobald Zielgeraet da ist.
4. `Speichern & Verbinden`.

## 5) Schnelltest ohne Hardware

Button `Demo-Druck` ausfuehren.
Im Debug-Modus wird ein ESC/POS-Log geschrieben und der Log-Pfad in der App angezeigt.

## 6) Update-Manifest (In-App Update Check)

Die App prueft Updates ueber:

`GET /api/mobile-updates/cashier` (OrderDesk-Kanal)

Quelle:

`C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app\backend\mobile-updates\cashier-stable.json`
