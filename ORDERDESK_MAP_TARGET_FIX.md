# OrderDesk Map Target Fix (P0 #2)

## Ursache
- Die Lieferkarten im Kassendisplay nutzten für das Ziel primär eine freie Adresssuche (`q=<Adresse>`).
- Diese Suche kann auf POIs (z. B. Tankstellen, Märkte) auflösen, wenn Straßenangaben unpräzise sind.
- Damit war das sichtbare Ziel nicht immer die echte Kunden-Lieferadresse.

## Datenquelle Lieferadresse
- Primär aus der Bestellung:
  - `customerAddress`
  - `customerZipCode`
  - `customerCity`
- Diese Felder werden zu einem Geocoding-Query kombiniert.

## Datenquelle Fahrerposition
- Unverändert aus `driver_tracking/location_ping` (AuditLog) über den Public Order-Display-Feed.
- Im Frontend verfügbar als `order.driverLocation`.

## Fix
- Zieladresse wird im Display nun zuerst geocodiert (Google Geocoding API über `NEXT_PUBLIC_GOOGLE_MAPS_API_KEY`).
- Karten nutzen danach Koordinaten statt unpräziser POI-Textsuche:
  - Zielkarte: Marker auf Ziel-Koordinaten
  - Route: Fahrer-Koordinaten -> Ziel-Koordinaten
- Wenn Fahrerposition fehlt:
  - Hinweis: "Fahrerposition noch nicht verfügbar."
- Wenn Zielkoordinaten noch fehlen/nicht geocodiert werden konnten:
  - Hinweis: "Lieferadresse vorhanden, Karte noch nicht verfügbar."
  - während Geocoding: "Lieferziel wird geocodiert..."

## Fallbacks
- Kein hartes Ausfallen der OrderCard/Map-Modal mehr bei fehlenden Koordinaten.
- Statt leerer iFrames werden klare Statushinweise angezeigt.

## Consent / Datenschutz
- Es werden keine zusätzlichen Kundendaten öffentlich gemacht.
- Map bleibt auf OrderDesk-/Kassendisplay-Kontext.
- Google Maps bleibt von bestehender Key-/Consent-Konfiguration abhängig; es wurde keine neue öffentliche Exposition eingeführt.

## Offene Punkte
- Für noch höhere Präzision kann später eine serverseitig persistierte Ziel-Koordinate pro Order ergänzt werden.
- ETA bleibt abhängig von verfügbarer Fahrerposition und externer Kartenberechnung.
