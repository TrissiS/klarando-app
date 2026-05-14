# Display Designer & Produktzuweisung

## Ziel
Das Screen-/Display-System wurde für den Pilot auf konsistente Auflösungsnutzung, bessere Vorschau und einfachere Produktzuweisung geschärft.

## Auflösung & Darstellung
- Unterstützte Presets im Admin:
  - `1280x720 (HD)`
  - `1920x1080 (Full HD)`
  - `3840x2160 (4K)`
  - `1080x1920 (Hochformat)`
  - `720x1280 (Hochformat)`
  - `Custom`
- Auflösungen werden in der Vorschau weiterhin orientierungsabhängig normalisiert (Quer/Hochformat).
- Die Vorschau zeigt jetzt zusätzlich:
  - Auflösungsprofil-Label
  - aktuelle Skalierung in Prozent

## Preview-Verbesserungen
- Neuer Direktlink in der Vorschau:
  - **„Vorschau in neuem Tab öffnen“** (`/screen/{deviceCode}`)
- Inhaltswarnung eingebaut:
  - Bei hoher Dichte, langen Produktnamen oder sehr großer Schrift erscheint eine Warnung, dass Inhalte abgeschnitten wirken können.

## Produktzuweisung (Admin)
- Bestehende Funktionen bleiben:
  - Produktsuche
  - Kategorienfilter
  - Checkbox-Auswahl
  - „Gefilterte Produkte wählen“
  - manuelle Reihenfolge über Drag & Drop
- Neu ergänzt:
  - **„Alle Produkte dieser Kategorie anzeigen“** (bei gesetztem Kategorienfilter).

## Designoptionen (bereits nutzbar)
- Layout-/Darstellungsbasis:
  - Grid über Spaltenzahl
  - kompakter/listiger Stil über `LIST` Card-Style
  - größere Karten über BOLD/SOFT + größere Padding/Fonts
- Sichtbarkeiten:
  - Preise an/aus
  - Allergene an/aus
  - Produktnummern an/aus
  - Kategorie-Header und Kategorie auf Karte
- Branding:
  - Logo
  - Akzent-/Textfarben
  - Hintergrundfarbe/-bild/-video
  - Schriftgrößen
- Hinweise:
  - Ticker/Lauftext
  - Angebotsfenster inkl. Position/Größe

## Offene Ausbaupunkte
- Harte „Safe-Area“-Warnung pro konkretem Element (pixelgenau) kann später ergänzt werden.
- Separate Persistenz-Flags für „Zutaten anzeigen“ und „Pfandhinweise anzeigen“ sind als nächster Schritt möglich, aktuell über bestehende Produktdarstellung abgedeckt.
- Erweiterte Layout-Presets (z. B. explizit „Kompakte Preisliste“ als eigener Preset-Button) können später ergänzt werden.
