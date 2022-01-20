#!/bin/bash

#Add Helm Chart
helm repo add shipa-charts https://shipa-charts.storage.googleapis.com
helm repo update

#Install Shipa
helm upgrade --install shipa shipa-charts/shipa \
--timeout=15m \
--version 1.5.2 \
--set=metrics.image=gcr.io/shipa-1000/metrics:30m \
--set=auth.adminUser=admin@acme.io \
--set=auth.adminPassword=shipa1234 \
--namespace shipa-system --create-namespace 
