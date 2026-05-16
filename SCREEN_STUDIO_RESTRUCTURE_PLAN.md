# Klarando Bildschirmstudio – Analyse & Umbauplan

## 1) Ist-Analyse (Stand heute)
- `app/admin/screen/page.tsx` ist funktional stark, aber sehr groß (Monolith), mit gemischten Zuständigkeiten:
  - Inhalte, Design, Geräte, Preview in einer Datei
  - viele technische Felder im Standard-Flow
  - hoher kognitiver Aufwand für Betreiber
- `app/admin/display-devices/page.tsx` + `app/Components/admin/DisplayDeviceManagementPanel.tsx` decken Pairing/Geräte gut ab, aber wirken getrennt vom Design- und Inhaltsfluss.
- Display-App wurde bereits TV-tauglich verbessert:
  - Pairing/Content responsive
  - keine Scroll-abhängige Live-Ansicht
  - Auto-Paging bei vielen Inhalten

## 2) Zielbild „Bildschirmstudio“
Ein zentrales Modul mit klaren Nutzerpfaden:
- Übersicht
- Inhalte
- Design
- Zeitplan
- Geräte
- Vorschau

Technische IDs werden im Standardmodus verborgen. Experten-/Diagnosedaten nur optional bzw. Superadmin-nah.

## 3) Erste Umsetzung in diesem Schritt
### Neu
- Neue Admin-Seite: `app/admin/screen-studio/page.tsx`
  - 6 Tabs: Übersicht, Inhalte, Design, Zeitplan, Geräte, Vorschau
  - Schnellaktionen und Statuskarten
  - zusammengeführter Zugriff auf Geräteverwaltung und Menübildschirm-Editor

### Navigation
- Sidebar-Eintrag von „Menübildschirme“ auf „Bildschirmstudio“ umgestellt:
  - `app/Components/admin/AdminLayout.tsx`
  - Route: `/admin/screen-studio`
  - Active-State-Erkennung für `/admin/screen-studio` ergänzt

### Geräteansicht entschlackt
- `DisplayDeviceManagementPanel` um `studioMode` erweitert:
  - technische Code-Zeile reduziert (keine code/id Darstellung im Standard-Studiofluss)

## 4) Geplante nächste Schritte (Phase 2+)
1. `app/admin/screen/page.tsx` in modulare Komponenten aufteilen:
   - `ScreenStudioContentTab`
   - `ScreenStudioDesignTab`
   - `ScreenStudioPreviewTab`
   - `ScreenStudioExpertPanel`
2. Drag & Drop für Inhalte in einen einheitlichen Listen-Builder überführen.
3. Design-Template-System als echte Presets mit persistierbaren Parametern aufbauen.
4. Zeitplan/Dayparts mit aktivem Scheduling in Backend/API einführen.
5. Vorschau-Simulator mit Overflow-Prüfung und „passt nicht“-Warnungen pro Auflösung.
6. Onboarding-Automation vorbereiten:
   - Logo-Farbanalyse
   - Designvorschlag
   - Importvorschau Speisekarte → Kategorien/Produkte

## 5) Architektur-Leitlinien
- Keine destruktiven Datenänderungen ohne Migration/Backfill.
- Tenant-Scope und Rollen strikt durchhalten.
- Standardmodus: UI-first, wenig Technik.
- Expertenmodus: explizit opt-in.
