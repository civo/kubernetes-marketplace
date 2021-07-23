#!/bin/bash

kubectl create ns kubenav

helm repo add kubenav https://kubenav.github.io/helm-repository

helm repo update

helm upgrade --install \
  kubenav kubenav/kubenav \
  --namespace kubenav \
  --version v1.1.0
