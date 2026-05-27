# Display Media Engine

## Manifest Playlist Struktur
`displayManifest.playlistItems` enthält rotierbare Inhalte:
- `id`
- `type` (`MENU | IMAGE | VIDEO | PROMO | HERO_PRODUCT | INFO`)
- `title`
- `durationSeconds`
- `order`
- `active`
- `validFrom`
- `validUntil`
- `daysOfWeek`
- `timeWindows`
- `assetUrl`
- `assetType`
- `backgroundColor`
- `transition`
- `productIds`
- `categoryIds`

Kompatibilität: `displayManifest.playlist` bleibt als Legacy-Alias bestehen.

## Renderer-Verhalten
Die Display-App lädt `playlistItems` (Fallback: `playlist`) und filtert aktiv gültige Items nach:
- `active`
- Datum (`validFrom`/`validUntil`)
- Wochentag (`daysOfWeek`)
- Zeitfenster (`timeWindows`)

Rendering je Typ:
- `MENU`: normaler Menüboard-Renderer
- `IMAGE`: Vollbildbild (mit Fallback-Karte bei Fehler)
- `VIDEO`: Placeholder-Karte (Video-Slide vorbereitet)
- `PROMO | HERO_PRODUCT | INFO`: Informations-/Promo-Slide über generische Slide-Karte

Wenn Playlist leer ist, fällt die App auf ein `MENU`-Item zurück.

## Asset Handling
- Nur valide `http/https` URLs werden als echte Medien geladen.
- Fehler bei Bild/Video crashen nicht den Renderer.
- Fallback-Card zeigt den Inhaltstyp sichtbar an.
- Debug-Werte bleiben im Overlay sichtbar.

## Screen-Studio Logik (vorbereitet)
Der Tab „Slides & Werbung“ soll diese Playlist-Felder schreiben.
Falls Backend-Funktionen fehlen, müssen Controls als in Vorbereitung markiert werden.

## Offline/Caching Vorbereitung
Manifest kann künftig `checksum`/Asset-Metadaten nutzen.
Die Struktur ist so vorbereitet, dass späteres Asset-Preloading ohne Breaking Changes ergänzt werden kann.

## Offene Punkte
- Echter Video-Player pro `VIDEO`-Playlistitem
- Asset-Preload + Cache-Strategie
- Playlist-Editor im Screen-Studio vollständig anbinden
- Kategorie-/Produktfilterung pro Slide serverseitig durchziehen

## Testplan
1. Playlist mit `MENU` + `PROMO` + `IMAGE` anlegen.
2. Rotation prüfen (`durationSeconds`).
3. Ungültige `assetUrl` prüfen (Fallback statt Crash).
4. `validFrom/validUntil` und `daysOfWeek/timeWindows` prüfen.
5. Leere Playlist prüfen (MENU-Fallback).
6. Build-Checks:
   - `npm run build`
   - `flutter build apk --flavor display -t lib/display_main.dart --debug --no-shrink`
