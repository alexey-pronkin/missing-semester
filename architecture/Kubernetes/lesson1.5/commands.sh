minikube start
# Create namespace lesson1-5
kubectl apply -f namespace.yaml
# Apply development with 3 pods
kubectl apply -f deployment.yaml
# Get info about pods
kubectl get pod -n lesson1-5 -o wide
# Get info about deployments
kubectl get deployments -n lesson1-5
# Get info about the deployment
kubectl describe deployment -n lesson1-5 goapp-deployment
# Scale deployment
kubectl scale deployment -n lesson1-5 goapp-deployment --replicas=5
# Delete deployment (pod are deleted too)
kubectl delete -f deployment.yaml
kubectl delete deployment -n lesson1-5 goapp-deployment

kubectl get pods -n lesson1-5 -w

kubectl get pods -n lesson1-5

kubectl delete pod -n lesson1-5 goapp-deployment-985f7c4c4-6n8qb