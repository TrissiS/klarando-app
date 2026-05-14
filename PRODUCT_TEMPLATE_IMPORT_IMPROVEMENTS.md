# Produktanlage & Vorlagenimport Verbesserungen

## Produktnummern aus Vorlagen
- Beim Übernehmen eines Vorlagenprodukts öffnet sich ein Dialog: **„Produkt aus Vorlage übernehmen“**.
- Dort kann der Admin vor dem Speichern eine eigene Produktnummer vergeben.
- Fallback-Regel:
  - Eingabe im Dialog gesetzt → diese Produktnummer wird verwendet.
  - Eingabe leer, Vorlage hat Artikelnummer → Vorlagen-Artikelnummer wird übernommen.
  - Beides leer → Produktnummer bleibt leer.

## EAN und weitere Felder beim Übernehmen
- EAN wird aus der Vorlage vorbelegt und kann im Dialog angepasst werden.
- Preis wird aus der Vorlage vorbelegt und kann angepasst werden.
- Kategorie wird per Namensabgleich auf vorhandene Tenant-Kategorie vorbelegt und bleibt editierbar.

## Eindeutigkeitsregel
- Produktnummer ist pro Filiale (`tenantId`) eindeutig.
- Technische Durchsetzung:
  - DB-Constraint: `@@unique([tenantId, productNumber])`
  - Backend-Validierung in `products.ts` vor `create` und `update`
  - Frontend zeigt bei Konflikt eine direkte Fehlermeldung am Feld.

## Verbesserte Produktanlage UI
- Produktnummer visuell prominenter dargestellt.
- Hinweis ergänzt: **„Produktnummer ist optional, aber empfohlen.“**
- Pflichtfelder klar markiert (z. B. Name, MwSt).
- Bereich „Aus Business-Vorlage übernehmen“ als schneller Einstieg ergänzt.
- Erweiterte Einstellungen bleiben einklappbar.

## Vorlagenqualität
- Vorlagenartikelnummern werden im Seed einheitlich generiert (z. B. `DÖN-001`, `PIZ-001`, `BUR-001`, `GET-001`).
- `articleNumber` und `ean` werden aus Template-Produkten beim Import in echte Produkte übernommen.

## Offene Punkte
- Optional später: automatischer Vorschlag der nächsten freien Produktnummer pro Kategorie/Präfix.
- Optional später: Massenübernahme mehrerer Vorlagenprodukte in einem Durchgang.
