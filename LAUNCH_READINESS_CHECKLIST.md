# Klarando Launch Readiness Checklist (Pilot 1–3 Betriebe)

## 1. Zielbild Pilot
- Kontrollierter Pilot mit 1–3 echten Betrieben.
- Fokus: stabile Bestellannahme, klare Admin-Bedienung, nachvollziehbarer Betrieb.
- Keine Vollausbaulogik (z. B. komplexes Billing/Automatisierung) als Go-Live-Voraussetzung.

## 2. Technik
- Web-Build erfolgreich (`npm run build`).
- Backend-Typecheck erfolgreich (`npm --prefix backend run typecheck`).
- Lint/TS-Checks erfolgreich (`npm run lint`).
- Env-Safety-Check erfolgreich (`npm run check:env-safety`).
- Docker-Prod-Compose: lokal aktuell nicht prüfbar (Docker CLI fehlt), auf VPS verpflichtend prüfen.

## 3. Rechtliches
- Seiten vorhanden:
  - `/impressum`
  - `/datenschutz`
  - `/agb`
  - `/cookies`
  - `/jugendschutz`
  - `/partner-agb`
- Vor Launch prüfen:
  - Footer-Links auf Startseite sichtbar und klickbar.
  - Rechtstexte juristisch final gegenprüfen (insb. Payment/Alkohol/Haftung).

## 4. Adminbereich (Pilot-kritisch)
- Sidebar-Link-Klickbarkeit in Admin/Chainadmin/Superadmin manuell E2E testen.
- Keine toten Links in Hauptnavigation.
- Deaktivierte Module nicht sichtbar.
- Dashboard reduziert auf betriebsrelevante KPIs (keine Technik-/Debug-Überfrachtung).

## 5. Kundenbestellung
- Checkout-Ende-zu-Ende testen:
  - Produktwahl → Warenkorb → Bestellung → Status sichtbar.
- Verfügbarkeitslogik aktiv:
  - Ordering-Hours/Bestellschluss
  - Vorbestellung (falls aktiviert)
  - Liefermodus-Slot-Logik als MVP vorbereitet.

## 6. OrderDesk / Fahrer / Displays
- OrderDesk-Pairing via QR mit Ablaufhinweis verifizieren.
- Fahrer-Pairing und Statuswechsel im Live-Fluss testen.
- Display-Verbindungsstatus:
  - keine permanente Technikmeldung im Normalbetrieb.
  - offline/instabil klar aber dezent.

## 7. Zahlungen / Finanzen
- Für Pilot nur klar als MVP kennzeichnen:
  - Finanzen-Übersicht lesbar
  - Gebührenlogik nachvollziehbar
  - keine produktive Vollabrechnung ohne finalen Prozess.

## 8. Liefergebiete
- Liefergebiet pro Tenant testbar:
  - Postleitzahl/Radius/Regeln korrekt.
  - Ausschlüsse greifen.
- Mindestens 3 Testadressen pro Betrieb prüfen (innen/außen/Borderline).

## 9. Support, Backup, Monitoring
- Support-Prozess klar:
  - Ansprechpartner
  - Fehlerkanal
  - Reaktionszeit im Pilot.
- Backup:
  - DB-Backup vor Pilotstart und vor größeren Änderungen.
- Monitoring:
  - Health-Endpunkte prüfen
  - Container-Status prüfen
  - zentrale Fehlerlogs beobachten.

## 10. Kritische Bugs (Priorität)
## P0 (Blocker vor Pilot)
- Admin-Sidebar nicht zuverlässig klickbar.
- Map muss echtes Lieferziel/Fahrerziel stabil anzeigen.
- Cookie-Banner/Consent real sichtbar und wirksam im Frontend (nicht nur Rechtsseite).

## P1 (schnell vor/nach Pilotstart)
- Dashboard weiter aufräumen (Betriebsfokus).
- Produktimport aus Vorlagen inkl. Produktnummer-Durchgriff vollständig manuell testen.
- Display-/OrderDesk-Verbindungsstatus UX finalisieren.
- Rechtliche Links in allen relevanten Flows prüfen (Login/Checkout/Footer/App).

## P2 (nach Launch)
- Promotions-Slider feinjustieren.
- Billing/Fees weiter vertiefen.

## 11. Pilotbetrieb-Demo-Daten (MVP)
- Demo-Imbiss (Tenant + Admin) anlegen.
- Kategorien/Produkte/Zutaten importieren.
- Liefergebiet setzen.
- Öffnungszeiten + Bestellzeiten setzen.
- Testfahrer + Testdisplay + Test-OrderDesk anbinden.
- 3–5 Testbestellungen inkl. Edge Cases erzeugen (geschlossen, Vorbestellung, Liefergrenze).

## 12. Launch-Seite / Startseite
- Startseite kundenorientiert (klare Value Proposition).
- CTA sichtbar:
  - „Jetzt bestellen“
  - „Partner werden“
- Footer mit Rechtlinks sichtbar.
- Mobile Darstellung prüfen (360x800, 768x1024).
- Promotion-Slider optional und nicht blocker-relevant.

## 13. Go/No-Go Kriterien
## Go nur wenn:
- P0-Bugs geschlossen.
- Checks grün.
- 1 kompletter E2E-Pilotflow je Betrieb erfolgreich.
- Rechtstexte und Consent sichtbar/klickbar.

## No-Go wenn:
- Admin-Menü im Tagesbetrieb unzuverlässig.
- Checkout/Bestellung instabil.
- Consent oder rechtliche Mindestanforderungen nicht sichtbar.

## 14. Nächste 10 Aufgaben (Priorisiert)
1. Admin-Sidebar Klick-Blocker final im echten Browserprofil debuggen und fix verifizieren.
2. Cookie-Banner im Frontend sichtbar einbinden (Consent speichern/ändern).
3. Lieferziel-/Tracking-Map E2E mit realen Koordinaten absichern.
4. Pilot-Demo-Tenant inkl. Produkte/Liefergebiet/Öffnungszeiten final provisionieren.
5. OrderDesk + Fahrer-Pairing in einem durchgehenden Ablauf testen und protokollieren.
6. Display-Statusanzeige auf „online/instabil/offline“ mit realen Heartbeats validieren.
7. Admin-Dashboard final entschlacken (nur betriebsrelevante KPI-Karten).
8. Produktvorlagen-Import mit Artikelnummern/EAN im UI inkl. Validierung testen.
9. VPS Deploy-Runbook finalisieren (Backup, Pull, Compose, Healthcheck, Rollback).
10. Pilot-Supportprozess schriftlich fixieren (Kontakt, SLA im Pilot, Eskalationsweg).
