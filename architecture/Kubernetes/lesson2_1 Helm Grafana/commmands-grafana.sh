# Adds grafana charts repo
helm repo add grafana https://grafana.github.io/helm-charts
# Installs grafana release
helm install grafana  grafana/grafana
# A cup of tea befor grafana pod is not running
kubectl get pods -w
# Get Admin password                                
kubectl get secret --namespace default grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo
# Port forwarding and open browser on localhost:3000
export POD_NAME=$(kubectl get pods --namespace default -l "app.kubernetes.io/name=grafana,app.kubernetes.io/instance=grafana" -o jsonpath="{.items[0].metadata.name}")
     kubectl --namespace default port-forward $POD_NAME 3000