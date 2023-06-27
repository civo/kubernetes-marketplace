#!/bin/bash

# Delete the app
helm uninstall kubefirst --namespace kubefirst

# Delete the namespace
kubectl delete namespace kubefirst
