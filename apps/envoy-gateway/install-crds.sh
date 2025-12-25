# https://gateway-api.sigs.k8s.io/guides/getting-started/#installing-gateway-api
kubectl apply --server-side -f https://github.com/kubernetes-sigs/gateway-api/releases/download/v1.4.1/standard-install.yaml

# experimental for TCP and UDP rules
kubectl apply --server-side -f https://github.com/kubernetes-sigs/gateway-api/releases/download/v1.4.1/experimental-install.yaml


