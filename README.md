# Spring Boot Demo GitOps Monorepo

This repository contains the application code, Kubernetes manifests, Argo CD application definitions, and GitHub Actions pipeline for the local GitOps demo.

## Layout

- `.github/workflows/` contains the active CI/CD workflow.
- `apps/` contains application source code, Dockerfiles, and Kubernetes manifests.
- `argocd/` contains the live Argo CD installation and `Application` definitions.
- `app-building/` and `argocd-repo/` are kept as repo-shaped references, but this repository is wired to work as a monorepo.

## CI/CD Flow

1. Push to `main`.
2. GitHub Actions builds and tests the Spring Boot app from `apps/`.
3. The workflow builds and pushes the Docker image.
4. The workflow merges the change into `deploy`.
5. The workflow updates `apps/k8s/base/deployment.yaml` with the new image tag.
6. Argo CD syncs from the `deploy` branch using the `apps/k8s...` manifest paths.
