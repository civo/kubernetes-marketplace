#!/bin/bash

KONG_VERSION=3.3
KONG_INGRESS_VERSION=2.11
NS=kong

# Add the Helm repository for Kong Ingress Controller
helm repo add kong https://charts.konghq.com
helm repo update

# Create the namespace and install the Helm chart
kubectl create namespace $NS
helm install kong kong/kong --set ingressController.installCRDs=false --set ingressController.image.tag=$KONG_INGRESS_VERSION --set image.tag=$KONG_VERSION --namespace $NS
