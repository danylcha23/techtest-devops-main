# Hello App

Simple Spring Boot app for CI/CD exercises.

## Run locally (no Docker)
From repo root:
```bash
cd app
mvn -q -DskipTests=false test
mvn -q spring-boot:run
