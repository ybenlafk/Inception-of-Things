#!/bin/bash

echo "Fetching K3s token from the controller (ybenlafkS)..."

# Fetch the K3s token securely using the SSH key
ssh -o StrictHostKeyChecking=no -i /goinfre/ybenlafk/Inception-of-Things/p1/.vagrant/machines/ybenlafkS/virtualbox/private_key vagrant@192.168.56.110 "sudo cat /var/lib/rancher/k3s/server/node-token"
