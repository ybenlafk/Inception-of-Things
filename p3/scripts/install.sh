# TODO: Dependencies 
# - curl
# - kubectl
# - docker
# - argocd cli
# Cluster configurations

k3d cluster create -p "8888:8888@loadbalancer" part3

# Dev

kubectl create -f ../config/dev-namespace.yaml
kubectl apply -f ../config/wil-app.yaml
kubectl apply -f ../config/wil-ingress.yaml

# Argocd

kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
sleep 5
kubectl wait pod --all --for=condition=Ready --namespace=argocd --timeout=-1s
kubectl port-forward svc/argocd-server -n argocd 8080:443
