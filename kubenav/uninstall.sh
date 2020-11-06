#!/bin/bash

# Delete the app
helm delete kubenav -n=kubenav

# Delete the namaespace
kubectl delete namespace kubenav
