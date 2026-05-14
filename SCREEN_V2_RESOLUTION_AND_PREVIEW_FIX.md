# Screen V2 Resolution And Preview Fix

## Ursache
- Auflösung und Spalten wurden an mehreren Stellen getrennt berechnet.
- Admin-Vorschau und Live-Screen nutzten nicht vollständig dieselben Ableitungen für Raster und Schrift.
- Globaler Einstellungsblock war dauerhaft groß sichtbar und hat den Arbeitsfluss gestört.

## Umgesetzte Fixes
- Zentrale Helper eingeführt in `lib/screen-display.ts`:
  - `normalizeDisplayResolution(settings)`
  - `getDisplayCanvasStyle(resolution, previewScale)`
  - `getDisplayColumns(settings, resolution)`
  - `getDisplayFontSizes(settings, resolution)`
  - `getKlarandoStandardBackground()`
- Admin-Preview (`app/admin/screen/page.tsx`) und Live-Screen (`app/screen/[deviceCode]/page.tsx`) verwenden diese gemeinsame Logik.
- Hintergrundmodus `KLARANDO_STANDARD` ergänzt (Frontend + Backend-Validierung).
- Spaltenlogik vereinheitlicht:
  - Unterstützt `Automatisch` plus `1` bis `5`.
  - Listenmodus erzwingt sichtbar erklärt `1` Spalte.
- Globale Einstellungen minimierbar gemacht, Zustand per `localStorage` gespeichert.
- Gerätebereich auf Karten mit eigener Vorschau pro Bildschirm erweitert.

## Globale Vs. Bildschirm-Einstellungen
- Globale Einstellungen bleiben Fallback.
- Bildschirm-Einstellungen können globale Werte überschreiben.
- Wenn keine Bildschirm-Spalten gesetzt sind, greift globale/automatische Logik.

## Klarando Standard Hintergrund
- Neuer Modus: `Klarando Standard`.
- Nutzt einen klaren Klarando-Hintergrundverlauf als Standard.
- Fallback auf bestehende Modi bleibt erhalten (`Farbe`, `Bild`, `Video`).

## Vorschau je Bildschirm
- Jede Bildschirmkarte zeigt eine Mini-Vorschau mit korrekt skaliertem Seitenverhältnis.
- „Vorschau öffnen“ nutzt die echte Screen-URL je Gerät.

## Offene Punkte
- Nächster Schritt: dedizierte `DisplayMenuRenderer`-Komponente extrahieren, damit Admin-Preview und Live-Ansicht auch strukturell 1:1 dieselbe JSX-Renderkomponente nutzen.
- Optional: per Bildschirm zusätzlich expliziten Hintergrundmodus-Override (nicht nur URL-Override) ergänzen.
