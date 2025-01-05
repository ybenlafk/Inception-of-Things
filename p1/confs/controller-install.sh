#!/bin/bash

echo "Setting up K3s controller on ybenlafkS..."

curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--node-ip=192.168.56.110 --bind-address=192.168.56.110" sh -s - --write-kubeconfig-mode 644

echo "K3s controller setup complete."
