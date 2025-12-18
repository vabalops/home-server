# On node that will be used to store data

curl -sSfL -o longhornctl https://github.com/longhorn/cli/releases/download/v1.9.1/longhornctl-linux-arm64

# Set the environment variable: 
export KUBECONFIG=/etc/rancher/k3s/k3s.yaml

# pass the flag directly: --kube-config=/path/to/config
sudo ./longhornctl check preflight --kube-config /etc/rancher/k3s/k3s.yaml

sudo ./longhornctl install preflight --kube-config /etc/rancher/k3s/k3s.yaml

