#!/bin/bash

# Delete the custom CRDs
kubectl delete -f app.yaml

# Delete the namespace
kubectl delete namespace monitoring
