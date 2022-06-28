minikube start
kubectl apply -f namespace.yaml
kubectl apply -f pod.yaml
kubectl port-forward  -n lesson1-4 static-web 8080:8080 # ключ -n означает неймспейс

# ClusterIP
kubectl apply -f service.yaml

# LoadBalancer
kubectl apply -f load_balancer.yaml

# NodePort
kubectl apply -f node_port.yaml


kubectl get pod -n lesson1-4 -o wide
kubectl describe pod -n lesson1-4

# Port Forwarding
kubectl -n lesson1-4 port-forward pod/static-web 8080:8080

# Logs
kubectl logs -f -n kube-system etcd-minikube

# Get pod yaml
kubectl get pods -n lesson1-4 static-web -o yaml

# Get shell in pod
kubectl exec -it -n lesson1-4 pod/static-web -c web sh

# Get info about resources of pod
kubectl top pods -n lesson1-4

# Delete pod
kubectl delete pod -n lesson1-4 static-web
