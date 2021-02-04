#!/bin/bash

# Delete the app
helm delete -f app.yaml

# Delete the namespace
kubectl delete namespace kubenav
