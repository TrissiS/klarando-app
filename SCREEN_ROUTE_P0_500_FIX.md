# Screen Route P0 500 Fix

## Ursache
Die Route `app/screen/[deviceCode]/page.tsx` war als Client-Component (`'use client'`) markiert und exportierte gleichzeitig Route-Segment-Config (`dynamic`/`revalidate`).

In Next.js (App Router) sind diese Exporte in diesem Setup nicht stabil erlaubt und führten beim Rendern von `/screen/[deviceCode]` zu:

`Invalid revalidate value`

Dadurch wurde die Seite mit HTTP 500 beendet.

## Fix
- Entfernt in `app/screen/[deviceCode]/page.tsx`:
  - `export const dynamic = 'force-dynamic'`
  - `export const revalidate = 0`

Die Route läuft jetzt wieder als normale Client-Page ohne fehlerhafte Segment-Config-Exports.

## Stabilität
- Build läuft wieder erfolgreich.
- Die Route `/screen/[deviceCode]` wird wieder als dynamische Seite gebaut.
- Legacy-Route `/order-display/[displayCode]` bleibt unverändert als Hinweisroute.
