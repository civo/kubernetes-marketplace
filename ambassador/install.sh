#!/bin/bash

VERSION=1.13.10
NS=ambassador

# Add the Helm repository for Ambassador Edge Stack
helm repo add datawire https://www.getambassador.io
helm repo update

# Create the namespace and install the Helm chart
kubectl create namespace $NS
helm install ambassador --namespace $NS --set image.tag=$VERSION datawire/ambassador

