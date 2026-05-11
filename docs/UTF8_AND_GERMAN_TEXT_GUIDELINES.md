# UTF-8 & Deutsche Texte Richtlinien

## Grundsatz
- Sichtbare UI-Texte immer mit echten deutschen Umlauten schreiben (`ä`, `ö`, `ü`, `Ä`, `Ö`, `Ü`, `ß`).
- Keine Ersatzschreibweise wie `ae/oe/ue` in Benutzertexten.

## Was ASCII bleiben soll
- Slugs, IDs, technische Keys, Enum-Werte, Dateinamen und API-Feldnamen bleiben ASCII.
- Beispiel: `DONER_KEBAP` ist technisch korrekt, UI darf dennoch „Döner / Kebap“ anzeigen.

## Fehlermeldungen
- Nutzernahe Fehlermeldungen klar, deutsch und freundlich formulieren.
- Beispiel: „Bitte gültige E-Mail-Adresse eingeben.“ statt technischer Rohfehler.

## Encoding
- Quelltextdateien als UTF-8 speichern.
- Frontend/Next.js und Backend/JSON standardmäßig UTF-8 ausliefern.
- Keine manuelle Windows-1252-Konvertierung verwenden.

## Review-Checkliste
- Sind sichtbare Texte mit Umlauten korrekt?
- Gibt es kaputte Zeichen (`�`)?
- Sind technische Bezeichner unverändert kompatibel geblieben?
