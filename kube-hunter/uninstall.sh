#!/bin/bash

# Delete all k8s resources of this app
kubectl delete -f https://raw.githubusercontent.com/civo/kubernetes-marketplace/master/kube-hunter/app.yaml
