#!/bin/bash

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
    export KUBECONFIG=$KUBECONFIG
  else
    echo "Creating new cluster: $CLUSTER_NAME"
    civo kubernetes create $CLUSTER_NAME --wait --save --merge --switch
    export KUBECONFIG=~/.kube/config
  fi
else
  # Create Civo Kubernetes cluster
  civo kubernetes create $CLUSTER_NAME --wait --save --merge --switch
  export KUBECONFIG=~/.kube/config
fi

# Install application
if [ -f "$APP_NAME/app.yaml" ]; then
  kubectl apply -f $APP_NAME/app.yaml
elif [ -f "$APP_NAME/install.sh" ]; then
  bash $APP_NAME/install.sh
else
  echo "No installation method found for application '$APP_NAME'"
  exit 1
fi

# Check if conformance.sh exists and run it
if [ -f "$APP_NAME/conformance.sh" ]; then
  cd $APP_NAME && bash conformance.sh
else
  echo "conformance.sh not found for application '$APP_NAME'"
  exit 1
fi

# Delete Civo Kubernetes cluster if --keep-cluster is not used
if [ "$KEEP_CLUSTER" = false ]; then
  civo kubernetes remove $CLUSTER_NAME --yes
  rm -f $KUBECONFIG
fi
