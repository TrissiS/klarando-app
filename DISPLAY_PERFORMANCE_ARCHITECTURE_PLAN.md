# Display Performance Architektur (MVP)

## 1) Zielbild
Klarando-Displays rendern lokal im Browser (oder Kiosk-WebView). Der Server liefert nur Daten, Konfiguration und Asset-URLs.

## 2) Trennung Server vs. lokales Rendering
- Server: Runtime-Konfiguration, Feed-Daten, Heartbeat-Endpunkte.
- Display-Gerät: Video-/Bild-Rendering, Layout, Auto-Scale, Reconnect, Cache-Nutzung.

## 3) Was lokal passiert
- Video-Hintergrund via `<video>` direkt auf dem Gerät.
- Layout-Berechnung und Rendering der Karten/Listen.
- Reconnect-Statusanzeige und Fallback auf gecachte Runtime-Konfiguration.

## 4) Was der Server liefert
- `GET /api/display-runtime/:deviceCode/config`
- enthält Gerätetyp, Branding, Layout-Hinweise, Refresh-Intervall, Asset-Infos, Cache-Version.

## 5) Video-/Bild-Asset-Strategie
- Assets werden als URL geliefert.
- Display rendert lokal, keine serverseitige Videoverarbeitung.
- Für MVP: maximal 1080p/30fps empfohlen.

## 6) Caching-Konzept
- Runtime-Konfiguration wird im Browser in `localStorage` gespeichert.
- Bei API-Ausfall wird die letzte gültige Konfiguration genutzt.
- `cacheVersion` unterstützt spätere harte Cache-Invalidierung.

## 7) Offline-/Reconnect-Konzept
- Zustände: `online`, `reconnecting`, `offline_cached`.
- Unaufdringliche Anzeige über Status-Badge.
- Retry-Loop mit konservativem Intervall.

## 8) Spätere WebSocket-/SSE-Strategie
- MVP bleibt bei Polling.
- Später: SSE/WebSocket für Events (neue Bestellungen, Statusänderungen, Live-Designwechsel).

## 9) Hardware-Empfehlung
- Mini-PC Intel N100 / 8 GB RAM für anspruchsvollere Layouts + Video.
- Raspberry Pi 5 für einfache Menüs/Abholanzeigen.
- Android-TV-Box nur für leichte Szenarien.

## 10) MVP-Umfang in diesem Schritt
- Neuer Runtime-Endpunkt + Heartbeat-Grundlage.
- Zentrale Frontend-Runtime-Helfer.
- Wiederverwendbare Display-Komponenten (`DisplayRuntimeShell`, `VideoBackground`, `DisplayConnectionStatus`).
- Vorsichtige Integration in bestehende Display-Seiten ohne Full-Refactor.
- Performance-Profil pro Display-Code über API:
  - `PATCH /api/display-runtime/:deviceCode/performance-mode`
  - Werte: `AUTO`, `NORMAL`, `LOW`
  - `LOW` reduziert Polling-Last und deaktiviert aufwändige Bewegungs-/Videoanteile.
