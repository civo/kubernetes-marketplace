#!/bin/sh
helm repo add cerbos https://download.cerbos.dev/helm-charts
helm repo update
kubectl create namespace cerbos
helm upgrade --install cerbos cerbos/cerbos --namespace cerbos --version 0.34.0 --wait
