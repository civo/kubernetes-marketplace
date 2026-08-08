#!/bin/bash

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Install IOMETE Operator CRDs
# NOTE: server-side apply is required. The Spark Operator CRDs exceed the 256KB
# limit on the last-applied-configuration annotation that client-side apply uses.
echo "Installing IOMETE Operator CRDs..."
kubectl apply --server-side --force-conflicts -f "$SCRIPT_DIR/operator-crds.yaml"

# Wait for the CRDs to be established before deploying the operator, so the
# controller never starts against a CRD the API server hasn't registered yet.
echo "Waiting for CRDs to be established..."
kubectl wait --for=condition=established --timeout=120s \
  crd/iometedataplaneenterprises.charts.iomete.com \
  crd/sparkapplications.sparkoperator.k8s.io \
  crd/scheduledsparkapplications.sparkoperator.k8s.io

# Deploy IOMETE Operator
echo "Deploying IOMETE Operator..."
kubectl apply --server-side --force-conflicts -f "$SCRIPT_DIR/operator-deploy.yaml"

echo "IOMETE Operator installation complete!"
echo "The operator has been deployed to the 'iomete-operator-system' namespace."
