# Display Offline Cache

## Ziel
Die Display-App nutzt jetzt einen Offline-First-Manifest-Cache, damit ein gekoppeltes Gerät bei Verbindungsproblemen weiterläuft.

## Verhalten
- Das letzte **valide** Manifest wird lokal in `SharedPreferences` gespeichert (`klarando_display_manifest_cache_v1`).
- Beim App-Start wird zuerst versucht, den lokalen Stand zu laden.
- Danach wird online synchronisiert.
- Wenn der neue Manifest-Request fehlschlägt, bleibt der letzte gültige Stand aktiv.
- Ein ungültiges Manifest überschreibt den Cache nicht.

## Validierungsregel
Ein Manifest wird nur übernommen, wenn das gemappte Runtime-Objekt mindestens enthält:
- `products` (List)
- `items` (List)
- `screenConfig` (Map)

## Asset-Strategie
- Bild-Assets werden nach erfolgreicher Manifest-Übernahme per `precacheImage` vorbereitet.
- Defekte Bild-URLs werden als Fehler gezählt und im Debug sichtbar.
- Video-Cache ist als Foundation vorbereitet (Video-URLs werden erkannt/gezählt), ohne große persistente Video-Cache-Engine.

## Debug-Informationen
Debug zeigt jetzt zusätzlich:
- `offlineMode`
- `lastSync`
- `cacheStatus`
- `assetCacheImages`
- `videoCachePrepared`
- `assetErrors`

## Bedienung
Im Debug-Overlay:
- `Manifest neu laden`
- `Cache löschen`

Im Strict-Manifest-Fehlerscreen:
- `Manifest neu laden` (wenn deviceCode vorhanden)
- `Cache löschen`
- `Neu koppeln`

## Wichtig
- Kein Legacy-Renderer wurde reaktiviert.
- Strict-Manifest-Prinzip bleibt bestehen.
