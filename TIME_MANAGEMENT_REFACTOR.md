# Time Management Refactor

## Ziel

Klarando verwendet jetzt eine zentrale Zeit- und Öffnungszeitenverwaltung unter `Lieferung -> Öffnungszeiten & Lieferzeiten`.

Diese Seite ist die Master-Quelle für:
- Öffnungszeiten
- Lieferdienstzeiten
- Feiertage & Ausnahmen
- Sofortbestellungen / Lieferpause
- Vorbestellungen
- Bestellannahmeschluss
- Mindestvorlauf
- maximale Vorbestelltage
- Zeitfenster pro Tag
- maximale Aufträge pro Zeitfenster

## Entfernt aus Verwaltung -> Einstellungen

Die alte Pflege in `Verwaltung -> Einstellungen` wurde stillgelegt für:
- Öffnungszeiten
- Lieferdienstzeiten
- Feiertage / Sonderöffnungen

Stattdessen zeigt die Seite jetzt nur noch einen Hinweis mit Link auf die zentrale Master-Verwaltung.

## Datenmodell

Im `businessSettings`-JSON gibt es jetzt das neue Feld:
- `timeManagement`

Struktur:
- `openingHours`
- `deliveryHours`
- `holidayHours`
- `ordering`
- `deliveryScheduling`

## Migration / Backward Compatibility

Beim Laden der Einstellungen wird automatisch migriert:
- `settings.openingHours -> timeManagement.openingHours`
- `settings.deliveryHours -> timeManagement.deliveryHours`
- `settings.holidayHours -> timeManagement.holidayHours`
- `settings.ordering -> timeManagement.ordering`
- `settings.deliveryScheduling -> timeManagement.deliveryScheduling`

Die alten Root-Felder bleiben vorerst als Legacy-Spiegel erhalten und werden beim Speichern automatisch synchronisiert.

Damit bleiben bestehende Datensätze kompatibel, aber neue Logik greift zentral auf `timeManagement` zu.

## Statusberechnung

Ein Betrieb gilt als geöffnet, wenn:
- der Tag aktiv ist
- ein gültiges Zeitfenster vorhanden ist
- kein Feiertag / keine Ausnahme mit `geschlossen` aktiv ist

Ein Betrieb gilt als geschlossen, wenn:
- kein aktives Zeitfenster vorliegt
- oder ein Feiertag / eine Ausnahme den Tag schließt

## Feiertage & Ausnahmen

Feiertage / Sonderöffnungen werden jetzt zentral über `holidayHours` gepflegt.

Unterstützte Fälle:
- kompletter Schließtag
- verkürzte Sonderöffnung
- Ausnahme auf sonst inaktivem Wochentag

Beispiele:
- `24.12.` geschlossen
- `31.12. 10:00 - 14:00`
- `01.01.` geschlossen

## Systemweit umgebogen

Die zentrale Quelle wird jetzt verwendet in:
- Backend Öffnungs-/Bestelllogik
- Lieferterminlogik / Vorbestellungen
- Discovery / Store Open Status
- Customer-App Verfügbarkeitsprüfung über Backend
- Admin Master-Verwaltung

## Betroffene Dateien

- `backend/src/lib/business-settings.ts`
- `backend/src/lib/ordering-availability.ts`
- `backend/src/lib/delivery-slots.ts`
- `backend/src/routes/business-settings.ts`
- `backend/src/routes/tenant.ts`
- `lib/api.ts`
- `app/Components/admin/AppSettingsFields.tsx`
- `app/admin/app-settings/page.tsx`
- `app/admin/settings/page.tsx`
- `app/admin/lieferung/page.tsx`
- `app/Components/admin/AdminLayout.tsx`

## Hinweis

Die alten Felder gelten ab jetzt als deprecated. Neue Features und weitere Status-/Order-Logik sollen nur noch `timeManagement` verwenden.
