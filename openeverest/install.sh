#!/bin/bash

# OpenEverest Installation Script for Civo Marketplace

set -e

# Add OpenEverest Helm repository
helm repo add openeverest https://openeverest.github.io/helm-charts/
helm repo update

# Build helm install command
HELM_ARGS="--namespace everest-system --create-namespace --set server.initialAdminPassword=${EVEREST_ADMIN_PASSWORD}"

# Add LoadBalancer service type if enabled
if [ "${EXPOSE_VIA_LOADBALANCER}" = "true" ]; then
  HELM_ARGS="${HELM_ARGS} --set server.service.type=LoadBalancer"
fi

# Install OpenEverest (operator + server in one command)
helm install everest openeverest/openeverest ${HELM_ARGS} --wait

echo "OpenEverest installation completed successfully!"
