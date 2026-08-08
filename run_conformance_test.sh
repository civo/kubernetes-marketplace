#!/bin/bash
# ------------------------------------------------------------------------------
# run_conformance_test.sh
#
# This script runs conformance tests for a specified application by creating a
# Civo Kubernetes cluster, installing the application, and executing the
# conformance tests defined in the application's conformance.sh script within
# a Docker container based on the conformance-test-runner image.
#
# Usage:
#   bash run_conformance_test.sh <application_name> [--keep-cluster]
#
# Parameters:
#   <application_name> - The name of the application to test
#   --keep-cluster     - Optional flag to keep the created cluster after testing
#
# Author: Dinesh Majrekar
# ------------------------------------------------------------------------------
# Change Log:
# 22/05/2025 - Added docstring to run_conformance_test.sh
# 22/05/2025 - Updated to run conformance.sh in a Docker container


# Check if application name is provided
if [ -z "$1" ]; then
  echo "Application name is required as the first argument"
  exit 1
fi

APP_NAME=$1
CLUSTER_NAME="conformance-test-${APP_NAME}-cluster"
KEEP_CLUSTER=false
KUBECONFIG="./kubeconfig-${CLUSTER_NAME}"

# Parse flags
while [[ $# -gt 1 ]]; do
  case $2 in
    --keep-cluster)
      KEEP_CLUSTER=true
      ;;
    *)
      echo "Unknown flag: $2"
      exit 1
      ;;
  esac
  shift
done

# Check if application directory exists
if [ ! -d "$APP_NAME" ]; then
  echo "Directory for application '$APP_NAME' does not exist"
  exit 1
fi

# Check if cluster exists when --keep-cluster is used
if [ "$KEEP_CLUSTER" = true ]; then
  if civo kubernetes show $CLUSTER_NAME >/dev/null 2>&1; then
    echo "Using existing cluster: $CLUSTER_NAME"
  else
    echo "Creating new cluster: $CLUSTER_NAME"
    civo kubernetes create $CLUSTER_NAME --wait
    echo "Cluster created: $CLUSTER_NAME"
    civo kubernetes config $CLUSTER_NAME --save --local-path="$KUBECONFIG"
    echo "Kubeconfig saved to: $KUBECONFIG"
  fi
else
  # Create Civo Kubernetes cluster
  echo "Creating new cluster: $CLUSTER_NAME"
  civo kubernetes create $CLUSTER_NAME --wait
  echo "Cluster created: $CLUSTER_NAME"
  civo kubernetes config $CLUSTER_NAME --save --local-path="$KUBECONFIG"
  echo "Kubeconfig saved to: $KUBECONFIG"
fi
echo "KUBECONFIG path: $KUBECONFIG"
kubectl config view --kubeconfig=$KUBECONFIG

# Install application
if [ -f "$APP_NAME/app.yaml" ]; then
  # For redis, set REDIS_PASS environment variable
  if [ "$APP_NAME" = "redis" ]; then
    export REDIS_PASS=$(openssl rand -base64 12 | tr -d '/+=')
    echo "Applying Redis app.yaml with REDIS_PASS=$REDIS_PASS"
    envsubst < $APP_NAME/app.yaml | KUBECONFIG=$KUBECONFIG kubectl apply -f -
    echo "kubectl apply result: $?"
    KUBECONFIG=$KUBECONFIG kubectl get pods -A -l app=redis
  else
    kubectl apply -f $APP_NAME/app.yaml
    echo "kubectl apply result: $?"
  fi
elif [ -f "$APP_NAME/install.sh" ]; then
  echo "Running install.sh for $APP_NAME"
  bash $APP_NAME/install.sh
  echo "install.sh result: $?"
  bash $APP_NAME/install.sh
else
  echo "No installation method found for application '$APP_NAME'"
  exit 1
fi

# Check if conformance.sh exists and run it in Docker container
if [ -f "$APP_NAME/conformance.sh" ]; then
  docker run --rm \
    -v "$(pwd)/$APP_NAME:/app" \
    -v "$KUBECONFIG:/root/.kube/config" \
    -e KUBECONFIG=/root/.kube/config \
    -e REDIS_PASS=$REDIS_PASS \
    conformance-test-runner:latest \
    bash /app/conformance.sh
else
  echo "conformance.sh not found for application '$APP_NAME'"
  exit 1
fi

# Delete Civo Kubernetes cluster if --keep-cluster is not used
if [ "$KEEP_CLUSTER" = false ]; then
  civo kubernetes remove $CLUSTER_NAME --yes
  rm -f $KUBECONFIG
fi
