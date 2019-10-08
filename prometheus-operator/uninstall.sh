#!/bin/bash

# Delete the custom CRDs
kubectl delete -f app.yaml

# Delete the helm app
helm delete --purge prometheus-operator

# Delete the namaespace
kubectl delete namespace monitoring
