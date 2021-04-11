#!/bin/bash

kubectl create ns maesh

helm repo add maesh https://containous.github.io/maesh/charts

helm repo update

helm upgrade --install \
  maesh maesh/maesh \
  --namespace maesh \
  --version v1.1.0
