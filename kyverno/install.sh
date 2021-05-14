#!/bin/bash

helm repo add kyverno https://kyverno.github.io/kyverno/

helm repo update

VALUES=""

case $POD_SECURITY_STANDARDS in
  default_enforce)
    VALUES="--set validationFailureAction=enforce"
    ;;
  restricted_audit)
    VALUES="--set podSecurityStandard=restricted"
    ;;
  restricted_enforce)
    VALUES="--set validationFailureAction=enforce --set podSecurityStandard=restricted"
    ;;
esac

helm install kyverno kyverno/kyverno $VALUES --namespace kyverno --create-namespace