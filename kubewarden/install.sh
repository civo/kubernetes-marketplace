#!/bin/sh

KUBEWARDEN_CRDS_CHART_VERSION="1.3.1"
KUBEWARDEN_DEFAULTS_CHART_VERSION="1.6.1"
KUBEWARDEN_CONTROLLER_CHART_VERSION="1.5.3"


# Currently, the chart depends on cert-manager.
# Make sure we have cert-manager installed before installing the kubewarden-controller chart.
kubectl wait --for=condition=Available deployment --timeout=2m -n cert-manager --all

helm repo add kubewarden https://charts.kubewarden.io

helm repo update kubewarden

helm upgrade \
  --install \
  --wait \
  -n kubewarden \
  --version "$KUBEWARDEN_CRDS_CHART_VERSION" \
  --create-namespace \
  kubewarden-crds \
  kubewarden/kubewarden-crds

helm upgrade \
  --install \
  --wait \
  -n kubewarden \
  --version "$KUBEWARDEN_CONTROLLER_CHART_VERSION"
  kubewarden-controller \
  kubewarden/kubewarden-controller

helm upgrade \
  --install \
  --wait \
  -n kubewarden \
  --version "$KUBEWARDEN_DEFAULTS_CHART_VERSION"
  kubewarden-defaults \
  kubewarden/kubewarden-defaults

