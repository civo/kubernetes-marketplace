#!/bin/bash

htpasswd -Bbn $REGISTRY_USERNAME $REGISTRY_PASSWD > /tmp/auth

kubectl create ns docker-registry

kubectl -n docker-registry create secret generic auth-ingress --from-file /tmp/auth

helm repo update

helm upgrade --install \
  private-registry stable/docker-registry \
  --namespace docker-registry \
  --set persistence.enabled=false
