# Screen Revalidate Crash Fix

## Fehlerbild
Auf `/screen/[deviceCode]` trat zur Laufzeit ein 500 auf mit:

`Invalid revalidate value`

## Root Cause
In `app/screen/[deviceCode]/page.tsx` wurden Route-Segment-Config-Exporte (`dynamic`, `revalidate`) in einer Client-Component verwendet. Diese Kombination verursachte den Crash im App-Router-Renderpfad.

## Umsetzung
- Entfernt:
  - `export const dynamic = 'force-dynamic'`
  - `export const revalidate = 0`

## Ergebnis
- `npm run build` erfolgreich.
- Route `/screen/[deviceCode]` wird wieder korrekt gebaut und kann serverseitig ausgeliefert werden, ohne Revalidate-Crash.
