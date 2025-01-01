#!/bin/bash

echo "Setting up K3s controller on ybenlafkS..."

# Install K3s in controller mode
curl -sfL https://get.k3s.io | sh -s - --write-kubeconfig-mode 644

# # Add Kubernetes apt repository
# sudo mkdir -p /etc/apt/keyrings
# curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.28/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-archive-keyring.gpg
# echo "deb [signed-by=/etc/apt/keyrings/kubernetes-archive-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.28/deb/ /" | sudo tee /etc/apt/sources.list.d/kubernetes.list

# # Update package list
# sudo apt-get update -y

# # Verify the repository configuration
# echo "Verifying repository configuration..."
# grep -r "kubernetes" /etc/apt/sources.list.d/
# cat /etc/apt/keyrings/kubernetes-archive-keyring.gpg

# # Install kubectl
# sudo apt-get install -y kubectl

echo "K3s controller setup complete."
