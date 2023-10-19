#!/bin/bash

# Delete the PMM
helm uninstall pmm

# Delete the secret
kubectl delete secret pmm-secret

# Delete the secret
kubectl delete pvc pmm-storage-pmm-0
