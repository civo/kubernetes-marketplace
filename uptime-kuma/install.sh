#!/bin/bash

kubectl create namespace uptime-kuma
helm repo add uptime-kuma https://dirsigler.github.io/uptime-kuma-helm

case $INSTALL_MODE in
  standalone)
    helm upgrade --atomic --install --namespace uptime-kuma --version 2.8.1 uptime-kuma uptime-kuma/uptime-kuma
    ;;
esac
