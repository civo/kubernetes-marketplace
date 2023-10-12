#!/bin/bash

# Add the EnRoute One-Step API Gateway helm repository
helm repo add saaras https://www.getenroute.io/
helm repo update

# Install the helm chart
# https://docs.getenroute.io/docs/prologue/introduction/
helm install enroute-demo saaras/enroute --set enrouteService.rbac.create=true
