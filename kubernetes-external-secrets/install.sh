#!/bin/bash

helm repo add external-secrets-operator https://charts.external-secrets.io/
helm repo update

kubectl create namespace external-secrets

helm upgrade -i external-secrets external-secrets-operator/external-secrets --namespace external-secrets --version 0.8.3
