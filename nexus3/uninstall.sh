#!/bin/bash

NEXUS_NS=nexus3

kubectl config set-context --current --namespace=$NEXUS_NS 

# uninstall chart
helm uninstall nexus3

# Delete the namespace
kubectl delete namespace nexus3

# Set context namespace back to "default"
kubectl config set-context --current --namespace=default