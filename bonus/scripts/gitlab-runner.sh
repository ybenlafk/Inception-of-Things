#!/usr/bin/env bash
k3d cluster create -p "8888:8888@loadbalancer" bonus

kubectl apply -f ../config/gitlab-app.yml
