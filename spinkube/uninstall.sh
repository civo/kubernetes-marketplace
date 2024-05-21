#!/bin/sh

SPINKUBE_VERSION="0.2.0"

# Uninstall Spin Operator using Helm
helm uninstall spin-operator --namespace spin-operator

# Uninstall all resources related to spin-operator including CRD resources
kubectl delete -f https://github.com/spinkube/spin-operator/releases/download/v${SPINKUBE_VERSION}/spin-operator.runtime-class.yaml
kubectl delete -f https://github.com/spinkube/spin-operator/releases/download/v${SPINKUBE_VERSION}/spin-operator.crds.yaml
kubectl delete -f https://github.com/spinkube/spin-operator/releases/download/v${SPINKUBE_VERSION}/spin-operator.shim-executor.yaml

# Delete Namespace
kubectl delete ns spin-operator
