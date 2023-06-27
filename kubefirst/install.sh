#!/bin/sh

helm repo add kubefirst https://charts.kubefirst.com
helm repo update

helm install kubefirst --set=console.installMethod=civo-marketplace --create-namespace --namespace kubefirst --wait --version 2.1.12 kubefirst/kubefirst
