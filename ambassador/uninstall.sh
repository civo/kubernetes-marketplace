#!/bin/bash

NS=ambassador

kubectl config set-context --current --namespace=$NS

# Uninstall chart
helm uninstall ambassador

# Delete the namespace
kubectl delete namespace $NS

