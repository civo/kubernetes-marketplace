#!/bin/bash

helm repo add kubenav https://kubenav.github.io/helm-repository
helm repo update 
helm install kubenav kubenav/kubenav --namespace kubenav
