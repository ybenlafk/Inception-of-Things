k3d cluster create -p "8888:8888@loadbalancer" part3

# Argocd

kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
echo "Waiting for argocd pods to be ready.."
sleep 5
kubectl wait pod --all --for=condition=Ready --namespace=argocd --timeout=-1s
kubectl port-forward --pod-running-timeout 1h svc/argocd-server -n argocd 8080:443& disown
argocd login --http-retry-max 1000 localhost:8080 --username admin --password $(argocd admin initial-password -n argocd | cut -d\  -f1) --insecure
argocd cluster add k3d-part3 --insecure -y --in-cluster
kubectl config set-context --current --namespace=argocd
argocd app create wil-app --repo https://github.com/soufianeamini/samini-iot-app.git --path . --dest-server https://kubernetes.default.svc --dest-namespace dev
argocd app set wil-app --sync-policy automated
