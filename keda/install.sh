#!/bin/bash

helm repo add kedacore https://kedacore.github.io/charts
helm repo update

kubectl create namespace keda

helm install keda kedacore/keda --version 2.17.0 --namespace keda
