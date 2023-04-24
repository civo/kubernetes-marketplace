#!/bin/sh

subdomain="rancher.$CLUSTER_ID.k8s.civo.com"
email="$EMAIL"

#Wait for the Cert Manager deployment to be done.
kubectl wait --for=condition=available --timeout=300s deployment/cert-manager-webhook  -n cert-manager

helm repo add rancher-latest https://releases.rancher.com/server-charts/latest
helm repo update
kubectl create namespace cattle-system

  
helm upgrade --install rancher rancher-latest/rancher --namespace cattle-system --set hostname="$subdomain" --set bootstrapPassword="$ADMIN_PASS" --set ingress.tls.source=letsEncrypt --set letsEncrypt.ingress.class=traefik --set letsEncrypt.email="$email" --version 2.7.3
