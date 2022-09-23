#!/bin/bash

helm repo add onechart https://chart.onechart.dev

kubectl create namespace gimlet-installer || true

helm repo update \
 && helm upgrade gimlet-installer --install onechart/onechart \
    --namespace gimlet-installer  \
    -f values.yaml \
    --set vars.HOST="$CLUSTER_ID.k8s.civo.com" \
    --set ingress.host="gimlet.$CLUSTER_ID.k8s.civo.com"
