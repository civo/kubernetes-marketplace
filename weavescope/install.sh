#!/bin/bash

VERSION=v1.13.2

kubectl apply -f https://github.com/weaveworks/scope/releases/download/$VERSION/k8s-scope.yaml
