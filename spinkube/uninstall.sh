#!/bin/sh

# Uninstall Spin Operator using Helm
helm uninstall spin-operator --namespace spin-operator

# Uninstall all resources related to spin-operator including CRD resources
kubectl delete -f https://github.com/spinkube/spin-operator/releases/download/v0.1.0/spin-operator.runtime-class.yaml
kubectl delete -f https://github.com/spinkube/spin-operator/releases/download/v0.1.0/spin-operator.crds.yaml
kubectl delete -f https://github.com/spinkube/spin-operator/releases/download/v0.1.0/spin-operator.shim-executor.yaml

# Delete Namespace
kubectl delete ns spin-operator