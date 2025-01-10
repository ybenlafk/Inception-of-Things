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
echo "Waiting for argocd pods to be ready.."
kubectl wait pod --all --for=condition=Ready --namespace=argocd --timeout=-1s
kubectl port-forward svc/argocd-server -n argocd 8080:443& disown
argocd login localhost:8080 --username admin --password $(argocd admin initial-password -n argocd | cut -d\  -f1) --insecure
argocd cluster add k3d-part3 --insecure -y --in-cluster # FIXME: This might not be necessary
kubectl config set-context --current --namespace=argocd
argocd app create wil-app --repo https://github.com/soufianeamini/wil-app.git --path . --dest-server https://kubernetes.default.svc --dest-namespace dev
argocd app set wil-app --sync-policy automated
