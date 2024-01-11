#!/bin/bash

kubectl config set-context --current --namespace=cerbos

# uninstall chart
helm uninstall cerbos

# Delete the namespace
kubectl delete namespace cerbos

# Set context namespace back to "default"
kubectl config set-context --current --namespace=default
