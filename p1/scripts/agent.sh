echo "hello i'm agent"

TOKEN=$(cat /vagrant/.node-token)
echo "============> " $TOKEN

curl -sfL https://get.k3s.io | K3S_URL=https://192.168.56.110:6443 K3S_TOKEN=$TOKEN sh -s - --node-ip 192.168.56.111
