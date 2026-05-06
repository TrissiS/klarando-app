# Pilot Monitoring (Minimal)

Stand: 06.05.2026

## Endpoint-Signale
- `GET /api/health`
  - Basis-Liveness (`ok`, `uptimeSeconds`, `startedAt`, `serverTime`)
- `GET /api/health/ready`
  - Readiness inkl. DB-Check (`SELECT 1`)
  - Bei DB-Ausfall: HTTP `503`, `ok: false`, `checks.database: "down"`

## Empfohlene Alarmregeln (MVP)
- `S1`: `/api/health` nicht erreichbar > 2 Minuten.
- `S1`: `/api/health/ready` liefert 2x hintereinander HTTP `503`.
- `S2`: 5xx-Rate > 5% fuer 5 Minuten.

## Kurz-Setup (z. B. UptimeRobot / Better Stack)
1. HTTP-Check auf `/api/health` alle 60 Sekunden.
2. HTTP-Check auf `/api/health/ready` alle 60 Sekunden.
3. Alarmziel definieren (Oncall/E-Mail/Telefon) fuer S1.
4. Incident in `PILOT_SUPPORT_PROCESS.md` dokumentieren.
