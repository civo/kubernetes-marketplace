#!/bin/bash

helm repo add devtron https://helm.devtron.ai
helm repo update 

kubectl create namespace devtroncd

helm install devtron devtron/devtron-operator --namespace devtroncd --set installer.arch=multi-arch