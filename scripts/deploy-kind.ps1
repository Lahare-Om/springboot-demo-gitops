Write-Host "Creating Kind cluster..."

kind create cluster

Write-Host "Building Python app image..."
docker build -t python-demo-app:0.1.0 .\python-app

Write-Host "Building Node app image..."
docker build -t node-demo-app:0.1.0 .\node-api

Write-Host "Loading Docker images..."

kind load docker-image springboot-demo-app:local
kind load docker-image python-demo-app:0.1.0
kind load docker-image node-demo-app:0.1.0

Write-Host "Deploying Kubernetes manifests..."

kubectl apply -k k8s/
kubectl apply -k k8s/python-app
kubectl apply -k k8s/node-api

Write-Host "Deployment complete!"
kubectl get pods
