#!/bin/bash

# Delete the app
helm delete -f app.yaml

# Delete the namaespace
kubectl delete namespace kubenav
