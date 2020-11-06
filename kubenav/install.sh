#!/bin/bash

# add kubenav helm repo
helm repo add kubenav https://kubenav.github.io/helm-repository

# update helm repos
helm repo update

# create kubenav namespace
kubectl create namespace kubenav

# install or upgrade kubenav
helm upgrade --install --namespace kubenav kubenav kubenav/kubenav
