#!/bin/sh

subdomain="$CLUSTER_ID.k8s.civo.com"
email="$EMAIL"

kubectl wait --namespace=cert-manager --for=condition=Ready pods --selector app.kubernetes.io/instance=cert-manager --timeout=200s

helm repo add rancher-latest https://releases.rancher.com/server-charts/latest
helm repo update
kubectl create namespace cattle-system

helm upgrade --install rancher rancher-latest/rancher --namespace cattle-system --set hostname="$subdomain" --set bootstrapPassword="$ADMIN_PASS"
