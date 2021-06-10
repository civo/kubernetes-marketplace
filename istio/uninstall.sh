#!/bin/bash

set -eu 
set -o pipefail 

ISTIO_NS=istio-system
ISTIO_INGRESS_NS=istio-ingress

# Determines the operating system.
OS="$(uname)"
if [ "${OS}" = "Darwin" ] ; then
  OSEXT="osx"
else
  OSEXT="linux"
fi

# Determin Istio version to download
if [ -z "$ISTIO_VERSION" ] || [ "$ISTIO_VERSION" == "latest" ];
then
  ISTIO_VERSION="$(curl -sL https://github.com/istio/istio/releases | \
                  grep -o 'releases/[0-9]*.[0-9]*.[0-9]*/' | sort --version-sort | \
                  tail -1 | awk -F'/' '{ print $2}')"
  ISTIO_VERSION="${ISTIO_VERSION##*/}"
fi

echo "Downloading Istio Version $ISTIO_VERSION"

DOWNLOAD_URL="https://github.com/istio/istio/releases/download/${ISTIO_VERSION}/istio-${ISTIO_VERSION}-${OSEXT}.tar.gz"

wget -q "${DOWNLOAD_URL}" -O - | tar -zxf -

ISTIO_DIR="istio-$ISTIO_VERSION"
export PATH=$ISTIO_DIR/bin:$PATH

# Delete Istio CRD and other resources
istioctl manifest generate --set profile=demo |\
   kubectl delete  -n$ISTIO_NS --ignore-not-found=true -f -

# Delete Istio Ingress Namespace
kubectl delete ns $ISTIO_INGRESS_NS --ignore-not-found=true

# Delete Istio Namespace
kubectl delete ns $ISTIO_NS --ignore-not-found=true

# Set context namespace back to "default"
kubectl config set-context --current --namespace=default