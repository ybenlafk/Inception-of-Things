#!/usr/bin/env bash
mkdir -p /tmp/gitlab-config /tmp/gitlab-opt /tmp/gitlab-log /tmp/gitlab-bonus
k3d cluster create -v /tmp/gitlab-config:/tmp/gitlab-config -v /tmp/gitlab-log:/tmp/gitlab-log -v /tmp/gitlab-opt:/tmp/gitlab-opt -v /tmp/gitlab-bonus:/tmp/gitlab-bonus -p "8888:8888@loadbalancer" bonus

mkdir -p /tmp/gitlab-bonus/wil-app
cp ../config/wil-app/*.yaml /tmp/gitlab-bonus/wil-app
cp ./gitlab-configure.sh /tmp/gitlab-bonus

kubectl apply -f ../config/gitlab-app.yaml
