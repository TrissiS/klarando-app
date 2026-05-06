# Klarando Mobile App (Android + iOS)

Diese App ist eine separate native Mobile-App auf Basis von Expo / React Native.

## Was ist enthalten

- Eigene App fuer Android und iOS
- Filialsuche gegen `GET /api/tenants/public/discovery`
- Suche nach PLZ, optional Strasse, Modus (alle, Lieferung, Abholung)
- Optionale Standortfreigabe fuer Radius-Matching
- API Base URL im App-UI konfigurierbar und lokal gespeichert

## Schnellstart

1. In den Mobile-Ordner wechseln:

```bash
cd mobile-app
```

2. Pakete installieren:

```bash
npm install
```

3. Dev-Server starten:

```bash
npm run start
```

4. Android oder iOS lokal starten:

```bash
npm run android
npm run ios
```

## Wichtige API URL Hinweise

- Android Emulator: `http://10.0.2.2:4000`
- iOS Simulator: `http://127.0.0.1:4000`
- Physisches Geraet: Rechner-IP verwenden, z. B. `http://192.168.178.20:4000`

Die URL kann direkt in der App gespeichert werden.

## Production Builds

EAS ist vorbereitet (`eas.json` vorhanden):

```bash
npx eas build --platform android --profile production
npx eas build --platform ios --profile production
```
