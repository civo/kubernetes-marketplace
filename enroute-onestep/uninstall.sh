#!/bin/bash

ENROUTE_NS=enroutedemo

kubectl config set-context --current --namespace=$ENROUTE_NS

# Uninstall EnRoute chart
helm uninstall enroute

# Delete namespace
kubectl delete namespace $ENROUTE_NS
