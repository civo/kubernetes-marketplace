#!/bin/bash

helm repo add netdata https://netdata.github.io/helmchart/
helm repo update
helm install --name=netdata --namespace=netdata --set ingress.enabled=false netdata/netdata
