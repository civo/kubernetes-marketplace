#!/bin/bash

NS=kong

kubectl config set-context --current --namespace=$NS

# Uninstall chart
helm uninstall kong

# Delete the namespace
kubectl delete namespace $NS

