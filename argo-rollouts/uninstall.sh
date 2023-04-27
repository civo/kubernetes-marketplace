#!/bin/bash

kubectl delete -n argo-rollouts -f https://github.com/argoproj/argo-rollouts/releases/download/v1.4.1/install.yaml
kubectl delete namespace argo-rollouts
