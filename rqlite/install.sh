#!/bin/sh

echo "Civo is preparing to helm some rqlite..."
# helm preparations
helm repo add rqlite https://rqlite.github.io/helm-charts
helm repo update

echo "Civo is installing the rqlite helm chart..."
# install the helm chart
helm upgrade -namespace rqlite --create-namespace --install rqlite rqlite/rqlite --version 1.1.0 --set persistence.size=1Gi
# helm upgrade -namespace rqlite --create-namespace --install rqlite rqlite/rqlite --version 1.1.0 --set readonly.replicaCount=0 --set persistence.size=1Gi --set replicaCount=3

echo "Done"
