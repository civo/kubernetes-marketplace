#!/bin/sh
#
# Agones Installation
# Process from https://agones.dev/site/docs/installation/install-agones/helm/
#
helm repo add agones https://agones.dev/chart/stable
helm repo update
helm install --name agones --namespace agones-system agones/agones

# TODO: Check Agones is up and running
