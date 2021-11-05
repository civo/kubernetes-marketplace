#!/bin/bash

#Install Traefik
helm repo add traefik https://helm.traefik.io/traefik
helm repo update
helm install traefik traefik/traefik

#Install Cert Manager
kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v1.5.4/cert-manager.yaml

#Install Ketch
kubectl apply -f https://github.com/shipa-corp/ketch/releases/download/v0.5.0/ketch-controller.yaml