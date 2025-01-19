#!/usr/bin/env bash
mkdir -p /tmp/gitlab-config /tmp/gitlab-opt /tmp/gitlab-log /tmp/gitlab-bonus
k3d cluster create -v /tmp/gitlab-config:/tmp/gitlab-config -v /tmp/gitlab-log:/tmp/gitlab-log -v /tmp/gitlab-opt:/tmp/gitlab-opt -v /tmp/gitlab-bonus:/tmp/gitlab-bonus -p "8888:8888@loadbalancer" bonus

cp ../config/wil-app/*.yaml /tmp/gitlab-bonus
cp ./gitlab-configure.sh /tmp/gitlab-bonus

kubectl apply -f ../config/gitlab-app.yaml
sleep 10
echo "Waiting for gitlab pod to be ready.."
kubectl wait pod --all --for=condition=Ready --namespace=gitlab --timeout=-1s
kubectl port-forward svc/gitlab-app-service -n gitlab 8080:8080& disown
