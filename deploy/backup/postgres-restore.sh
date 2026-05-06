#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "Verwendung: $0 /pfad/zum/backup.sql.gz"
  exit 1
fi

BACKUP_FILE="$1"
if [[ ! -f "${BACKUP_FILE}" ]]; then
  echo "Fehler: Backup-Datei nicht gefunden: ${BACKUP_FILE}"
  exit 1
fi

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
COMPOSE_FILE="${ROOT_DIR}/docker-compose.prod.yml"
ENV_FILE="${ROOT_DIR}/.env.production"

if [[ ! -f "${ENV_FILE}" ]]; then
  echo "Fehler: ${ENV_FILE} nicht gefunden."
  exit 1
fi

source "${ENV_FILE}"

echo "Restore startet aus ${BACKUP_FILE}"
gunzip -c "${BACKUP_FILE}" | docker compose --env-file "${ENV_FILE}" -f "${COMPOSE_FILE}" exec -T postgres \
  psql -U "${POSTGRES_USER}" -d "${POSTGRES_DB}"

echo "Restore abgeschlossen."
