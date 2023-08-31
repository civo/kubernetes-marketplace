#!/bin/bash


# Add the Helm repository for Ambassador Edge Stack
helm repo add datawire https://www.getambassador.io
helm repo update

#Install CRD's
kubectl apply -f https://app.getambassador.io/yaml/edge-stack/3.8.0/aes-crds.yaml
kubectl wait --timeout=90s --for=condition=available deployment emissary-apiext -n emissary-system

#Install stack
helm install -n ambassador --create-namespace edge-stack datawire/edge-stack --set controller.image.tag=3.8.0 --set emissary-ingress.createDefaultListeners=true
# --set emissary-ingress.agent.cloudConnectToken=<CLOUD KEY>
# steps to retrieve Cloud key is listed in the post installation docs