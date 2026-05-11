# Display-Geräte Setup (DE)

## Empfohlene Geräte
- Mini-PC (Intel N100, 8 GB RAM): beste Stabilität für Video + komplexe Layouts.
- Raspberry Pi 5: gut für einfache Menüs/Abholnummern.
- Android-TV-Box: nur für einfache Anzeigen, begrenzte Reserven.

## Browser/Kiosk-Modus
- Chrome/Edge im Vollbild-Kiosk-Modus.
- Autostart nach Reboot einrichten.
- Energiesparmodi deaktivieren.

## Video-Empfehlungen
- Formate: MP4 (H.264) oder WebM.
- Auflösung: 1080p.
- Framerate: 30 fps.
- Kurze Loops statt großer Langvideos.
- Assets möglichst über CDN oder gut gecachten Host ausliefern.

## Performance-Hinweise
- Keine 4K-Pflicht im MVP.
- Lokales Rendering auf dem Gerät, Server liefert nur URLs + Daten.
- Layout mit moderaten Animationen nutzen.

## Internet-Fallback
- Runtime-Konfiguration wird lokal gecacht.
- Bei kurzen Ausfällen läuft Anzeige mit letzter Konfiguration weiter.
- Reconnect automatisch im Hintergrund.

## Betriebsroutine
- Display-Geräte regelmäßig neu starten (z. B. nachts).
- Browser-Cache und Kiosk-Konfiguration kontrollieren.
- Heartbeat prüfen, wenn Anzeigen „offline“ wirken.

## Späterer Ausbau
- Service Worker für robusteren Offline-Asset-Cache.
- WebSocket/SSE für Echtzeit-Events.
- Device-Fleet-Monitoring inkl. Alarmierung.
