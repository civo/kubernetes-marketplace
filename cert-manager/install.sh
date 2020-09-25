#!/bin/bash

kubectl create namespace cert-manager

helm repo add jetstack https://charts.jetstack.io

helm repo update

kubectl apply --validate=false -f https://github.com/jetstack/cert-manager/releases/download/v1.0.2/cert-manager.crds.yaml

helm install \
  --name cert-manager \
  --namespace cert-manager \
  --version v1.0.2 \
  jetstack/cert-manager
