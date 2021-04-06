#!/bin/bash

kubectl create ns gitea

helm repo add gitea-charts https://dl.gitea.io/charts/

helm upgrade --install \
  gitea gitea-charts/gitea \
  --namespace gitea \
  --set persistence.enabled=false \
  --set gitea.admin.email=$ADMIN_EMAIL \
  --set gitea.admin.password=$ADMIN_PASS \
  --set postgresql.persistence.enabled=false
