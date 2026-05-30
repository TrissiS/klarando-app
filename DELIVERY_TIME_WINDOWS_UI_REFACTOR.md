# Delivery Time Windows UI Refactor

## Alte Probleme
- Zeitfenster wurden als große vertikale Blöcke dargestellt.
- Bei mehreren Tagen/Slots wurde die Seite schnell sehr lang und unübersichtlich.
- Validierungsfehler waren nicht tagbezogen sichtbar.

## Neue Wochenübersicht
- Kompakte Wochenplanung pro Wochentag (Mo-So).
- Zeilenstruktur pro Tag:
  - Tag
  - Aktiv/Inaktiv
  - Zeitfenster (Von/Bis)
  - Max. Aufträge
  - Aktionen
- Aktive Liefertage als kompakte Chips.

## Bedienung
- `+ Zeitfenster` pro Tag.
- `Auf alle kopieren` pro Tag.
- Standardvorlagen pro Tag:
  - Vormittag 09:00-12:00
  - Mittag 12:00-15:00
  - Nachmittag 15:00-18:00
  - Ganztägig 09:00-18:00
  - Leer starten
- Globale Standardvorlagen für alle Tage sowie `Alle Zeitfenster leeren`.

## Validierungen
Tagbezogen eingebaut:
- Bis-Zeit muss größer als Von-Zeit sein.
- Überlappende Zeitfenster am selben Tag werden erkannt.
- Leere Uhrzeiten werden gemeldet.
- Negative `maxOrders` werden gemeldet.
- Aktiver Tag ohne Zeitfenster wird gemeldet.

## Datenformat
Bestehende Struktur bleibt erhalten:
- `settings.deliveryScheduling.timeSlots[]` mit
  - `day`
  - `start`
  - `end`
  - `maxOrders`

## Offene Punkte
- Optional später: persistente `sticky` Save-Bar.
- Optional später: intelligente Sortierung bei manueller Eingabe.
