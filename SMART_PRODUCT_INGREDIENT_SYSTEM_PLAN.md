# Smart Product, Ingredient & Allergen System Plan

## 1. Ziel des Systems
Klarando soll das bestehende Business-Template-System so erweitern, dass ein Tenant den Import gezielt steuern kann:
- nur gewünschte Bereiche importieren (Kategorien, Produkte, Zutaten, Verknüpfungen)
- Allergene aus Template-Zutaten übernehmen
- Preisvorschläge optional übernehmen
- bestehende Daten standardmäßig schützen (kein Überschreiben ohne Opt-in)

## 2. Datenmodell-Erweiterungen
Ist-Zustand (bereits vorhanden):
- `BusinessTemplate`, `BusinessTemplateCategory`, `BusinessTemplateProduct`, `BusinessTemplateIngredient`, `BusinessTemplateProductIngredient`
- `BusinessTemplateIngredient.allergens` als `TemplateAllergenCode[]`
- Tenant-Zutaten haben `Ingredient.allergens` (String)

MVP-Erweiterung ohne Schema-Bruch:
- Keine neue Tabelle notwendig
- Importoptionen als Request-Payload (API-/Service-Ebene)
- Import-Ergebnis erweitert (inkl. `productsUpdated`, `allergensApplied`, `skippedExisting`)

## 3. Import-Optionen
Neue optionale Flags am Import-Endpunkt:
- `importCategories`
- `importProducts`
- `importIngredients`
- `importProductIngredients`
- `importAllergens`
- `importPriceSuggestions`
- `overwriteExisting`

Regeln:
- Wenn Flags fehlen: abwärtskompatibles Default-Verhalten (alles an, außer `overwriteExisting=false`)
- Ohne `overwriteExisting`: keine Bestandsdaten überschreiben
- Mit `overwriteExisting=true`: bestehende Datensätze gezielt aktualisieren

## 4. Allergen-Automatik
MVP:
- Template-Zutat trägt Allergen-Codes
- Beim Import werden diese (falls aktiviert) auf Tenant-Zutat übertragen

Später:
- Produkt-Allergene dynamisch aus verknüpften Zutaten berechnen
- Konsistente Anzeige-/Warnlogik in Kunden-/OrderDesk-/Display-Flows

Wichtiger Hinweis:
- Allergenangaben sind technische Hilfsdaten und keine rechtliche Garantie.

## 5. Produkt-Assistent / Wizard (späterer Ausbau)
Empfohlener Wizard-Flow:
1. Betriebsart wählen
2. Kategorien auswählen
3. Produkte auswählen
4. Zutaten bestätigen
5. Allergene prüfen
6. Preisvorschläge übernehmen oder ignorieren
7. Import-Simulation + Ergebnis

## 6. MVP-Abgrenzung
Im aktuellen Schritt enthalten:
- API- und Service-Unterstützung für Importoptionen
- UI-Checkboxen im Importdialog
- Ergebnisanzeige mit Importstatistik
- Seed-Daten für 4 Betriebsarten verbessert

Nicht im MVP dieses Schritts:
- vollständiger Multi-Step Wizard
- Lager-/Einkaufsautomatik
- rechtliche Freigabe-Workflows für Allergenpflege

## 7. Spätere Erweiterungen
- Einkauf/Lager/Lieferantenkatalog-Verknüpfung
- KI-gestützter Template-Import und Mapping
- automatische Kalkulationsvorschläge (Marge, EK/VK)
- Simulation vor Import (Dry Run)
- erweiterte Konfliktauflösung je Feld statt globalem Overwrite
