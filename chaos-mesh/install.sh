#!/bin/bash

kubectl create namespace chaos-testing
helm repo add chaos-mesh https://charts.chaos-mesh.org

# Install Chaos Mesh to chaos-testing namespace
helm install chaos-mesh chaos-mesh/chaos-mesh --namespace=chaos-testing --set dashboard.create=true --set chaosDaemon.runtime=containerd --set chaosDaemon.socketPath=/run/k3s/containerd/containerd.sock
