#!/bin/bash
helm repo add kriten https://kriten-io.github.io/kriten-charts/
helm repo update

kubectl create namespace kriten

helm install kriten kriten/kriten -n kriten
