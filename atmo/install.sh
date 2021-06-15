#!/bin/sh

kubectl create namespace suborbital

# add the PVC
kubectl apply -f https://raw.githubusercontent.com/suborbital/atmo-k8s-helm/main/k8s/atmo-k3s-pvc.yml
# install Atmo
kubectl apply -f https://raw.githubusercontent.com/suborbital/atmo-k8s-helm/main/k8s/atmo-deployment.yml
# set up the Atmo service
kubectl apply -f https://raw.githubusercontent.com/suborbital/atmo-k8s-helm/main/k8s/atmo-svc.yml
