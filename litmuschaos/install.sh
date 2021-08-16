kubectl create ns litmus
helm repo add litmuschaos https://litmuschaos.github.io/litmus-helm
helm install chaos litmuschaos/litmus --namespace=litmus --version=2.0.28