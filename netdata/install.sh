#!/bin/bash
kubectl create namespace netdata

helm repo add netdata https://netdata.github.io/helmchart/
helm repo update
helm upgrade --install netdata/netdata --name=netdata --namespace=netdata --set ingress.enabled=false 
