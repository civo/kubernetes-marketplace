#!/bin/bash

kubectl create namespace vault
helm repo add hashicorp https://helm.releases.hashicorp.com

case $INSTALL_MODE in
  standalone)
    helm upgrade --atomic --install --namespace vault --version 0.24.0 vault hashicorp/vault
    ;;
  dev)
    helm upgrade --install --namespace vault --version 0.24.0 vault hashicorp/vault --set "server.dev.enabled=true"
    ;;
  ha-raft)
    helm upgrade --atomic --install --namespace vault --version 0.24.0 vault hashicorp/vault --set="server.ha.enabled=true" --set="server.ha.raft.enabled=true"
    ;;
esac
