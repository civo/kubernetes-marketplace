#!/bin/bash

kubectl create namespace vault
helm repo add hashicorp https://helm.releases.hashicorp.com

case $INSTALL_MODE in
  dev)
    helm upgrade --install --namespace vault  --version 0.13.0 vault hashicorp/vault --set "server.dev.enabled=true"
    ;;
  standalone)
    helm upgrade --atomic --install --namespace vault --version 0.13.0 vault hashicorp/vault
    ;;
esac

