#!/bin/sh

SYSTEM_DOMAIN="$CLUSTER_ID.k8s.civo.com"

#Wait for the Cert Manager deployment to be done.
kubectl wait --for=condition=available --timeout=300s deployment/cert-manager-webhook  -n cert-manager

helm repo add epinio https://epinio.github.io/helm-charts
helm repo update
kubectl create namespace epinio

helm upgrade --install epinio epinio/epinio --namespace epinio --set global.domain="$SYSTEM_DOMAIN" --version 1.6.2 --wait
