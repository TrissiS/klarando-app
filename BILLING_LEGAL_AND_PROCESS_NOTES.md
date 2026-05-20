# Billing Legal And Process Notes

## Rechnungs-Pflichtangaben (DE, B2B)
- Vollständiger Name/Anschrift des leistenden Unternehmens
- Vollständiger Name/Anschrift des Leistungsempfängers
- Rechnungsnummer (fortlaufend)
- Rechnungsdatum
- Leistungszeitraum
- Leistungsbeschreibung und Umfang
- Netto-Beträge, Steuersatz, Steuerbetrag, Brutto-Betrag
- Zahlungsziel / Zahlungsinformationen
- USt-ID oder Steuernummer

## E-Rechnung (Vorbereitung)
- Strukturierte Rechnungsdaten bleiben getrennt von Darstellung (PDF/HTML)
- PDF ist aktuell MVP-Ausgabe, strukturierte Daten sind vorbereitet
- ZUGFeRD/XRechnung/EN-16931 Exportpfad ist als nächster Ausbauschritt vorgesehen
- UI-Text vermeidet harte Zusicherung "rechtssicher"; stattdessen Hinweise auf Vorbereitung

## Nachvollziehbarkeit / Betriebsprüfung (Vorbereitung)
- Unveränderbare Historie: finale Rechnungen werden nicht direkt bearbeitet, nur Status-Übergänge + Korrekturprozess
- Audit-Logs für zentrale Schritte:
  - Erstellung Billing-Run
  - Finalisierung
  - Storno
  - Korrekturrechnung
- Fortlaufende Rechnungsnummern über zentrale Sequence
- Klare Statuskette:
  - `DRAFT`, `APPROVED/ISSUED`, `SENT`, `PAYMENT_PLANNED`, `PAYMENT_SUBMITTED`, `PAID`, `OVERDUE`, `PAYMENT_FAILED`, `RETURNED`, `CANCELLED`
- Versand-/Zahlungsstatus wird protokolliert (Mail/Collection-Metadaten + Historie-Endpunkt)
- Berechnungsgrundlagen werden als strukturierter Snapshot (`calculationSnapshot` + Hash) an der Rechnung abgelegt
- Storno-/Korrekturprozess:
  - Storno-Endpunkt
  - Korrekturrechnung als eigener Beleg mit Verweis auf Ursprung (`correctionOfInvoiceId`)

## Monatsabrechnungsprozess
1. Monatslauf erzeugt Rechnungen als `DRAFT`
2. Superadmin prüft und gibt frei (`DRAFT -> ISSUED/APPROVED`)
3. Interne Nachricht wird erzeugt
4. E-Mail-Zustellung läuft in `TEST` oder `LIVE` (env-gesteuert)
5. Zahlungseinzug bleibt bis Provider-Freigabe im Vorbereitungsmodus

## SEPA-/Einzugsprozess (Vorbereitung)
- Zahlungsstatus im Rechnungs-/Collection-Kontext:
  - `PAYMENT_PLANNED`, `PAYMENT_SUBMITTED`, `PAID`, `PAYMENT_FAILED`, `RETURNED`, `CANCELLED`
- SEPA-Mandatsreferenz und Mandatsdatum im Profilkontext pflegen
- Keine unkontrollierte Live-Belastung ohne explizite Freigabe

## Rücklastschriftprozess (Vorbereitung)
- Rücklastschriftlisten basieren auf fehlgeschlagenen Collections
- Sichtbar: Betrag, Datum, Fehlergrund, Provider-Referenz, Rücklastschriftkosten
- Folgeaktionen: erneuter Einzug planen, interne Nachricht, E-Mail-Hinweis, Mahnprozess

## Offene Punkte für Steuerberater/Rechtsprüfung
- Finales Rechnungslayout und Pflichttextbausteine
- GoBD-konforme Archivierung und Aufbewahrung
- E-Rechnungsformat final (ZUGFeRD/XRechnung)
- Lastschriftmandatsprozess inkl. Pre-Notification Details
- Mahn- und Eskalationsprozess inkl. Fristen
