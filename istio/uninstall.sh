#!/bin/bash

set -e
set -o pipefail 

ISTIO_NS=istio-system
ISTIO_INGRESS_NS=istio-ingress

ISTIO_NS=istio-system
ISTIO_INGRESS_NS=istio-ingress

# Determine Istio version to download
if [ -z "$ISTIO_VERSION" ] || [ "$ISTIO_VERSION" == "latest" ];
then
  ISTIO_VERSION="$(curl -sL https://github.com/istio/istio/releases | \
                  grep -o 'releases/[0-9]*.[0-9]*.[0-9]*/' | sort --version-sort | \
                  tail -1 | awk -F'/' '{ print $2}')"
  ISTIO_VERSION="${ISTIO_VERSION##*/}"
fi

echo "Downloading Istio Version $ISTIO_VERSION"

NOHUP_FILE="$(basedir)/nohup.out"
rm -f "$NOHUP_FILE"
curl -sSL https://istio.io/downloadIstio | nohup sh - > "$NOHUP_FILE" 2>&1 &
wait 

#ISTIO_DIR="istio-$ISTIO_VERSION"
ISTIO_PATH=$(grep -oP '(?<=export PATH="\$PATH:).*(?=")' "$NOHUP_FILE")
ISTIOCTL_CMD="$ISTIO_PATH/istioctl"

# Delete Istio CRD and other resources
$ISTIOCTL_CMD manifest generate --set profile=demo |\
   kubectl delete  -n$ISTIO_NS --ignore-not-found=true -f -

# Delete Istio Ingress Namespace
kubectl delete ns $ISTIO_INGRESS_NS --ignore-not-found=true

# Delete Istio Namespace
kubectl delete ns $ISTIO_NS --ignore-not-found=true

# Set context namespace back to "default"
kubectl config set-context --current --namespace=default