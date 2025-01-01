#!/bin/bash

echo "Setting up common environment..."

# Update system and install basic dependencies
sudo apt-get update -y
sudo apt-get install -y curl apt-transport-https sshpass

echo "Common environment setup complete."
