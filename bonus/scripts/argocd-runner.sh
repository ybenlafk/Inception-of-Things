#!/usr/bin/env bash

kubectl create namespace argocd
kubectl apply -f ../config/argocd-service-ref.yaml
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
echo "Waiting for pods to be ready"
sleep 5
kubectl wait pod --all --for=condition=Ready --namespace=argocd --timeout=-1s
kubectl port-forward --pod-running-timeout 1h svc/argocd-server -n argocd 9091:443& disown
argocd login --http-retry-max 1000 localhost:9091 --username admin --password "$(argocd admin initial-password -n argocd | cut -d\  -f1)" --insecure
argocd cluster add k3d-bonus --insecure -y --in-cluster
kubectl config set-context --current --namespace=argocd
argocd app create wil-app --repo http://gitlab-ref:8080/root/samini_bonus_project.git --path . --dest-server https://kubernetes.default.svc --dest-namespace dev
argocd app set wil-app --sync-policy automated
