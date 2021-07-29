#!/bin/bash

helm repo add external-secrets https://external-secrets.github.io/kubernetes-external-secrets/
helm repo update

kubectl create namespace external-secrets

helm install external-secrets external-secrets/kubernetes-external-secrets --namespace external-secrets --version 8.2.2
