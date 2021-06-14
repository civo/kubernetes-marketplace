#!/bin/bash

helm repo add stakater https://stakater.github.io/stakater-charts
helm repo update

kubectl create namespace reloader

helm install reloader stakater/reloader --version v0.0.91 --namespace reloader