#!/bin/bash
kubectl config set-context --current --namespace=flagsmith

# uninstall chart
helm uninstall flagsmith

# Delete the namespace
kubectl delete namespace flagsmith

# Set context namespace back to "default"
kubectl config set-context --current --namespace=default
