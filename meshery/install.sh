#!/bin/bash

helm repo add meshery https://meshery.io/charts/

helm repo update

helm install meshery meshery/meshery --namespace meshery --create-namespace --version v0.8.103
