#!/bin/bash

helm repo add onechart https://chart.onechart.dev

kubectl create namespace gimlet-installer || true

helm repo update \
 && helm upgrade gimlet-installer --install onechart/onechart \
    --namespace gimlet-installer  \
    --set image.repository=ghcr.io/gimlet-io/gimlet-installer \
    --set tag=v0.4.2 \
    --set containerPort=9000 \
    --set vars.HOST="$CLUSTER_ID.k8s.civo.com" \
    --set ingress.host="gimlet.$CLUSTER_ID.k8s.civo.com" \
    --set "ingress.annotations.kubernetes\.io/ingress\.class=traefik"
