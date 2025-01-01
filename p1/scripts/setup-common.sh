#!/bin/bash

echo "Setting up common environment..."

sudo apt-get update -y
sudo apt-get install -y curl apt-transport-https sshpass

echo "Common environment setup complete."
