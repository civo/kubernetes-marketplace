#!/bin/bash

domain="${CLUSTER_ID}.k8s.civo.com"
gitProvider=${GITPROVIDER}

helm repo add epamedp https://epam.github.io/edp-helm-charts/stable
helm repo update

# Wait for Tekton to be ready
kubectl wait --for=condition=available --timeout=200s deployment/tekton-pipelines-webhook -n tekton-pipelines

kubectl create namespace edp

helm install edp epamedp/edp-install --version 3.7.3 --namespace edp --set global.dnsWildCard="$domain" --set global.gitProvider=${GITPROVIDER} --timeout 10m
