#!/bin/bash

helm repo add sealed-secrets https://bitnami-labs.github.io/sealed-secrets
helm repo update sealed-secrets

kubectl create namespace sealed-secrets

helm upgrade --install sealed-secrets sealed-secrets/sealed-secrets --namespace sealed-secrets --version 2.15.3
# sealed secrets chart version - 2.15.3, which install app version - 0.26.2
