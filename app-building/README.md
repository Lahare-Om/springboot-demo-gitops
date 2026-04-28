# App Building Repo

This repo owns build automation, local helper scripts, and runbooks for the application platform.

## What Lives Here

- `.github/workflows/` for CI/CD automation
- `scripts/` for local cluster/bootstrap/smoke-test helpers
- `docs/` for setup and operational notes

## Expected Sibling Repositories

The local scripts assume this layout on disk:

```text
workspace/
|- app-building/
|- apps/
`- argocd-repo/
```

## GitHub Setup

Set these in the `app-building` GitHub repository before enabling the workflow:

- Repository variable `APPS_REPOSITORY`: the `owner/name` of the apps repo
- Secret `CROSS_REPO_TOKEN`: a token with permission to checkout and push to the apps repo
- Secrets `DOCKER_USERNAME` and `DOCKER_PASSWORD`

The root workflow builds the Spring Boot image from `apps/` and updates `apps/k8s/base/deployment.yaml` on the `deploy` branch.
