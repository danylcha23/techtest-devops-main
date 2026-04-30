#!/usr/bin/env bash
set -euo pipefail

URL="${1:-http://localhost:8080/actuator/health}"
MAX_RETRIES="${MAX_RETRIES:-30}"
SLEEP_SECONDS="${SLEEP_SECONDS:-2}"

echo "Smoke test: waiting for $URL"

for i in $(seq 1 "$MAX_RETRIES"); do
  if curl -fsS "$URL" | grep -q '"status":"UP"'; then
    echo "OK: service is UP"
    exit 0
  fi
  echo "Not ready yet ($i/$MAX_RETRIES). Sleeping ${SLEEP_SECONDS}s..."
  sleep "$SLEEP_SECONDS"
done

echo "FAIL: service never became healthy"
exit 1
