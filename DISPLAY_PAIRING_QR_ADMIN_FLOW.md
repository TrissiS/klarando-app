# Klarando Display Pairing (TV zeigt QR, Admin scannt)

## Neue API-Routen
- `POST /api/display/pairing/session`
- `GET /api/display/pairing/session/:pairingToken`
- `POST /api/admin/displays/pairing/claim`
- `GET /api/display/content`
- `POST /api/display/heartbeat`

## Ablauf
1. Display-App startet und prüft lokalen `deviceToken`.
2. Ohne Token wird eine Pairing-Session erstellt.
3. TV zeigt QR + Gerätecode (6-stellig, 5 Minuten).
4. Admin scannt/fügt Payload ein und bestätigt Filiale/Bildschirm.
5. Display pollt Status alle 3 Sekunden.
6. Bei `CLAIMED` wird `deviceToken` gespeichert und Inhalt geladen.

## Sicherheit
- Pairing-Token nur 5 Minuten gültig.
- Pairing-Session ist one-time (`PENDING` -> `CLAIMED`/`EXPIRED`).
- Pairing-Token und Device-Token werden gehasht gespeichert.
- Claim nur mit Admin-Rechten und Tenant-Scope.
- QR enthält keine dauerhaften Secrets.
