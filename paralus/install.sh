#!/bin/bash

domain="paralus.${CLUSTER_ID}.k8s.civo.com"
email="${EMAIL}"

helm repo add paralus https://paralus.github.io/helm-charts

helm repo update

helm install paralus-ztka paralus/ztka --namespace paralus --create-namespace --set fqdn.domain="$domain" --set paralus.initialize.adminEmail="${EMAIL}" --set deploy.postgresql.enable=true