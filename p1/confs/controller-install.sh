#!/bin/bash

echo "Setting up K3s controller on ybenlafkS..."

# Install K3s in controller mode
curl -sfL https://get.k3s.io | sh -s - --write-kubeconfig-mode 644

# Install kubectl
sudo apt-get install -y kubectl

echo "K3s controller setup complete."
