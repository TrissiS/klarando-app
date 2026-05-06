#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
COMPOSE_FILE="${ROOT_DIR}/docker-compose.prod.yml"
ENV_FILE="${ROOT_DIR}/.env.production"
BACKUP_DIR="${ROOT_DIR}/backups/postgres"

if [[ ! -f "${ENV_FILE}" ]]; then
  echo "Fehler: ${ENV_FILE} nicht gefunden."
  echo "Bitte zuerst .env.production anlegen."
  exit 1
fi

source "${ENV_FILE}"

mkdir -p "${BACKUP_DIR}"
TIMESTAMP="$(date +%Y-%m-%d_%H-%M-%S)"
TARGET_FILE="${BACKUP_DIR}/klarando_${TIMESTAMP}.sql.gz"

echo "Erstelle Backup: ${TARGET_FILE}"
docker compose --env-file "${ENV_FILE}" -f "${COMPOSE_FILE}" exec -T postgres \
  pg_dump -U "${POSTGRES_USER}" -d "${POSTGRES_DB}" | gzip > "${TARGET_FILE}"

echo "Backup fertig."

# Aufbewahrung: taeglich 30 Tage
find "${BACKUP_DIR}" -type f -name '*.sql.gz' -mtime +30 -delete
echo "Alte Backups >30 Tage geloescht."
