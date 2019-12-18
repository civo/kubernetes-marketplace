#!/bin/bash

# Init version
export RELEASE=v1.0.5

# Install Kubeless
kubectl create ns kubeless
kubectl create -f https://github.com/kubeless/kubeless/releases/download/$RELEASE/kubeless-$RELEASE.yaml 

# Install Kubeless UI
kubectl create -f https://raw.githubusercontent.com/kubeless/kubeless-ui/master/k8s.yaml
