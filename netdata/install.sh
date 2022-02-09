#!/bin/bash

helm repo add netdata https://netdata.github.io/helmchart/
helm repo update
helm install netdata netdata/netdata --namespace netdata --create-namespace --set ingress.enabled=false
