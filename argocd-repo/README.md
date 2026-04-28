# Argo CD Repo

This directory mirrors the live `argocd/` configuration and points Argo CD at this monorepo.

## What Lives Here

- `application-controller*/`, `repo-server/`, `server/`, and `redis/` for Argo CD components
- `application.yaml` for the main Spring Boot application
- `*-app.yaml` and `*-api.yaml` for the language-specific demo services

## Source Paths

The application manifests are wired to:

- `https://github.com/Lahare-Om/springboot-demo-gitops`
- branch `deploy`

They expect application Kubernetes resources to live under:

- `apps/k8s/` for the Spring Boot app
- `apps/k8s/<service-name>/` for the supporting demo services
