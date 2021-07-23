#!/bin/bash

# Init version
export RELEASE=v1.0.5

# Install Kubeless
kubectl delete -f https://github.com/kubeless/kubeless/releases/download/$RELEASE/kubeless-$RELEASE.yaml 

# Install Kubeless UI
kubectl delete -f https://raw.githubusercontent.com/kubeless/kubeless-ui/master/k8s.yaml

# Delete namespace
kubectl delete ns kubeless
