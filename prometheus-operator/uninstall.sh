#!/bin/bash

# Delete the operator
helm delete prometheus-operator  prometheus-community/kube-prometheus-stack --namespace monitoring

# Delete the namespace
kubectl delete namespace monitoring
