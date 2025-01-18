#!/usr/bin/env bash
k3d cluster create -p "8888:8888@loadbalancer" bonus

mkdir -p /tmp/gitlab-scripts
cp ../config/wil-app/*.yaml /tmp/gitlab-scripts
cp ./gitlab-configure.sh /tmp/gitlab-scripts

kubectl apply -f ../config/gitlab-app.yaml
