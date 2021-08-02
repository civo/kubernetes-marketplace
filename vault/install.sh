kubectl create namespace vault
helm repo add hashicorp https://helm.releases.hashicorp.com
VALUES=""

case $INSTALL_MODE in
  dev)
    VALUES='--set "server.dev.enabled=true"'
    ;;
esac

helm upgrade --atomic --install --namespace vault --version 0.13.0 vault hashicorp/vault
