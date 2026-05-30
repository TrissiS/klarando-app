# Product Tags, Age Rating, Liter Price and Trade Catalog

## Überblick
Dieses Update erweitert die Produktverwaltung um kundenrelevante Kennzeichnungen, Altersfreigaben und Getränkelogik sowie einen zentralen Superadmin-Handelsartikelkatalog.

## Produkt-Kennzeichnungen
Pro Produkt wurden neue Flags ergänzt:
- `isVegetarian`
- `isVegan`
- `isSpicy`
- `isVerySpicy`
- `isNew`
- `isPopular`

Diese sind in der Admin-Produktbearbeitung pflegbar und werden im Public-Katalog (`/api/tenants/public/:tenantId/catalog`) mit ausgeliefert (`tags` Block).

## Altersfreigabe
Neues Enum `ProductAgeRestriction` mit:
- `NONE`
- `AGE_16`
- `AGE_18`

In der Produktverwaltung auswählbar und im Public-Katalog über `ageRestriction` sichtbar.
Checkout-Hinweise/harte Altersprüfung sind als nächster Schritt vorgesehen.

## Getränkedaten und Literpreis
Neue Produktfelder:
- `isBeverage`
- `contentVolumeLiters`
- `beverageContainerType`
- `deposit`

Literpreislogik:
- nur bei `isBeverage === true`
- nur wenn `contentVolumeLiters > 0`
- Berechnung: `price / contentVolumeLiters`

Ausgabe:
- Adminliste: `EUR/l`
- Public-Katalog: `literPrice`

## Zentraler Handelsartikel-Katalog
Neu:
- Prisma-Modell `TradeCatalogItem`
- Backend-Route `/api/trade-catalog` (SUPERADMIN)
- Superadmin-Seite `/superadmin/trade-catalog`

Inhalt:
- Name, Marke, Kategorie, EAN, Artikelnummer
- Inhalt Liter, Behältnis, Pfand
- Altersfreigabe, Aktiv-Status

Beim ersten Laden werden Basisartikel (z. B. Coca-Cola, Fanta, Sprite, Wasser, Ayran, Red Bull) als Starterdaten erzeugt.

## Business-Vorlagen ausblenden
- Admin-Navigation: Eintrag entfernt
- Superadmin-Navigation: Vorlagen-Einträge entfernt
- Schnelllinks auf Handelsartikel umgestellt
- Vorlagenlogik bleibt technisch erhalten (Legacy-Import)

## Offene Punkte
- Checkout-seitige Altersprüfung (Fahrer/Abholung) final erzwingen
- Customer-App Filter-UI (Vegetarisch/Vegan/Scharf) konkret visualisieren
- Übernahme-Flow „Aus Klarando-Katalog übernehmen“ im Admin als dedizierter Wizard
