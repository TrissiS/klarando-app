# Production API URL Fix

## Problem
Im Produktions-Frontend wurden Display-Runtime-Requests auf `http://localhost:4000` gebaut.  
Dadurch entstanden Fehler wie:

- `GET http://localhost:4000/api/display-runtime/... ERR_CONNECTION_REFUSED`

## Ursache
- In `lib/display-runtime.ts` war eine eigene API-Basislogik hinterlegt:
  - `NEXT_PUBLIC_API_URL || NEXT_PUBLIC_API_BASE_URL || http://localhost:4000`
- Diese Logik umging die zentrale Produktionsauflösung aus `lib/config.ts`.

## Fix
- `lib/display-runtime.ts` nutzt jetzt ausschließlich die zentrale `API_BASE_URL` aus `lib/config.ts`.
- Keine lokale Fallback-URL mehr in der Display-Runtime.

## Produktionsauflösung jetzt
- Browser auf echten Domains (`klarando.com`, `www.klarando.com`, `app.klarando.com`, `admin.klarando.com`) → `https://api.klarando.com`
- Lokal (`localhost`) → `http://localhost:4000`

## ENV-Hinweis
- Pflicht in Produktion:
  - `NEXT_PUBLIC_API_BASE_URL=https://api.klarando.com`
- Optionaler Legacy-Alias:
  - `NEXT_PUBLIC_API_URL=https://api.klarando.com`

Beide Werte dürfen in Produktion **nicht** auf `localhost` zeigen.
