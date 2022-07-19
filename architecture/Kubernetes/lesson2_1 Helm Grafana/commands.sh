helm create test-chart
minikube start
helm install my-helm-release  test-chart -n tst-namespace -f test-chart/values.yaml --create-namespace
helm uninstall my-helm-release -n tst-namespace
elm install my-dev-release  test-chart -n dev-namespace -f test-chart/dev.yaml --create-namespace
helm package test-chart 
