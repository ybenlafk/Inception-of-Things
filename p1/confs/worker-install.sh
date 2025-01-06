#!/bin/bash

# Get the K3s token from the argument
TOKEN=$1

if [ -z "$TOKEN" ]; then
  echo "Error: K3s token is missing. Exiting."
  exit 1
fi

echo "Setting up K3s worker on ybenlafkSW..."

# Function to check if the server is accessible and ready
check_server() {
  curl -sk https://192.168.56.110:6443/healthz &>/dev/null
  return $?
}

# Wait for server to be ready
echo "Waiting for K3s server to be ready..."
max_attempts=60  # Increased attempts
attempt=1
while [ $attempt -le $max_attempts ]; do
  if check_server; then
    echo "Server is accessible and healthy, proceeding with installation..."
    break
  fi
  echo "Waiting for server... attempt $attempt/$max_attempts"
  sleep 10
  attempt=$((attempt + 1))
done

if [ $attempt -gt $max_attempts ]; then
  echo "Server failed to become ready in time"
  exit 1
fi

# Print token length for debugging (don't print the actual token)
echo "Token length: ${#TOKEN}"

# Install K3s in agent mode with the specified node IP and additional flags
curl -sfL https://get.k3s.io | \
  INSTALL_K3S_EXEC="--node-ip=192.168.56.111 --kubelet-arg=node-status-update-frequency=5s" \
  K3S_URL="https://192.168.56.110:6443" \
  K3S_TOKEN="$TOKEN" \
  sh -

# Wait for agent to start
echo "Waiting for k3s-agent to start..."
max_wait=300  # 5 minutes
start_time=$(date +%s)
while true; do
  if systemctl is-active --quiet k3s-agent; then
    echo "k3s-agent is active"
    break
  fi
  current_time=$(date +%s)
  elapsed=$((current_time - start_time))
  if [ $elapsed -gt $max_wait ]; then
    echo "Timeout waiting for k3s-agent to start"
    systemctl status k3s-agent
    journalctl -u k3s-agent -n 50
    exit 1
  fi
  echo "Waiting for k3s-agent to start... ($elapsed seconds elapsed)"
  sleep 5
done

echo "K3s worker setup complete."