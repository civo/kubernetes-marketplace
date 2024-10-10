#!/bin/sh

helm repo add konstruct https://charts.konstruct.io
helm repo update

helm install kubefirst --set=console.installMethod=civo-marketplace --set=global.cloudProvider=civo --set=global.clusterType=bootstrap --set=global.installMethod=civo-marketplace --set=console.ingress.enabled=false  --create-namespace --namespace kubefirst --version 2.6.1 --wait konstruct/kubefirst
