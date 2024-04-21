#!/bin/sh

helm repo add kubefirst https://charts.kubefirst.com
helm repo update

helm install kubefirst --set=global.cloudProvider=civo --set=global.clusterType=bootstrap --set=global.installMethod=civo-marketplace --set=console.ingress.enabled=false  --create-namespace --namespace kubefirst --version 2.4.5 --wait kubefirst/kubefirst
