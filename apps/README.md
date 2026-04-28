# Apps Repo

This repo contains the runnable application code plus the Kubernetes manifests that describe the workloads Argo CD deploys.

## Contents

- Spring Boot app at the repo root: `src/`, `pom.xml`, `Dockerfile`
- Frontend app in `frontend/`
- Supporting demo services in `python-app/`, `node-api/`, `go-api/`, `rust-api/`, `dotnet-api/`, `php-app/`, `ruby-app/`, `kotlin-app/`, and `elixir-app/`
- Kubernetes manifests in `k8s/`

## Local Build

Build the main Spring Boot image from this repo root:

```bash
docker build -t springboot-demo-app:local .
docker run --rm -p 8080:8080 springboot-demo-app:local
```

Build the frontend locally:

```bash
cd frontend
npm install
npm run dev
```

## Kubernetes Layout

- `k8s/` contains the Spring Boot base manifests plus ingress
- `k8s/python-app`, `k8s/node-api`, and the other service folders contain service-specific Kustomize overlays

## GitOps Relationship

This repo is the source of truth for application manifests.

- The `app-building` repo builds images and can update manifest image tags on the `deploy` branch.
- The `argocd-repo` points Argo CD at this repo's `k8s/` paths.
