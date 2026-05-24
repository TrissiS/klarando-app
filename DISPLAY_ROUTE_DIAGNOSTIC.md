# Display Route Diagnostic

## TV-Routen im Projekt
- `/screen/[deviceCode]` -> `app/screen/[deviceCode]/page.tsx`
- `/order-display/[displayCode]` -> `app/order-display/[displayCode]/page.tsx`
- `/terminal/[terminalCode]` -> `app/terminal/[terminalCode]/page.tsx`

## Aktuelle Renderer-Dateien
- Manifest-Menürenderer (primär für Speisekarten-TV): `app/screen/[deviceCode]/page.tsx`
- Order-/Küchen-/Pickup-Renderer: `app/order-display/[displayCode]/page.tsx`
- Terminal-Renderer: `app/terminal/[terminalCode]/page.tsx`

## Warum alte Darstellung sichtbar war
- Es gab keine harte Sichtbarkeit, welche TV-Route wirklich läuft.
- Dadurch wurde häufig die falsche Route (z. B. Order-Display) für das Problem gehalten.
- Zusätzlich war der Manifest-Pfad auf `/screen/[deviceCode]` nicht strikt erzwungen.

## Behoben
- Diagnose-Overlay auf allen drei TV-Routen mit Route/Renderer/API/IDs.
- `/screen/[deviceCode]` lädt Runtime jetzt strikt aus Manifest (`strictManifest=true`).
- Bei fehlendem Manifest: sichtbare Fehlermeldung statt stiller Legacy-Annahme.
- Debug-Aktionen auf `/screen/[deviceCode]`:
  - Manifest neu laden
  - Cache löschen
  - Manifest-Debug ein/aus

## Erwartete Prüfung
1. TV öffnen und Overlay prüfen: Route + Renderer
2. Bei Menü-TV muss stehen:
   - Route `/screen/[deviceCode]`
   - Runtime API `/api/display-runtime/:deviceCode/manifest`
3. Falls nicht: TV nutzt falsche Route und muss auf richtige URL umgestellt werden.
