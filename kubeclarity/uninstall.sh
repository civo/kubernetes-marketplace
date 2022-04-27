#!/bin/bash

NS=kubeclarity

kubectl config set-context --current --namespace=$NS

# Uninstall chart
helm uninstall kubeclarity

# Delete the namespace
kubectl delete namespace $NS
