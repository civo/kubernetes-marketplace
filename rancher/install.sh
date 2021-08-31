#!/bin/sh

subdomain="$CLUSTER_ID.k8s.civo.com"
email="$EMAIL"

kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v1.3.1/cert-manager.yaml
sleep 30
helm repo add rancher-latest https://releases.rancher.com/server-charts/latest
helm repo update
kubectl create namespace cattle-system

helm upgrade --install rancher rancher-latest/rancher --namespace cattle-system --set hostname="$subdomain" --set bootstrapPassword="$ADMIN_PASS"
