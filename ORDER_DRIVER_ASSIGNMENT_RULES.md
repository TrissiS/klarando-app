# ORDER_DRIVER_ASSIGNMENT_RULES

## Ziel
- Fahrerzuweisung folgt technisch einer klaren Prioritaet:
  - `assignedDriverId` ist die kanonische Identitaet
  - `assignedDriverName` ist Snapshot-/Anzeige-Feld und Legacy-Fallback

## Aktuelle Regel
1. Wenn bei einer Zuweisung eine echte Fahrer-ID bekannt ist, wird diese als Master gespeichert.
2. Wenn eine Fahrer-ID bekannt ist, wird `assignedDriverName` nur noch als kanonischer Anzeigename des aufgeloesten Fahrers gespeichert.
3. Freie Namenseingaben duerfen eine vorhandene ID-Zuordnung nicht mehr ueberschreiben.
4. Namens-Fallback ist nur noch fuer Legacy-/Device-Faelle ohne gespeicherte `assignedDriverId` erlaubt.

## Matching-Regeln
- Fahrer-User mit `driverUserId`
  - matcht zuerst nur auf `assignedDriverId`
  - faellt nur dann auf `assignedDriverName` zurueck, wenn die Bestellung keine `assignedDriverId` gespeichert hat
- Device-/Legacy-Akteure ohne `driverUserId`
  - duerfen nur Bestellungen sehen/nutzen, die ebenfalls keine `assignedDriverId` haben und per `assignedDriverName` passen

## Sicherheitswirkung
- Gleichnamige Fahrer koennen eine bereits per ID vergebene Bestellung nicht mehr ueber Namensvergleich uebernehmen.
- Device-Sessions ohne gebundene Fahrer-ID sehen keine Auftraege mehr, die bereits hart an einen Fahrer-User gebunden sind.
- Historische name-only Zuweisungen bleiben weiterhin nutzbar, solange keine `assignedDriverId` gesetzt ist.

## Geaenderte Stellen
- `backend/src/lib/driver-assignment.ts`
- `backend/src/lib/order-dispatch.ts`
- `backend/src/routes/orders.ts`
- `backend/src/routes/order-displays.ts`

## Bewusst nicht umgesetzt
- Keine Datenmigration alter Bestellungen
- Keine Entfernung des Felds `assignedDriverName`
- Kein neues Dispatch-Modell
- Keine neue Statuslogik

## Naechster sauberer Schritt
- Mittelfristig sollten neue produktive Fahrerzuweisungen nur noch ueber echte Fahrer-User-IDs erfolgen.
- `assignedDriverName` sollte dann nur noch als Snapshot fuer Anzeige, Bons und Historie verbleiben.
