#!/bin/bash
kubectl create namespace kafka

helm repo add bitnami https://charts.bitnami.com/bitnami

helm repo update

# Installing kafka with default rules.
helm install kafka -f https://github.com/bitnami/charts/raw/master/bitnami/kafka/values.yaml bitnami/kafka -n kafka 