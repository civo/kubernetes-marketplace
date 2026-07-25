#!/bin/bash

# Create a dedicated namespace for Temporal
kubectl create namespace temporal

# Add the official Temporal Helm chart repository
helm repo add temporal https://go.temporal.io/helm-charts

helm repo update

# Install Temporal with default settings (includes bundled Cassandra, Elasticsearch and web UI)
# Uses the default developer/demo configuration that bundles all dependencies
helm install temporal temporal/temporal \
  --namespace temporal \
  --set server.replicaCount=1 \
  --set cassandra.config.cluster_size=1 \
  --set prometheus.enabled=false \
  --set grafana.enabled=false \
  --set elasticsearch.replicas=1 \
  --timeout 15m \
  --wait
