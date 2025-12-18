# on master
# TODO: include `--disable=coredns --disable=metrics-server` once managed via charts
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC='server --disable=traefik --disable=local-storage --flannel-backend=host-gw --disable-network-policy --cluster-init' sh -

# for context
sudo cat /etc/rancher/k3s/k3s.yaml

# to get token from master
sudo cat /var/lib/rancher/k3s/server/node-token

# on agent
NODE_TOKEN="xxxxx"
curl -sfL https://get.k3s.io | K3S_URL='https://192.168.1.245:6443' K3S_TOKEN=${NODE_TOKEN} sh -
