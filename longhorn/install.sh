#!/bin/bash

helm repo add longhorn https://charts.longhorn.io
helm repo update

kubectl create namespace longhorn-system

helm install longhorn longhorn/longhorn --namespace longhorn-system --version 1.3.2
