#!/bin/bash

APISIX_CHART_VERSION=1.1.0
NS=apisix

# Add the Helm repository for Apache APISIX Ingress Controller
helm repo add apisix https://charts.apiseven.com
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update

# Create the namespace and install the Helm chart
helm upgrade -i apisix apisix/apisix --version=$APISIX_CHART_VERSION --namespace $NS --create-namespace --set gateway.type=LoadBalancer --set ingress-controller.enabled=true --set ingress-controller.config.apisix.serviceNamespace=$NS  --set ingress-controller.config.apisix.adminAPIVersion=v3 --set ingress-controller.config.ingressPublishService="$NS/apisix-gateway"
