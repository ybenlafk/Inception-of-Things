echo "hello i'm server"

curl -sfL https://get.k3s.io | sh -s - --node-ip 192.168.56.110 --write-kubeconfig-mode 644

sudo cp /var/lib/rancher/k3s/server/node-token /vagrant/ && sudo mv /vagrant/node-token /vagrant/.node-token
