#!/bin/bash

#Add Helm Chart
helm repo add shipa-charts https://shipa-charts.storage.googleapis.com
helm repo update

#Wait for the Cert Manager deployment to be done.
kubectl wait --for=condition=available --timeout=300s deployment/cert-manager-webhook  -n cert-manager

#Install Shipa
helm upgrade --install shipa shipa-charts/shipa \
--timeout=15m \
--version 1.7.2 \
--set=auth.adminUser="$ADMIN_EMAIL" \
--set=auth.adminPassword="$ADMIN_PW" \
--namespace shipa-system --create-namespace 
