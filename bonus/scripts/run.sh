k3d cluster create -p "8888:8888@loadbalancer" bonus

# Argocd

kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
sleep 5
echo "Waiting for argocd pods to be ready.."
kubectl wait pod --all --for=condition=Ready --namespace=argocd --timeout=-1s
kubectl port-forward svc/argocd-server -n argocd 9091:443& disown
argocd login localhost:9091 --username admin --password $(argocd admin initial-password -n argocd | cut -d\  -f1) --insecure
argocd cluster add k3d-part3 --insecure -y --in-cluster
kubectl config set-context --current --namespace=argocd
argocd app create wil-app --repo http://localhost/root/wil-app.git --path . --dest-server https://kubernetes.default.svc --dest-namespace dev
argocd app set wil-app --sync-policy automated
