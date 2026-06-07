# DELIVERY_AVAILABILITY_DEBUG_AUDIT

## Status

- Bewertung: `ROT`
- Ergebnis: Die beobachtete Kombination
  - Lieferfenster `08:00 - 22:00`
  - Zeitpunkt `08:47`
  - Blocking Reason `OUTSIDE_DELIVERY_WINDOWS`
  - Nächste Lieferung `10:00`
  ist nach der aktuellen Implementierung technisch erklärbar, aber fachlich sehr wahrscheinlich ein Bug.

## Kurzfazit

Die neue `DeliveryAvailability`-Berechnung mischt zwei verschiedene Zeitkonzepte:

1. Konfigurierte Lieferfenster werden als lokale Uhrzeiten-Strings wie `08:00` bis `22:00` behandelt.
2. Die eigentliche Berechnung nutzt `Date.getHours()`, `Date.getMinutes()`, `Date.getDay()` und `Date.setHours()` aus der Laufzeitumgebung des Servers.

Dadurch hängt das Ergebnis von der Server-Zeitzone ab. Wenn der Server nicht dieselbe lokale Zeitzone wie der Gastronom bzw. die App verwendet, entstehen genau die beobachteten Widersprüche.

Beispiel:

- Kunde/Admin sieht lokal `08:47` in `Europe/Berlin`
- Server rechnet intern z. B. in `UTC`
- dieselbe absolute Zeit ist serverseitig `06:47`
- Fenster `08:00 - 22:00` wird dadurch intern als noch nicht geöffnet bewertet
- `OUTSIDE_DELIVERY_WINDOWS` wird gesetzt
- `nextDeliveryAt` wird als `08:00` Server-Zeit erzeugt
- im Browser erscheint dieser Zeitpunkt dann als `10:00` lokale Zeit

Das passt exakt zu dem gemeldeten Verhalten.

---

## 1. Warum wird `OUTSIDE_DELIVERY_WINDOWS` gesetzt?

`OUTSIDE_DELIVERY_WINDOWS` wird gesetzt, wenn es zwar Lieferfenster für den Tag gibt, der aktuelle Zeitpunkt aber nicht innerhalb dieser Fenster liegt.

Relevanter Code in [backend/src/lib/delivery-availability.ts](C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app\backend\src\lib\delivery-availability.ts):

- `buildDeliveryAvailability(...)`
- `todayDeliveryWindows = buildDeliveryWindowsForDate(settings, now)`
- `isWithinTodayWindow = isNowWithinWindows(todayDeliveryWindows, now)`

Dann:

```ts
if (!hasWindowsToday) {
  blockingReasons.push('NO_DELIVERY_WINDOWS_AVAILABLE')
} else if (!isWithinTodayWindow) {
  blockingReasons.push('OUTSIDE_DELIVERY_WINDOWS')
}
```

Das heißt:

- Es gibt mindestens ein Fenster für heute.
- Aber `isNowWithinWindows(...)` liefert `false`.

---

## 2. Welche Bedingung löst das aus?

Die konkrete Bedingung liegt in `isNowWithinWindows(...)`:

```ts
const nowMinutes = minutesFromDate(now)
return windows.some((window) => {
  const startMinutes = toMinutes(window.start)
  const endMinutes = toMinutes(window.end)
  return nowMinutes >= startMinutes && nowMinutes < endMinutes
})
```

Und `minutesFromDate(now)` ist:

```ts
return value.getHours() * 60 + value.getMinutes()
```

Damit ist die auslösende Bedingung:

- `now.getHours()` / `now.getMinutes()` liegen außerhalb des konfigurierten Fensters.

Wichtig:

- Diese Berechnung verwendet die lokale Zeitzone des Node-Prozesses auf dem Server.
- Die Fenster `08:00`, `22:00` sind nur nackte Uhrzeit-Strings ohne Zeitzonenbezug.

---

## 3. Welche Uhrzeit wird intern verwendet?

Intern wird entweder verwendet:

- `input.now`, wenn der API-Aufrufer `at` übergibt
- oder `new Date()`, wenn kein `at` übergeben wird

Relevante Stellen:

- In [backend/src/routes/delivery.ts](C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app\backend\src\routes\delivery.ts):
  - `const parsedAt = at ? new Date(at) : null`
  - `now: parsedAt ?? new Date()`

- In [backend/src/lib/delivery-availability.ts](C:\Users\Tristan Stenger\Documents\New project\klarando\klarando-app\backend\src\lib\delivery-availability.ts):
  - `const now = input.now ?? new Date()`

Für die Admin-Debug-Vorschau ohne manuell gesetztes `at` bedeutet das:

- intern wird die aktuelle Serverzeit verwendet.

Nicht verwendet wird:

- eine explizite Tenant-Zeitzone
- eine feste Zeitzone wie `Europe/Berlin`
- eine Normalisierung der Uhrzeit auf den Filialstandort

---

## 4. Welche Zeitzone wird verwendet?

Explizit: keine.

Faktisch verwendet die Berechnung die Zeitzone der Node.js-Laufzeitumgebung, weil folgende Methoden zeitzonenabhängig sind:

- `getHours()`
- `getMinutes()`
- `getDay()`
- `setHours()`
- `toLocaleString(...)` ohne `timeZone`

In `delivery-availability.ts` gibt es keine Stelle mit:

- `timeZone: 'Europe/Berlin'`
- `Intl.DateTimeFormat(..., { timeZone: ... })`
- oder einer tenantbezogenen Zeitzonenauflösung

Deshalb hängt die Logik davon ab, in welcher Server-Zeitzone der Backend-Prozess läuft.

Wenn der Server in `UTC` läuft und der Nutzer in Deutschland sitzt, entstehen typischerweise +2 Stunden Abweichung im Juni.

---

## 5. Welche Slots werden verwendet?

Die Slot-Logik kommt aus:

- `settings.timeManagement.deliveryScheduling.timeSlots`

Relevante Funktionen:

- `hasConfiguredTimeSlots(...)`
- `buildSlotRangesForDate(...)`
- `buildDeliveryWindowsForDate(...)`

Die Logik arbeitet so:

1. Zuerst wird ein Basisfenster gebildet:
   - Schnittmenge aus `openingHours` und `deliveryHours`

2. Wenn **keine** konfigurierten Slots vorhanden sind:
   - Rückgabe eines einzigen Fensters vom Typ `BASE_WINDOW`

3. Wenn Slots vorhanden sind:
   - Nur die Slots des aktuellen Wochentags werden genutzt
   - Diese werden mit Feiertagszeiten beschnitten
   - Danach werden sie mit dem Basisfenster geschnitten
   - Ergebnisfenster haben `source: 'SLOT'`

Wichtig:

- `todayDeliveryWindows` kann also entweder
  - das reine Basisfenster enthalten oder
  - nur Slot-Fenster enthalten.

Die gemeldete Anzeige `08:00 - 22:00` deutet eher auf ein `BASE_WINDOW` hin.
Die gemeldete `Nächste Lieferung: 10:00` passt dagegen sehr gut zu einem Zeitzonenversatz bei der Berechnung eines Startzeitpunkts aus `08:00`.

---

## 6. Warum wird `10:00` als nächste Lieferung berechnet?

`nextDeliveryAt` wird in `getNextDeliveryAt(...)` berechnet.

Die Funktion:

1. bestimmt einen Starttag mit `leadDays`
2. baut für jeden Tag die Delivery-Fenster
3. nimmt das erste Fenster, dessen Startzeitpunkt in der Zukunft liegt

Entscheidend ist diese Stelle:

```ts
const candidate = new Date(date)
candidate.setHours(Number(hoursRaw), Number(minutesRaw), 0, 0)
if (candidate.getTime() > now.getTime()) {
  return candidate
}
```

Das Problem:

- `window.start` ist ein lokaler String wie `08:00`
- `candidate.setHours(8, 0, 0, 0)` interpretiert diese Uhrzeit in der Server-Zeitzone
- Im Browser wird `candidate` später wieder in der lokalen Nutzerzeitzone dargestellt

Wenn der Server in `UTC` läuft und der Nutzer in `Europe/Berlin`, dann wird:

- `08:00` serverseitig als `08:00 UTC` gebaut
- im Browser als `10:00` angezeigt

Genau dadurch kann aus einem lokal erwarteten Start um `08:00` eine angezeigte nächste Lieferung um `10:00` werden.

---

## 7. Ist das korrekt oder Bug?

Bewertung: `Bug`

### Warum?

Fachlich sollen die konfigurierten Lieferzeiten aus Sicht der Filiale und des Kunden gelten.

Eine Berechnung ist dafür nur dann korrekt, wenn:

- dieselbe Zeitzone für
  - aktuellen Zeitpunkt
  - Tagesgrenze
  - Wochentag
  - Fenstervergleich
  - nächste Lieferzeit
  verwendet wird

Das ist aktuell nicht sichergestellt.

### Konkret problematische Stellen

- `minutesFromDate(now)` mit `getHours()` / `getMinutes()`
- `DAY_BY_INDEX[date.getDay()]`
- `startOfDay(...)` mit `setHours(0,0,0,0)`
- `candidate.setHours(...)`
- `formatCustomerDateTime(...)` ohne feste Zeitzone

### Fachliche Folge

Folgende Kombination ist möglich:

- Fenster werden als lokale deutsche Geschäftszeiten gepflegt
- der Server interpretiert `now` in UTC
- das System hält die Filiale für noch geschlossen
- trotzdem sieht der Admin lokale Uhrzeiten
- dadurch entsteht eine widersprüchliche Debug-Ansicht

Diese Inkonsistenz ist für Go-Live relevant.

---

## Technische Einordnung des konkreten Widerspruchs

Die beobachtete Kombination ist am plausibelsten durch einen Zeitzonenversatz erklärbar:

1. Konfiguriertes Fenster: `08:00 - 22:00`
2. Admin sieht lokal: `08:47`
3. Backend rechnet intern z. B. mit `06:47` in UTC
4. `06:47` liegt außerhalb von `08:00 - 22:00`
5. daher `OUTSIDE_DELIVERY_WINDOWS`
6. nächster Start `08:00` Server-Zeit
7. im Browser dargestellt als `10:00`

Das ist konsistent mit dem Code und konsistent mit dem gemeldeten Symptom.

---

## Empfehlung

Vor einem produktiven Rollout sollte die Delivery-Availability-Zeitlogik vereinheitlicht werden.

Mindestens nötig:

1. Eine kanonische Zeitzone definieren
   - idealerweise tenantbezogen
   - mindestens aber `Europe/Berlin`, solange Klarando nur lokal in DE genutzt wird

2. Alle Zeitoperationen darauf umstellen
   - Tagesstart
   - Wochentag
   - Fenstervergleich
   - `nextDeliveryAt`
   - Formatierung der Kundentexte

3. Debug-Ausgabe erweitern
   - `evaluatedAt`
   - `evaluatedTimeZone`
   - `internalNowLocal`
   - `windowComparisonNowMinutes`

---

## Schlussbewertung

- `OUTSIDE_DELIVERY_WINDOWS`: technisch erklärbar
- `10:00` als nächste Lieferung: technisch erklärbar
- Kombination mit sichtbarem Fenster `08:00 - 22:00` bei lokal `08:47`: fachlich widersprüchlich
- Gesamturteil: `Bug in der Zeit-/Zeitzonenbehandlung`, nicht nur ein Anzeigeproblem
