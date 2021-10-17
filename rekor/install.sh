#!/bin/bash

helm repo add sigstore https://sigstore.github.io/helm-charts
helm repo update

kubectl create namespace rekor

helm install rekor sigstore/rekor --version 0.2.2 --namespace rekor --set server.ingress.hostname=$SERVER_INGRESS_HOSTNAME \
--set mysql.auth.password=$MYSQL_PASSWORD --set mysql.auth.rootPassword=$MYSQL_ROOT_PASSWORD