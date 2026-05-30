# Display Link Migration

## Ziel
- Alle Oeffnen-/Preview-Links von Legacy-Route `/order-display/{displayCode}` auf `/screen/{deviceCode}` umstellen.

## Gefundene Stellen
- `app/admin/page.tsx`
- `backend/src/routes/access.ts`

## Geaenderte Dateien
- `app/admin/page.tsx`
  - Aktive Links im Admin-Dashboard (Bestell-Displays) nutzen jetzt `/screen/${code}`.
- `backend/src/routes/access.ts`
  - `loadDisplayOverviewRows`: `previewPath` fuer `ORDER_DISPLAY` nutzt jetzt `/screen/...`.
  - `GET /api/access/displays/:ref/preview`: `previewUrl` fuer `ORDER_DISPLAY` nutzt jetzt `/screen/...`.
  - Wenn nur `displayCode` vorhanden ist, wird zuerst ein passendes `ScreenDevice` im selben Tenant gesucht (`deviceCode` case-insensitive). Falls vorhanden, wird dessen `deviceCode` verwendet, sonst Fallback auf `displayCode`.

## Neue URL-Struktur
- Neu: `/screen/{deviceCode}`
- Legacy (bleibt nur als blockierte Hinweisseite): `/order-display/{displayCode}`
