#!/bin/bash

helm repo add kubevela https://charts.kubevela.net/core
helm repo update
helm install --create-namespace -n vela-system kubevela kubevela/vela-core --wait