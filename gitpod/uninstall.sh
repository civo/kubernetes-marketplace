#!/bin/sh

kubectl get configmaps gitpod-app -n gitpod -o jsonpath='{.data.app\.yaml}' | kubectl delete -f -
kubectl delete -f ./gitpod/app.yaml || true
