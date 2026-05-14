# Legal & Consent Implementation (Klarando)

Stand: 14.05.2026

## Neu angelegte/aktualisierte Seiten
- `/impressum`
- `/datenschutz`
- `/agb`
- `/cookies`
- `/jugendschutz`
- `/partner-agb`

## Eingebaute Links
- Web-Login (`components/LoginForm.tsx`): Impressum, Datenschutz, AGB, Cookies, Jugendschutz
- Haupt-App-Webseite (`app/main-app/page.tsx`): Footer mit Impressum, Datenschutz, AGB, Cookies, Jugendschutz
- Legal-Shell (`app/Components/legal/LegalShell.tsx`): zentraler Rechts-Footer inkl. Cookies/Jugendschutz/Partner-AGB
- Customer-App (`mobile_flutter_app/lib/src/klarando_app.dart`): Rechtslinks im Auth-Bereich erweitert
- Fahrer-App (`mobile_flutter_app/lib/src/driver_delivery_app.dart`): Rechtslinks im Login-/Pairing-Bereich
- OrderDesk-App (`mobile_flutter_app/lib/src/cashier_display_app.dart`): Rechtslinks im Verbindungsbereich
- Admin-Web (`app/Components/admin/AdminLayout.tsx`, `app/Components/admin/BackofficeLayout.tsx`): Footer mit Impressum, Datenschutz, AGB, Cookies, Jugendschutz, Partner-AGB

## Consent-/Cookie-Status
- Neuer Web-Consent-Banner (`components/CookieConsentBanner.tsx`)
- Kategorien:
  - Notwendig (immer aktiv)
  - Funktional
  - Standort/Maps
  - Marketing
  - Analyse/Statistik
- Verhalten:
  - Optionales standardmäßig deaktiviert
  - Ablehnen möglich
  - Auswahl speichern möglich
  - Consent-Version + Zeitstempel in `localStorage`
  - Später änderbar über Button „Cookie-Einstellungen“
- Speicherung:
  - `klarando.cookieConsent.v1`
  - `klarando.maps.enabled`
- Google Maps-Loading (Web):
  - `app/main-app/page.tsx`: Standortzugriff nur bei Consent-Kategorie `Standort/Maps`
  - `app/Components/admin/ServiceAreaEditor.tsx`: Google Maps API wird erst geladen, wenn `Standort/Maps` freigegeben wurde

## Jugendschutz
- Eigene Seite `/jugendschutz`
- Customer-Checkout-Hinweis bei erkannten alkoholischen Produkten (Keyword-basiert)
- Hinweistext: Altersprüfung und Übergabeverweigerung bei Minderjährigen

## Juristisch vor Go-Live prüfen
- Finale AGB/Datenschutzerklärung mit Anwalt (insb. Zahlungsfluss über Plattform)
- Auftragsverarbeitung/AVV mit IONOS und weiteren Dienstleistern
- Finale Formulierungen zu Social-Login, Push, Standortverarbeitung
- Konkrete Speicherfristen je Datenkategorie
- Altersprüfung-Prozess und Dokumentation bei Alkohollieferungen

## Offene technische Punkte
- Optional: Consent serverseitig speichern (nicht nur lokal)
- Optional: Analytics-/Marketing-Skripte strikt erst nach Consent laden
- Optional: explizite Cookie-Einstellungsseite mit granularer UI
