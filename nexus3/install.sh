#!/bin/bash
NEXUS_NS=nexus3

kubectl create namespace $NEXUS_NS
kubectl config set-context --current --namespace=$NEXUS_NS 

helm repo add sonatype https://sonatype.github.io/helm3-charts/
helm repo update

helm install -f https://raw.githubusercontent.com/kameshsampath/kubernetes-marketplace/master/nexus3/values.yaml --wait \
  nexus3 sonatype/nexus-repository-manager

# Set context namespace back to "default"
kubectl config set-context --current --namespace=default