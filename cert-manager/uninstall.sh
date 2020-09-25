#!/bin/bash

# Delete the app
helm delete cert-manager -n=cert-manager

# Delete the custom CRDs
kubectl delete -f https://github.com/jetstack/cert-manager/releases/download/v1.0.2/cert-manager.crds.yaml

# Delete the namaespace
kubectl delete namespace cert-manager