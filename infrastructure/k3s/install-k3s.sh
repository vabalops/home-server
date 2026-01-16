# on master
# TODO: include `--disable=coredns --disable=metrics-server` once managed via charts
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC='server --disable=traefik --disable=local-storage --flannel-backend=host-gw --disable-network-policy --cluster-init' sh -

# for context
sudo cat /etc/rancher/k3s/k3s.yaml

# to get token from master
sudo cat /var/lib/rancher/k3s/server/node-token

# on agent
# TODO: configure as HA cluster
NODE_TOKEN="xxxxx"
curl -sfL https://get.k3s.io | K3S_URL='https://192.168.1.121:6443' K3S_TOKEN=${NODE_TOKEN} sh -

add roles to nodes:
kubectl label node --all node-role.kubernetes.io/worker=
kubectl label node --all node-role.kubernetes.io/longhorn=


###### HA

# requires load balancer in front of servers

# first node
curl -sfL https://get.k3s.io | INSTALL_K3S_CHANNEL=v1.34 sh -s - --cluster-init --token homeKubernetes2026 --tls-san 192.168.1.222 --disable=traefik --disable=local-storage --flannel-backend=host-gw --disable-network-policy

# remaining
curl -sfL https://get.k3s.io | INSTALL_K3S_CHANNEL=v1.34 sh -s - --server https://192.168.1.222:6443 --token homeKubernetes2026 --disable=traefik --disable=local-storage --flannel-backend=host-gw --disable-network-policy
