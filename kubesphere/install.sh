#!/bin/bash

# Init version
export RELEASE=v3.2.1

# Install clusterconfiguration crd
kubectl apply -f https://github.com/kubesphere/ks-installer/releases/download/$RELEASE/cluster-configuration.yaml
