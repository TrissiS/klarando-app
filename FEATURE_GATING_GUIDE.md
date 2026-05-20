# Feature Gating Guide

Stand: 2026-05-20

Für nicht fertige Funktionen gilt künftig ein einheitliches Muster:

1. **Sichtbar aber klar markiert**
   - Status-Badge: `READY`, `LIMITED`, `IN_PREPARATION`
2. **Keine toten Klicks**
   - `IN_PREPARATION`: Button deaktiviert + erklärender Tooltip/Hinweis
3. **Konsistente Sprache**
   - „In Vorbereitung“ statt technischer Fehlermeldungen
4. **Rollen-/Modulbezug beachten**
   - Sichtbarkeit abhängig von Modulfreigabe und Berechtigungen

## Reusable UI-Baustein
- `app/Components/admin/FeatureGate.tsx`
  - `FeatureGateBadge`
  - `FeatureGateAction`

Diese Bausteine sind als gemeinsame Grundlage vorbereitet und können schrittweise in Screen-Studio, Module-Billing und weitere Admin-Bereiche übernommen werden.
