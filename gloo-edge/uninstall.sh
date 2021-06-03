#!/bin/bash

GLOO_NS=gloo-system

kubectl config set-context --current --namespace=$GLOO_NS

# uninstall chart
helm uninstall gloo

# Delete the namespace
kubectl delete namespace $GLOO_NS

# Set context namespace back to "default"
kubectl config set-context --current --namespace=default