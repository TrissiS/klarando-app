# NGINX Routing Debug (LIVE + TEST)

## Erwartetes Routing
- `/api` und `/api/*` -> `backend:4000`
- `/` -> `web:3000`
- `/_next/*` -> `web:3000`
- `/static/*` -> `web:3000`
- `/healthz` -> direkte NGINX-Antwort

## Welche Config wird wirklich gemountet?

### LIVE (`docker-compose.prod.yml`)
Der NGINX-Service mounted:
- `./deploy/nginx/klarando.ssl.conf -> /etc/nginx/conf.d/default.conf`

### TEST (`docker-compose.test.yml`)
Der NGINX-Service mounted:
- `./deploy/nginx/klarando.http.conf -> /etc/nginx/conf.d/default.conf`

## Warum das Problem auftreten konnte
- HTTPS LIVE nutzt `klarando.ssl.conf`, nicht `klarando.http.conf`.
- Wenn nur `http.conf` angepasst wird, bleibt LIVE-Routing auf HTTPS unveraendert.
- Bei Zugriff per IP (`https://31.70.76.55`) muss der 443-`default_server` auf Web-Routing zeigen.

## Wichtige LIVE-Checks auf dem VPS

1. Aktive Compose-Konfiguration aufloesen
```bash
docker compose --env-file .env.production -f docker-compose.prod.yml config
```

2. Gemountete NGINX-Datei im Container anzeigen
```bash
docker exec klarando-app-nginx-1 cat /etc/nginx/conf.d/default.conf
```

3. NGINX-Container neu starten
```bash
docker compose --env-file .env.production -f docker-compose.prod.yml restart nginx
```

4. Optional komplett neu erstellen (sicherster Weg)
```bash
docker compose --env-file .env.production -f docker-compose.prod.yml up -d --build nginx
```

5. Direkt im Container NGINX-Syntax pruefen
```bash
docker exec klarando-app-nginx-1 nginx -t
```

6. Laufende Container pruefen
```bash
docker compose --env-file .env.production -f docker-compose.prod.yml ps
```

7. Health/API/Web pruefung lokal am VPS
```bash
curl -k https://localhost/
curl -k https://localhost/api/health
```

8. Oeffentliche IP pruefen
```bash
curl -k https://31.70.76.55/
curl -k https://31.70.76.55/api/health
```

## Wenn weiterhin Backend-Antwort bei `/` kommt
- Pruefen, ob wirklich der richtige Containername verwendet wurde (`docker ps`).
- Pruefen, ob mehrere Stacks laufen (z. B. LIVE + TEST + alte Stacks).
- Pruefen, ob ein externer Reverse-Proxy vor Docker liegt.
- Logs ansehen:
```bash
docker compose --env-file .env.production -f docker-compose.prod.yml logs --tail=200 nginx
docker compose --env-file .env.production -f docker-compose.prod.yml logs --tail=200 web
docker compose --env-file .env.production -f docker-compose.prod.yml logs --tail=200 backend
```
