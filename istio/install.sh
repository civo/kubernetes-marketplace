#!/bin/bash
set -e
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

# Create a revision name
ISTIO_REVISION="${ISTIO_VERSION//./-}"

NS=$(kubectl get namespace $ISTIO_NS --ignore-not-found);
if [[ "$NS" ]]; then
  echo "Skipping creation of namespace $ISTIO_NS - already exists";
else
  echo "Creating namespace $ISTIO_NS";
  kubectl create namespace $ISTIO_NS;
fi;

SVC=$(kubectl get svc istiod -n $ISTIO_NS --ignore-not-found);
if [[ "$SVC" ]]; then
  echo "Skipping creation of service istiod - already exists";
else
  echo "Creating service istiod";
  kubectl create -n $ISTIO_NS \
  -f https://raw.githubusercontent.com/civo/kubernetes-marketplace/master/istio/istiod-service.yaml
fi;

istioctl install -y -n $ISTIO_NS \
  -f control-plane.yaml \
  --revision "$ISTIO_REVISION"

###########################################
# Deploy Ingress Gateways
###########################################

NS=$(kubectl get namespace $ISTIO_INGRESS_NS --ignore-not-found);
if [[ "$NS" ]]; then
  echo "Skipping creation of namespace $ISTIO_INGRESS_NS - already exists";
else
  echo "Creating namespace $ISTIO_INGRESS_NS";
  kubectl create namespace $ISTIO_INGRESS_NS;
fi;

istioctl install -y -n $ISTIO_INGRESS_NS \
   -f https://raw.githubusercontent.com/civo/kubernetes-marketplace/master/istio/ingress-gateways.yaml \
  --revision "$ISTIO_REVISION"
