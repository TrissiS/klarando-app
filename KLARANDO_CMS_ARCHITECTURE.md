# Klarando CMS Architektur (Plan)

## Zielbild
Klarando bekommt ein **einfaches internes CMS** für die öffentliche Webplattform, direkt im bestehenden Stack (Next.js + Backend + Prisma), ohne externe Systeme wie WordPress.

Der Fokus liegt auf:
- Superadmin kann Inhalte selbst pflegen
- sichere, strukturierte Inhalte statt freies HTML
- einfache Vorschau vor Veröffentlichung
- kein großer Architekturumbau

Geplante Einstiegspfade:
- Superadmin UI: `/superadmin/cms`
- Öffentliche Seite (z. B. `/`): lädt veröffentlichte CMS-Inhalte über bestehende API-Struktur

## MVP-Umfang (vor Pilot / früh produktiv)

### Bearbeitbare Inhalte
- Startseite (Landing Page) mit strukturierten Blöcken:
1. Hero
2. Vorteile (Features/Benefits)
3. FAQ
4. CTA-Bereich
5. SEO (Title, Description, optional OG-Basis)
6. Banner/Bilder-Referenzen (über Asset-Modell)

### Workflow
- Status pro Seite:
1. `DRAFT`
2. `PUBLISHED`

- Einfacher Ablauf:
1. Superadmin bearbeitet Entwurf
2. Vorschau aufrufen
3. veröffentlichen
4. öffentliche Seite zeigt nur `PUBLISHED`

### Nicht im MVP
- Kein freies WYSIWYG mit beliebigem HTML/Script
- Keine komplexe Medienbibliothek mit CDN-Pipeline
- Keine mehrsprachige Vollstruktur
- Keine vollständige Revisions-/Diff-UI (optional später)

## Geplanter CMS-Bereich in Superadmin

### Route
- `/superadmin/cms`

### Unterbereiche (MVP)
1. Seitenübersicht
2. Seitendetails (Abschnitte)
3. Vorschau
4. Veröffentlichung

### UX (einfach und robust)
- Form-basiert (Textfelder, Textareas, Listen)
- Abschnittsweise Speichern
- klare Validierungsfehler
- Status-Badge: Entwurf/Veröffentlicht

## Datenmodell-Vorschlag (Prisma)

### 1) `CmsPage`
Zweck: Repräsentiert eine editierbare Seite (z. B. `home`).

Vorschlagsfelder:
- `id` (UUID)
- `slug` (unique, z. B. `home`)
- `title` (interner Name)
- `status` (`DRAFT` | `PUBLISHED`)
- `seoTitle` (nullable)
- `seoDescription` (nullable)
- `publishedAt` (nullable)
- `publishedByUserId` (nullable)
- `createdAt`
- `updatedAt`

Hinweis:
- Für MVP reicht 1 Seite (`home`) + erweiterbar auf weitere Slugs.

### 2) `CmsSection`
Zweck: Strukturierte Inhaltsblöcke einer Seite.

Vorschlagsfelder:
- `id` (UUID)
- `pageId` (FK auf `CmsPage`)
- `key` (z. B. `hero`, `benefits`, `faq`, `cta`)
- `type` (z. B. `HERO`, `BENEFITS`, `FAQ`, `CTA`)
- `sortOrder` (int)
- `isEnabled` (bool)
- `contentJson` (JSON, strikt validiert)
- `createdAt`
- `updatedAt`

Hinweis:
- `contentJson` hält strukturierte Daten (keinen beliebigen HTML-Blob).

### 3) `CmsAsset`
Zweck: Referenzierte Medien (Banner/Bilder) für CMS-Sektionen.

Vorschlagsfelder:
- `id` (UUID)
- `pageId` (nullable, falls global nutzbar)
- `sectionId` (nullable)
- `kind` (`IMAGE`)
- `url` (oder interner Storage-Pfad)
- `altText` (nullable)
- `mimeType`
- `fileSizeBytes`
- `width`/`height` (nullable)
- `createdAt`
- `updatedAt`

### 4) `CmsRevision` (optional später)
Zweck: Historie/Versionierung.

Vorschlagsfelder:
- `id`
- `pageId`
- `revisionNumber`
- `snapshotJson`
- `createdByUserId`
- `createdAt`

## API-Plan (MVP)

### Superadmin (geschützt)
- `GET /api/cms/pages`
- `GET /api/cms/pages/:slug`
- `PUT /api/cms/pages/:slug`
- `PUT /api/cms/pages/:slug/sections/:key`
- `POST /api/cms/pages/:slug/publish`
- `POST /api/cms/assets` (Upload-Metadaten / Referenz)

### Public Read (nur veröffentlicht)
- `GET /api/public/cms/pages/:slug`

Regel:
- Public-Endpunkt liefert nur `PUBLISHED` und nur freigegebene Felder.

## Sicherheitskonzept

### Zugriff
- Schreibzugriff nur `SUPERADMIN`.
- Durch bestehende Auth/Permission Middleware absichern.
- Kein Tenant-Scope nötig für globale Marketingseite, aber Role-Scope zwingend.

### Input-Härtung
- Keine ungeprüften `<script>`/HTML-Blöcke speichern.
- Whitelist-Validierung je Section-Typ (z. B. Hero braucht `headline`, `subline`, `ctaLabel`, `ctaHref`).
- Längenlimits pro Feld.

### Upload-Sicherheit
- Nur erlaubte MIME-Typen (z. B. `image/jpeg`, `image/png`, `image/webp`).
- Dateigrößenlimit (z. B. 2–5 MB MVP).
- Dateiname normalisieren.
- Kein ausführbarer Inhalt.

### Audit
- Jede CMS-Änderung als Audit-Event loggen:
- `CMS_PAGE_UPDATED`
- `CMS_SECTION_UPDATED`
- `CMS_PAGE_PUBLISHED`
- `CMS_ASSET_UPLOADED`

### Secrets
- Keine Secrets im CMS-Inhalt.
- Kein Rendern von ENV-Werten im Editor.

## Vorschau-Konzept

MVP-Variante:
- Preview im Superadmin über URL wie `/superadmin/cms/preview/home`.
- Frontend lädt dort Draft-Daten über geschützten Admin-API-Endpunkt.
- Öffentliche Route `/` bleibt bei published Daten.

Später möglich:
- signierte Preview-Token-URLs.

## Rechtliches
- Impressum/Datenschutz/AGB weiter als eigene Seiten/Prozesse.
- CMS setzt nur Links/Teaser, **überschreibt rechtliche Inhalte nicht automatisch**.

## Wie die öffentliche Startseite Inhalte lädt

Empfehlung:
1. Next.js Seite ruft serverseitig `GET /api/public/cms/pages/home`.
2. Falls keine veröffentlichte CMS-Seite existiert: fallback auf sichere Default-Inhalte.
3. Rendering komponentenbasiert pro Section-Typ (Hero, FAQ, Benefits, CTA).

Vorteil:
- klare Trennung zwischen Editing und Public-Auslieferung
- robuste Fallbacks
- kein Client-seitiges Flackern nötig

## Was vor MVP sinnvoll ist
1. Prisma-Modelle + minimale Migration.
2. Superadmin-geschützte CRUD-Endpoints.
3. Public Read-Endpoint für veröffentlichte Inhalte.
4. `/superadmin/cms` Grund-UI (Seite bearbeiten + veröffentlichen).
5. Validierung + Audit-Logging.

## Was nach MVP kommen kann
1. Revisionshistorie mit Restore (`CmsRevision`).
2. Mehrsprachigkeit (`de`, `en`, ...).
3. Erweiterte Medienverwaltung (CDN, Fokuspunkt, Bildvarianten).
4. A/B Varianten je Section.
5. Geplante Veröffentlichungen (publishAt).
6. Redaktionsrollen (Editor/Reviewer) zusätzlich zu Superadmin.

## Risiken und Gegenmaßnahmen
1. Freitext-Missbrauch (XSS-Risiko):
Validierte JSON-Struktur statt raw HTML.
2. Unvollständige Inhalte:
Pflichtfelder + Plausibilitätschecks vor Publish.
3. Performance bei Public-Laden:
Serverseitiges Caching + kompakte JSON-Struktur.
4. Versehentliche Fehlveröffentlichung:
Draft/Publish-Trennung + optional Confirm-Dialog.

## Fazit
Mit diesem Plan entsteht ein **leichtgewichtiges, sicheres internes CMS** für Klarando, das schnell nutzbar ist, die bestehende Architektur respektiert und später ohne Rebuild in Richtung Revisionssystem, Mehrsprachigkeit und Medien-Workflow ausgebaut werden kann.
