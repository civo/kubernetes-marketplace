#!/bin/bash

cat <<EOF | kubectl create -f -
apiVersion: v1
kind: Secret
metadata:
  name: permission-manager
  namespace: permission-manager
type: Opaque
stringData:
  PORT: "4000" # port where server is exposed
  CLUSTER_NAME: "$CLUSTER_NAME" # name of the cluster to use in the generated kubeconfig file
  CONTROL_PLANE_ADDRESS: "$CONTROL_PLANE_ADDRESS" # full address of the control plane to use in the generated kubeconfig file
  BASIC_AUTH_PASSWORD: "$BASIC_AUTH_PASSWORD" # password used by basic auth (username is "admin")
EOF
