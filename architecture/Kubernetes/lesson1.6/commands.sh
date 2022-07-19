minikube start
# Create namespace lesson1-6
kubectl apply -f namespace.yaml
# Apply development with 3 pods
kubectl apply -f deployment-env.yaml