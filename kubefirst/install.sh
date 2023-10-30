#!/bin/sh

helm repo add kubefirst https://charts.kubefirst.com
helm repo update

helm install kubefirst --set=console.installMethod=civo-marketplace --set=global.cloudProvider=civo --set=global.clusterType=bootstrap --set=global.installMethod=civo-marketplace --create-namespace --namespace kubefirst --wait kubefirst/kubefirst --version 2.3.4
