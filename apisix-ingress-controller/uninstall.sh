#!/bin/bash

# Uninstall helm release
helm uninstall apisix --namespace apisix

# Delete the namespace
kubectl delete namespace apisix
