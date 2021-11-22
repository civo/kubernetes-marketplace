#!/bin/bash

#Sleep for 5 Seconds incase Civo Cert Manager Install has not scaled to one replica. Ketch v0.6.1 handles this better.
sleep 5

#Incase Sleep does not work, can leverage a kubectl wait for the Cert Manager deployment to be done.
kubectl wait --for=condition=available --timeout=300s deployment/cert-manager-webhook  -n cert-manager

#Install Ketch
kubectl apply -f https://github.com/theketchio/ketch/releases/download/v0.6.1/ketch-controller.yaml
