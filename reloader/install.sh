#!/bin/bash

helm repo add stakater https://stakater.github.io/stakater-charts
helm repo update

helm install reloader stakater/reloader --version v1.1.0 --namespace reloader --create-namespace
