kubectl create deployment first-deployment  --image=mathinaction/lesson2:v0.2
kubectl apply -f deployment.yaml
kubectl get deployments
kubectl get pod
kubectl config use-context mathinaction
# error: no context exists with the name: "mathinaction"
kubectl describe pods first-deployment-85678ddb5d-whbt2
minikube addons disable heapster
minikube addons enable metrics-server

kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/high-availability.yaml
kubectl top pods
kubectl top pods -A
kubectl delete pod first-deployment-85678ddb5d-whbt2
kubectl exec -it declarative-deployment-fddd7bb77-f55m9 sh
kubectl cp declarative-deployment-fddd7bb77-f55m9:main.go ./main.go