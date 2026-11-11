#!/bin/bash

helm repo add sonarqube https://SonarSource.github.io/helm-chart-sonarqube

helm repo update

kubectl create namespace sonarqube

helm upgrade --install -n sonarqube sonarqube sonarqube/sonarqube --version 10.7.0+3598 \
  --set service.type=ClusterIP \
  --set-string account.currentAdminPassword=admin \
  --set-string account.adminPassword="${ADMIN_PASSWORD}"
