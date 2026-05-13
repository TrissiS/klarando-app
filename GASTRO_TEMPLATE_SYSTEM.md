# Gastro Template System

## Überblick
Das Klarando-Template-System liefert branchenspezifische Demo-Vorlagen für neue Partner. Jede Vorlage enthält:
- Kategorien
- Produkte
- Zutaten
- Allergenzuordnung (TemplateAllergenCode A–N)
- Modifier-Vorschläge (als strukturierte Seed-Metadaten)

Die Daten werden über `backend/scripts/seed-business-templates.cjs` gepflegt.

## Technische Struktur
- Basismodelle:
- `BusinessTemplate`
- `BusinessTemplateCategory`
- `BusinessTemplateProduct`
- `BusinessTemplateIngredient`
- `BusinessTemplateProductIngredient`

- Seed-Strategie:
- Idempotent per `upsert`
- Keine destruktiven Operationen
- Produktionsschutz über:
- `NODE_ENV=production`
- `ALLOW_PRODUCTION_TEMPLATE_SEED=true` notwendig

## Vorlagen
1. Döner / Kebap (stark ausgearbeitet)
2. Pizzeria (stark ausgearbeitet)
3. Burger / Smashburger (stark ausgearbeitet)
4. Grill / Imbiss
5. Asiatisch
6. Café / Bäckerei
7. Getränkelieferdienst (stark ausgearbeitet)
8. Kiosk / Späti (stark ausgearbeitet)
9. Restaurant allgemein
10. Steakhouse / Grillhaus
11. Sushi
12. Vegan / Healthy Food
13. Foodtruck
14. Eisdiele / Dessert
15. Bar / Lounge

## Aufbau der Daten
- Kategorien sind displayfreundlich sortiert.
- Produktnamen sind bewusst kurz gehalten.
- Preise sind realistische Demo-Preise (keine rechtlich verbindliche Kalkulation).
- Allergene werden auf Zutatenebene gepflegt und beim Import in Tenant-Zutaten übertragbar.

## Modifier / Zusätze
Das Template-System speichert aktuell Modifier als Seed-Vorschläge (fachliche Grundlage). 
Die operative Produkt-Modifier-Konfiguration erfolgt tenant-spezifisch nach dem Import.

## Demo-Bilder / Assets
Aktuell sind keine festen Bilddateien im Seed enthalten.
Empfohlene Struktur (später):
- `public/demo-assets/templates/<template-key>/...`
- optionale Verknüpfung über Bild-URL pro Produkt/Kategorie

## Neue Branchen hinzufügen
1. `TEMPLATE_TYPES` in `backend/scripts/seed-business-templates.cjs` erweitern.
2. Datenblock in `DATA[templateKey]` ergänzen:
- Kategorien
- Zutaten
- Produkte
- Modifier-Vorschläge
3. Script ausführen:
- `npm --prefix backend run seed:business-templates`

## Templates erweitern
- Zusätzliche Kategorien/Produkte/Zutaten einfach in `DATA[...]` ergänzen.
- Durch `upsert` bleiben bestehende IDs stabil; Einträge werden aktualisiert statt gelöscht.

## Besonders vollständige Vorlagen
Für Demo/Onboarding zuerst empfohlen:
- Döner / Kebap
- Pizzeria
- Burger / Smashburger
- Getränkelieferdienst
- Kiosk / Späti
