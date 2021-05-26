#!/bin/bash

set -eu 
set -o pipefail 

ISTIO_NS=istio-system

if [ "$ISTIO_VERSION" == "latest" ];
then
  unset ISTIO_VERSION
  curl -L https://istio.io/downloadIstio | sh -
else
  curl -L https://istio.io/downloadIstio | ISTIO_VERSION=$ISTIO_VERSION sh -
fi

ISTIO_DIR=$(find . -name istio*)
export PATH=$ISTIO_DIR/bin:$PATH

kubectl config set-context --current --namespace=$ISTIO_NS

# Delete Istio
istioctl manifest generate --set profile=demo |\
   kubectl delete  -n$ISTIO_NS --ignore-not-found=true -f -

# Set context namespace back to "default"
kubectl config set-context --current --namespace=default