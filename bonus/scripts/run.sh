k3d cluster create -p "80:80@loadbalancer" -p"443:443@loadbalancer" bonus

# Gitlab
helm repo add gitlab https://charts.gitlab.io/
helm install gitlab gitlab/gitlab \
  --set global.hosts.domain=web-02.rash0x6964.tech \
  --set certmanager-issuer.email=rash0x6964@gmail.com


# Argocd

# kubectl create namespace argocd
# kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
# sleep 5
# echo "Waiting for argocd pods to be ready.."
# kubectl wait pod --all --for=condition=Ready --namespace=argocd --timeout=-1s
# kubectl port-forward svc/argocd-server -n argocd 8080:443& disown
# argocd login localhost:8080 --username admin --password $(argocd admin initial-password -n argocd | cut -d\  -f1) --insecure
# argocd cluster add k3d-part3 --insecure -y --in-cluster
# kubectl config set-context --current --namespace=argocd
# argocd app create wil-app --repo https://github.com/soufianeamini/samini-iot-app.git --path . --dest-server https://kubernetes.default.svc --dest-namespace dev
# argocd app set wil-app --sync-policy automated
