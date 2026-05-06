# Kassen-Geraet Vorbereitung (ohne Hardware)

Stand: 2026-05-04

## Ziel

Solange das 8-Zoll-Geraet noch nicht da ist, bereiten wir alles so vor, dass am Liefertag nur noch:
- App installieren
- Backend-URL + Display-Code setzen
- 2-3 Testdrucke

## 1) Build/Start fuer Klarando OrderDesk

App starten (Dev):

```powershell
cd "C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app\mobile_flutter_app"
C:\src\flutter\bin\flutter.bat run --flavor orderdesk -t lib\cash_main.dart
```

Release APK bauen:

```powershell
cd "C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app\mobile_flutter_app"
C:\src\flutter\bin\flutter.bat build apk --flavor orderdesk -t lib\cash_main.dart --release
```

APK-Ausgabe:
- `C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app\mobile_flutter_app\build\app\outputs\flutter-apk\app-orderdesk-release.apk`

## 2) Vorab-Test ohne Drucker (Debug-Log Modus)

In Klarando OrderDesk:
1. Druckmodus auf `Debug-Log (ohne Druck)` setzen.
2. Mit Display verbinden.
3. Bei einer Bestellung `Drucken` ausfuehren.
4. In der Info-Zeile wird der Log-Pfad angezeigt.

Technischer Log-Speicher:
- Temp-Verzeichnis: `.../klarando_cashier_receipt_logs`
- Format: JSONL mit Zeitstempel, Byte-Laenge, Base64-Preview.

Nutzen:
- End-to-End Test fuer Feed -> Receipt-Jobs -> Queue -> Druckadapter
- komplett ohne physisches Druckgeraet

## 3) Geraeteeingang-Checkliste

Beim Eintreffen des Geraets:
1. Sunmi/Vendor-Modus aktivieren.
2. Backend + Display verbinden.
3. 20x Testdrucke (Kunde/Kueche gemischt).
4. Umlaute, lange Artikel, Modifier pruefen.
5. Queue-Retry testen (kurz Netzwerk oder Druckdienst stoeren).

## 4) Definition Ready fuer Go-Live-Pilot

- Klarando OrderDesk verbindet stabil mit Feed.
- Aktionen `Annehmen`, `Bezahlt`, `Dispatch` funktionieren.
- Druck ueber 80mm stabil.
- Reprint (`Kunde`/`Kueche`) funktioniert.
