#!/bin/bash
kubectl create namespace core

helm repo add bitnami https://charts.bitnami.com/bitnami

helm repo update

# Installing core with default rules.
helm install core -f https://github.com/bitnami/charts/raw/master/bitnami/aspnet-core/values.yaml bitnami/aspnet-core -n core