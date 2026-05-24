# Display Render Pipeline

## Flow
1. `Screen-Studio` speichert Design-/Inhaltswerte in `ScreenConfig` und Display-Metadaten (inkl. Distribution) in Device-`notes`.
2. Backend erstellt Runtime mit `buildDisplayRuntimeForDevice`.
3. `GET /api/display-runtime/:deviceCode/manifest` liefert Manifest + Runtime als primäre Quelle.
4. Display-App (`/screen/[deviceCode]`) lädt Runtime/Manifest, cached lokal und rendert daraus.

## Theme-System
Die Anzeige nutzt zuerst Runtime-Werte und fällt nur bei fehlenden Werten auf `feed.config` zurück:
- `layoutSettings`: Spalten, CardStyle, Größen, Animationen, Kategorie-/Zutatenflags
- `brandingSettings`: Farben, Logo, Hintergrundmodus/-medien, Schriftfamilie
- `contentSettings`: Kategorie-/Zutatenanzeige, Distribution

## Produktkarten
Produktkarten rendern aus manifestbasierten Daten:
- Name, Preis
- Kategorie (optional)
- Zutaten (optional)
- Badge/Farbe
- Variantengrößen

## Layout & Skalierung
- Auto-Dichte bei 1 Display und vielen Produkten
- Multi-Display Distribution über Runtime `distribution`:
  - `split-products`
  - `duplicate-all`
  - `category-based` (vorbereitet)

## Legacy-Styles
Alte harte `feed.config`-Renderpfade wurden auf Runtime-Merge umgestellt.
Fallback bleibt nur zur Rückwärtskompatibilität für bestehende TV-Sticks/DeviceCodes aktiv.

## Preview-Architektur
Screen-Studio-Vorschau zeigt Distribution pro simuliertem Display (`Display X von Y`) und Manifest-Debugdaten.
Die gespeicherten Werte gehen in dieselbe Runtime-Pipeline wie die echte Display-App.
