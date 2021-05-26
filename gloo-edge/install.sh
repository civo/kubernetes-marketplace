#!/bin/bash
GLOO_NS=gloo-system

# Get back to default NS
kubectl config set-context --current --namespace=default

# Add the Helm repository for Gloo Edge
helm repo add gloo https://storage.googleapis.com/solo-public-helm
helm repo update

# Create the namespace and install the Helm chart
kubectl create namespace $GLOO_NS
helm install gloo gloo/gloo --namespace $GLOO_NS --wait
