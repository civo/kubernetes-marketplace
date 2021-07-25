kubectl create namespace vault
helm repo add hashicorp https://helm.releases.hashicorp.com
helm upgrade --atomic --install --namespace vault --version 0.13.0 vault hashicorp/vault