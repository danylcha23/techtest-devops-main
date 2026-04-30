#!/usr/bin/env bash
set -euo pipefail

echo "Starting via docker compose (build happens in Docker)..."
docker compose up -d --build

echo "Running smoke test..."
./scripts/smoke_test.sh

echo "Done. Try: curl http://localhost:8080/hello"
