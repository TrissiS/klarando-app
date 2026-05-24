# Display Route Diagnostic

## Aktive TV-Route feststellen
Auf allen drei Display-Routen ist jetzt ein **dauerhaft sichtbares Diagnose-Badge** oben links:
- `/screen/[deviceCode]`
- `/order-display/[displayCode]`
- `/terminal/[terminalCode]`

Angezeigt werden u. a.:
- Route
- Renderer-Version
- Build-Version
- Commit-ID
- Runtime-API
- Manifest-Version
- Gerätecode
- showCategories/showIngredients
- loadedAt

## Harte Manifest-Regel
`/screen/[deviceCode]` nutzt jetzt strikt:
- `GET /api/display-runtime/:deviceCode/manifest`

Wenn kein gültiges Manifest geladen wird:
- **kein stiller Legacy-Fallback**
- stattdessen Fehlerbildschirm:
  `STRICT MANIFEST FAILED - Legacy Renderer disabled`

## Debug-Aktionen auf /screen
- Manifest Debug ein/aus
- Manifest neu laden
- Cache löschen

## Warum alte Darstellung weiterhin sichtbar sein konnte
Hauptursachen:
1. TV öffnet nicht `/screen/[deviceCode]`, sondern `/order-display/...` oder `/terminal/...`
2. Stale Runtime/Browser-Cache
3. Alte URL in TV-App/WebView gespeichert

Mit dem Badge ist die echte Route jetzt sofort eindeutig sichtbar.
