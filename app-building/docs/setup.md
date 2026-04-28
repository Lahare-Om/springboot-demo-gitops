# Local Environment Setup

## Required Tooling

- Docker 26.x
- kubectl v1.30
- kind v0.22
- minikube v1.33
- Java 21
- Maven 3.9

## Local Repo Layout

Clone the split repositories as siblings:

```text
workspace/
|- app-building/
|- apps/
`- argocd-repo/
```

The helper scripts in `app-building/scripts` resolve the `apps` repo from that sibling layout.
