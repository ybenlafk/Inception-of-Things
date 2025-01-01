#!/bin/bash

# Update system
apt-get update
apt-get upgrade -y

# Install required packages
apt-get install -y curl net-tools

# Install K3s
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--node-ip=192.168.56.110" sh -s - --write-kubeconfig-mode 644
# Wait for K3s to be ready
while ! kubectl get node | grep -q "Ready"; do
    sleep 2
done

# Apply configurations
kubectl apply -f /vagrant/confs/app1.yaml
kubectl apply -f /vagrant/confs/app2.yaml
kubectl apply -f /vagrant/confs/app3.yaml
kubectl apply -f /vagrant/confs/ingress.yaml