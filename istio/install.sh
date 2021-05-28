#!/bin/bash

set -eu 
set -o pipefail 

ISTIO_NS=istio-system

if [ "$ISTIO_VERSION" == "latest" ];
then
  ISTIO_VERSION=$(curl -sSL https://api.github.com/repos/istio/istio/releases/latest | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')
  echo "Downloading latest Istio: v$ISTIO_VERSION"
  curl -L https://istio.io/downloadIstio | sh -
else
  echo "Downloading Istio: v$ISTIO_VERSION"
  curl -L https://istio.io/downloadIstio | ISTIO_VERSION=$ISTIO_VERSION sh -
fi

ISTIO_DIR=$(find . -name istio*)
export PATH=$ISTIO_DIR/bin:$PATH

# # Run prechecks
istioctl x precheck

# # Install Istio Demo Profile
istioctl install --set profile=demo -y

# Create the Ingress Gateway for istio-ingressgateway
kubectl apply -n $ISTIO_NS https://raw.githubusercontent.com/civo/kubernetes-marketplace/master/istio/ingress.yaml