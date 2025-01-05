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
  timeout 5 bash -c 'cat < /dev/null > /dev/tcp/192.168.56.110/6443'
  return $?
}

# Wait for server to be ready
echo "Waiting for K3s server to be ready..."
max_attempts=30
attempt=1
while [ $attempt -le $max_attempts ]; do
  if check_server; then
    echo "Server port is accessible, proceeding with installation..."
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

# Install K3s in agent mode with the specified node IP
curl -sfL https://get.k3s.io | \
  INSTALL_K3S_EXEC="--node-ip=192.168.56.111" \
  K3S_URL="https://192.168.56.110:6443" \
  K3S_TOKEN="$TOKEN" \
  sh -

# Verify the agent status
systemctl status k3s-agent

echo "K3s worker setup complete."