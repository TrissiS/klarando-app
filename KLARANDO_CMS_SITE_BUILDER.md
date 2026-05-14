# Klarando CMS / Site Builder (MVP)

## Ziel
Superadmin kann zentrale Website-Inhalte ohne Codepflege verwalten.  
Bereich: `/superadmin/cms`

## Datenmodell
- `CmsPage`
  - `key`, `slug`, `title`, `status`
  - `seoTitle`, `seoDescription`, `ogImageUrl`
  - `contentJson` (strukturierte Blöcke)
  - `publishedAt`, `createdAt`, `updatedAt`
- `CmsRevision`
  - versionierte Snapshots pro Seite
  - optionaler Bezug zum bearbeitenden User
- `CmsAsset`
  - vorbereitet für Medienverwaltung (MVP aktuell URL-basiert)

## Blocktypen (MVP)
- `Hero`
- `FeatureGrid`
- `TextImage`
- `FAQ`
- `CTA`
- `PromotionSlider`
- `LegalNoticeBlock`

Hinweis: Es werden nur bekannte Blocktypen akzeptiert. Freie Script-/HTML-Inhalte sind nicht vorgesehen.

## API
### Superadmin (auth + role SUPERADMIN)
- `GET /api/cms/pages`
- `GET /api/cms/pages/:id`
- `POST /api/cms/pages`
- `PATCH /api/cms/pages/:id`
- `POST /api/cms/pages/:id/publish`
- `GET /api/cms/pages/:id/revisions`

### Public
- `GET /api/cms/public/:slug`
  - liefert nur `PUBLISHED`

## Superadmin-UI
- Seitenliste
- Seite anlegen
- SEO-Felder bearbeiten
- Blöcke hinzufügen
- Block nach oben/unten
- Block löschen
- Als Entwurf speichern
- Veröffentlichen
- Vorschau in neuem Tab

## Public Rendering + Fallback
- Renderer:
  - `components/cms/CmsPageRenderer.tsx`
  - `components/cms/CmsBlockRenderer.tsx`
- Public Loader:
  - `components/cms/PublicCmsPage.tsx`
- Aktuell angebunden:
  - `/main-app` (Slug `home`)
  - `/partner` (Slug `partner`)
  - `/faq` (Slug `faq`)

Fallback-Regel:
- Existiert keine veröffentlichte CMS-Seite für den Slug, bleibt der bisherige Fallback-Inhalt sichtbar.

## Vorschau
- Route: `/superadmin/cms/preview/[pageId]`
- Zugriff nur für Superadmin (Frontend-Guard)
- zeigt Entwurfsstand, ohne Veröffentlichung

## Sicherheitskonzept
- Schreibzugriff nur Superadmin
- Public Endpoint liefert nur veröffentlichte Inhalte
- `contentJson` wird blockbasiert validiert
- keine freie Script-Ausführung
- externe URLs werden textbasiert gespeichert, nicht aktiv „evaluiert“

## Rechtliche Seiten
Rechtsseiten bleiben bewusst separat:
- `/impressum`
- `/datenschutz`
- `/agb`
- `/cookies`
- `/jugendschutz`
- `/partner-agb`

Für diese Seiten ist später ein Freigabe-/Versionierungsprozess vorgesehen.

## MVP umgesetzt / später
Umgesetzt:
- Datenmodell
- API
- Superadmin-CMS
- Public-Rendering mit Fallback
- Preview

Später:
- Upload-Workflow für `CmsAsset`
- Freigabe-Workflow (4-Augen-Prinzip)
- Mehrsprachigkeit
- Landingpage-Generator (Städte/Händler)
- App-Content aus CMS
- Rechtstexte mit dediziertem Freigabeprozess
