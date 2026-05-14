# Cookie-/Consent P0 Fix

## Ziel
Das Consent-Banner ist auf `klarando.com` beim Erstbesuch sichtbar und wirksam. Zustimmung/Ablehnung/Einstellungen funktionieren, werden gespeichert und können später erneut geöffnet werden.

## Ursache
- Consent-Logik war verteilt (mehrere direkte `localStorage`-Reads).
- Es gab keinen zentralen Trigger, um Einstellungen aus der `/cookies`-Seite direkt wieder zu öffnen.

## Umsetzung
- Zentrale Consent-Helfer in `lib/cookie-consent.ts` eingeführt:
  - `COOKIE_CONSENT_KEY`
  - `buildDefaultCookieConsent(...)`
  - `readCookieConsent()`
  - `hasMapsConsent()`
  - `openCookieSettings()`
- `components/CookieConsentBanner.tsx` auf zentrale Helper umgestellt.
- Banner reagiert auf Event `klarando:open-cookie-settings`.
- `/cookies` enthält jetzt einen Button `Cookie-Einstellungen öffnen`, der das Banner direkt im Einstellungsmodus öffnet.
- Karten-/Standort-Freigabe nutzt zentrale Consent-Prüfung:
  - `app/main-app/page.tsx`
  - `app/Components/admin/ServiceAreaEditor.tsx`

## Verhalten nach Fix
1. **Erstbesuch:** Banner erscheint automatisch.
2. **Akzeptieren/Ablehnen:** Speicherung unter `localStorage["klarando.cookieConsent.v1"]`.
3. **Einstellungen:** Kategorien können einzeln gesetzt werden.
4. **Später ändern:**  
   - Floating-Button `Cookie-Einstellungen` (unten links), oder  
   - über `/cookies` mit „Cookie-Einstellungen öffnen“.
5. **Notwendig:** immer aktiv.
6. **Marketing/Analyse:** standardmäßig aus.
7. **Maps/Standort:** nur bei Zustimmung `maps=true` nutzbar.

## Manuelle Testliste
- Inkognito öffnen → Banner sichtbar.
- Startseite `/` → Banner sichtbar und bedienbar.
- Login/Admin-Seiten → Banner sichtbar und bedienbar.
- `/cookies` → Button öffnet Einstellungen.
- Nach Speichern Seite neu laden → Banner bleibt geschlossen, Einstellungen persistiert.
- Nach Ablehnung Standort-/Maps-Funktionen blockieren mit verständlichem Hinweis.
