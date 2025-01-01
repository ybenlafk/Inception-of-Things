#!/bin/bash

# Get the K3s token from the argument
TOKEN=$1

if [ -z "$TOKEN" ]; then
  echo "Error: K3s token is missing. Exiting."
  exit 1
fi

echo "Setting up K3s worker on ybenlafkSW..."

# Install K3s in agent mode
curl -sfL https://get.k3s.io | K3S_URL=https://192.168.56.110:6443 K3S_TOKEN=$TOKEN sh -

echo "K3s worker setup complete."
