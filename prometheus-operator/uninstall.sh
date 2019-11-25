#!/bin/bash

# Delete the custom CRDs
kubectl delete -f app.yaml

# Delete the namaespace
kubectl delete namespace monitoring
