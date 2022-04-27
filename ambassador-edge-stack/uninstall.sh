#!/bin/bash

NS=ambassador

kubectl config set-context --current --namespace=$NS

# Uninstall chart
helm uninstall ambassador

# Delete the namespace
kubectl delete namespace $NS

# Delete CRDs
kubectl delete -f https://app.getambassador.io/yaml/edge-stack/2.1.2/aes-crds.yaml
