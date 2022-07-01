#!/bin/bash

# Create the namespace for monitoring
kubectl create namespace monitoring

# Add the prometheus-community Helm repository
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts

# Update your local Helm chart repository cache
helm repo update

# Install the prometheus-blackbox-exporter Helm chart
helm install prometheus-blackbox-exporter  prometheus-community/prometheus-blackbox-exporter --namespace monitoring