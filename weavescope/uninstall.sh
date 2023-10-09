#!/bin/bash

VERSION=v1.13.2

# Delete weavescope resources
kubectl delete -f https://github.com/weaveworks/scope/releases/download/$VERSION/k8s-scope.yaml
