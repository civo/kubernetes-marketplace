#!/bin/sh

domain="${CLUSTER_ID}.k8s.civo.com"
email="${EMAIL}"
edition=${EDITION}

helm repo add gitlab https://charts.gitlab.io/
helm repo update

kubectl create namespace gitlab --dry-run=client -o yaml | kubectl apply -f - 

echo 'waiting for 30s for the components to get started'
#Wait for the Cert Manager deployment to be done.
kubectl wait --for=condition=available --timeout=300s deployment/cert-manager-webhook  -n cert-manager

helm upgrade --install gitlab gitlab/gitlab --namespace gitlab --set global.edition="${EDITION}" --set global.hosts.domain="$domain" --set global.hosts.https=true --set certmanager-issuer.email="${EMAIL}" --timeout 600s --version 7.2.3 -f https://raw.githubusercontent.com/civo/kubernetes-marketplace/master/gitlab/config.yaml 

