# Service Area Polygon Fix

## Ursache
- `POLYGON` hat bisher strikt `matchedByPolygon` erzwungen.
- Wenn kein gültiges Polygon (`< 3 Punkte`) gespeichert war, ergab die Prüfung immer `false`.
- Dadurch wurde die Filiale in der Customer-App als „nicht verfügbar/geschlossen“ dargestellt, obwohl PLZ-Regeln gültig waren.

## Neue Fallbacklogik
- Strategie `POLYGON`:
  - gültiges Polygon + Koordinaten vorhanden: Punkt-in-Polygon wird verwendet
  - Polygon ungültig/fehlend + PLZ-Liste vorhanden: PLZ-Fallback (`usedZipFallback = true`)
  - Polygon vorhanden, aber keine Koordinaten + PLZ-Liste vorhanden: PLZ-Fallback
  - weder gültiges Polygon noch PLZ-Regel: `configurationIncomplete = true`
- Status-Trennung:
  - Öffnungszeiten/Ordering bleiben eigene Logik
  - Liefergebiet liefert eigene Statushinweise (`CONFIG_PENDING`, `LOCATION_REQUIRED`, `OUT_OF_AREA`)

## Unterschied: Geschlossen vs. Liefergebiet
- **Geschlossen**: nur durch Öffnungs-/Bestelllogik
- **Nicht lieferbar**: außerhalb Liefergebiet
- **Liefergebiet wird geprüft**: Polygonregel aktiv, aber unvollständig konfiguriert

## GeoJSON / Koordinaten-Hinweis
- Normalisierung akzeptiert jetzt:
  - `{ lat, lng }`
  - Arrays `[lng, lat]` (GeoJSON-Reihenfolge)
  - GeoJSON-ähnliche `Polygon`-Strukturen
- Doppelte Endpunkte (geschlossenes Polygon mit identischem erstem/letztem Punkt) werden bereinigt.

## Admin-Hinweis
- In der ServiceArea-UI erscheint bei `POLYGON` + `<3` Punkten:
  - „Für Polygonprüfung ist noch kein gültiges Gebiet gezeichnet. Bis dahin wird die PLZ-Regel verwendet.“

## Manuelle Testfälle
- `ruleType=ZIP_LIST`, PLZ `57223` erlaubt => lieferbar
- `ruleType=POLYGON`, kein Polygon, PLZ `57223` erlaubt => lieferbar (PLZ-Fallback)
- `ruleType=POLYGON`, gültiges Polygon, Punkt innen => lieferbar
- `ruleType=POLYGON`, gültiges Polygon, Punkt außen => außerhalb Liefergebiet
- `ruleType=POLYGON`, GeoJSON `[lng,lat]` => korrekt normalisiert
- Öffnungszeit geschlossen => geschlossen, unabhängig vom Liefergebiet

## Offene Punkte
- Erweiterte visuelle Polygon-Validierung (Selbstschnitt, Mindestfläche) kann später ergänzt werden.
- Optional dedizierte Kundenmeldung in Checkout/Adressdialog analog zur Startseite erweitern.
