#!/bin/sh
helm repo add flagsmith https://flagsmith.github.io/flagsmith-charts/
helm repo update
kubectl create namespace flagsmith
helm upgrade --install flagsmith flagsmith/flagsmith --namespace flagsmith --wait
