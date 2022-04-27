#!/bin/bash

NS=netdata

kubectl config set-context --current --namespace=$NS

# Uninstall chart
helm uninstall netdata

# Delete the namespace
kubectl delete namespace $NS
