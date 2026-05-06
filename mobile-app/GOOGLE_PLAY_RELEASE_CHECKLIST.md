# Google Play Release Checkliste (Klarando App)

## 1. Policy & Pflichtangaben
- [ ] Impressum URL in den Filial-Einstellungen gepflegt
- [ ] Datenschutz URL in den Filial-Einstellungen gepflegt
- [ ] Support E-Mail gepflegt
- [ ] Kontoloeschung E-Mail gepflegt
- [ ] In-App Bereich "Infos" zeigt Pflichtangaben sichtbar an
- [ ] Konto-Loeschanfrage in der App ueber Profil moeglich

## 2. Data Safety Form (Play Console)
- [ ] Erhobene Daten dokumentieren:
- [ ] E-Mail
- [ ] Name
- [ ] Adresse (optional)
- [ ] Telefonnummer (optional)
- [ ] Bestell-/Nutzungsdaten
- [ ] Zweck markieren:
- [ ] App-Funktionalitaet (Bestellung/Konto)
- [ ] Kunden-Support
- [ ] Sicherheit/Betrugspraevention (falls genutzt)
- [ ] Verschluesselung bei Uebertragung bestaetigen (HTTPS)
- [ ] Datenloeschungspfad angeben (Profil -> Kontoloeschung anfragen)

## 3. Store Listing
- [ ] App-Name und Kurzbeschreibung
- [ ] Vollbeschreibung mit Liefer-/Abholfunktion
- [ ] Datenschutz-URL in Play Console eingetragen
- [ ] Support-Kontakt in Play Console eingetragen
- [ ] Kategorie korrekt gesetzt (Food & Drink)
- [ ] Content Rating Fragebogen abgeschlossen

## 4. Screenshots & Assets
- [ ] Smartphone-Screenshots (mind. 2, empfohlen 5+):
- [ ] Start
- [ ] Filialsuche
- [ ] Produktliste mit Bild + Zutaten/Allergenen
- [ ] Warenkorb / Checkout
- [ ] Profil mit Konto-Loeschoption
- [ ] 512x512 App-Icon
- [ ] Feature Graphic 1024x500

## 5. Release & Testing Track
- [ ] Signiertes AAB via EAS Build erstellt
- [ ] Internal Testing Track hochgeladen
- [ ] Tester-Liste gepflegt
- [ ] Smoke-Test auf echten Android-Geraeten:
- [ ] Registrierung / Login
- [ ] Filialsuche
- [ ] Produkt in Warenkorb
- [ ] Bestellung senden
- [ ] Kontoloeschung anfragen
- [ ] Erst nach erfolgreichem Test in Closed/Open/Production promoten

## 6. Vor dem Go-Live
- [ ] Backend Migration/Prisma Generate auf Zielumgebung ausgefuehrt
- [ ] API Base URL in App korrekt (Produktivsystem)
- [ ] Monitoring fuer `/api/app-auth/*` und `/api/orders` aktiv
- [ ] Incident-Kontakt intern dokumentiert
