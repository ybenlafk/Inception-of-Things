#!/bin/bash

echo "Fetching K3s token from the controller (ybenlafkS)..."

# Fetch the K3s token securely
sshpass -p "vagrant" ssh -o StrictHostKeyChecking=no vagrant@192.168.56.110 "sudo cat /var/lib/rancher/k3s/server/node-token"
