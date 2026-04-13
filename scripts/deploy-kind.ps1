Write-Host "Creating Kind cluster..."

kind create cluster

Write-Host "Building Python app image..."
docker build -t python-demo-app:0.1.0 .\python-app

Write-Host "Loading Docker images..."

kind load docker-image springboot-demo-app:local
kind load docker-image python-demo-app:0.1.0

Write-Host "Deploying Kubernetes manifests..."

kubectl apply -k k8s/
kubectl apply -k k8s/python-app

Write-Host "Deployment complete!"
kubectl get pods
