# Klarando Business Template System Plan

## Zielbild
Neue Betriebe sollen beim Onboarding eine passende Betriebsart waehlen koennen und daraus Kategorien, Produkte, Zutaten und Allergen-Hinweise in den Ziel-Tenant importieren. Der Import erzeugt immer Tenant-eigene Kopien.

## Ist-Analyse
- `Tenant`, `Category`, `Product`, `Ingredient`, `ProductIngredient` existieren bereits und sind tenant-basiert.
- Ein separates `Allergen`-Model existiert aktuell nicht. Allergene werden heute als Code-String in `Ingredient.allergens` gespeichert.
- Tenant-Scope-Guard existiert zentral in `backend/src/lib/tenant-scope.ts`.
- Produkt-/Kategorie-/Zutaten-Routen sind bereits tenant-geschuetzt.
- Seed-Strukturen existieren (`seed-basic-data.cjs`, `seed-test-tenants.js`), aber bisher kein globales Vorlagenmodell.

## Datenmodell-Vorschlag (MVP)
- `BusinessTemplate`
- `BusinessTemplateCategory`
- `BusinessTemplateProduct`
- `BusinessTemplateIngredient`
- `BusinessTemplateProductIngredient`
- `BusinessTemplateType` Enum fuer 15 Betriebsarten
- `TemplateAllergenCode` Enum (`A` bis `N`)

Wichtige Prinzipien:
- Vorlagen sind global (kein `tenantId` in den Template-Tabellen).
- Import erstellt Kopien in `Category`, `Product`, `Ingredient`, `ProductIngredient` mit `tenantId`.
- Deduplizierung beim Import erfolgt tenant-intern.

## Import-Flow (MVP)
1. Berechtigter User waehlt Vorlage und Ziel-Tenant.
2. Backend prueft Rolle + Tenant-Scope.
3. Import-Service laedt Template inkl. Kategorien, Zutaten, Produkte, Produkt-Zutaten-Relationen.
4. Kategorien werden per Name tenant-intern dedupliziert, sonst angelegt.
5. Zutaten werden per Name tenant-intern dedupliziert, sonst angelegt.
6. Produkte werden per `productNumber` (Fallback Name) tenant-intern dedupliziert, sonst angelegt.
7. Produkt-Zutaten-Links werden nur angelegt, wenn im Tenant noch nicht vorhanden.
8. Ergebnis (Anzahl neu angelegter Datensaetze) wird zurueckgegeben und auditiert.

## Admin-/Superadmin-Flow
- `GET /api/business-templates`
- `GET /api/business-templates/:id`
- `POST /api/business-templates/:id/import`

Rollen:
- `SUPERADMIN`: import in jeden erlaubten Tenant
- `CHAINADMIN`: nur Tenants der eigenen Chain
- `ADMIN`: nur eigener Tenant
- `STAFF`/`DRIVER`: kein Import

## Tenant-Schutz
- Import-Route nutzt `resolveTenantScope(...)` mit `tenantId` aus Body.
- Keine ungepruefte Tenant-Uebernahme.
- Bei `CHAINADMIN` zusaetzliche Kettenpruefung gegen Ziel-Tenant.
- Keine globalen Template-Daten direkt in operative Tabellen eingeblendet.

## MVP-Umfang
- Struktur fuer alle 15 Betriebsarten vorhanden.
- Seed-Daten initial fuer 4 Typen:
  - Doener / Kebap
  - Pizzeria
  - Burger / Smashburger
  - Grill / Imbiss
- Kein automatischer Aufruf in Produktion.
- Kein Delete/Reset, nur additive Upserts in Template-Seed.

## Spaetere Erweiterungen
- Vollstaendige Befuellung aller 15 Betriebsarten.
- Versionsmodell fuer Vorlagen (`templateVersion`, `changelog`).
- Selektiver Import (nur Kategorien, nur Produkte, nur Zutaten).
- Konflikt-UI (was bei bestehenden Produkten passieren soll).
- Optionales Allergen-Normalisierungsmodell als eigene Tabelle.
- Optionales Modul fuer tenant-spezifische Vorlagenkopien (custom templates).
