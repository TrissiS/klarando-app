# Customer App Stripe Checkout Flow

## Ziel
- Die Flutter Customer-App kann Stripe-Zahlungen direkt in der App starten.
- Die Bestellung wird nicht clientseitig auf `PAID` gesetzt.
- Der finale Zahlungsstatus kommt ausschließlich serverseitig über den Stripe-Webhook.

## Technischer Flow
1. Kunde wählt im Checkout `Online bezahlen`.
2. Die App erstellt wie bisher zuerst die Bestellung über `POST /api/orders`.
3. Für Stripe-Bestellungen wird danach `POST /api/payments/stripe/payment-intent` aufgerufen.
4. Das Backend liefert:
   - `clientSecret`
   - `publishableKey`
   - `mode`
   - PaymentIntent-Metadaten
5. Die App öffnet `flutter_stripe` PaymentSheet.
6. Bei Erfolg zeigt die App:
   - `Zahlung wird bestätigt`
7. Die App pollt danach kurz den Orderstatus.
8. Der Webhook setzt die Bestellung serverseitig auf `PAID`.

## Sicherheit
- Kein Stripe Secret im Flutter-Code.
- Nur `publishableKey` und `clientSecret` gehen an den Client.
- Die Customer-App nutzt keine Admin- oder Billing-Daten.

## Öffentliche Tenant-Information
Die Customer-App liest über die öffentlichen Tenant-Endpunkte:
- `payments.stripeAvailable`
- `payments.stripeMode`

Damit kann die App:
- Online-Zahlung nur bei aktivem Stripe anbieten
- Testmodus-Hinweise sauber anzeigen

## Fehlerfälle
- Stripe nicht eingerichtet:
  - Online-Zahlung wird nicht angeboten oder sauber abgelehnt
- Zahlung abgebrochen:
  - Bestellung bleibt offen bzw. `pending_payment`
  - Kunde kann die Zahlung erneut fortsetzen
- Webhook noch nicht angekommen:
  - App zeigt Hinweis, dass die Zahlung serverseitig bestätigt wird

## Testmodus
- Im Testmodus zeigt die App einen klaren Hinweis.
- Testkarte:
  - `4242 4242 4242 4242`
  - beliebiges zukünftiges Ablaufdatum
  - beliebiger CVC

## Bekannte Grenzen des MVP
- Online-Zahlung setzt aktuell ein Kundenkonto/App-Login voraus.
- Kein Web-Checkout in diesem Scope.
- Kein Apple Pay / Google Pay in diesem MVP.
