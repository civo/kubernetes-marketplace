#!/bin/bash

htpasswd -Bbn $REGISTRY_USERNAME $REGISTRY_PASSWD > /tmp/auth

kubectl create secret generic auth-ingress --from-file /tmp/auth

# Update the helm repo
helm repo update

helm install stable/docker-registry --name private-registry \
  --namespace default --set persistence.enabled=false
