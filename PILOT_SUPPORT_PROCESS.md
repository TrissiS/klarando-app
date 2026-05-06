# Pilot Supportprozess (MVP)

Stand: 06.05.2026

## Ziel
Ein einheitlicher Ablauf fuer Pilot-Incidents, damit Bestellausfaelle schnell erkannt und bearbeitet werden.

## Schweregrade
- `S1 (kritisch)`: Keine Bestellungen moeglich, OrderDesk komplett offline, Backend nicht erreichbar.
- `S2 (hoch)`: Teilfunktion gestoert (z. B. Fahrerzuweisung/Status haengt), Workaround vorhanden.
- `S3 (normal)`: UI-/Datenproblem ohne direkten Betriebsstopp.

## SLA fuer Pilot
- `S1`: Reaktion <= 15 Minuten, Workaround/Fix <= 60 Minuten.
- `S2`: Reaktion <= 60 Minuten, Workaround/Fix <= 4 Stunden.
- `S3`: Reaktion <= 1 Arbeitstag, Fix geplant im naechsten Sprint.

## Verbindlicher Incident-Ablauf
1. Ticket sofort anlegen (`Zeit`, `Filiale`, `Betroffene Rolle/App`, `Fehlerbild`, `Bestellnummer falls vorhanden`).
2. Schweregrad `S1/S2/S3` setzen.
3. Incident-Owner benennen (eine verantwortliche Person).
4. Sofortmassnahme eintragen (Workaround/Neuzuweisung/Neustart).
5. Abschluss erst nach dokumentierter Ursache + Praeventionsmassnahme.

## Pflichtfelder pro Ticket
- `tenantId` / Filialname
- betroffene Route/App (z. B. `POST /api/orders`, OrderDesk, Driver-App)
- Zeitraum + Zeitzone
- Screenshots/Logs (falls vorhanden)
- Incident-Owner
- aktueller Status (`offen`, `in Arbeit`, `beobachten`, `geschlossen`)

## Eskalationskette
1. Pilot-Support (erste Sichtung)
2. Backend-Oncall (API/DB/Orders)
3. Produktverantwortung (bei Prozess-/MVP-Entscheidungen)

## Pilot-Checkliste vor Schichtstart
- `/api/health` und `/api/health/ready` liefern `ok: true`.
- Mindestens ein OrderDesk ist online.
- Mindestens ein Fahrergeraet sendet Heartbeats.
- Letzter DB-Backup-Lauf erfolgreich.
