# Klarando Signage Studio – Modulplan

## Modulbeschreibung
- Neues kostenpflichtiges Modul: `SIGNAGE_STUDIO`
- Zweck: Animierte Display-Slides, Werbung, Videos und Playlists im bestehenden Display-/Device-System.
- Freischaltung: Superadmin über Modul-/Lizenzsystem, tenantfähig.
- Verhalten ohne Freischaltung: Tab sichtbar, aber gesperrt mit Hinweis.

## Runtime-Struktur (vorbereitet)
- `signageSettings`
  - `enabled`
  - `playlistId`
  - `rotationMode`
  - `defaultSlideDurationSeconds`
  - `transitionType`
  - `loopEnabled`
  - `preloadMedia`
  - `offlineCacheEnabled`
- `slides[]`
  - `id`, `type`, `title`, `durationSeconds`, `background`, `mediaUrl`
  - `productIds`, `textBlocks`, `animation`, `sortOrder`, `active`

## Medienstrategie
- Hauptstrategie: HTML5/CSS/Media-basierte Slides.
- Empfohlene Formate:
  - Bilder: `WebP`, `JPG`, `PNG` (Transparenz)
  - Videos: `MP4 (H.264)` bevorzugt
  - Animation: CSS/HTML5, optional Lottie oder kurze MP4
- Kein PPTX als primäres Laufzeitformat.
- PowerPoint-Hinweis: Export zu MP4 oder Bildfolge als Content-Eingang.

## Offline-Cache
- Display-Runtime und Snapshot enthalten Signage-Felder.
- Zielbild: letzter gültiger Stand bleibt bei Ausfall sichtbar.
- Medien-Preload/Offline-Cache als Settings vorbereitet.

## Auflösung / FPS Empfehlungen
- Im Admin sichtbar: geschätzte Wiedergabeleistung (nicht garantierte Hz).
- Empfehlung nach Gerät:
  - Standard: 25/30 fps
  - 60 fps nur bei starken Geräten
  - 4K nur bei leistungsfähigen Geräten
- Dateiempfehlungen:
  - 1920x1080 (16:9) oder 1080x1920 (9:16), je nach Orientation
  - 4K optional: 3840x2160

## Gerätdiagnose (vorbereitet)
- Erfasste Werte:
  - effektive Auflösung / Viewport
  - `devicePixelRatio`
  - Orientation
  - Fullscreen-/Touch-Support
  - User-Agent
  - App-Version
  - geschätzte Performance-Klasse
  - Videoformat-Liste
  - empfohlene Zielauflösung

## Billing-/Paketlogik
- `SIGNAGE_STUDIO` ist als Feature-Modul im Katalog und in Paketen vorbereitet.
- Preis-/Limitsteuerung erfolgt über bestehende Modul-Billing-Struktur.
- Geplante Limits:
  - max. Slides
  - max. Playlists
  - max. Speicher
  - max. aktive Displays

## Offene Folgeaufgaben
1. Vollständige CRUD-UI im Tab `Slides & Werbung` (Playlist-/Slide-Editor).
2. Modul-Limits serverseitig erzwingen.
3. Medienvalidierung (Seitenverhältnis, Dateigröße, Codec) beim Upload.
4. Erweiterte Publish-Pipeline mit Versionierung pro Playlist.
5. Optionaler PPT-Import-Assist (Konvertierungsworkflow, kein Direkt-Playback).
