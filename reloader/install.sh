#!/bin/bash

helm repo add stakater https://stakater.github.io/stakater-charts
helm repo update

helm install reloader stakater/reloader --version v0.0.125 --namespace reloader --create-namespace
