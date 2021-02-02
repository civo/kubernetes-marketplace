#!/bin/bash

# Delete the app
helm uninstall kubenav --namespace kubenav

# Delete the namaespace
kubectl delete namespace kubenav
