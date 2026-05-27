# Display Schedule Engine

## Ziel
Zeitgesteuerte Display-Inhalte für Tageszeiten, Aktionen und Events, ohne Legacy-Fallback-Logik.

## Manifest-Erweiterung
Jedes `playlistItem` unterstützt jetzt:
- `validFrom`
- `validUntil`
- `daysOfWeek`
- `timeWindows` (`from`/`until`)
- `priority` (höher = wichtiger)
- `fallbackItem` (wird nur genutzt, wenn nichts anderes gültig ist)
- `scheduleName`
- `active`

Zusätzlich enthält `displayManifest.schedule`:
- `timezone`
- `generatedAt`
- `currentTime`
- `presets` (Frühstück, Mittag, Abend, Happy Hour, Wochenende, Feiertag, Event)

## Renderer-Regeln
1. Nur aktive und zeitlich gültige Items werden berücksichtigt.
2. Abgelaufene und zukünftige Items werden verworfen.
3. Sortierung:
   - Nicht-Fallback vor Fallback
   - Höhere `priority` vor niedriger
   - Dann `order`
4. Wenn kein reguläres Item gültig ist, wird auf `fallbackItem` gewechselt.
5. Wenn gar nichts vorhanden ist, bleibt `MENU`-Fallback aktiv.

## Debug
Im Display-Debug erscheinen jetzt:
- Anzahl aktiver Schedule-Items
- übersprungene Gründe (gekürzt)
- aktueller `scheduleName`
- aktueller Item-Typ
- nächster Wechsel in Sekunden

## Screen-Studio (Vorbereitung)
Für `Slides & Werbung` / `Veröffentlichung` sind folgende Controls vorgesehen:
- Datum von/bis
- Wochentage
- Zeitfenster
- Priorität
- Fallback-Schalter
- „Was läuft jetzt?“ / „Was läuft morgen 18:00?“ Vorschau

## Offene Punkte
- Vollständige Screen-Studio-Editoren für alle Schedule-Felder
- UI-Preview für simulierte Zeitpunkte
- Backend-Validierung für überlappende Regeln
- Nächsten automatischen Wechselzeitpunkt explizit berechnen
