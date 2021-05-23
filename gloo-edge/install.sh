#!/bin/bash
GLOO_NS=gloo-system
TRAEFIK_NS=kube-system

# Uninstall default Trafeik resources as gloo-edge and traefik 
# are mutally exclusive

kubectl config set-context --current --namespace=$TRAEFIK_NS
helm uninstall traefik

# Get back to default NS
kubectl config set-context --current --namespace=default

# Add the Helm repository for Gloo Edge
helm repo add gloo https://storage.googleapis.com/solo-public-helm
helm repo update

# Create the namespace and install the Helm chart
kubectl create namespace $GLOO_NS
helm install gloo gloo/gloo --namespace $GLOO_NS --wait
