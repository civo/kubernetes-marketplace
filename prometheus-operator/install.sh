#!/bin/bash

NAMESPACE=monitoring
HELM_CHART_VERSION=8.2.0
# Create the namespace for prometheus-operator
kubectl create namespace ${NAMESPACE}

# Update your local Helm chart repository cache
helm repo update

# Ensure CRDs exist
checkCRDs () {
  kubectl -n ${NAMESPACE} wait --for condition=established --timeout=60s crd/alertmanagers.monitoring.coreos.com
  kubectl -n ${NAMESPACE} wait --for condition=established --timeout=60s crd/podmonitors.monitoring.coreos.com
  kubectl -n ${NAMESPACE} wait --for condition=established --timeout=60s crd/prometheuses.monitoring.coreos.com
  kubectl -n ${NAMESPACE} wait --for condition=established --timeout=60s crd/prometheusrules.monitoring.coreos.com
  kubectl -n ${NAMESPACE} wait --for condition=established --timeout=60s crd/servicemonitors.monitoring.coreos.com
}

BACKOFF=1
until checkCRDs || [ $BACKOFF -eq 10 ]; do
  printf 'Waiting for CRDs to exist...'
  sleep $(( BACKOFF++ ))
done

# Install the prometheus-operator Helm chart
helm install \
  --name prometheus-operator \
  --namespace ${NAMESPACE} \
  --set prometheusOperator.createCustomResource=false \
  --version ${HELM_CHART_VERSION} \
  stable/prometheus-operator
