#!/bin/bash

# Delete the operator
helm uninstall prometheus --namespace monitoring

# Delete the namespace
kubectl delete namespace monitoring
