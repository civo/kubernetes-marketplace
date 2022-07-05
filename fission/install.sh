#!/bin/bash

helm repo add fission-charts https://fission.github.io/fission-charts
helm repo update

kubectl create namespace fission

kubectl create -k "github.com/fission/fission/crds/v1?ref=v1.16.0"
helm install fission fission-charts/fission-all --version v1.16.0 --namespace fission \
    --set routerServiceType=NodePort
