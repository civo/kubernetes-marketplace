#!/bin/bash
kubectl create namespace kafka

helm repo add bitnami https://charts.bitnami.com/bitnami

helm repo update

# Installing kafka with default rules.
helm install kafka -f https://raw.githubusercontent.com/bitnami/charts/refs/heads/main/bitnami/kafka/values.yaml bitnami/kafka --set image.repository=bitnamilegacy/kafka -n kafka
