#!/bin/bash

name="$CLUSTER_NAME"

helm repo add otomi https://otomi.io/otomi-core
helm repo update

helm install otomi otomi/otomi \
    --set cluster.name="$name" \
    --set cluster.provider=civo \
    --set apps.keycloak.resources.keycloak.limits.cpu="2000m" \
    --set apps.keycloak.resources.keycloak.limits.memory="1Gi" \
    --set apps.keycloak.resources.keycloak.requests.cpu="500m" \
    --set apps.keycloak.resources.keycloak.requests.memory="512Mi" \
    --set apps.keycloak.resources.operator.limits.cpu="1000m" \
    --set apps.keycloak.resources.operator.limits.memory="512Mi" \
    --set apps.keycloak.resources.operator.requests.cpu="100m" \
    --set apps.keycloak.resources.operator.requests.memory="128Mi" \
    --set apps.host-mods.enabled=false