#!/bin/bash
kubectl create namespace greptimedb

helm repo add greptime https://greptimeteam.github.io/helm-charts/

helm repo update

# Installing GreptimeDB with default values
helm upgrade --install greptimedb-standalone greptime/greptimedb-standalone -n greptimedb
