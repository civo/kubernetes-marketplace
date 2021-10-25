#!/bin/bash

# Add the EnRoute One-Step API Gateway helm repository
helm repo add saaras https://getenroute.io
helm repo update

# Install the helm chart
# https://getenroute.io/docs/getting-started-enroute-ingress-controller/
helm install enroute-demo saaras/enroute --set enrouteService.rbac.create=true
