# Admin UI Cleanup Report

Stand: 06.05.2026

## 1) Gefundene Probleme
- In der Admin-Navigation wurden deaktivierte oder nicht freigegebene Punkte als „disabled“ angezeigt statt komplett verborgen.
- Modul-/Feature-Prüfung war verteilt und nicht zentralisiert.
- Dashboard-Sektionen und Statistik-Karten wurden auch dann angeboten, wenn die zugrunde liegenden Module nicht freigegeben waren.
- Einzelne UI-Texte im Adminbereich waren noch in ASCII-Umschreibungen (`Menue`, `Oeffnen`, `Verkaeufe`).
- Leere Zustände waren nicht konsistent benannt.

## 2) Behobene Probleme
- Zentrale Modul-Sichtbarkeit eingeführt:
  - `lib/admin-module-visibility.ts`
  - zentrale Funktion: `isModuleEnabled(...)`
  - kombiniert Permissions + optionale Feature-Flags (z. B. `driver.enabled`).
- Admin-Navigation bereinigt:
  - deaktivierte Module werden vollständig ausgeblendet (Sidebar, Subnavigation, Mobile-Navigation).
  - keine „toten“ disabled Links mehr.
  - leere Navigationssektionen werden nicht mehr gerendert.
- Feature-Flag für Fahrer-Modul integriert:
  - `Fahrer-App` wird bei `settings.driver.enabled === false` ausgeblendet.
- Dashboard bereinigt:
  - Sektionen werden nur angezeigt, wenn das jeweilige Modul freigegeben ist.
  - Widget-Auswahl zeigt nur verfügbare Sektionen.
  - Statistik-Karten werden modulabhängig gefiltert.
- Leere Zustände vereinheitlicht:
  - relevante Bereiche auf „Keine Daten vorhanden.“ angepasst.
- Kleine UX-Politur:
  - Sidebar-Navigation mit `overflow-y-auto` gegen abgeschnittene Inhalte.
- Umlaute/Deutsch-Texte verbessert:
  - z. B. `Hauptmenü`, `Menü`, `Schließen`, `Quelle öffnen`, `Verkäufe`, `Öffnen`.

## 3) UTF-8 / Encoding Check
- Quellcodeprüfung auf fehlerhafte Ersatzzeichen (`�`) im Projektcode (`app`, `components`, `lib`, `backend/src`) ergab keine Treffer.
- Keine doppelten Encoding-Konvertierungen im geprüften Bereich gefunden.
- Frontend rendert Umlaute in den geänderten Admin-Komponenten korrekt.
- Hinweis Backend:
  - JSON-Antworten laufen über Express `res.json(...)` und sind UTF-8-kompatibel.
  - Für den Pilot wurden hier keine riskanten globalen Header-Umbauten vorgenommen.

## 4) Bewusst nicht angefasste Baustellen
- Kein Full-Redesign (Farbsystem/Layout-Struktur unverändert).
- Keine großflächige Refaktorierung aller Admin-/Chainadmin-/Superadmin-Seiten.
- Keine neuen Libraries.
- Keine Änderung an Datenmodell oder API-Verträgen.

## 5) Verbleibende UX-Risiken
- Einige ältere Seiten nutzen weiterhin uneinheitliche Texte/Komponentenklassen (historisch gewachsen).
- Tabellen-/Formular-Politur ist noch nicht überall konsistent umgesetzt.
- Backoffice-Layouts außerhalb `app/admin` können noch einzelne Sprach-/Spacing-Unterschiede enthalten.

## 6) Empfehlungen nach Pilot
1. Einheitliche UI-Bausteine für Tabellen, Empty/Loading/Error-State zentralisieren.
2. Sprachstandard in allen Bereichen auf vollständiges Deutsch mit Umlauten vereinheitlichen.
3. Modul-Freigaben zusätzlich serverseitig als explizite Feature-Matrix bereitstellen (statt nur über Permission-Ableitung + Settings).
4. Visuelle Smoke-Tests pro Adminbereich (Desktop + Mobile) in CI ergänzen.
5. Schrittweise Konsolidierung der Styles für Cards/Buttons/Abstände über alle Backoffice-Apps.
