# Display Multi Screen Sync

## Ziel
Mehrere Displays in einer Gruppe sollen konsistent oder verteilt betrieben werden.

## Manifest-Felder
Zusätzlich im `displayManifest`:
- `displayGroupId`
- `displayGroupName`
- `displayIndex` (1-basiert)
- `displayCount`
- `syncMode`

Unterstützte `syncMode`-Werte:
- `DUPLICATE_ALL`
- `SPLIT_PRODUCTS`
- `CATEGORY_BASED`
- `PLAYLIST_SYNC`
- `CUSTOM_ASSIGNMENT`

## Produktverteilung
- `SPLIT_PRODUCTS`: Produkte werden gleichmäßig auf Displays verteilt.
- `DUPLICATE_ALL`: alle Displays zeigen dieselbe Produktmenge.
- `CATEGORY_BASED`: derzeit vorbereitet; ohne Zuordnung Fallback wie Split.

## Playlist-Sync
- Bei `PLAYLIST_SYNC` wird die Playlist rein über Serverzeit getaktet (kein Display-Offset).
- Bei anderen Modi bleibt Offset über `displayIndex` möglich.

## Overlay/Debug
Das Display-Debug zeigt:
- Gruppe (`displayGroupId`)
- Index (`displayIndex/displayCount`)
- `syncMode`
- Produktbereich auf dem Gerät
- aktuellen Playlist-Index
- nächsten Wechsel

## Fehlerfälle / Fallback
- Kein Gruppenkontext: `displayCount=1` / Einzelmodus.
- Ungültige Indexdaten: Renderer nutzt sichere Fallback-Werte.
- Leere Gruppenlogik: Menü-Fallback bleibt aktiv.
- Einzelne Offline-Geräte blockieren die übrigen nicht.

## Offene Punkte
- Category-Based Zuweisungseditor im Screen Studio
- Custom Assignment UI je Display
- Group-Management-UI (Name, Reihenfolge, Zuordnung)
- Gruppenweite Vorschau Display 1/2/3 im Studio
