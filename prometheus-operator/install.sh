#!/bin/bash

NAMESPACE=monitoring
HELM_CHART_VERSION=8.2.0
# Create the namespace for prometheus-operator
kubectl create namespace ${NAMESPACE}

# Update your local Helm chart repository cache
helm3 repo update

# Install the prometheus-operator Helm chart
helm3 install \
  --namespace ${NAMESPACE} \
  --set prometheusOperator.createCustomResource=false \
  --version ${HELM_CHART_VERSION} \
  prometheus-operator stable/prometheus-operator
