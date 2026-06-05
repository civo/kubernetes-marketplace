#!/bin/bash

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Install IOMETE Operator CRDs
echo "Installing IOMETE Operator CRDs..."
kubectl apply -f "$SCRIPT_DIR/operator-crds.yaml"

# Deploy IOMETE Operator
echo "Deploying IOMETE Operator..."
kubectl apply -f "$SCRIPT_DIR/operator-deploy.yaml"

echo "IOMETE Operator installation complete!"
echo "The operator has been deployed to the 'iomete-operator-system' namespace."
