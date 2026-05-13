# Display-Designer & Produktzuweisung

## Ziel
Der Display-Designer ist so aufgebaut, dass Betreiber ein Gerät anlegen, die passende Auflösung wählen, Inhalte zuweisen und direkt in einer realitätsnahen Vorschau prüfen können.

## Auflösungskonzept
- Presets: `1280x720`, `1920x1080`, `3840x2160`, `1080x1920`, `720x1280`.
- Zusätzlich bleibt `Benutzerdefiniert` verfügbar.
- Die Auflösung wird jetzt konsistent für folgende Bereiche genutzt:
  - Anzeige-Logik auf der echten Display-Seite
  - Spaltenberechnung
  - Angebotsfenster-Größe
  - Reserve-Abstände
  - Logo-Größe
  - Admin-Vorschau (native Auflösung + skalierte Browser-Vorschau)

## Produktzuweisung
Im Bereich **Gerät & Inhalt** können Betreiber:
- Kategorien für ein Display auswählen
- Produkte direkt zuweisen
- Produkte per Suche filtern
- Produkte nach Kategorie filtern
- gefilterte Treffer gesammelt übernehmen
- Zuordnungen gezielt leeren

Hinweis: Produktzuordnungen haben Vorrang vor reiner Kategoriezuordnung.

## Design- und Layout-Optionen
Vorhandene Optionen im Designer:
- Kartenstil (`SOFT`, `SHARP`, `GLASS`, `BOLD`, `OUTLINE`, `MINIMAL`, `LIST`)
- Farben (Hintergrund, Akzent, Texte)
- Anzeigeoptionen (Preise, Allergene, Produktnummern, Verfügbarkeiten)
- Angebotsfenster (Position, Größe, Medienrotation)
- Ticker/Laufschrift (Position, API/Custom-Text, Farben, Rand/Offset)

## Vorschau
- Vorschau nutzt dieselben Konfigurationsdaten wie die Display-Ausgabe.
- Auflösung wird im Vorschaurahmen berücksichtigt und skaliert dargestellt.
- Damit sind typische Zuschnitt-Probleme vor dem Livegang sichtbar.

## Sicherheit
- Tenant-Scope bleibt serverseitig aktiv.
- Admin sieht nur eigene Geräte.
- Display-Feeds bleiben über Device-Code auf den zugehörigen Tenant begrenzt.

## Nächste Ausbaustufen
- Offline-Cache für Display-Assets
- zeitgesteuerte Layout-Slots
- Multi-Slide/Playlist für Tageszeiten
- automatische Bestseller-Rankings
- optionale sanfte Animationen pro Layoutprofil
