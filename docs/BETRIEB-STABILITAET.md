# Betrieb und Stabilität (Klarando)

## Ziel
Sauberer Betrieb ohne Hänger im Tagesgeschäft.

## Empfohlenes Betriebsmodell
Online-first mit zentralem Dashboard und zentraler Datenbank.

Warum:
- Mehrere Filialen/Ketten sind zentral besser steuerbar.
- Updates, Backups, Rechte und Compliance sind einfacher.
- Fehlerbehebung ist schneller als bei vielen lokalen Installationen.

## Start-Reihenfolge (Entwicklung)
1. `npm run preflight`
2. Backend starten: `npm run dev:backend`
3. Web starten: `npm run dev`
4. Health prüfen: `npm run health:all`

## Mindest-Checks vor Release
1. `npm run typecheck:all`
2. `npm run build`
3. Health-Endpunkte prüfen:
   - `http://localhost:4000/api/health`
   - `http://localhost:3000/api/health`

## Störungsfall (schnell)
1. Hängende Prozesse beenden (`node`, `dart`, `flutter`).
2. Ports 3000/4000 prüfen.
3. Neu starten in der Reihenfolge aus "Start-Reihenfolge".
4. `npm run health:all` ausführen.

## Produktion (kurz)
- Zentraler Server mit Monitoring und täglichem Backup.
- Pro Filiale stabile Internetverbindung + Fallback-Prozess bei Ausfall.
- Änderungen zuerst in Testumgebung, danach Rollout.
