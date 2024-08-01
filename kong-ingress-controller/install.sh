#!/bin/bash

KONG_VERSION=3.5
KONG_INGRESS_VERSION=3.0
NS=kong

# Add the Helm repository for Kong Ingress Controller
helm repo add kong https://charts.konghq.com
helm repo update

# Create the namespace and install the Helm chart
kubectl create namespace $NS
helm install kong kong/ingress --set controller.ingressController.image.tag=$KONG_INGRESS_VERSION --set gateway.image.tag=$KONG_VERSION --namespace $NS
