#!/bin/bash

set -euo pipefail

NAMESPACE="rstream-system"
VERSION="0.5.2"

echo "Installing rstream operator in ${NAMESPACE} namespace"

helm upgrade --install --create-namespace rstream-operator \
  oci://ghcr.io/rstreamlabs/rstream-operator \
  --namespace "${NAMESPACE}" \
  --version "${VERSION}" \
  --wait \
  --timeout 8m
