# Legacy Route Matrix

Stand: 2026-05-24

| Alte Route | Neue Route (Primary) | Redirect aktiv | Geplant entfernen ab Version | Risiko |
|---|---|---|---|---|
| `/admin/speisekarte` | `/admin/menu` | Ja (`next.config.ts`) | `>= 0.2.0` | Niedrig (nur Deep Links) |
| `/admin/geraete` | `/admin/devices` | Ja (`next.config.ts`) | `>= 0.2.0` | Niedrig |
| `/admin/lieferung` | `/admin/delivery` | Ja (`next.config.ts`) | `>= 0.2.0` | Niedrig |
| `/admin/finanzen-uebersicht` | `/admin/billing` | Ja (`next.config.ts`) | `>= 0.2.0` | Niedrig |
| `/infos/impressum` | `/impressum` | Ja (`next.config.ts`) | `>= 0.2.0` | Niedrig (SEO/Backlinks) |
| `/infos/datenschutz` | `/datenschutz` | Ja (`next.config.ts`) | `>= 0.2.0` | Niedrig |
| `/infos/agb` | `/agb` | Ja (`next.config.ts`) | `>= 0.2.0` | Niedrig |
| `/Components/admin` | `/admin` | Ja (`next.config.ts`) | `>= 0.2.0` | Mittel (alte interne Bookmarks) |
| `/Components/admin/calculation` | `/admin/calculation` | Ja (`next.config.ts`) | `>= 0.2.0` | Niedrig |
| `/Components/admin/screen` | `/admin/screen-studio` | Ja (`next.config.ts`) | `>= 0.2.0` | Mittel |

## Regeln
- Neue Navigation nutzt nur Primary-Routen.
- Legacy-Routen bleiben übergangsweise per Redirect erreichbar.
- Vor Entfernen: Zugriffszahlen und externe Links prüfen.
