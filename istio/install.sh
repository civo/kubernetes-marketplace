#!/bin/bash
set -e
set -o pipefail 

ISTIO_NS=istio-system
ISTIO_INGRESS_NS=istio-ingress

basedir() {
  # Default is current directory
  local script=${BASH_SOURCE[0]}

  # Resolve symbolic links
  if [ -L "$script" ]; then
      if readlink -f "$script" >/dev/null 2>&1; then
          script=$(readlink -f "$script")
      elif readlink "$script" >/dev/null 2>&1; then
          script=$(readlink "$script")
      elif realpath "$script" >/dev/null 2>&1; then
          script=$(realpath "$script")
      else
          printf "ERROR: Cannot resolve symbolic link %s" "$script"
          exit 1
      fi
  fi

  local dir
  dir=$(dirname "$script")
  local full_dir
  full_dir=$(cd "${dir}" && pwd)
  echo "${full_dir}"
}

# Determine Istio version to download
if [ -z "${ISTIO_VERSION}" ] || [ "${ISTIO_VERSION}" == "latest" ];
then
  ISTIO_VERSION="$(curl -sL https://github.com/istio/istio/releases | \
                  grep -o 'releases/[0-9]*.[0-9]*.[0-9]*/' | sort --version-sort | \
                  tail -1 | awk -F'/' '{ print $2}')"
  ISTIO_VERSION="${ISTIO_VERSION##*/}"
fi

echo "Downloading Istio Version ${ISTIO_VERSION}"

NOHUP_FILE="$(basedir)/nohup.out"
rm -f "$NOHUP_FILE"
curl -sSL https://istio.io/downloadIstio | nohup sh - > "$NOHUP_FILE" 2>&1 &
wait 

###########################################
# Deploy Control Plane
###########################################

#ISTIO_DIR="istio-${ISTIO_VERSION}"
ISTIO_PATH=$(grep -oP '(?<=export PATH="\$PATH:).*(?=")' "$NOHUP_FILE")
ISTIOCTL_CMD="$ISTIO_PATH/istioctl"

# Compute the revision name
ISTIO_REVISION=$(awk 'BEGIN { dot = "[\\.]";dash ="-" } { gsub(dot, dash); print }' <<< "${ISTIO_VERSION}")

echo "Appling Istio Revision: $ISTIO_REVISION"

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

curl -sSL https://raw.githubusercontent.com/civo/kubernetes-marketplace/master/istio/control-plane.yaml | \
  $ISTIOCTL_CMD install -y -n $ISTIO_NS --revision "$ISTIO_REVISION" -f -

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

curl -sSL https://raw.githubusercontent.com/civo/kubernetes-marketplace/master/istio/ingress-gateways.yaml | \
  $ISTIOCTL_CMD install -y -n $ISTIO_INGRESS_NS --revision "$ISTIO_REVISION" -f -
