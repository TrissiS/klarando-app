# Klarando Funktionstests (erste echte Online-Tests)

Stand: 2026-05-04

## Testziel

Sicherstellen, dass alle 3 Apps stabil zusammenspielen:

- Kunden-App
- Fahrer-App
- Admin/Kassendisplay

## Testvorbereitung

1. Umgebung: `staging.klarando.com`
2. API erreichbar: `https://api.staging.klarando.com/health` muss `ok` liefern.
3. Rollen angelegt:
   - Superadmin
   - Kettenadmin
   - Filialadmin
   - Fahrer
   - Kunde
4. Eine Filiale vollständig gepflegt:
   - Liefergebiet/Abholgebiet
   - Produkte/Kategorien/Zutaten
   - Zahlungsarten
   - App-Freigabe aktiv

## Kern-Testfälle (Pflicht)

1. Kunde registriert sich in der App und hinterlegt Standard-Lieferadresse.
2. Kunde sucht per PLZ (`57223`) und findet freigegebene Lokale.
3. Bestellung mit mehreren Artikeln abschicken.
4. Bestellung erscheint sofort im Kassendisplay mit Ton/Popup.
5. Filiale nimmt Bestellung an und setzt ETA.
6. Fahrer wird zugewiesen (nur zugewiesene Aufträge in Fahrer-App sichtbar).
7. Fahrer startet Tour, Standort-Update sichtbar.
8. Kunde sieht Statuswechsel (angenommen, in Arbeit, Fahrer unterwegs, erledigt).
9. Lieferung abgeschlossen, Bestellung archiviert (nur bezahlt).
10. Reklamation mit Bild aus Kunden-App senden und im Admin/Kassendisplay prüfen.

## Zusätzliche Testfälle (Soll)

- Abholung statt Lieferung
- Mindestbestellwert nicht erreicht
- Produkt mit Pfand (Einweg/Mehrweg)
- Bestellung mit Optionen/Größen
- Offline/Netzunterbrechung Fahrer

## Abnahme-Kriterien

Ein Testlauf gilt nur als bestanden, wenn:

- kein Blocker im Bestellfluss auftritt,
- Status in allen Clients synchron bleibt,
- keine Mandantenfremden Daten sichtbar sind,
- alle kritischen Aktionen auditierbar sind.

## Sofortige Stop-Kriterien (kein Livegang)

- Bestellung verschwindet oder doppelt verarbeitet
- falsche Filiale/Kette sieht Fremddaten
- Reklamationen oder Zahlungsstatus inkonsistent
- Fahrertracking überträgt nicht zuverlässig

