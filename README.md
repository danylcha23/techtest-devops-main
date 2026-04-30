# DevOps Tech Test – CI/CD Pipeline Exercise

## Context
This repository contains a small Spring Boot application (Java 21, Maven) with unit tests and a health endpoint.
Your goal is to design and implement a CI/CD pipeline as you would in production, within a limited timebox.

## Timebox
Plan for ~2–3 hours of work.

## Constraints
- You may use **any CI/CD platform** (GitHub Actions, GitLab CI, Azure DevOps, Jenkins, CircleCI, Buildkite, etc.).
- You may produce **any deliverable** (artifact, container image, or a deployment), as long as it is traceable to a commit.
- Your solution will be reviewed and demonstrated during a follow-up interview.

## Must-have requirements
Implement pipeline automation that:
1. Builds the application
2. Runs unit tests
3. Runs an integration smoke test (health endpoint)
4. Produces a traceable deliverable tied to a commit

## Helpful commands

### Build + unit tests (no Docker)
```bash
cd app
mvn test
mvn package
