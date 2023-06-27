#!/bin/sh

helm repo add kubefirst https://charts.kubefirst.com
helm repo update

helm install kubefirst --create-namespace --namespace kubefirst --wait kubefirst/kubefirst
