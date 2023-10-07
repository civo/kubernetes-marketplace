#!/bin/bash

name="$CLUSTER_NAME"

helm repo add otomi https://otomi.io/otomi-core
helm repo update

helm install otomi otomi/otomi \
    --set cluster.name="$name" \
    --set cluster.provider=civo