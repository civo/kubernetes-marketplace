#!/bin/bash


# Add the Helm repository for Ambassador Edge Stack
helm repo add datawire https://www.getambassador.io
helm repo update

#Install CRD's
kubectl apply -f https://app.getambassador.io/yaml/edge-stack/2.1.2/aes-crds.yaml
kubectl wait --timeout=90s --for=condition=available deployment emissary-apiext -n emissary-system

#Install stack
helm install -n ambassador --create-namespace edge-stack datawire/edge-stack --set controller.image.tag=2.1.2  && kubectl rollout status  -n ambassador deployment/edge-stack -w


