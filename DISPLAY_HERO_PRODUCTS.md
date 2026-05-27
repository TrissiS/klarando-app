# Display Hero Products

## Ziel
Hero-Produkte erlauben eine stärkere visuelle Hervorhebung auf TV-Displays, ohne das Gesamtlayout zu destabilisieren.

## Manifest-Felder je Produkt
- `isHero`
- `isBestseller`
- `isNew`
- `isPromotion`
- `promotionText`
- `badgeLabel`
- `badgeColor`
- `highlightPriority`
- `heroImageUrl`
- `originalPrice`
- `promoPrice`
- `validFrom`
- `validUntil`

## Aktuelles Renderer-Verhalten
- Maximal 3 Hero-Produkte pro Screen werden als echte Hero-Karten priorisiert.
- Hero-Produkte werden nach `highlightPriority` bevorzugt einsortiert.
- Hero-Karten erhalten:
  - stärkere Border
  - Badge-Darstellung
  - größere Typografie
  - Promo-Preis-Rendering (optional)
  - Originalpreis mit Durchstreichung (wenn vorhanden)
- Bei zu wenig Platz fällt der Renderer automatisch auf normale Karten zurück (nur die Top-3 bleiben Hero).

## Datenherkunft (Backend)
- `ScreenProductSetting.isFeatured` -> `isHero`
- `ScreenProductSetting.badgeText` -> `badgeLabel`
- `ScreenProductSetting.highlightColor` -> `badgeColor`
- Heuristik:
  - badge enthält `Aktion/Deal/Promo/Angebot` -> `isPromotion`
  - badge enthält `Neu` -> `isNew`
  - badge enthält `Bestseller/Top/Hit/Beliebt` oder Hero -> `isBestseller`

## Debug
Display-Diagnose enthält:
- `heroProducts` (Anzahl)
- `promoProducts` (Anzahl)

## Screen-Studio
Die UI-Felder sind vorbereitet über bestehende Produkt-Screen-Einstellungen
(`isFeatured`, `badgeText`, `highlightColor`).
Für vollständige Hero-Redaktion (Promo-Preis, Gültigkeit, Priorität) ist ein dedizierter Editor im Tab `Inhalte` bzw. `Slides & Werbung` als nächster Schritt vorgesehen.

## Offene Punkte
- Vollständige Hero-Editor-UI im Screen-Studio
- Validierungslogik für `validFrom/validUntil`
- Eigene Hero-Layout-Variante mit großem Produktbild
- Zeitgesteuerte Promo-Preis-Felder aus Admin-UI
