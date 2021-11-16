#!/bin/bash

#Sleep for 5 Seconds incase Civo Cert Manager Install has not scaled to one replica. Ketch v0.6.1 handles this better.
sleep 5

#Install Ketch
kubectl apply -f https://github.com/theketchio/ketch/releases/download/v0.6.1/ketch-controller.yaml
