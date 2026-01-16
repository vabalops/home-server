# On master node

curl -sSfL -o longhornctl https://github.com/longhorn/cli/releases/download/v1.10.1/longhornctl-linux-arm64

sudo chmod +x longhornctl

# Set the environment variable: 
export KUBECONFIG=/etc/rancher/k3s/k3s.yaml

# pass the flag directly: --kubeconfig=/path/to/config
sudo ./longhornctl check preflight --kubeconfig /etc/rancher/k3s/k3s.yaml

sudo ./longhornctl install preflight --kubeconfig /etc/rancher/k3s/k3s.yaml

